import 'package:flutter/material.dart';

import 'screen/home.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'model/web.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(WebAdapter());
  await Hive.openBox('webBox');
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      
    );
  }
}