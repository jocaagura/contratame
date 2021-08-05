import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../blocs/bloc_central.dart';
import '../models/model_users.dart';

class AvatarUserWidget extends StatelessWidget {
  const AvatarUserWidget({
    required this.height,
    required this.modelUser,
  });

  final double height;
  final ModelUser modelUser;

  @override
  Widget build(BuildContext context) {
    final url = modelUser.avatar;

    if (!BlocCentral().validateUrl(url)) {
      return Center(
          child: Icon(
        Icons.error,
        color: Theme.of(context).errorColor,
      ));
    }

    return Container(
      width: height,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: CachedNetworkImage(
          imageUrl: modelUser.avatar,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) =>
              Icon(Icons.error, color: Theme.of(context).errorColor),
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.orangeAccent.withOpacity(0.18),
                      BlendMode.colorBurn)),
            ),
          ),
        ),
      ),
    );
  }
}
