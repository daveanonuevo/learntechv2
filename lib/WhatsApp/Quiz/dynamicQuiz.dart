import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:learntech/WhatsApp/Quiz/dynamicCheck.dart';
import 'package:learntech/WhatsApp/Quiz/dynamicRadio.dart';

class DynamicQuiz extends StatefulWidget {
  @override
  _DynamicQuizState createState() => _DynamicQuizState();
}

class _DynamicQuizState extends State<DynamicQuiz> {
  List<Question> _questions = <Question>[];

  void listenForQuestions() async {
    final Stream<Question> stream = await getQuestions();
    stream.listen(
        (Question question) => setState(() => _questions.add(question)));
  }

  @override
  void initState() {
    listenForQuestions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Online Quizzes"),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.black,
        ),
        itemCount: _questions.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(_questions[index].title, style: TextStyle(fontSize: 32)),
          onTap: () => {
            (_questions[index].type == "radio")
                ? Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DynamicRadio(
                      question: _questions[index].question,
                      correctAnswer: _questions[index].correctAnswer,
                      options: _questions[index].options,
                      title: _questions[index].title,
                    )),
                  ) //push to a radio dynamic page
                : Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DynamicCheck(
                      question: _questions[index].question,
                      correctAnswer: _questions[index].correctAnswer,
                      options: _questions[index].options,
                      title: _questions[index].title,
                    )),
                  ) //push to a radio dynamic page
          },
        ),
      ),
    );
  }
}

class Question {
  String type;
  String title;
  String question;
  int numberOfOptions;
  List<dynamic> options;
  List<dynamic> correctAnswer;

  Question(
      {@required this.type,
      @required this.title,
      @required this.question,
      @required this.numberOfOptions,
      @required this.options,
      @required this.correctAnswer});

  Question.fromJSON(Map<String, dynamic> jsonMap)
      : type = jsonMap["type"],
        question = jsonMap["question"],
        numberOfOptions = jsonMap["numberOfOptions"],
        title = jsonMap["title"],
        options = jsonMap["options"],
        correctAnswer = jsonMap["correctAnswer"];
}

Future<Stream<Question>> getQuestions() async {
  final String url =
      'https://us-central1-learntech-d9387.cloudfunctions.net/widgets/quizzes/';
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
  HttpClientResponse response = await request.close();
  return utf8.decoder
      .bind(response)
      .join()
      .asStream()
      .transform(json.decoder)
      .expand((data) => (data as List))
      .map((data) => Question.fromJSON(data));
}
