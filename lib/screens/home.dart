import 'package:flutter/material.dart';
import 'package:movpass/colors.dart';
import 'package:movpass/widgets/buttons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movpass'),
        backgroundColor: primaryColor,
      ),
      drawer: buildDrawer(context),
      body: buildBody(),
    );
  }

  Widget buildDrawer(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width - 50,
      color: Colors.white,
      child: Center(child: Text('Drawer', style: TextStyle(fontSize: 24))),
    );
  }

  Widget buildBody() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            simpleButton('Treinadores', onTap: () {}),
            simpleButton('Modalidades', onTap: () {}),
          ],
        ),
      );
}
