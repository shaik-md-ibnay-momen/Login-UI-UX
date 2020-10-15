import 'package:flutter/material.dart';
import 'delayTween.dart';
import 'loginpage.dart';
import 'dart:async';
import 'package:shopeira/Screens/Welcome/welcome_screen.dart';
import 'maptest.dart';

var user5,icndis,icnsize,sliderH, sliderW,btnsize;
var icondistance;

void main(){
  runApp(MaterialApp(
    home: splashscreen(),
  ));
}
class splashscreen extends StatefulWidget {

  @override
  _splashscreenState createState() => _splashscreenState();

}
class _splashscreenState extends State<splashscreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4),
            ()=>page_route());
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    var a= MediaQuery.of(context).size.height/100;
    var aw= MediaQuery.of(context).size.width/100;

    var bw= aw*84.0278;
    var b= a*6.58;
    var c= a*7.90;
    var d= c/6;
    var e= d*4;
    var f= d*1.5;
    var g= d*2;
    var h= d*3;

    icndis=aw*50.93;
    icnsize=e;
    sliderH=a*9.22;
    sliderW=bw;
    btnsize=d*6;
    icondistance= sliderW - ((((sliderH - btnsize) / 2)*2)+(btnsize*2));
    print(sliderW);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage("images/logo_black.png"),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        /*   CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 60.0,
                          child: Image.asset('images/splashicon.png'),
                        )*/
                      ],
                    ),
                  )),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    /*CircularProgressIndicator(backgroundColor: Colors.white,),*/
                    SpinKitFadingCube(),
                    Padding(padding: EdgeInsets.only(top: h),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),

    );

  }

  page_route(){
    Navigator.push(context,
        MaterialPageRoute(builder: (context)=>mapPage()));
  }
}

class SpinKitFadingCube extends StatefulWidget {

  const SpinKitFadingCube({
    Key key,
    this.color=const Color(0xffffff00),
    this.size=50.0,
    this.itemBuilder,
    this.duration = const Duration(milliseconds: 2400),
    this.controller,
  })  : assert(!(itemBuilder is IndexedWidgetBuilder && color is Color) && !(itemBuilder == null && color == null),
  'You should specify either a itemBuilder or a color'),
        assert(size != null),
        super(key: key);

  final Color color;
  final double size;
  final IndexedWidgetBuilder itemBuilder;
  final Duration duration;
  final AnimationController controller;

  @override
  _SpinKitFadingCubeState createState() => _SpinKitFadingCubeState();
}

class _SpinKitFadingCubeState extends State<SpinKitFadingCube> with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ?? AnimationController(vsync: this, duration: widget.duration))..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context);
    var a= MediaQuery.of(context).size.height/100;
    var b= a*6.58;
    var c= a*7.90;
    var d= c/6;
    var e= d*4;
    var f= d*1.5;
    var g= d*2;
    var h= d*5;
    print(h);
    return Center(
      child: SizedBox.fromSize(
        size: Size.square(h),
        child: Center(
          child: Transform.rotate(
            angle: -45.0 * 0.0174533,
            child: Stack(
              children: List.generate(4, (i) {
                final _size = h * 0.5, _position = h * .5;
                return Positioned.fill(
                  top: _position,
                  left: _position,
                  child: Transform.scale(
                    scale: 1.1,
                    origin: Offset(-_size * .5, -_size * .5),
                    child: Transform(
                      transform: Matrix4.rotationZ(90.0 * i * 0.0174533),
                      child: Align(
                        alignment: Alignment.center,
                        child: FadeTransition(
                          opacity: DelayTween(begin: 0.0, end: 1.0, delay: 0.3 * i).animate(_controller),
                          child: SizedBox.fromSize(size: Size.square(_size), child: _itemBuilder(i)),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder(context, index)
      : DecoratedBox(decoration: BoxDecoration(color: widget.color));
}

