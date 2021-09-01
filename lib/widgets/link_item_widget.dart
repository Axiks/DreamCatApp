import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkItemWidget extends StatelessWidget {
  const LinkItemWidget({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  final String title;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return url != null
        ? OutlinedButton.icon(
      onPressed: (){
        launch(url.toString());
        },
      icon: Icon(Icons.http),
      label: Text(title),
    )
        : Container();
  }
}