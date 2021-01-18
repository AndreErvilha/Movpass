import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movpass/bloc/personal_trainers_list_bloc.dart';
import 'package:movpass/screens/personal_trainers_details.dart';
import 'package:movpass/widgets/lists_widgets.dart';

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
            if (!snapshot.hasData) {
              // Show an progress indicator
              return Center(
                child: myCircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              // Show an error message
              return buildMessage('Show user message');
            } else if (snapshot.data.isEmpty) {
              // Show message of empty list
              return buildMessage('Show message of empty list');
            } else {
              // Show list
              return Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  myDataLabeled('Lista de treinadores', '',
                      labelTextStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(height: 5),
                  ),
                  Expanded(
                    child: myList(snapshot.data.length,
                        itemBuilder: (context, index) =>
                            myListCard(snapshot.data[index]['name'], onTap: () {
                              // Push to personal trainer details by id
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  print(
                                      'Details of personal trainer id: ${snapshot.data[index]['id']}');
                                  return PersonalTrainersDetails(
                                      snapshot.data[index]['id']);
                                },
                              ));
                            })),
                  ),
                ],
              );
            }
          }),
    );
  }
}
