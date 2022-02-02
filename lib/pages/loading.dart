import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async {
    // simulate network request for a username
    // String username = await Future.delayed(Duration(seconds: 3), () {
    //   return 'jenal';
    // });

    // String bio = await Future.delayed(Duration(seconds: 2), () {
    //   return 'vegan, musician & egg collector';
    // });

    // print('$username - $bio');

    Response response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    Map data = jsonDecode(response.body);
    print(data);
    print(data['title']);
  }

  @override
  void initState() {
    super.initState();
    // print('initState function ran');
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Loading')),
    );
  }
}
