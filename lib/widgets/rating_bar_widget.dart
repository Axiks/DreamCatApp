import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingBarWidget extends StatelessWidget {
  const RatingBarWidget({
    Key? key,
    required this.title,
    required this.rating,
  }) : super(key: key);

  final String title;
  final int? rating;

  @override
  Widget build(BuildContext context) {
    return rating != null
        ? Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          SizedBox(
            height: 6,
          ),
          RatingBarIndicator(
            rating: rating?.toDouble() ?? 0,
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: 32.0,
            direction: Axis.horizontal,
          ),
          SizedBox(
            height: 16,
          ),
        ],
      )
        : Container();
  }
}