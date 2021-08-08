import 'package:flutter/material.dart';

import '../../../blocs/bloc_central.dart';
import '../blocs/bloc_users.dart';
import '../models/model_users.dart';
import '../widgets/card_user_widget.dart';

class UserCreateEditFormPage extends StatefulWidget {
  const UserCreateEditFormPage();

  @override
  _UserCreateEditFormPageState createState() => _UserCreateEditFormPageState();
}

class _UserCreateEditFormPageState extends State<UserCreateEditFormPage> {
  @override
  Widget build(BuildContext context) {
    final BlocCentral _blocCentral = BlocCentral();

    final size = _blocCentral.size;
    final TextStyle titleStyle = TextStyle(
        color: Colors.blue,
        fontFamily: 'fjalla',
        fontSize: size.height * 0.0275,
        fontWeight: FontWeight.bold);

    final labelStyle = TextStyle(
        fontFamily: 'sourceserif',
        color: Colors.blue,
        fontSize: size.height * 0.012);

    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: size.height * 0.3,
                child: StreamBuilder(
                  stream: BlocUsers().userStream,
                  builder: (BuildContext context,
                      AsyncSnapshot<ModelUser?> snapshot) {
                    if (snapshot.hasData) {
                      final modelUser = snapshot.data!;
                      return FittedBox(
                        child: Stack(
                          children: [
                            CardUserWidget(
                              modelUser: modelUser,
                              size: size,
                            ),
                            Positioned(
                              top: size.height * 0.04,
                              right: size.width * 0.06,
                              child: Container(
                                width: size.width * 0.5,
                                height: size.height * 0.05,
                                child: Text(
                                    '${modelUser.firstName} ${modelUser.lastName}'),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              Container(
                width: size.width,
                height: 50.0,
                child: Text(
                  'Registro de usuario',
                  style: titleStyle,
                ),
              ),

              /// Inputs form
              /// first Name
              _InputFormField(
                label: 'Nombre:',
                callback: (value) {
                  if (value != null &&
                      value != '' &&
                      BlocUsers().user?.firstName != value) {
                    BlocUsers().user = ModelUser(
                      firstName: value,
                      lastName: BlocUsers().user?.lastName ?? '',
                      avatar: BlocUsers().user?.avatar ??
                          'https://jocaagura.github.io/hvalbertjimenez/img/joao.jpg',
                      email: BlocUsers().user?.email ?? '',
                    );
                  }
                },
                initialValue: BlocUsers().user?.firstName,
                size: size,
                labelStyle: labelStyle,
                callbackValidator: (value) {
                  if (value == null || value == '') {
                    return 'Se requiere un nombre';
                  }

                  return null;
                },
              ),

              /// last name
              _InputFormField(
                label: 'Apellidos:',
                callback: (value) {
                  if (value != null &&
                      value != '' &&
                      BlocUsers().user?.lastName != value) {
                    BlocUsers().user = ModelUser(
                      firstName: BlocUsers().user?.firstName ?? '',
                      lastName: value,
                      avatar: BlocUsers().user?.avatar ??
                          'https://jocaagura.github.io/hvalbertjimenez/img/joao.jpg',
                      email: BlocUsers().user?.email ?? '',
                    );
                  }
                },
                initialValue: BlocUsers().user?.lastName,
                size: size,
                labelStyle: labelStyle,
                callbackValidator: (value) {
                  if (value == null || value == '') {
                    return 'Se requiere un Apellido';
                  }
                  return null;
                },
              ),

              /// email
              _InputFormField(
                label: 'Email:',
                callback: (value) {
                  if (value != null && _blocCentral.validateEmail(value)) {
                    BlocUsers().user = ModelUser(
                      firstName: BlocUsers().user?.firstName ?? '',
                      lastName: BlocUsers().user?.lastName ?? '',
                      avatar: BlocUsers().user?.avatar ??
                          'https://jocaagura.github.io/hvalbertjimenez/img/joao.jpg',
                      email: value,
                    );
                  }
                  return 'Escribe una direccion de correo valida';
                },
                initialValue: BlocUsers().user?.email,
                size: size,
                labelStyle: labelStyle,
                callbackValidator: (value) {
                  if (value == null) {
                    return 'Escribe una direccion de correo valida';
                  }

                  if (!_blocCentral.validateEmail(value)) {
                    return 'Escribe una direccion de correo valida';
                  }
                  return null;
                },
              ),

              ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      BlocUsers()
                          .createUserIntoDataBase(BlocUsers().user!)
                          .then((val) {
                        Navigator.of(context).pop();
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                  'Usuario creado satisfactoriamente con id ${val.id}'),
                            );
                          },
                        );
                      });
                    }
                  },
                  child: Text('Crear usuario')),
            ],
          ),
        ),
      ),
    );
  }
}

class _InputFormField extends StatelessWidget {
  const _InputFormField(
      {required this.size,
      required this.labelStyle,
      required this.label,
      required this.initialValue,
      required this.callback,
      required this.callbackValidator});

  final Size size;
  final TextStyle labelStyle;
  final String label;
  final String? initialValue;
  final Function(String? val) callback;
  final Function(String? val) callbackValidator;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.1,
      child: Column(
        children: [
          Container(
            width: size.width,
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              label,
              style: labelStyle,
            ),
          ),
          TextFormField(
              initialValue: initialValue,
              onChanged: callback,
              validator: (value) {
                return callbackValidator(value);
              }),
        ],
      ),
    );
  }
}
