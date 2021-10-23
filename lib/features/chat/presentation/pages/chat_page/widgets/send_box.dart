import 'package:chat_design/features/chat/presentation/global/localization/app_localizations.dart';
import 'package:flutter/material.dart';

class SendBox extends StatelessWidget {
  const SendBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(20.0);
    final themeData = Theme.of(context);
    final localizations = AppLocalizations.of(context);
    return  Container(
      decoration: const  BoxDecoration(
        borderRadius:  BorderRadius.only(
          topLeft: radius,
          topRight: radius,
        ),
        gradient: LinearGradient(
          colors:  [
            Color(0xfffffce9),
            Color(0xfffed4ba),
          ],
          end: Alignment( -2, -2),
          // stops:  [0.5, 1.0],
          begin: Alignment.topRight,
        ),
      ),
      child: Row(
          children:  [
            Directionality(
              textDirection: TextDirection.ltr,
              child: Material(
                color: Colors.transparent,
                clipBehavior: Clip.antiAlias,
                shape: const CircleBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: IconButton(
                    highlightColor: Colors.transparent,
                    onPressed: (){},
                    icon: Icon(
                      Icons.send,
                      color: themeData.colorScheme.primary,
                      size: 32.0,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: localizations.translate("enter_message"),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,

                ),
                keyboardType: TextInputType.multiline,
                minLines: 1,//Normal textInputField will be displayed
                maxLines: 5,
              ),
            ),
            Material(
              color: Colors.transparent,
              clipBehavior: Clip.antiAlias,
              shape: const CircleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: IconButton(
                  onPressed: (){},
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    Icons.emoji_emotions_outlined,
                    color: themeData.colorScheme.onSecondary,
                    size: 32.0,
                  ),
                ),
              ),
            ),
          ],
        ),
    );
  }
}
