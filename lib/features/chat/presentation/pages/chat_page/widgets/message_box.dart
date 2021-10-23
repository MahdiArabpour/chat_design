import 'package:chat_design/features/chat/domain/entities/message.dart';
import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  final Message message;

  const MessageBox({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    const biggerRadius = Radius.circular(25.0);
    const smallerRadius = Radius.circular(5.0);
    final mediaQueryData = MediaQuery.of(context);

    if (message.date != null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4.0),
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: message.isMyMessage ?? true
                  ? themeData.colorScheme.background
                  : themeData.colorScheme.secondary,
              borderRadius: const BorderRadiusDirectional.all(biggerRadius),
            ),
            child: Text(message.date ?? " "),
          ),
        ],
      );
    }

    return Row(
      mainAxisAlignment: message.isMyMessage ?? true
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          constraints:
              BoxConstraints(maxWidth: mediaQueryData.size.width * 0.6),
          decoration: BoxDecoration(
            color: message.isMyMessage ?? true
                ? themeData.colorScheme.background
                : themeData.colorScheme.secondary,
            borderRadius: BorderRadiusDirectional.only(
                topStart: biggerRadius,
                topEnd: biggerRadius,
                bottomStart:
                    message.isMyMessage ?? true ? smallerRadius : biggerRadius,
                bottomEnd:
                    message.isMyMessage ?? true ? biggerRadius : smallerRadius),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: message.isMyMessage ?? true
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: [
                if (message.imagePath != null) ...[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5.0,
                      left: 5.0,
                      right: 5.0,
                    ),
                    child: Image.asset(message.imagePath ?? ""),
                  ),
                ],
                if (message.text != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      message.text ?? "",
                    ),
                  ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (message.isMyMessage ?? true)
                      Icon(
                        Icons.check_rounded,
                        size: 16.0,
                        color: themeData.colorScheme.primary,
                      ),
                    Text(
                      message.time ?? "",
                      style: themeData.textTheme.caption?.apply(
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
