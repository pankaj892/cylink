import 'package:flutter/material.dart';

class BrainLoading extends StatefulWidget {
  @override
  _BrainLoadingState createState() => _BrainLoadingState();
}

class _BrainLoadingState extends State<BrainLoading> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(vsync:this,duration: Duration(seconds: 1));
    _animationController.repeat(reverse: true);

    super.initState();
  }


  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    _animation =  Tween(begin: 2.0,end: 20.0).animate(_animationController)..addListener((){
      setState(() {

      });
    });
    return Container(
          width: 50,
          height: 50,
          child: Image.asset("assets/brain.png",color: Colors.white, width: 50, height: 50,),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(
                  color: Colors.indigoAccent,
                  blurRadius: _animation.value,
                  spreadRadius: _animation.value
              )]
          ),
        );
  }
}
