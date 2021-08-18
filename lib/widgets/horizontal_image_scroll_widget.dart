import 'package:animations/animations.dart';
import 'package:dreambitcattestapp/model/cat_image.dart';
import 'package:dreambitcattestapp/screens/image_screen.dart';
import 'package:flutter/material.dart';

class HorizontalImageScrollWidget extends StatelessWidget {
  const HorizontalImageScrollWidget({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<CatImage> images;

  @override
  Widget build(BuildContext context) {
    //var a = images.map((i) => null)
    // Iterable<DataRow> dataRow = images.map((image) {
    //   return DataRow(cells: [
    //     DataCell(
    //       Text(image.url.toString()),
    //     ),
    //     DataCell(
    //       Text(image.width.toString()),
    //     ),
    //   ]);
    // });

    return Container(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for(var image in images)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: OpenContainer(
                  openBuilder: (context, _) => ImageScreen(image: image),
                  closedBuilder: (context, _) => Image(
                    image: NetworkImage(image.url!),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}