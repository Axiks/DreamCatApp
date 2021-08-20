import 'dart:async';
import 'package:dreambitcattestapp/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
            ()=> Navigator.pushReplacement(context,
                MaterialPageRoute(builder:
                    (context) => HomeScreen()
                )
            )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: LoadingWidget()
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