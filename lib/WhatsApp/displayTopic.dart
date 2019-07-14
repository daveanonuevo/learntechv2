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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
            widget.topic.topicName,
          style: TextStyle(color: Colors.black),
          ),
      ),
      body: ListView(
        children: ModuleTopic.loadTopics(widget.module, context)[widget.count].topicInfo,
      )
    );
  }
}