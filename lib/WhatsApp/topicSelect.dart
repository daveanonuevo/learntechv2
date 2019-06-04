import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learntech/WhatsApp/displayTopic.dart';
import 'package:learntech/WhatsApp/uiCopy.dart';
import 'topicList.dart';
import 'dart:ui';
//import 'package:auto_size_text/auto_size_text.dart'

class TopicSelect extends StatefulWidget {
  final String selectedTopic;

  TopicSelect({Key key, @required this.selectedTopic}) : super(key: key);

  @override
  _TopicSelectState createState() => _TopicSelectState();
}

class _TopicSelectState extends State<TopicSelect> {
  final PageController _pageViewController = PageController(
    viewportFraction: 0.85,
    initialPage: 0,
  );
  var currentPageValue = 0.0;

//  (() {
//

  @override
  Widget build(BuildContext context) {

    _pageViewController.addListener(() {
      setState(() {
        currentPageValue = _pageViewController.page;
      });
    });

    final ModuleTopic imageTopic = loadTopics("${widget.selectedTopic}")[currentPageValue.round()];
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            imageTopic.imagePath),
            fit: BoxFit.cover,)
        ),

          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  title: Text(widget.selectedTopic == "WhatsApp"
                      ? "WhatsApp"
                      : "Security Tips"),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context, false),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
//              centerTitle: true, //Android is left-align by default
                ),
                body: PageTransformer(pageViewBuilder: (context, visibilityResolver) {
                  return PageView.builder(
                    controller: _pageViewController,
                    itemCount: loadTopics("${widget.selectedTopic}").length,
                    itemBuilder: (context, index) {
                      final topic = loadTopics("${widget.selectedTopic}")[index];
                      final pageVisibility =
                      visibilityResolver.resolvePageVisibility(index);
                      return WhatsAppTopicCards(
                        topic: topic,
                        pageVisibility: pageVisibility,
                      );
                    },
                  );
                })),
          ),
        ),
      ]
//        Container(
//        decoration: BoxDecoration(
//          image: DecorationImage(
//                  image: AssetImage(imageTopic.imagePath),
//            fit: BoxFit.cover,
//          )
//        ),
    );
  }
}

class ImageReturn extends StatelessWidget {
  ImageReturn({
    @required this.topic,
  });

  final ModuleTopic topic;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        "${topic.imagePath}",
        fit: BoxFit.cover,
      ),
    );
  }
}

class WhatsAppTopicCards extends StatelessWidget {
  WhatsAppTopicCards({
    @required this.topic,
    @required this.pageVisibility,
  });

  final ModuleTopic topic;
  final PageVisibility pageVisibility;

  Widget _applyTextEffects({
    @required double translationFactor,
    @required Widget child,
  }) {
    final double xTranslation = pageVisibility.pagePosition * translationFactor;

    return Opacity(
      opacity: pageVisibility.visibleFraction,
      child: Transform(
        alignment: FractionalOffset.topLeft,
        transform: Matrix4.translationValues(
          xTranslation,
          0.0,
          0.0,
        ),
        child: child,
      ),
    );
  }

  _buildTextContainer(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var textWithCoolEffects = _applyTextEffects(
      translationFactor: 300.0,
      child: Text(
        topic.topicName,
        style: textTheme.caption.copyWith(
          color: Colors.white70,
          fontWeight: FontWeight.w500,
          letterSpacing: 2.0,
          fontSize: 24.0,
        ),
        textAlign: TextAlign.center,
      ),
    );

//    var titleText = _applyTextEffects(
//      translationFactor: 200.0,
//      child: Padding(
//        padding: const EdgeInsets.only(top: 16.0),
//        child: Text(
//          topic.title,
//          style: textTheme.title
//              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
//          textAlign: TextAlign.center,
//        ),
//      ),
//    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 00.0, 0.0, 0.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            textWithCoolEffects,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var image = Image.asset(
      topic.imagePath,
      fit: BoxFit.cover,
      alignment: FractionalOffset(
        0.5 + (pageVisibility.pagePosition / 3),
        0.5,
      ),
    );
    var imageOverlayGradient = DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            const Color(0xA0000000),
            const Color(0x00000000),
          ],
        ),
      ),
    );

    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DisplayTopic(
                    topicName: topic.topicName,
                    imagePath: topic.imagePath,
                    topicInformation: topic.topicInfo,
                  ))),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50.0,
          horizontal: 8.0,
        ),
        child: Material(
          clipBehavior: Clip.antiAlias,
          elevation: 4.0,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Stack(
            fit: StackFit.expand,
            children: [
              image,
              imageOverlayGradient,
              _buildTextContainer(context),
            ],
          ),
        ),
      ),
    );
  }
}
