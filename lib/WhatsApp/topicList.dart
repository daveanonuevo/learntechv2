import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:learntech/localizations.dart';
import 'dart:io';


class ModuleTopic {
  String topicName;
  IconData icon;
  String imagePath;
  List<Widget> topicInfo;

  ModuleTopic(
      {@required this.topicName,
      this.icon,
      @required this.imagePath,
      @required this.topicInfo});

  static List loadTopics(String module, [BuildContext context]) {
    TextStyle _localStyle = TextStyle(
      fontFamily: "san francisco",
      fontSize: 32.0,
    );
    TextStyle _localSub = TextStyle(
      fontFamily: "roboto",
      fontSize: 18.0,
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

    return module == "WhatsApp" //Everything till the next thing is all IOS shit
        ? [
            ModuleTopic(
              topicName: AppLocalizations().waTitle1Category1Trans,
              icon: Icons.explore, 
              imagePath: "assets/WhatsAppTopics/InstallingWhatsApp.jpg",
              topicInfo: [
                Text(
                  AppLocalizations().waTitle1Category1ContentTrans1,
                  style: _localStyle,
                ),
                DivideLine(),
//                Container(
//                  child: Image.asset(
//                    "assets/WhatsAppTopics/Android/FindInstallSearch1.png",
//                  ),
//                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category1ContentTrans2,
                  style: _localStyle,
                ),
                DivideLine(),
//                Container(
//                  child: Image.asset(
//                    "assets/WhatsAppTopics/Android/FindInstallSearch2.jpg",
//                  ),
//                ),
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
              imagePath: "assets/WhatsAppTopics/CreatingAnAccount.jpg",
              topicInfo: [
                Text(
                    AppLocalizations().waTitle1Category2ContentTrans1,
                    style: _localStyle),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category2ContentTrans2,
                  style: _localSub,
                ),
                DivideLine(),
                Text(
                    AppLocalizations().waTitle1Category2ContentTrans3,
                    style: _localStyle),
                DivideLine(),
                Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/learntech-d9387.appspot.com/o/CreatingAnAccount.gif?alt=media&token=a332b72d-9d3c-4867-aba6-9b5426779455",
                  gaplessPlayback: true,
                ),
                // imagesBox(
                //     "assets/WhatsAppTopics/Android/CreatingAnAccount.gif"),  //both deployed
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: AppLocalizations().waTitle1Category3Trans,
              icon: Icons.create,
              imagePath: "assets/WhatsAppTopics/AddingContacts.jpg",
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
                Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/learntech-d9387.appspot.com/o/AddingContacts.gif?alt=media&token=3e9cf01d-751d-46f3-9e45-98208698abde",
                  gaplessPlayback: true,
                ),
                // imagesBox(
                //   "assets/WhatsAppTopics/Android/AddingContacts.gif",  //both deployed
                // ),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: AppLocalizations().waTitle1Category4Trans,
              icon: Icons.network_wifi,
              imagePath: "assets/WhatsAppTopics/SendingMessages.jpg",
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
                Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/learntech-d9387.appspot.com/o/SendingMessages.gif?alt=media&token=91c9209e-4a06-43c7-982b-94b123906755",
                  gaplessPlayback: true,
                ),
                // imagesBox(
                //   "assets/WhatsAppTopics/Android/SendingMessages.gif", //Android not deployed
                // ),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: AppLocalizations().waTitle1Category5Trans,
              icon: Icons.keyboard_voice,
              imagePath: "assets/WhatsAppTopics/SendingVoiceMemos.jpg",
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
                Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/learntech-d9387.appspot.com/o/SendingVoiceMemos.gif?alt=media&token=ae4c9e21-b1f0-4fb5-b8a2-04adb7963542",
                  gaplessPlayback: true,
                ),
                // imagesBox(
                //   "assets/WhatsAppTopics/Android/SendingVoiceMemos.gif",  //Both deployed
                // ),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: AppLocalizations().waTitle1Category6Trans,
              icon: Icons.network_wifi,
              imagePath: "assets/WhatsAppTopics/SendingMedia.jpg",
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
                Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/learntech-d9387.appspot.com/o/SendingPhotos.gif?alt=media&token=b6f657cc-39e2-4152-a0e1-4e74a64f231e",
                  gaplessPlayback: true,
                ),
                // imagesBox(
                //   "assets/WhatsAppTopics/Android/SendingPhotos.gif",  //Both deployed
                // ),
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
              icon: Icons.keyboard_voice,
              imagePath: "assets/WhatsAppTopics/ManagingCalls.jpg",
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
                Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/learntech-d9387.appspot.com/o/GivingCalls.gif?alt=media&token=73a63db2-30ba-481b-b645-f9703b881ae0",
                  gaplessPlayback: true,
                ),
                // imagesBox(
                //   "assets/WhatsAppTopics/Android/GivingCalls.gif",   //Both Deployed
                // ),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: AppLocalizations().waTitle1Category8Trans,
              icon: Icons.keyboard_voice,
              imagePath: "assets/WhatsAppTopics/AnsweringCalls.jpg",
              topicInfo: [
                Text(
                  AppLocalizations().waTitle1Category8ContentTrans1,
                  style: _localStyle,
                ),
                imagesBox(
                  "assets/WhatsAppTopics/Android/ReceivingCall.jpg",
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category8ContentTrans2,
                  style: _localStyle,
                ),
                Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/learntech-d9387.appspot.com/o/Answering.gif?alt=media&token=5fc72568-5c7e-4039-b38f-df940a7b9a92",
                  gaplessPlayback: true,
                ),
                // imagesBox(
                //   "assets/WhatsAppTopics/Android/Answering.gif",
                // ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category8ContentTrans3,
                  style: _localStyle,
                ),
                Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/learntech-d9387.appspot.com/o/Declining.gif?alt=media&token=705ea02d-91ee-4bc1-a65f-4964b05ecd8c",
                  gaplessPlayback: true,
                ),
                // imagesBox(
                //   "assets/WhatsAppTopics/Android/Declining.gif",
                // ),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: AppLocalizations().waTitle1Category9Trans,
              icon: Icons.keyboard_voice,
              imagePath: "assets/WhatsAppTopics/CreatingGroupChats.jpg",
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
                Image.network(
                  "https://firebasestorage.googleapis.com/v0/b/learntech-d9387.appspot.com/o/AddingContactstoGroup.gif?alt=media&token=ac64d7ce-2850-4aaf-8ad0-60ba7ba41091",
                  gaplessPlayback: true,
                ),
                // imagesBox(
                //   "assets/WhatsAppTopics/Android/AddingContactstoGroup.gif",  //Both deployed
                // ),
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
              icon: Icons.network_wifi,
              imagePath: "assets/SecurityTopics/IncreasePrivacy.jpg",
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
                Text(
                    AppLocalizations().safeTitle2Category1ContentTrans4,
                    style: _localSub),
                // imagesBox(
                //   "assets/WhatsAppTopics/Android/LastSeen.gif",   //Android Haven't deploy
                // ),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: AppLocalizations().safeTitle2Category2Trans,
              icon: Icons.network_wifi,
              imagePath: "assets/SecurityTopics/DetectingScams.jpg",
              topicInfo: [
                Text(
                  AppLocalizations().safeTitle2Category2ContentTrans1,
                  style: _localStyle
                ),
                DivideLine(),
                Container(
                  child: Image.asset(
                    "assets/SecurityTopics/Scam.jpg",
                  ),
                ),
                DivideLine(),
                Text(
                  AppLocalizations().safeTitle2Category2ContentTrans2,
                  style: _localStyle
                ),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: AppLocalizations().safeTitle2Category3Trans,
              icon: Icons.network_wifi,
              imagePath: "assets/SecurityTopics/DetectingFakeNews.jpg",
              topicInfo: [
                Text(
                    AppLocalizations().safeTitle2Category3ContentTrans1,
                    style: _localStyle
                ),
                DivideLine(),
                Container(
                  child: Image.asset(
                    "assets/SecurityTopics/FakeNews.jpg",
                  ),
                ),
                DivideLine(),
                Text(
                    AppLocalizations().safeTitle2Category3ContentTrans2,
                    style: _localStyle
                ),
                DivideLine(),
              ],
            ),
          ];
  }
}

// Cause Divide() SUCKS LOL, forked from it xd wrecks
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
                color: Colors.black,
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