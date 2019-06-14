import 'package:flutter/material.dart';
import 'dart:io' show Platform;

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
              topicName: "Installing WhatsApp",
              icon: Icons.explore,
              imagePath: "assets/WhatsAppTopics/InstallingWhatsApp.jpg",
              topicInfo: [
                Text(
                  "Find your phone’s App Store and open it, search for WhatsApp and install",
                  style: _localStyle,
                ),
                imagesBox(
                    "assets/WhatsAppTopics/$strPlat/FindInstallSearch.gif"),
                Text(
                  "Congratulations, you now have WhatsApp installed!",
                  style: _localStyle,
                ),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: "Creating an Account",
              icon: Icons.account_circle,
              imagePath: "assets/WhatsAppTopics/CreatingAnAccount.jpg",
              topicInfo: [
                Text(
                    "Open WhatsApp and key in your phone number and country code, tap on Next when done",
                    style: _localStyle),
                DivideLine(),
                Text(
                  "Allow all permissions it requests of you to make life easier",
                  style: _localSub,
                ),
                DivideLine(),
                Text("Edit your profile such as your name and photo.",
                    style: _localStyle),
                DivideLine(),
                imagesBox(
                    "assets/WhatsAppTopics/$strPlat/CreatingAnAccount.gif"),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: "Adding Contacts",
              icon: Icons.create,
              imagePath: "assets/WhatsAppTopics/AddingContacts.jpg",
              topicInfo: [
                Text(
                  "Tap on the Message Icon on the top right",
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  "Tap on New Contact",
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  "Fill in the name and number of the one you wish to contact and click Save on the top right when done",
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
              topicName: "Sending Messages",
              icon: Icons.network_wifi,
              imagePath: "assets/WhatsAppTopics/SendingMessages.jpg",
              topicInfo: [
                Text(
                  "Tap on the Message Icon",
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  "Tap on the name of the person you wish to message",
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  "Tap on the bottom text field and type your message using the keyboard",
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  "When you have completed typing, press the Arrow Icon on the right",
                  style: _localStyle,
                ),
                imagesBox(
                  "assets/WhatsAppTopics/$strPlat/SendingMessages.gif",
                ),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: "Sending Voice Memos",
              icon: Icons.keyboard_voice,
              imagePath: "assets/WhatsAppTopics/SendingVoiceMemos.jpg",
              topicInfo: [
                Text(
                  "Tap on the Message Icon",
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  "Tap on the name of the person you wish to contact",
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  "Press and hold the microphone icon on the bottom right, and start to speak your message",
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  "Once you have completed, let go of the microphone and your message will be sent, or swipe left for it to be discarded",
                  style: _localStyle,
                ),
                imagesBox(
                  "assets/WhatsAppTopics/$strPlat/SendingVoiceMemos.gif",
                ),
                DivideLine(),
              ],
            ),
            ModuleTopic(
              topicName: "Sending Media",
              icon: Icons.network_wifi,
              imagePath: "assets/WhatsAppTopics/SendingMedia.jpg",
              topicInfo: [
                Text(
                  "Tap on the Message Icon",
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  "Tap on the name of the person you wish to contact",
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  "Tap on the + sign that is on the left of the Message Text Field",
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  "Select the media type you wish to send and follow through accordingly",
                  style: _localStyle,
                ),
                DivideLine(),
                Text(
                  "Here's an example of sharing a photo",
                  style: _localSub,
                ),
                imagesBox(
                  "assets/WhatsAppTopics/$strPlat/SendingPhotos.gif",
                ),
                DivideLine(),
                Text(
                  "Here's an example of sharing your location \n*You may need to allow your phone permissions to do this",
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
