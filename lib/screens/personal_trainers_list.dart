import 'package:flutter/material.dart';
import 'package:movpass/bloc/personal_trainers_list_bloc.dart';

class PersonalTrainersList extends StatefulWidget {
  @override
  _PersonalTrainersListState createState() => _PersonalTrainersListState();
}

class _PersonalTrainersListState extends State<PersonalTrainersList> {
  final PersonalTrainersListBloc bloc = PersonalTrainersListBloc();

  @override
  void initState() {
    bloc.getPersonalTrainersList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Treinadores')),
      body: StreamBuilder<List>(
          stream: bloc.personalTrainers,
          builder: (context, snapshot) {
            if (snapshot.hasError || !snapshot.hasData) {
              // Show user message
              return Container(
                child: Text('Show user message'),
              );
            } else if (snapshot.data.isEmpty) {
              // Show message of empty list
              return Container(
                child: Text('Show message of empty list'),
              );
            } else {
              // Show list
              return Container(
                child: Text('Show list'),
              );
            }
          }),
    );
  }
}
