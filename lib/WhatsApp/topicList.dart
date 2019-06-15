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
              topicName: "Giving Voice Calls",
              icon: Icons.keyboard_voice,
              imagePath: "assets/WhatsAppTopics/ManagingCalls.jpg",
              topicInfo: [
                Text(
                  "Tap on the Calls Icon located at the bottom of the screen",
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  "Tap on the top right to display a list of your contacts",
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  "Tap on the name of the person you wish to contact",
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  "You may need to allow permissions",
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
              topicName: "Answering Voice Calls",
              icon: Icons.keyboard_voice,
              imagePath: "assets/WhatsAppTopics/AnsweringCalls.jpg",
              topicInfo: [
                Text(
                  "Your phone will look like this when you receive a call",
                  style: _localStyle,
                ),
                imagesBox(
                  "assets/pikachu.gif",
                ),
                DivideLine(),
                Text(
                  "Press and hold the green button, and then swipe up to answer",
                  style: _localStyle,
                ),
                imagesBox(
                  "assets/pikachu.gif",
                ),
                DivideLine(),
                Text(
                  "Or press the red button to decline",
                  style: _localStyle,
                ),
                imagesBox(
                  "assets/pikachu.gif",
                ),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: "Creating Group Chats",
              icon: Icons.keyboard_voice,
              imagePath: "assets/WhatsAppTopics/CreatingGroupChats.jpg",
              topicInfo: [
                Text(
                  "Tap on the Message Icon",
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  "Tap on New Group",
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  "Select all the contacts you wish to be inside the group",
                  style: _localStyle,
                ),
                imagesBox(
                  "assets/WhatsAppTopics/$strPlat/AddingContactstoGroup.gif",
                ),
                DivideLine(),
                Text(
                  "Tap on the arrow to proceed",
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  "Give the group a name and then tap the arrow to finish",
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
              topicName: "Protecting your Privacy",
              icon: Icons.network_wifi,
              imagePath: "assets/SecurityTopics/IncreasePrivacy.jpg",
              topicInfo: [
                Text(
                  "Tap on the Settings icon on the bottom right",
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  "Tap Account then Privacy",
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  "Tap Last Seen, Select My Contacts",
                  style: _localStyle,
                ),
                Text(
                    "\n*This allows only those whom are in your contacts to know when was the last time you used WhatsApp",
                    style: _localSub),
                imagesBox(
                  "assets/WhatsAppTopics/$strPlat/LastSeen.gif",
                ),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: "Detecting Scams",
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
              topicName: "Detecting Fake News",
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
