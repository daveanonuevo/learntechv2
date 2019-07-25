import 'package:flutter/material.dart';
import 'package:learntech/WhatsApp/Quiz/dynamicQuiz.dart';
import 'package:learntech/WhatsApp/Quiz/fakeNewsQuiz.dart';
import 'package:learntech/WhatsApp/Quiz/privacyQuiz.dart';
import 'package:learntech/WhatsApp/Quiz/scamsQuiz.dart';
import 'dart:io' show Platform;
import 'package:learntech/localizations.dart';

class ModuleTopic {
  String topicName;
  IconData icon;
  List<Widget> topicInfo;

  ModuleTopic(
      {@required this.topicName,
      @required this.icon,
      @required this.topicInfo});

  static List loadTopics(String module, [BuildContext context]) {
    TextStyle _localStyle = TextStyle(
      fontFamily: "san francisco",
      fontSize: 35.0,
      color: Colors.black,
    );
    TextStyle _localSub = TextStyle(
      fontFamily: "roboto",
      fontSize: 25.0,
      color: Colors.black26,
    );

    String strPlat = (Platform.isAndroid
//    true
        )
        ? "Android"
        : "iOS";

    Widget imagesBox(String imagePath) {
      if (context != null)
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: (strPlat == "iOS")
                ? MediaQuery.of(context).size.width / 32 * 5
                : MediaQuery.of(context).size.width / 32 * 3.7,
          ),
          height: MediaQuery.of(context).size.height / 32 * 28,
          child: Image.asset(
            imagePath,
            fit: BoxFit.fitHeight,
          ),
          decoration: BoxDecoration(
              border: new Border.all(
            color: Colors.black,
            width: 3,
          )),
        );
      return Text("Context is null, please report to administrator");
    }

    return module == "WhatsApp" //Everything till the next thing is all IOS
        ? [
            ModuleTopic(
              topicName: AppLocalizations().waTitle1Category1Trans,
              icon: Icons.get_app,
              topicInfo: [
                Text(
                  AppLocalizations().waTitle1Category1ContentTrans1,
                  style: _localStyle,
                ),
                DivideLine(),
                Container(
                  child: Image.asset(
                    "assets/WhatsAppTopics/Android/FindInstallSearch1.png",
                  ),
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category1ContentTrans2,
                  style: _localStyle,
                ),
                DivideLine(),
                Container(
                  child: Image.asset(
                    "assets/WhatsAppTopics/Android/FindInstallSearch2.jpg",
                  ),
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category1ContentTrans3,
                  style: _localStyle,
                ),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: AppLocalizations().waTitle1Category2Trans,
              icon: Icons.account_circle,
              topicInfo: [
                Text(AppLocalizations().waTitle1Category2ContentTrans1,
                    style: _localStyle),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category2ContentTrans2,
                  style: _localSub,
                ),
                DivideLine(),
                Text(AppLocalizations().waTitle1Category2ContentTrans3,
                    style: _localStyle),
                DivideLine(),
                imagesBox(
                    "assets/WhatsAppTopics/Android/CreatingAnAccount.gif"),
                //both deployed
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: AppLocalizations().waTitle1Category3Trans,
              icon: Icons.contact_phone,
              topicInfo: [
                Text(
                  AppLocalizations().waTitle1Category3ContentTrans1,
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category3ContentTrans2,
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category3ContentTrans3,
                  style: _localStyle,
                ),
                DivideLine(),
                imagesBox(
                  "assets/WhatsAppTopics/Android/AddingContacts.gif", //both deployed
                ),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: AppLocalizations().waTitle1Category4Trans,
              icon: Icons.send,
              topicInfo: [
                Text(
                  AppLocalizations().waTitle1Category4ContentTrans1,
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category4ContentTrans2,
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category4ContentTrans3,
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category4ContentTrans4,
                  style: _localStyle,
                ),
                DivideLine(),
                imagesBox(
                  "assets/WhatsAppTopics/Android/SendingMessages.gif", //Android not deployed
                ),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: AppLocalizations().waTitle1Category5Trans,
              icon: Icons.keyboard_voice,
              topicInfo: [
                Text(
                  AppLocalizations().waTitle1Category5ContentTrans1,
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category5ContentTrans2,
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category5ContentTrans3,
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category5ContentTrans4,
                  style: _localStyle,
                ),
                DivideLine(),
                imagesBox(
                  "assets/WhatsAppTopics/Android/SendingVoiceMemos.gif", //Both deployed
                ),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: AppLocalizations().waTitle1Category6Trans,
              icon: Icons.perm_media,
              topicInfo: [
                Text(
                  AppLocalizations().waTitle1Category6ContentTrans1,
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category6ContentTrans2,
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category6ContentTrans3,
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category6ContentTrans4,
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category6ContentTrans5,
                  style: _localSub,
                ),
                DivideLine(),
                imagesBox(
                  "assets/WhatsAppTopics/Android/SendingPhotos.gif", //Both deployed
                ),
                DivideLine(),
//                Text(
//                  AppLocalizations().waTitle1Category6ContentTrans6,
//                  style: _localSub,
//                ),
//                imagesBox(
//                  "assets/WhatsAppTopics/Android/SendingLocation.gif",
//                ),
//                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: AppLocalizations().waTitle1Category7Trans,
              icon: Icons.phone_in_talk,
              topicInfo: [
                Text(
                  AppLocalizations().waTitle1Category7ContentTrans1,
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category7ContentTrans2,
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category7ContentTrans3,
                  style: _localSub,
                ),
                DivideLine(),
                imagesBox(
                  "assets/WhatsAppTopics/Android/GivingCalls.gif", //Both Deployed
                ),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: AppLocalizations().waTitle1Category8Trans,
              icon: Icons.local_phone,
              topicInfo: [
                Text(
                  AppLocalizations().waTitle1Category8ContentTrans1,
                  style: _localStyle,
                ),
                DivideLine(),
                imagesBox(
                  "assets/WhatsAppTopics/Android/ReceivingCall.jpg",
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category8ContentTrans2,
                  style: _localStyle,
                ),
                DivideLine(),
                imagesBox(
                  "assets/WhatsAppTopics/Android/Answering.gif",
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category8ContentTrans3,
                  style: _localStyle,
                ),
                DivideLine(),
                imagesBox(
                  "assets/WhatsAppTopics/Android/Declining.gif",
                ),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: AppLocalizations().waTitle1Category9Trans,
              icon: Icons.group,
              topicInfo: [
                Text(
                  AppLocalizations().waTitle1Category9ContentTrans1,
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category9ContentTrans2,
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category9ContentTrans3,
                  style: _localStyle,
                ),
                DivideLine(),
                imagesBox(
                  "assets/WhatsAppTopics/Android/AddingContactstoGroup.gif", //Both deployed
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category9ContentTrans4,
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category9ContentTrans5,
                  style: _localStyle,
                ),
                DivideLine(),
              ],
            ),
          ]
        : //Bottom is returned if WhatsApp isn't selected
        [
            ModuleTopic(
              topicName: AppLocalizations().safeTitle2Category1Trans,
              icon: Icons.security,
              topicInfo: [
                Text(
                  AppLocalizations().safeTitle2Category1ContentTrans1,
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  AppLocalizations().safeTitle2Category1ContentTrans2,
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  AppLocalizations().safeTitle2Category1ContentTrans3,
                  style: _localStyle,
                ),
                Text(AppLocalizations().safeTitle2Category1ContentTrans4,
                    style: _localSub),
                DivideLine(),
                imagesBox(
                  "assets/WhatsAppTopics/Android/LastSeen.gif", //Android Haven't deploy
                ),
                DivideLine(),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MaterialButton(
                        child: Text(
                          AppLocalizations()
                              .safeTitle2Category3QuizReturnTrans22,
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                        height: 90.0,
                        highlightElevation: 8,
                        color: Colors.amberAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PrivacyQuiz()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: AppLocalizations().safeTitle2Category2Trans,
              icon: Icons.warning,
              topicInfo: [
                Text(AppLocalizations().safeTitle2Category2ContentTrans1,
                    style: _localStyle),
                DivideLine(),
                Image.asset(
                  "assets/SecurityTopics/Scam.jpg",
                ),
                DivideLine(),
                Text(AppLocalizations().safeTitle2Category2ContentTrans2,
                    style: _localStyle),
                DivideLine(),
                Text(AppLocalizations().safeTitle2Category2ContentTrans3,
                    style: _localStyle),
                DivideLine(),
                Text(AppLocalizations().safeTitle2Category2ContentTrans4,
                    style: _localStyle),
                DivideLine(),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MaterialButton(
                        child: Text(
                          AppLocalizations()
                              .safeTitle2Category3QuizReturnTrans22,
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                        height: 90.0,
                        highlightElevation: 8,
                        color: Colors.amberAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScamsQuiz()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: AppLocalizations().safeTitle2Category3Trans,
              icon: Icons.announcement,
              topicInfo: [
                Text(AppLocalizations().safeTitle2Category3ContentTrans1,
                    style: _localStyle),
                DivideLine(),
                Image.asset(
                  "assets/SecurityTopics/FakeNews.jpg",
                ),
                DivideLine(),
                Text(AppLocalizations().safeTitle2Category3ContentTrans2,
                    style: _localStyle),
                DivideLine(),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MaterialButton(
                        child: Text(
                          AppLocalizations()
                              .safeTitle2Category3QuizReturnTrans22,
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                        height: 90.0,
                        highlightElevation: 8,
                        color: Colors.amberAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FakeNewsQuiz()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: "Online Quizzes (experimental)",
              icon: Icons.warning,
              topicInfo: [
                Text("Warning! This is an experimental feature. This requires internet connection.", style: TextStyle(fontSize: 32.0),),

                MaterialButton(
                  child: Text("Proceed",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                    ),
                  ),
                  height: 90.0,
                  highlightElevation: 8,
                  color: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DynamicQuiz()),
                    );
                  },
                ),

              ],
            ),
          ];
  }
}

// Cause Divide() .... LOL, forked from it xd wrecks
class DivideLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: Center(
        child: Container(
          height: 0.0,
          margin: EdgeInsets.symmetric(horizontal: 100.0),
          decoration: BoxDecoration(
            border: Border(
              bottom: createBorderSide(
                context,
                color: Colors.black45,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static BorderSide createBorderSide(BuildContext context,
      {Color color, double width = 0.5}) {
    assert(width != null);
    return BorderSide(
      color: color ?? Theme.of(context).dividerColor,
      width: width,
    );
  }
}
