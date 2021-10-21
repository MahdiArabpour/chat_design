import 'package:chat_design/features/chat/presentation/global/localization/app_localizations.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {

  static const routeName = "/chat-page";

  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate("chat_page")),
      ),
    );
  }
}
