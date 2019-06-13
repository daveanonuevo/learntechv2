import 'package:flutter/material.dart';
import 'topicList.dart';

class TopicSelect2 extends StatefulWidget {
  final String selectedTopic;

  TopicSelect2({Key key, @required this.selectedTopic}) : super(key: key);

  @override
  _TopicSelect2State createState() => _TopicSelect2State();
}

class _TopicSelect2State extends State<TopicSelect2> {
  final PageController ctrl =
      PageController(viewportFraction: 0.8, initialPage: 0);
  int currentPage = 0;
  @override
  void initState(){
    ctrl.addListener((){
      int next = ctrl.page.round();
      if (currentPage != next){
        setState(() {
          currentPage = next;
        });
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
            widget.selectedTopic == "WhatsApp" ? "WhatsApp" : "Security Tips",
        style: TextStyle(
          color: Colors.black,
        )),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () => Navigator.pop(context, false),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: PageView.builder(
          controller: ctrl,
          itemCount: ModuleTopic.loadTopics("${widget.selectedTopic}").length,
          itemBuilder: (context, int currentIndex) {
            bool active = currentIndex == currentPage;
            final topic =
                ModuleTopic.loadTopics("${widget.selectedTopic}")[currentIndex];
            return _BuildStoryPage(
              topic: topic,
              module: widget.selectedTopic == "WhatsApp"
                  ? "WhatsApp"
                  : "Security Tips",
              active: active,
              currentIndex: currentIndex,
            );
          }),
    );
  }
}


class _BuildStoryPage extends StatefulWidget {
  _BuildStoryPage(
      {@required this.topic,
      @required this.module,
      @required this.active,
      @required this.currentIndex});

  final ModuleTopic topic;
  final String module;
  final bool active;
  final int currentIndex;

  @override
  __BuildStoryPageState createState() => __BuildStoryPageState();
}

class __BuildStoryPageState extends State<_BuildStoryPage> {
//  double blur = widget.active ? 30 : 0;
//  double offset = widget.active ? 20 : 0;
//  double top = widget.active ? 100 : 200;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(
          top: widget.active ? 50 : 100, bottom: 50, right: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(widget.topic.imagePath)),
          boxShadow: [
            BoxShadow(
                color: Colors.black87,
                blurRadius: widget.active ? 30 : 0,
                offset: Offset(widget.active ? 20 : 0, widget.active ? 20 : 0))
          ]),
      child: Center(
        child: Text(widget.topic.topicName,
            style: TextStyle(fontSize: 28, color: Colors.white)),
      ),
    );
  }
}
