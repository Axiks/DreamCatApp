import 'package:dreambitcattestapp/bloc/cat/cat_bloc.dart';
import 'screens/cat_screen.dart';
import 'package:dreambitcattestapp/model/cat.dart';
import 'package:dreambitcattestapp/widgets/link_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/cat/cat_event.dart';
import 'bloc/cat/cat_states.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CatBloc>(
        create: (BuildContext context) => CatBloc()..add(GetAllCats()),
        child: CatsViewWidget(),
      ),
    );
  }
}

class CatsViewWidget extends StatelessWidget {
  const CatsViewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatBloc, CatsState>(
      builder: (context, state) {
        if(state is CatsInitial){
          return LoadingWidget();
        }else if (state is CatsNotLoaded){
          String errorMessages = state.errorMessages;
          return Scaffold(
              body: Center(
                  child: Text("Cats Not Loaded: " + errorMessages)
              )
          );
        }else if (state is CatsLoaded){
          List<Cat> cats = state.cats;
          return Scaffold(
            appBar: AppBar(
              title: Text("Cat Screen"),
            ),
            body: Center(
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
                  );
                },
              ),
            ),
          );
        }else{
          return Text("Невідома помилка");
        }
      },
    );
  }
}

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/splash.png',
                height: 64,
              ),
              SizedBox(
                height: 40,
              ),
              CircularProgressIndicator(),
              SizedBox(
                height: 40,
              ),
              Text("The Cat App",
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 22
              ),
              )
            ],
          )
      ),
    );
  }
}