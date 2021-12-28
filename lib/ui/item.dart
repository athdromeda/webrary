// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';

class ItemCard extends StatelessWidget {
  String title;
  String subtitle;
  ItemCard({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  _launchUrl() async {
    if (!await launch(subtitle)) throw 'Couldnt launch';
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(0),
      child: ListTile(
        onTap: _launchUrl,
        leading: Container(
          height: 10,
          width: 10,
          color: Colors.teal,
          child: Center(
              child: Text(
            title[0],
            style: TextStyle(color: Colors.white),
          )),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subtitle),
      ),
      endActionPane: ActionPane(
        motion: BehindMotion(),
        children: [
          SlidableAction(
            onPressed: null,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            label: 'Hapus',
          )
        ],
      ),
    );
  }
}
