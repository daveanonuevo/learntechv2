import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learntech/WhatsApp/displayTopic.dart';
import 'package:learntech/WhatsApp/uiCopy.dart';
import 'topicList.dart';
import 'dart:ui';

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

  List imagePaths = new List();

  @override
  void initState() {
    print("initState");
    for (int x = 0; x < loadTopics("WhatsApp").length; x++) {
      imagePaths.add(loadTopics("WhatsApp")[x].imagePath);
    }
    for (int x = 0; x < loadTopics("Security Tips").length; x++) {
      imagePaths.add(loadTopics("Security Tips")[x].imagePath);
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies");
    for (int x = 0; x < imagePaths.length; x++) {
      precacheImage(AssetImage(imagePaths[x]), context);
      print("loading into cache");
    }
  }

  @override
  Widget build(BuildContext context) {
    _pageViewController.addListener(() {
      setState(() {
        currentPageValue = _pageViewController.page;
      });
    });

    final ModuleTopic imageTopic =
        loadTopics("${widget.selectedTopic}")[currentPageValue.round()];
    return Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(imageTopic.imagePath),
          fit: BoxFit.cover,
        )),
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
              ),
              body: PageTransformer(
                  pageViewBuilder: (context, visibilityResolver) {
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
    ]);
  }
}

class ImageReturn extends StatefulWidget {
  ImageReturn({
    @required this.topic,
  });

  final ModuleTopic topic;

  @override
  _ImageReturnState createState() => _ImageReturnState();
}

class _ImageReturnState extends State<ImageReturn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        "${widget.topic.imagePath}",
        fit: BoxFit.cover,
        gaplessPlayback: true,
      ),
    );
  }
}

class WhatsAppTopicCards extends StatefulWidget {
  WhatsAppTopicCards({
    @required this.topic,
    @required this.pageVisibility,
  });

  final ModuleTopic topic;
  final PageVisibility pageVisibility;

  @override
  _WhatsAppTopicCardsState createState() => _WhatsAppTopicCardsState();
}

class _WhatsAppTopicCardsState extends State<WhatsAppTopicCards> {
  Widget _applyTextEffects({
    @required double translationFactor,
    @required Widget child,
  }) {
    final double xTranslation =
        widget.pageVisibility.pagePosition * translationFactor;

    return Opacity(
      opacity: widget.pageVisibility.visibleFraction,
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
        widget.topic.topicName,
        style: textTheme.caption.copyWith(
          color: Colors.white70,
          fontWeight: FontWeight.w500,
          letterSpacing: 2.0,
          fontSize: 24.0,
        ),
        textAlign: TextAlign.center,
      ),
    );

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
    var image = Image.asset(widget.topic.imagePath,
        fit: BoxFit.cover,
        alignment: FractionalOffset(
          0.5 + (widget.pageVisibility.pagePosition / 3),
          0.5,
        ),
        gaplessPlayback: true);
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
                    topicName: widget.topic.topicName,
                    imagePath: widget.topic.imagePath,
                    topicInformation: widget.topic.topicInfo,
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
