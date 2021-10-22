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
    return Align(
      alignment: message.date != null
          ? Alignment.center
          : (message.isMyMessage ?? true
              ? AlignmentDirectional.centerStart
              : AlignmentDirectional.centerEnd),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
          vertical: 4.0,
        ),
        child: Material(
          color: (message.isMyMessage ?? true)
              ? themeData.colorScheme.background
              : themeData.colorScheme.secondary,
          borderRadius: BorderRadiusDirectional.only(
            topEnd: biggerRadius,
            topStart: biggerRadius,
            bottomEnd: message.date != null
                ? biggerRadius
                : ((message.isMyMessage ?? true)
                    ? biggerRadius
                    : smallerRadius),
            bottomStart: message.date != null
                ? biggerRadius
                : ((message.isMyMessage ?? true)
                    ? smallerRadius
                    : biggerRadius),
          ),
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: mediaQueryData.size.width / 2),
            child: Builder(
              builder: (context) {
                if (message.date != null) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(message.date ?? ""),
                  );
                } else if (message.imagePath != null) {
                  return Column(
                    children: [
                      Image.asset(message.imagePath ?? ""),
                      if (message.text != null) Text(message.text ?? ""),
                    ],
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        style: themeData.textTheme.bodyText2,
                        children: [
                          TextSpan(
                            text: message.text ?? "",
                          ),
                          TextSpan(
                            text: "\n" + (message.time ?? ""),
                            style: themeData.textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          // Column(
          //   mainAxisSize: MainAxisSize.min,
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     if (message.imagePath != null)
          //       Image.asset(message.imagePath ?? ""),
          //     if (message.text != null) Text(message.text ?? ""),
          //     Align(
          //       alignment: message.isMyMessage ?? true
          //           ? AlignmentDirectional.centerStart
          //           : AlignmentDirectional.centerEnd,
          //       child: Padding(
          //         padding: const EdgeInsets.all(2.0),
          //         child: Text(
          //           message.time ?? "",
          //           style: themeData.textTheme.caption,
          //         ),
          //       ),
          //     )
          //   ],
          // ),
        ),
      ),
    );
    //   Row(
    //   mainAxisAlignment: message.date != null
    //       ? MainAxisAlignment.center
    //       : MainAxisAlignment.start,
    //   textDirection:
    //       (message.isMyMessage ?? true) ? TextDirection.rtl : TextDirection.ltr,
    //   children: [
    //     if (message.date != null)
    //       Expanded(
    //         child: Container(
    //           margin: const EdgeInsets.symmetric(
    //             horizontal: 40.0,
    //             vertical: 4.0,
    //           ),
    //           decoration: BoxDecoration(
    //             borderRadius: const BorderRadiusDirectional.all(biggerRadius),
    //             color: themeData.colorScheme.background,
    //           ),
    //         ),
    //       )
    //     else
    //       Expanded(
    //         child: Container(
    //           margin: const EdgeInsets.symmetric(
    //             horizontal: 40.0,
    //             vertical: 4.0,
    //           ),
    //           decoration: BoxDecoration(
    //             color: (message.isMyMessage ?? true)
    //                 ? themeData.colorScheme.background
    //                 : themeData.colorScheme.secondary,
    //             borderRadius: BorderRadiusDirectional.only(
    //               topEnd: biggerRadius,
    //               topStart: biggerRadius,
    //               bottomEnd: (message.isMyMessage ?? true)
    //                   ? biggerRadius
    //                   : smallerRadius,
    //               bottomStart: (message.isMyMessage ?? true)
    //                   ? smallerRadius
    //                   : biggerRadius,
    //             ),
    //           ),
    //           child: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               if (message.imagePath != null)
    //                 Image.asset(message.imagePath ?? ""),
    //               if (message.text != null) Text(message.text ?? ""),
    //             ],
    //           ),
    //         ),
    //       ),
    //   ],
    // );
  }
}
