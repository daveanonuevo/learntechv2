import 'package:flutter/material.dart';

//import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'dart:convert';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  final _urlAPI =
      "http://us-central1-learntech-d9387.cloudfunctions.net/widgets/";
  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusMessage = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/wallpaper.png"),
              fit: BoxFit.cover,
            )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text("Contact Us"),
            textTheme:
            TextTheme(title: TextStyle(color: Colors.black, fontSize: 25)),
            centerTitle: true,
            backgroundColor: Colors.white,
//            leading: new IconButton(
////                icon: Icon(
////                  Icons.arrow_back,
////                ),
////                color: Colors.black,
////                onPressed: () {
////                },
////                tooltip: "Go back"),
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                height: 470,
                width: 360,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, left: 13.0, right: 13.0, bottom: 10.0),
                        child: Text(
                          "Please provide us with any feedbacks or comments about the app",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Theme(
                          data: ThemeData(primaryColor: Color(0XFF009688)),
                          child: TextFormField(
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (term){
                              _fieldFocusChange(context, _focusMessage, _focusName);
                            },
                            controller: _messageController,
                            keyboardType: TextInputType.multiline,
                            maxLines: 3,
                            style: TextStyle(fontSize: 20),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              labelText: "Feedback",
                              border: OutlineInputBorder(
                                gapPadding: 2,
                                borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: Theme(
                            data: ThemeData(primaryColor: Color(0XFF009688)),
                            child: TextFormField(
                              textInputAction: TextInputAction.next,
                              focusNode: _focusName,
                              onFieldSubmitted: (term){
                                _fieldFocusChange(context, _focusName, _focusEmail);
                              },
                              controller: _nameController,
                              style: TextStyle(fontSize: 20),
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  labelText: "Name",
                                  border: OutlineInputBorder(
                                      gapPadding: 2,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)))),
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Theme(
                          data: ThemeData(primaryColor: Color(0XFF009688)),
                          child: TextFormField(
                            textInputAction: TextInputAction.done,
                            focusNode: _focusEmail,
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            style: TextStyle(fontSize: 20),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                labelText: "Email",
                                border: OutlineInputBorder(
                                    gapPadding: 2,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)))),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 19.0),
                        child: GestureDetector(
                          onTap: () {
                            var data = jsonEncode({
                              'name': '${_nameController.text}',
                              'email': '${_emailController.text}',
                              'message': '${_messageController.text}'
                            });
                            apiRequest(_urlAPI, data);
                            _nameController.text = "";
                            _emailController.text = "";
                            _messageController.text = "";
                          },
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                                color: Color(0xFF009688)),
                            child: Center(
                                child: Text(
                                  "Send",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20.0),
                                )),
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          ),
        ));
  }
}

Future<String> apiRequest(String url, String jsonMap) async {
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode(jsonMap));
  HttpClientResponse response = await request.close();
  // todo - you should check the response.statusCode
  String reply = await response.transform(utf8.decoder).join();
  httpClient.close();
  return reply;
}

_fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}