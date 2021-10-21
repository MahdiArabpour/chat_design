import 'features/chat/presentation/pages/chat_page/chat_page.dart';
import 'package:flutter/material.dart';

import 'features/chat/presentation/global/localization/app_localizations.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Myelin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      supportedLocales: AppSupportedLocales.all,
      localizationsDelegates: AppLocalizations.delegates,
      localeResolutionCallback: AppLocalizations.localeResolutionCallback,
      initialRoute: ChatPage.routeName,
      routes: {
        ChatPage.routeName: (_) => const ChatPage(),
      },
    );
  }
}
