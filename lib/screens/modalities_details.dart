import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movpass/bloc/modalities_details_bloc.dart';
import 'package:movpass/config/colors.dart';
import 'package:movpass/widgets/lists_widgets.dart';

class ModalitiesDetails extends StatefulWidget {
  final int id;

  ModalitiesDetails(this.id);

  @override
  _ModalitiesDetailsState createState() => _ModalitiesDetailsState();
}

class _ModalitiesDetailsState extends State<ModalitiesDetails> {
  final ModalitiesDetailsBloc bloc = ModalitiesDetailsBloc();

  @override
  void initState() {
    bloc.getModalitiesById(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhes da modalidade')),
      body: StreamBuilder<Map>(
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
                        SizedBox(height: 5),
                        myDataLabeled('modalidade:', snapshot.data['label']),
                        myDataLabeled(
                            'descrição:', snapshot.data['description']),
                        myDataLabeled(
                            'duração:', snapshot.data['duration'].toString())
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      child: Text('Treinadores que oferecem essa modalidade:',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Divider(height: 5),
                  ),
                  Expanded(
                      child: myList(2,
                          itemBuilder: (context, index) => InkWell(
                                highlightColor: Colors.black12,
                                splashColor: Colors.black26,
                                onTap: () {},
                                radius: 5,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: accentColor.withOpacity(0.5),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5))),
                                  height: 50,
                                  child: Center(
                                      child: Text(
                                    'Nome do treinador (to be implemented)',
                                    style: TextStyle(fontSize: 16),
                                  )),
                                ),
                              ))),
                ],
              );
            }
          }),
    );
  }
}
