import 'package:flutter/material.dart';

class DisplayTopic extends StatefulWidget {
  DisplayTopic(
      {Key key,
      @required this.topicName,
      @required this.imagePath,
      this.topicInformation})
      : super(key: key);

  final String topicName;
  final String imagePath;
  final List<Widget> topicInformation;

  @override
  _DisplayTopicState createState() => _DisplayTopicState();
}

class _DisplayTopicState extends State<DisplayTopic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        pinned: true,
        expandedHeight: 250.0,
        centerTitle: false,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text(
            widget.topicName,
            textAlign: TextAlign.center,
          ),
          background: Image.asset(
            widget.imagePath,
            fit: BoxFit.cover,
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.all(8.0),
        sliver: SliverList(
          delegate: SliverChildListDelegate(
            widget.topicInformation,
          ),
        ),
      )
    ]));
  }
}

class DisplayInformation {}
