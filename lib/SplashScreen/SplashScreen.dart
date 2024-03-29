import 'package:flutter/material.dart';
import 'package:xforg_flutter_demo/PullLoad/PullOnLoadingWidge.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new AnimationController(vsync: this,duration: Duration(milliseconds: 1500));
    _animation = new Tween(begin: 0.0,end: 1.0).animate(_controller);
    _animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        Navigator.of(context).pushAndRemoveUntil(
            new MaterialPageRoute(builder: (context) => new PullOnLoadingPage()),
            (route) => route == null);
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return new FadeTransition(opacity: _animation,
     child: new Image.asset('assets/photo.jpg',scale: 2.0,fit: BoxFit.cover,),);
  }
}
