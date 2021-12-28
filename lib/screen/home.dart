import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rewebrary/screen/input.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final Box webBox;

  @override
  void initState() {
    super.initState();
    webBox = Hive.box('webBox');
  }

  // @override
  // void dispose(){
  //   Hive.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => InputData()))),
      body: Container(
        padding: EdgeInsets.all(24),
        child: ValueListenableBuilder(
            valueListenable: webBox.listenable(),
            builder: (context, Box box, widget) {
              if (box.isNotEmpty) {
                return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                  var currentBox = box;
                  var webData = currentBox.getAt(index);
                  return ListTile(
                      title: Text(webData.title),
                      subtitle: Text(webData.subtitle));
                });
              } else {
                return Text('masih kosong');
              }
            }),
      ),
    );
  }
}
