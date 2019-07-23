import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:learntech/localizations.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  final _urlAPI =
      "http://us-central1-learntech-d9387.cloudfunctions.net/widgets/contactus/";
  final _focusName = FocusNode();
  final _focusEmail = FocusNode();
  final _focusMessage = FocusNode();

  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Background/wallpaper.png"),
              fit: BoxFit.cover,
            )),
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(AppLocalizations.of(context).contactTrans),
            textTheme:
            TextTheme(title: TextStyle(color: Colors.black, fontSize: 25)),
            centerTitle: true,
            backgroundColor: Colors.white,
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
                          AppLocalizations.of(context).contactContentTrans,
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
                              labelText: AppLocalizations.of(context).contactContentFeedbackTrans1,
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
                                  labelText: AppLocalizations.of(context).contactContentFeedbackTrans2,
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
                                labelText: AppLocalizations.of(context).contactContentFeedbackTrans3,
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
                            if(_messageController.text.isEmpty)
                              _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).contactSnackBarFeedback)));
                            else if (_nameController.text.isEmpty)
                              _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).contactSnackBarName)));
                            else if (_emailController.text.isEmpty)
                              _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).contactSnackBarEmail)));
                            else if (!_emailController.text.contains('@'))
                               _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).contactSnackBarEmailError)));
                            else{
                              var data = jsonEncode({
                                'name': '${_nameController.text}',
                                'email': '${_emailController.text}',
                                'message': '${_messageController.text}'
                              });
                              apiRequest(_urlAPI, data).then((reply) =>
                              (reply == resSuc) ?   _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).contactSnackBarFeedbackSuccess))) :
                              _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(AppLocalizations.of(context).contactSnackBarFeedbackFail)))
                              );
                              _nameController.text = "";
                              _emailController.text = "";
                              _messageController.text = "";
                              
                            }
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
                                  AppLocalizations.of(context).contactContentFeedbackButtonTrans,
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
final String resSuc = "Success";

Future<String> apiRequest(String url, String jsonMap) async {
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  request.add(utf8.encode(jsonMap));
  HttpClientResponse response = await request.close();
  String reply = await utf8.decoder.bind(response).join();
  httpClient.close();
  return reply;
}

_fieldFocusChange(BuildContext context, FocusNode currentFocus,FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}