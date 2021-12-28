import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:rewebrary/model/web.dart';

class InputData extends StatefulWidget {
  const InputData({Key? key}) : super(key: key);

  @override
  _InputDataState createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  final _title = TextEditingController();
  final _subtitle = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final Box box;

  _addData() async {
    Web newWeb = Web(title: _title.text, subtitle: _subtitle.text);
    box.add(newWeb);
  }

  @override
  void initState() {
    super.initState();
    box = Hive.box('webBox');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _title,
            ),
            TextFormField(
              controller: _subtitle,
            ),
            ElevatedButton(onPressed: (){
              if(_formKey.currentState!.validate()){
                _addData();
                Navigator.of(context).pop();
              }
            }, child: Text('Simpan'))
          ],
        ),
      ),
    ));
  }
}
