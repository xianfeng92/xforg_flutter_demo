import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinkitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text('Spinkit',style: TextStyle(fontSize: 24.0)),
      ),
      body: SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const SizedBox(height: 32.0,),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitRotatingCircle(color: Colors.blue),
                SpinKitRotatingPlain(color: Colors.blue),
                SpinKitChasingDots(color: Colors.blue)
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitPumpingHeart(color: Colors.blue),
                SpinKitPulse(color: Colors.blue),
                SpinKitDoubleBounce(color: Colors.blue),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:[
                SpinKitWave(color: Colors.blue, type: SpinKitWaveType.start),
                SpinKitWave(color: Colors.blue, type: SpinKitWaveType.center),
                SpinKitWave(color: Colors.blue, type: SpinKitWaveType.end),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              children: [
                SpinKitThreeBounce(color: Colors.blue),
                SpinKitWanderingCubes(color: Colors.blue),
                SpinKitWanderingCubes(color: Colors.blue, shape: BoxShape.circle),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              children: [
                SpinKitCircle(color: Colors.blue),
                SpinKitFadingFour(color: Colors.blue),
                SpinKitFadingFour(color: Colors.blue, shape: BoxShape.rectangle),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitFadingCube(color: Colors.blue),
                SpinKitCubeGrid(size: 51.0, color: Colors.blue),
                SpinKitFoldingCube(color: Colors.blue),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitRing(color: Colors.blue),
                SpinKitDualRing(color: Colors.blue),
                SpinKitRipple(color: Colors.blue),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitFadingGrid(color: Colors.blue),
                SpinKitFadingGrid(
                    color: Colors.blue, shape: BoxShape.rectangle),
                SpinKitHourGlass(color: Colors.blue),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitSpinningCircle(color: Colors.blue),
                SpinKitSpinningCircle(color: Colors.blue, shape: BoxShape.rectangle),
                SpinKitFadingCircle(color: Colors.blue),
              ],
            ),
            const SizedBox(height: 48.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpinKitPouringHourglass(color: Colors.blue),
              ],
            ),
            const SizedBox(height: 64.0),
          ],
        ),
      ),
    );
  }
}
