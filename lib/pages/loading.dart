import 'package:flutter/material.dart';
import 'package:flutter_world_time/pages/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  Future<void> setupWorldTime() async {
    World_Time instance = World_Time(
        location: 'Indonesia', flag: 'indonesia.png', url: 'Asia/Jakarta');
    await instance.getTime();
    setState(() {
      time = instance.time2;
    });
  }

  @override
  void initState() {
    super.initState();
    // print('initState function ran');
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(50.0),
          child: Text(time),
        ),
      ),
    );
  }
}
