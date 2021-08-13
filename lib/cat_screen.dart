import 'package:animations/animations.dart';
import 'package:dreambitcattestapp/block/image/image_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import 'block/image/image_bloc.dart';
import 'block/image/image_states.dart';
import 'image_screen.dart';
import 'model/cat.dart';
import 'model/cat_image.dart';

class CatScreen extends StatelessWidget{
  final Cat cat;
  CatScreen({required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cat info"),
        ),
        body: BlocProvider<ImageBlock>(
          create: (BuildContext context) => ImageBlock(ImageInitial()),
          child: CatInfoWidget(cat: cat)
        )
    );
  }
}

class CatInfoWidget extends StatefulWidget{
  Cat cat;

  CatInfoWidget({Key? key, required this.cat}) : super(key: key);

  @override
  _MyCatInfoState createState() => _MyCatInfoState();
}

class _MyCatInfoState extends State<CatInfoWidget>{
  @override
  Widget build(BuildContext context) {
    Cat cat = widget.cat;
    GetImages catBlock = GetImages(widget.cat.id!);
    context.read<ImageBlock>().add(catBlock);

    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<ImageBlock, ImageState>(
          builder: (context, state) {
            if(state is ImageInitial){
              return LinearProgressIndicator();
            }
            else if(state is ImageUnsuccess){
              String errorMessages = state.errorMessages;
              print("Error load Images: " + errorMessages);
              return Text("Error load Images");
            }
            else if(state is ImageSuccess){
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
                    Visibility(
                      visible: cat.wikipediaUrl != null,
                      child: OutlinedButton.icon(
                        onPressed: (){
                          launch(cat.wikipediaUrl.toString());
                        },
                        icon: Icon(Icons.http),
                        label: Text("Wikipedia"),
                      ),
                    ),
                    Visibility(
                      visible: cat.cfaUrl != null,
                      child: OutlinedButton.icon(
                        onPressed: (){
                          launch(cat.cfaUrl.toString());
                        },
                        icon: Icon(Icons.http),
                        label: Text("CFA"),
                      ),
                    ),
                    Visibility(
                      visible: cat.vetstreetUrl != null,
                      child: OutlinedButton.icon(
                        onPressed: (){
                          launch(cat.vetstreetUrl.toString());
                        },
                        icon: Icon(Icons.http),
                        label: Text("vetstreet"),
                      ),
                    ),
                    Visibility(
                      visible: cat.vcahospitalsUrl != null,
                      child: OutlinedButton.icon(
                        onPressed: (){
                          launch(cat.vcahospitalsUrl.toString());
                        },
                        icon: Icon(Icons.http),
                        label: Text("VCA"),
                      ),
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
    return Visibility(
        visible: rating != null,
        child: Column(
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
    );
  }
}

class HorizontalImageScrollWidget extends StatelessWidget {
  const HorizontalImageScrollWidget({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<CatImage> images;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          for(var image in images)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                //width: 200,
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