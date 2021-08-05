import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../models/model_users.dart';
import 'avatar_user_widget.dart';

class CardAlertWidget extends StatelessWidget {
  const CardAlertWidget({
    required this.size,
    required this.modelUser,
  });

  final Size size;
  final ModelUser modelUser;

  @override
  Widget build(BuildContext context) {
    final height1 = size.height * 0.5;
    final height1B = height1 * 0.25;

    return BounceInDown(
      duration: Duration(milliseconds: 550),
      child: Container(
        width: size.width,
        height: size.height,
        color: Colors.orangeAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              width: size.width,
              height: height1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                children: [
                  AvatarUserWidget(height: height1 * 0.9, modelUser: modelUser),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: size.width,
                            height: height1B,
                            child: Text(
                                '${modelUser.firstName} ${modelUser.lastName}'),
                          ),
                          Container(
                            width: size.width,
                            height: height1B,
                            child: Text('Id: ${modelUser.id}'),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              padding: EdgeInsets.only(right: 10.0),
              alignment: Alignment.centerRight,
              width: size.width,
              height: height1B,
              child: Text(
                '${modelUser.email}',
                style: TextStyle(color: Colors.blue),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
