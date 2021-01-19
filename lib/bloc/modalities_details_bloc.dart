import 'dart:convert';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';
import 'package:movpass/api/api.dart';
import 'package:rxdart/rxdart.dart';

class ModalitiesDetailsBloc extends BlocBase {
  // Store a object API to manage requests
  final Api api = Api();

  // The app use streams to control status of data acquisition
  BehaviorSubject<Map> _modalities = BehaviorSubject<Map>();

  Stream<Map> get modalities => _modalities.stream;

  // --- Functions ---
  Future<void> getModalitiesById(int id) async {
    Map myReturn;

    // set data as null indicating "request on progress"
    _modalities.sink.add(null);

    // Request data and show an error on "catchError"
    Response res = await api.get('modalities/$id').catchError((e) {
      print('Error on data acquisition!, error: $e');
      _modalities.addError('Error on data acquisition!');
    });

    // If the request return null set as an empty List -> []
    try {
      myReturn = jsonDecode(res.toString());
      _modalities.sink.add(myReturn);
    } catch (e) {
      print('Error on data json decode!, error: $e');
      _modalities.addError('Error on data json decode!');
    }
  }

  // close all streams when the bloc were disposed
  @override
  void dispose() {
    _modalities.close();
    super.dispose();
  }
}
