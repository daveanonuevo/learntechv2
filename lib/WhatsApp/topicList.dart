import 'package:flutter/material.dart';
import 'package:learntech/WhatsApp/topicSelect.dart';
import 'dart:io' show Platform;
import 'package:learntech/localizations.dart';

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
                imagesBox(
                    "assets/WhatsAppTopics/$strPlat/FindInstallSearch.gif"),
                Text(
                  AppLocalizations().waTitle1Category1ContentTrans2,
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
                imagesBox(
                    "assets/WhatsAppTopics/$strPlat/CreatingAnAccount.gif"),
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
                imagesBox(
                  "assets/WhatsAppTopics/$strPlat/AddingContacts.gif",
                ),
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
                imagesBox(
                  "assets/WhatsAppTopics/$strPlat/SendingMessages.gif",
                ),
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
                imagesBox(
                  "assets/WhatsAppTopics/$strPlat/SendingVoiceMemos.gif",
                ),
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
                imagesBox(
                  "assets/WhatsAppTopics/$strPlat/SendingPhotos.gif",
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category6ContentTrans6,
                  style: _localSub,
                ),
                imagesBox(
                  "assets/WhatsAppTopics/$strPlat/SendingLocation.gif",
                ),
                DivideLine(),
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
//                DivideLine(),
//                Text(
//                  "Tap on the name of the person you wish to contact",  //irrelevant
//                  style: _localStyle,
//                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category7ContentTrans3,
                  style: _localSub,
                ),
                DivideLine(),
                imagesBox(
                  "assets/WhatsAppTopics/$strPlat/GivingCalls.gif",
                ),
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
                  "assets/pikachu.gif",
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category8ContentTrans2,
                  style: _localStyle,
                ),
                imagesBox(
                  "assets/pikachu.gif",
                ),
                DivideLine(),
                Text(
                  AppLocalizations().waTitle1Category8ContentTrans3,
                  style: _localStyle,
                ),
                imagesBox(
                  "assets/pikachu.gif",
                ),
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
                imagesBox(
                  "assets/WhatsAppTopics/$strPlat/AddingContactstoGroup.gif",
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
                imagesBox(
                  "assets/WhatsAppTopics/$strPlat/CreatingGroups.gif",
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
                imagesBox(
                  "assets/WhatsAppTopics/$strPlat/LastSeen.gif",
                ),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: AppLocalizations().safeTitle2Category2Trans,
              icon: Icons.network_wifi,
              imagePath: "assets/SecurityTopics/DetectingScams.jpg",
              topicInfo: [
                imagesBox(
                  "assets/pikachu.gif",
                ),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: AppLocalizations().safeTitle2Category3Trans,
              icon: Icons.network_wifi,
              imagePath: "assets/SecurityTopics/DetectingFakeNews.jpg",
              topicInfo: [
                imagesBox(
                  "assets/pikachu.gif",
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
