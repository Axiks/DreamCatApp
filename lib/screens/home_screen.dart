import 'package:dreambitcattestapp/bloc/cat/cat_bloc.dart';
import 'package:dreambitcattestapp/bloc/cat/cat_event.dart';
import 'package:dreambitcattestapp/screens/cat_screen.dart';
import 'package:dreambitcattestapp/model/cat.dart';
import 'package:dreambitcattestapp/widgets/link_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:dreambitcattestapp/bloc/cat/cat_states.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cat Screen"),
      ),
      body: BlocProvider<CatBloc>(
        create: (BuildContext context) => CatBloc()..add(GetAllCats()),
        child: BlocBuilder<CatBloc, CatsState>(
          builder: (context, state) {
            if(state is CatsInitial){
              return Center(
                  child: CircularProgressIndicator()
              );
            }else if (state is CatsNotLoaded){
              String errorMessages = state.errorMessages;
              return Scaffold(
                  body: Center(
                      child: Text("Cats Not Loaded: " + errorMessages)
                  )
              );
            }else if (state is CatsLoaded){
              List<Cat> cats = state.cats;
              return CatsListWidget(cats: cats,);
            }else{
              return Text("Невідома помилка");
            }
          },
        )
      ),
    );
  }
}

class CatsListWidget extends StatelessWidget{
  final List<Cat> cats;

  CatsListWidget({required this.cats});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
          itemCount: cats.length,
          itemBuilder: (context, index) {
            String imageUrl = "https://via.placeholder.com/150";
            if(cats[index].catImage != null && cats[index].catImage!.url != null){
              imageUrl = cats[index].catImage!.url!;
            }
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage:
                  NetworkImage(imageUrl),
                  backgroundColor: Colors.transparent,
                ),
                title: Text(cats[index].name ?? ""),
                subtitle: Text(cats[index].origin ?? ""),
                trailing: LinkItemWidget(
                  title: "Wikipedia",
                  url: cats[index].wikipediaUrl,
                ),
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CatScreen(cat: cats[index]),
                      ));
                },
              ),
            );
          },
        ),
    );
  }

}