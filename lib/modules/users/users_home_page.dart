import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'blocs/bloc_users.dart';
import 'models/model_users.dart';
import 'widgets/card_alert_widget.dart';
import 'widgets/card_user_widget.dart';

class HomeUserPage extends StatelessWidget {
  const HomeUserPage();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeCardAlertHeight = size.width * 0.45;

    // final ModelUser modelUser = ModelUser(id: 1, email: 'albert@joao.com', firstName: 'Albert', lastName: 'Jimenez', avatar: 'https://jocaagura.github.io/hvalbertjimenez/img/joao.jpg');

    return FutureBuilder(
      future: BlocUsers().listUsers(),
      builder: (BuildContext context, AsyncSnapshot<List<ModelUser>> snapshot) {
        if (snapshot.hasData) {
          List<ModelUser> listUsers = snapshot.data ?? [];
          if (listUsers.length > 0) {
            return ListView.builder(
              itemCount: listUsers.length,
              itemBuilder: (BuildContext context, int index) {
                ModelUser modelUser = listUsers[index];
                return FadeInLeft(
                  duration: Duration(milliseconds: 450),
                  child: InkWell(
                    onTap: () async {
                      ModelUser user =
                          await BlocUsers().singleUser(modelUser.id);
                      if (user.firstName == 'firstName') {
                        user = modelUser;
                      }

                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Ok'))
                            ],
                            content: CardAlertWidget(
                                size: Size(size.width, sizeCardAlertHeight),
                                modelUser: user),
                          );
                        },
                      );
                    },
                    child: CardUserWidget(
                      modelUser: modelUser,
                      size: size,
                    ),
                  ),
                );
              },
            );
          }
        }
        return Center(
          child: CircularProgressIndicator(
            semanticsLabel: 'Recuperando lista',
          ),
        );
      },
    );
  }
}
