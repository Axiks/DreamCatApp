import 'package:animations/animations.dart';
import 'package:dreambitcattestapp/block/image/image_event.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              return Text("Initial");
            }
            else if(state is ImageUnsuccess){
              return Text("Unsuccess");
            }
            else if(state is ImageSuccess){
              List<CatImage> images = state.images;
              return HorizontalImageScrollWidget(images: images);
            }
            else{
              return Text("Невідома помилка");
            }
          }),

          Visibility(
            visible: (cat.catImage != null) && (cat.catImage!.url != null),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image(
                image: NetworkImage(cat.catImage!.url!),
                height: 150,
              ),
            ),
          ),
          Center(child: Text("Cat name: " + (cat.name ?? ""))),
          Center(child: Text(cat.description ?? "")),
          Center(child: Text(cat.origin ?? "")),
          Center(child: Text(cat.altNames ?? "")),
          Center(child: Text("Temperament" + (cat.temperament ?? ""))),
          Center(child: Text(cat.lifeSpan ?? "")),
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
                  closedBuilder: (context, _) => ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image(
                      image: NetworkImage(image.url!),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}