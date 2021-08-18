import 'package:dreambitcattestapp/bloc/image/image_event.dart';
import 'package:dreambitcattestapp/widgets/horizontal_image_scroll_widget.dart';
import 'package:dreambitcattestapp/widgets/link_item_widget.dart';
import 'package:dreambitcattestapp/widgets/rating_bar_widget.dart';
import 'package:dreambitcattestapp/widgets/text_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/image/image_bloc.dart';
import '../bloc/image/image_states.dart';
import '../model/cat.dart';
import '../model/cat_image.dart';

class CatScreen extends StatelessWidget{
  final Cat cat;
  CatScreen({required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cat info"),
        ),
        body: BlocProvider<ImageBloc>(
          create: (BuildContext context) => ImageBloc(ImagesInitial())..add(GetImages(cat.id!)),
          child: CatInfoWidget(cat: cat)
        )
    );
  }
}

class CatInfoWidget extends StatelessWidget{
  Cat cat;
  CatInfoWidget({required this.cat});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<ImageBloc, ImagesState>(
          builder: (context, state) {
            if(state is ImagesInitial){
              return LinearProgressIndicator();
            }
            else if(state is ImagesNotLoaded){
              String errorMessages = state.errorMessages;
              print("Error load Images: " + errorMessages);
              return Text("Error load Images");
            }
            else if(state is ImagesLoaded){
              List<CatImage> images = state.images;
              return HorizontalImageScrollWidget(images: images);
            }
            else{
              return Text("Невідома помилка");
            }
          }),
          SizedBox(
            height: 16,
          ),
          Visibility(
            visible: (cat.catImage != null) && (cat.catImage!.url != null),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: CircleAvatar(
                radius: 82,
                backgroundImage: NetworkImage(cat.catImage?.url ?? ""),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(cat.name ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 36
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Visibility(
                  visible: cat.origin != null,
                  child: Center(child: Text(cat.origin ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.w300,
                    ),
                  )
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Wrap(
                  spacing: 5,
                  children: [
                    LinkItemWidget(
                      title: "Wikipedia",
                      url: cat.wikipediaUrl,
                    ),
                    LinkItemWidget(
                      title: "CFA",
                      url: cat.cfaUrl,
                    ),
                    LinkItemWidget(
                      title: "vetstreet",
                      url: cat.vetstreetUrl,
                    ),
                    LinkItemWidget(
                      title: "VCA",
                      url: cat.vcahospitalsUrl,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                TextItemWidget(
                  title: "",
                  body: cat.description,
                ),
                TextItemWidget(
                  title: "Alt name: ",
                  body: cat.altNames,
                ),
                TextItemWidget(
                  title: "Temperament: ",
                  body: cat.temperament,
                ),
                TextItemWidget(
                  title: "Life span: ",
                  body: cat.lifeSpan,
                ),
                RatingBarWidget(
                  title: "Dog friendly",
                  rating: cat.dogFriendly,
                ),
                RatingBarWidget(
                  title: "Child friendly",
                  rating: cat.childFriendly,
                ),
                RatingBarWidget(
                  title: "Energy level",
                  rating: cat.energyLevel,
                ),
                RatingBarWidget(
                  title: "Grooming",
                  rating: cat.grooming,
                ),
                RatingBarWidget(
                  title: "Health issues",
                  rating: cat.healthIssues,
                ),
                RatingBarWidget(
                  title: "Intelligence",
                  rating: cat.intelligence,
                ),
                RatingBarWidget(
                  title: "Shedding level",
                  rating: cat.sheddingLevel,
                ),
                RatingBarWidget(
                  title: "Social needs",
                  rating: cat.socialNeeds,
                ),
                RatingBarWidget(
                  title: "Stranger friendly",
                  rating: cat.strangerFriendly,
                ),
                RatingBarWidget(
                  title: "Vocalisation",
                  rating: cat.vocalisation,
                ),
                RatingBarWidget(
                  title: "Bidability",
                  rating: cat.bidability,
                ),
                RatingBarWidget(
                  title: "Experimental",
                  rating: cat.experimental,
                ),
                RatingBarWidget(
                  title: "Hairless",
                  rating: cat.hairless,
                ),
                RatingBarWidget(
                  title: "Natural",
                  rating: cat.natural,
                ),
                RatingBarWidget(
                  title: "Rare",
                  rating: cat.rare,
                ),
                RatingBarWidget(
                  title: "Rex",
                  rating: cat.rex,
                ),
                RatingBarWidget(
                  title: "Suppressed tail",
                  rating: cat.suppressedTail,
                ),
                RatingBarWidget(
                  title: "Short legs",
                  rating: cat.shortLegs,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}