import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learntech/WhatsApp/displayTopic.dart';
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
  final PreloadPageController _backgroundViewController = PreloadPageController(
    viewportFraction: 1.0,
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    _pageViewController.addListener(() {
      setState(() {
        _backgroundViewController.animateToPage(
            _pageViewController.page.floor(),
            duration: Duration(milliseconds: 500),
            curve: Curves.ease);
        currentPageValue = _pageViewController.page;
      });
    });

    return Stack(fit: StackFit.expand, children: <Widget>[
      PageTransformer(pageViewBuilder: (context, visibilityResolver) {
        return PreloadPageView.builder(
          controller: _backgroundViewController,
          preloadPagesCount: ModuleTopic.loadTopics(
                  widget.selectedTopic == "WhatsApp"
                      ? "WhatsApp"
                      : "Security Tips")
              .length,
          itemCount: ModuleTopic.loadTopics("${widget.selectedTopic}").length,
          itemBuilder: (context, index) {
            final topic =
                ModuleTopic.loadTopics("${widget.selectedTopic}")[index];
            final pageVisibility =
                visibilityResolver.resolvePageVisibility(index);
            return BackgroundImages(
              topic: topic,
              pageVisibility: pageVisibility,
            );
          },
        );
      }),
      Container(
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
                return PreloadPageView.builder(
                  controller: _pageViewController,
                  preloadPagesCount: ModuleTopic.loadTopics(
                          widget.selectedTopic == "WhatsApp"
                              ? "WhatsApp"
                              : "Security Tips")
                      .length,
                  itemCount:
                      ModuleTopic.loadTopics("${widget.selectedTopic}").length,
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
              })),
        ),
      ),
    ]);
  }
}

class BackgroundImages extends StatefulWidget {
  BackgroundImages({
    @required this.topic,
    @required this.pageVisibility,
  });

  final ModuleTopic topic;
  final PageVisibility pageVisibility;

  @override
  _BackgroundImagesState createState() => _BackgroundImagesState();
}

class _BackgroundImagesState extends State<BackgroundImages> {
  @override
  Widget build(BuildContext context) {
    var image = Image.asset(
      widget.topic.imagePath,
      fit: BoxFit.cover,
      alignment: FractionalOffset(
        0.5 + (widget.pageVisibility.pagePosition / 3),
        0.5,
      ),
    );
    return image;
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

  @override
  void initState() {
    super.initState();
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
    var image = Image.asset(
      widget.topic.imagePath,
      fit: BoxFit.cover,
      alignment: FractionalOffset(
        0.5 + (widget.pageVisibility.pagePosition / 3),
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
