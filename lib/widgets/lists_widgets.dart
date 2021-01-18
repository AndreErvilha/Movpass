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

Widget myListCard(String text, {onTap, textStyle, int maxLines = 1}) {
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
            style: textStyle ??
                TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            maxLines: maxLines,
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

Container myDataLabeled(String label, String data,
    {EdgeInsets padding, TextStyle labelTextStyle, TextStyle dataTextStyle}) {
  return Container(
    padding: padding ?? EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      children: [
        Text(label,
            style: labelTextStyle ??
                TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(width: 10),
        Expanded(
            child: Text(data,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: dataTextStyle ?? TextStyle(fontSize: 16))),
      ],
    ),
  );
}

Container myDataDetails(String title, String description, String duration,
    {EdgeInsets padding, TextStyle labelTextStyle, TextStyle dataTextStyle}) {
  return Container(
    decoration: BoxDecoration(
        color: accentColor, borderRadius: BorderRadius.all(Radius.circular(5))),
    padding: EdgeInsets.all(10),
    constraints: BoxConstraints(
      maxHeight: 150,
      minWidth: 0,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            width: double.infinity,
            child: Text(title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
        SizedBox(height: 5),
        Container(
            width: double.infinity,
            child: Text(description,
                maxLines: 3, overflow: TextOverflow.ellipsis)),
        SizedBox(height: 5),
        myDataLabeled('Duração:', duration, padding: EdgeInsets.zero)
      ],
    ),
  );
}
