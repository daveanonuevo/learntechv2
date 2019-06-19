import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learntech/WhatsApp/displayTopic.dart';
import 'package:learntech/localizations.dart';
import 'topicList.dart';
import 'dart:ui';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:learntech/WhatsApp/uiCopy.dart';

class TopicSelect extends StatefulWidget {
  final String selectedTopic;

  TopicSelect({Key key, @required this.selectedTopic}) : super(key: key);

  @override
  _TopicSelectState createState() => _TopicSelectState();
}

class _TopicSelectState extends State<TopicSelect> {
  var currentPageValue = 0.0;

  List imagePaths = new List();

  final PreloadPageController _pageViewController = PreloadPageController(
    viewportFraction: 0.85,
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  title: Text(widget.selectedTopic == "WhatsApp"
                      ? AppLocalizations.of(context).waTitle1Trans
                      : AppLocalizations.of(context).safeTitle2Trans),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context, false),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                ),
                body: PageTransformer(
                    pageViewBuilder: (context, visibilityResolver) {
                  return PreloadPageView.builder(
                    controller: _pageViewController,
                    preloadPagesCount: ModuleTopic.loadTopics(
                            widget.selectedTopic == "WhatsApp"
                                ? "WhatsApp"
                                : "Security Tips")
                        .length,
                    itemCount: ModuleTopic.loadTopics("${widget.selectedTopic}")
                        .length,
                    itemBuilder: (context, index) {
                      final topic = ModuleTopic.loadTopics(
                          "${widget.selectedTopic}")[index];
                      final pageVisibility =
                          visibilityResolver.resolvePageVisibility(index);
                      return WhatsAppTopicCards(
                        topic: topic,
                        pageVisibility: pageVisibility,
                        module: widget.selectedTopic == "WhatsApp"
                            ? "WhatsApp"
                            : "Security Tips",
                        count: index,
                      );
                    },
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WhatsAppTopicCards extends StatefulWidget {
  WhatsAppTopicCards({
    @required this.topic,
    @required this.pageVisibility,
    @required this.module,
    @required this.count,
  });

  final ModuleTopic topic;
  final PageVisibility pageVisibility;
  final String module;
  final int count;

  @override
  _WhatsAppTopicCardsState createState() => _WhatsAppTopicCardsState();
}

class _WhatsAppTopicCardsState extends State<WhatsAppTopicCards> {
  @override
  void initState() {
    super.initState();
  }

  _buildTextContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 00.0, 0.0, 0.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.topic.topicName,
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w500,
                letterSpacing: 2.0,
                fontSize: 24.0,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var image = Image.asset(
      widget.topic.imagePath,
      fit: BoxFit.cover,
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
                    topic: widget.topic,
                    module: widget.module,
                    count: widget.count,
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
