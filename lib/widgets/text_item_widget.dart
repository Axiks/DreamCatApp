import 'package:flutter/material.dart';

class TextItemWidget extends StatelessWidget {
  const TextItemWidget({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  final String title;
  final String? body;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: body != "",
        child: Column(
          children: [
            Text(title + body.toString()),
            SizedBox(
              height: 16,
            ),
          ],
        )
    );
  }
}