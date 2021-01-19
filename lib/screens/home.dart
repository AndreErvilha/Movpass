import 'package:flutter/material.dart';
import 'package:movpass/screens/modalities_list.dart';
import 'package:movpass/screens/personal_trainers_list.dart';
import 'package:movpass/widgets/buttons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movpass')),
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
            simpleButton('Treinadores', onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PersonalTrainersList()));
            }),
            simpleButton('Modalidades', onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ModalitiesList()));
            }),
          ],
        ),
      );
}