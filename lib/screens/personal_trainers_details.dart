import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movpass/bloc/personal_trainers_details_bloc.dart';
import 'package:movpass/config/colors.dart';
import 'package:movpass/screens/modalities_details.dart';
import 'package:movpass/widgets/lists_widgets.dart';

class PersonalTrainersDetails extends StatefulWidget {
  final int id;

  PersonalTrainersDetails(this.id);

  @override
  _PersonalTrainersDetailsState createState() =>
      _PersonalTrainersDetailsState();
}

class _PersonalTrainersDetailsState extends State<PersonalTrainersDetails> {
  final PersonalTrainersDetailsBloc bloc = PersonalTrainersDetailsBloc();

  @override
  void initState() {
    bloc.getPersonalTrainerById(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhes do treinador')),
      body: StreamBuilder<Map>(
          stream: bloc.personalTrainer,
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
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    color: accentColor.withOpacity(0.7),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        myDataLabeled('Detalhes do treinador', '',
                            labelTextStyle: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        myDataLabeled(
                            'cref:', snapshot.data['cref'].toString()),
                        myDataLabeled('nome:', snapshot.data['name']),
                        myDataLabeled('e-mail:', snapshot.data['email'])
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  myDataLabeled('Modalidades', '',
                      padding: EdgeInsets.all(10),
                      labelTextStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Divider(height: 5),
                  ),
                  Expanded(
                    child: myList(snapshot.data['modalities'].length,
                        itemBuilder: (context, index) => myDataDetails(
                                snapshot.data['modalities'][index]['label'],
                                snapshot.data['modalities'][index]
                                    ['description'],
                            snapshot.data['modalities'][index]['duration']
                                .toString() + ' min'
                                .toString(), onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      ModalitiesDetails(snapshot.data['id'])));
                            })),
                  ),
                ],
              );
            }
          }),
    );
  }
}
