import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movpass/bloc/modalities_list_bloc.dart';
import 'package:movpass/screens/modalities_details.dart';
import 'package:movpass/widgets/lists_widgets.dart';

class ModalitiesList extends StatefulWidget {
  @override
  _ModalitiesListState createState() => _ModalitiesListState();
}

class _ModalitiesListState extends State<ModalitiesList> {
  final ModalitiesListBloc bloc = ModalitiesListBloc();

  @override
  void initState() {
    bloc.getModalitiesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Modalidades')),
      body: StreamBuilder<List>(
          stream: bloc.modalities,
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
                  myDataLabeled('Lista de modalidades', '',
                      labelTextStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(height: 5),
                  ),
                  Expanded(
                    child: myList(snapshot.data.length,
                        itemBuilder: (context, index) => myListCard(
                                snapshot.data[index]['label'],
                                textStyle: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                maxLines: 2, onTap: () {
                              // Push to personal trainer details by id
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  print(
                                      'Details of personal trainer id: ${snapshot.data[index]['id']}');
                                  return ModalitiesDetails(
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
