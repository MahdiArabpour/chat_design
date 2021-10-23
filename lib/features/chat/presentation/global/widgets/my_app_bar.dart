import 'dart:ui';

import 'package:chat_design/features/chat/presentation/global/widgets/blur_filter.dart';
import 'package:chat_design/features/chat/presentation/global/widgets/my_button.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final Widget? profileImg;
  final String? title;
  final String? subtitle;
  final bool? backButton;
  final bool blur;

  const MyAppBar({
    Key? key,
    this.actions,
    this.profileImg,
    this.title,
    this.subtitle,
    this.backButton,
    this.blur = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hasBackButton = backButton ?? Navigator.of(context).canPop();
    final themeData = Theme.of(context);
    const radius = Radius.circular(30.0);
    return BlurFilter(
      blur: blur,
      borderRadius: const BorderRadius.only(
        bottomLeft: radius,
        bottomRight: radius,
      ),
      padding: EdgeInsets.only(
        left: 40.0,
        right: 40.0,
        top: MediaQuery.of(context).padding.top,
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                if (hasBackButton) ...[
                  MyButton(
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 20.0,
                    ),
                    onTap: () {
                      debugPrint("backButtonPressed");
                    },
                  ),
                  const SizedBox(
                    width: 24.0,
                  ),
                ],
                if (profileImg != null)
                  DecoratedBox(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: themeData.colorScheme.secondary,
                        offset: const Offset(0.0, 24.0),
                        blurRadius: 30.0,
                      ),
                    ]),
                    child: ClipRRect(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: profileImg ?? const SizedBox(),
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                const SizedBox(
                  width: 12.0,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          title ?? "",
                          style: themeData.textTheme.headline5,
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          subtitle ?? "",
                          style: themeData.textTheme.caption,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: actions ?? const [],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(86.0);
}
