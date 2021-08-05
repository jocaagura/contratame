import 'package:flutter/material.dart';

import '../models/model_users.dart';
import 'avatar_user_widget.dart';

class CardUserWidget extends StatelessWidget {
  const CardUserWidget({required this.modelUser, required this.size});

  final Size size;
  final ModelUser modelUser;

  @override
  Widget build(BuildContext context) {
    final verticarMargin = size.height * 0.015;
    final horizontalMargin = size.width * 0.05;

    final cardHeight = size.width / 3;
    final cardWidth = size.width * 0.9;
    final avatarHeight = cardHeight * 0.8;
    final containerEmail = cardWidth - (avatarHeight * 1.5);

    return Container(
        margin: EdgeInsets.symmetric(
            vertical: verticarMargin, horizontal: horizontalMargin),
        padding: EdgeInsets.all(verticarMargin),
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AvatarUserWidget(height: avatarHeight, modelUser: modelUser),
            Container(
              width: containerEmail,
              height: avatarHeight,
              alignment: Alignment.centerLeft,
              child: Text('${modelUser.email}'),
            )
          ],
        ));
  }
}
