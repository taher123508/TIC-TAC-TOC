import 'package:flutter/material.dart';
import 'package:tic/Pages/tic.dart';

void main() {

  /*
  طاهر حلبي
  S00006

https://googleflutter.com/flutter-listview-disable-scroll/#:~:text=You%20can%20make%20the%20ListView%20widget%20never%20scrollable,horizontally%20placed%20items%2C%20but%20disable%20the%20scroll%20functionality.

https://youtu.be/zlfScWSVblU



*/






  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Tic(),
    );
  }
}


