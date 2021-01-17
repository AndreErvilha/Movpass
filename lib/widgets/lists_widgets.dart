import 'package:flutter/material.dart';
import 'package:movpass/config/colors.dart';

CircularProgressIndicator myCircularProgressIndicator() {
  return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(accentColor));
}

Widget buildMessage(String message) {
  return Container(
    padding: EdgeInsets.all(10),
    child: Align(
        alignment: Alignment.topCenter,
        child: Container(
            height: 60,
            width: double.infinity,
            child: Card(child: Center(child: Text(message))))),
  );
}

Widget myListCard(String text, {onTap}) {
  return Container(
    height: 60,
    child: Card(
      color: accentColor,
      margin: EdgeInsets.zero,
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        highlightColor: Colors.black12,
        splashColor: Colors.black26,
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    ),
  );
}

Container myList(int itemCount,
        {Function(BuildContext context, int index) itemBuilder}) =>
    Container(
        padding: EdgeInsets.all(10),
        child: ListView.separated(
            padding: EdgeInsets.zero,
            itemCount: itemCount,
            separatorBuilder: (context, index) => Divider(height: 10),
            itemBuilder: itemBuilder));
