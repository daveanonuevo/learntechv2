import 'package:flutter/material.dart';
import 'package:learntech/WhatsApp/topicList.dart';

class DisplayTopic extends StatefulWidget {

  DisplayTopic(
      {Key key,
      @required this.topic,
      @required this.module,
      @required this.count})
      : super(key: key);

  final ModuleTopic topic;
  final String module;
  final int count;

  @override
  _DisplayTopicState createState() => _DisplayTopicState();
}

class _DisplayTopicState extends State<DisplayTopic> {
  @override
  Widget build(BuildContext context) {
    print(widget.topic.topicInfo);
    print(widget.topic.imagePath);
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        pinned: true,
        expandedHeight: 250.0,
        centerTitle: false,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            widget.topic.topicName,
            textAlign: TextAlign.center,
          ),
          background: Image.asset(
            widget.topic.imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.all(8.0),
        sliver: SliverList(
          delegate: SliverChildListDelegate(

            ModuleTopic.loadTopics(widget.module, context)[widget.count].topicInfo,
          ),
        ),
      )
    ]));
  }
}