import 'package:chat_design/features/chat/domain/entities/message.dart';
import 'package:chat_design/features/chat/presentation/global/localization/app_localizations.dart';
import 'package:chat_design/features/chat/presentation/global/widgets/dismissible_focus.dart';
import 'package:chat_design/features/chat/presentation/global/widgets/my_app_bar.dart';
import 'package:chat_design/features/chat/presentation/global/widgets/my_button.dart';
import 'package:chat_design/features/chat/presentation/pages/chat_page/widgets/message_box.dart';
import 'package:chat_design/features/chat/presentation/pages/chat_page/widgets/send_box.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  static const routeName = "/chat-page";

  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final mediaQueryData = MediaQuery.of(context);
    final themeData = Theme.of(context);

    const messages = [
      Message(
        date: "۱۹ اردیبهشت ۱۴۰۰",
      ),
      Message(
        isMyMessage: true,
        text: "سلام خوبی؟",
        time: "۱۴:۳۰",
      ),
      Message(
        isMyMessage: true,
        text:
            "هویج، یک ریشه گیاهی دارد که اغلب ادعا می‌شود برای سلامتی، یک غذای کامل است. هویج، ترد خوشمزه و سرشار از مواد مغذی میباشد.",
        time: "۱۴:۳۰",
      ),
      Message(
        imagePath: "assets/images/img1.png",
        isMyMessage: false,
        time: "۱۴:۳۱",
      ),
      Message(
        isMyMessage: false,
        text: "سلام خوبم تو خوبی؟",
        time: "۱۴:۳۱",
      ),
    ];

    return DismissibleFocus(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: MyAppBar(
          backButton: true,
          profileImg: Image.asset("assets/images/person_img.png"),
          title: localizations.translate("person_name"),
          subtitle: localizations.translate("last_seen"),
          actions: [
            MyButton(
              onTap: () {
                debugPrint("more button clicked");
              },
              child: const Icon(Icons.more_vert),
            ),
          ],
        ),
        body: Container(
          height: mediaQueryData.size.height,
          width: mediaQueryData.size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                themeData.colorScheme.secondary.withOpacity(0.5),
                themeData.colorScheme.secondaryVariant,
              ],
              end: Alignment.bottomLeft,
              stops: const [0.4, 1.0],
              begin: Alignment.topRight,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => MessageBox(
                    message: messages[index],
                  ),
                  itemCount: messages.length,
                  shrinkWrap: true,
                ),
              ),
              const SendBox(),
            ],
          ),
        ),
      ),
    );
  }
}
