// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:rewebrary/model/web.dart';

class InputData extends StatefulWidget {
  const InputData({Key? key}) : super(key: key);

  @override
  _InputDataState createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  final _title = TextEditingController();
  TextEditingController _subtitle = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final Box box;

  _addData() async {
    if (!_subtitle.text.substring(0, 5).contains('http')) {
        _subtitle.text = "http://" + _subtitle.text;
    }
    Web newWeb = Web(title: _title.text, subtitle: _subtitle.text);
    box.add(newWeb);
  }

  _pasteText() async {
    ClipboardData cdata = (await Clipboard.getData(Clipboard.kTextPlain))!;
    setState(() {
      _subtitle.text = cdata.text!;
    });
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.language,
                    color: Colors.teal[300],
                  ),
                  labelText: 'Nama',
                  hintText: 'Masukkkan nama web...'),
              controller: _title,
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(
                  Icons.link,
                  color: Colors.teal[300],
                ),
                labelText: 'Alamat',
                hintText: 'Masukkkan alamat web...',
                suffix: IconButton(
                  onPressed: _pasteText,
                  icon: Icon(Icons.paste, color: Colors.teal[300]),
                ),
              ),
              controller: _subtitle,
            ),
            SizedBox(
              height: 24,
            ),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _addData();
                  Navigator.of(context).pop();
                }
              },
              child: Container(
                color: Colors.teal,
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    'SIMPAN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
