import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learntech/WhatsApp/displayTopic.dart';
import 'package:learntech/localizations.dart';
import 'topicList.dart';
import 'dart:ui';

class TopicSelect extends StatefulWidget {
  final String selectedTopic;

  TopicSelect({Key key, @required this.selectedTopic}) : super(key: key);

  @override
  _TopicSelectState createState() => _TopicSelectState();
}

class _TopicSelectState extends State<TopicSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  title: Text(widget.selectedTopic == "WhatsApp"
                      ? AppLocalizations.of(context).waTitle1Trans
                      : AppLocalizations.of(context).safeTitle2Trans),
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black,),
                    onPressed: () => Navigator.pop(context, false),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                ),
                body: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.black,
                    indent: 72,
                  ),
                  itemCount:
                      ModuleTopic.loadTopics("${widget.selectedTopic}").length,
                  itemBuilder: (context, index) {
                    final topic = ModuleTopic.loadTopics(
                        "${widget.selectedTopic}")[index];
                    return WhatsAppTopicCards(
                      topic: topic,
                      module: widget.selectedTopic == "WhatsApp"
                          ? "WhatsApp"
                          : "Security Tips",
                      count: index,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//ListView.separated(
//separatorBuilder: (context, index) => Divider(
//color: Colors.black,
//),
//itemCount: 20,
//itemBuilder: (context, index) => Padding(
//padding: EdgeInsets.all(8.0),
//child: Center(child: Text("Index $index")),
//),
//)

class WhatsAppTopicCards extends StatelessWidget {
  final ModuleTopic topic;
  final String module;
  final int count;

  WhatsAppTopicCards({
    @required this.topic,
    @required this.module,
    @required this.count,
  });

  @override
  Widget build(BuildContext context) {
       return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DisplayTopic(
                    topic: topic,
                    module: module,
                    count: count,
                  ))),
      child: ListTile(
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 55,
          color: Colors.black,
        ),
        title: Text(
          topic.topicName,
          style: TextStyle(color: Colors.black, fontSize: 27.6),
        ),
        leading: Icon(topic.icon, size: 55, color: Colors.black),
      ),
    );
  }
}

//
//class WhatsAppTopicCards extends StatefulWidget {
//  WhatsAppTopicCards({
//    @required this.topic,
//    @required this.pageVisibility,
//    @required this.module,
//    @required this.count,
//  });
//
//  final ModuleTopic topic;
//  final PageVisibility pageVisibility;
//  final String module;
//  final int count;
//
//  @override
//  _WhatsAppTopicCardsState createState() => _WhatsAppTopicCardsState();
//}
//
//class _WhatsAppTopicCardsState extends State<WhatsAppTopicCards> {
//  @override
//  void initState() {
//    super.initState();
//  }
//
//  _buildTextContainer(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.fromLTRB(0.0, 00.0, 0.0, 0.0),
//      child: Center(
//        child: Column(
//          mainAxisSize: MainAxisSize.min,
//          children: [
//            Text(
//              widget.topic.topicName,
//              style: TextStyle(
//                color: Colors.white70,
//                fontWeight: FontWeight.w500,
//                letterSpacing: 2.0,
//                fontSize: 24.0,
//              ),
//              textAlign: TextAlign.center,
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    var image = Image.asset(
//      widget.topic.imagePath,
//      fit: BoxFit.cover,
//    );
//    var imageOverlayGradient = DecoratedBox(
//      decoration: BoxDecoration(
//        gradient: LinearGradient(
//          begin: FractionalOffset.bottomCenter,
//          end: FractionalOffset.topCenter,
//          colors: [
//            const Color(0xA0000000),
//            const Color(0x00000000),
//          ],
//        ),
//      ),
//    );
//    return GestureDetector(
//      onTap: () => Navigator.push(
//          context,
//          MaterialPageRoute(
//              builder: (context) => DisplayTopic(
//                    topic: widget.topic,
//                    module: widget.module,
//                    count: widget.count,
//                  ))),
//      child: Padding(
//        padding: const EdgeInsets.symmetric(
//          vertical: 50.0,
//          horizontal: 8.0,
//        ),
//        child: Material(
//          clipBehavior: Clip.antiAlias,
//          elevation: 4.0,
//          borderRadius: BorderRadius.all(Radius.circular(20)),
//          child: Stack(
//            fit: StackFit.expand,
//            children: [
//              image,
//              imageOverlayGradient,
//              _buildTextContainer(context),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
