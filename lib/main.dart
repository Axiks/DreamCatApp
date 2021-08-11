import 'package:dreambitcattestapp/block/cat/cat_bloc.dart';
import 'package:dreambitcattestapp/cat_screen.dart';
import 'package:dreambitcattestapp/model/cat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'block/cat/cat_event.dart';
import 'block/cat/cat_states.dart';

void main() {
  runApp(MyApp());
  // CatRepository catRepository = CatRepository();
  // print("Cat resp start");
  // catRepository.getAll();
  // // catRepository.getCat();
  // print("Cat resp end");
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home Screen'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocProvider<CatBlock>(
        create: (BuildContext context) => CatBlock(CatInitial()),
        child: CatsViewWidget(),
      )
    );
  }
}

class CatsViewWidget extends StatelessWidget {
  const CatsViewWidget({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //Get all cats
    AllCats catBlock = AllCats();
    context.read<CatBlock>().add(catBlock);

    return BlocBuilder<CatBlock, CatState>(
      builder: (context, state) {
        if(state is CatInitial){
          return Text("Initial");
        }else if (state is CatUnsuccess){
          return Text("Unsuccess");
        }else if (state is CatSuccess){
          List<Cat> cats = state.cats;

          return Center(
            child: ListView.builder(
              itemCount: cats.length,
              itemBuilder: (context, index) {
                String imageUrl = "https://via.placeholder.com/150";
                if(cats[index].catImage != null && cats[index].catImage!.url != null){
                  imageUrl = cats[index].catImage!.url!;
                }
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30.0,
                    backgroundImage:
                    NetworkImage(imageUrl),
                    backgroundColor: Colors.transparent,
                  ),
                  title: Text(cats[index].name ?? ""),
                  subtitle: Text(cats[index].origin ?? ""),
                  trailing: OutlinedButton.icon(
                      onPressed: (){
                        launch(cats[index].wikipediaUrl.toString());
                      },
                      icon: Icon(Icons.http),
                      label: Text("Wikipedia"),
                  ),
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CatScreen(cat: cats[index]),
                        ));
                  },
                );
              },
            ),
          );
        }else{
          return Text("Невідома помилка");
        };
      },
    );
  }
}