import 'package:flutter/services.dart';

import 'features/chat/presentation/global/themes/app_themes.dart';

import 'features/chat/presentation/pages/chat_page/chat_page.dart';
import 'package:flutter/material.dart';

import 'features/chat/presentation/global/localization/app_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark
    ),
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Myelin',
      theme: AppThemes.light,
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
