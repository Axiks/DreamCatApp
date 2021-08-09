import 'package:dreambitcattestapp/block/cat_bloc.dart';
import 'package:dreambitcattestapp/block/cat_states.dart';
import 'package:dreambitcattestapp/model/cat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatScreen extends StatelessWidget{
  final Cat cat;
  CatScreen({required this.cat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cat info"),
        ),
        body: BlocProvider<CatBlock>(
          create: (BuildContext context) => CatBlock(CatInitial()),
          child: Center(child: Text("Cat name: " + (cat.name ?? ""))),
        )
    );
  }

}