import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import '../../src/poke/model/poke_model.dart';

class OutletRepository {

  Future<dynamic> fetchOutlet()async{

    try {
      Dio dio = Dio();
      final response = await dio.get('https://pokeapi.co/api/v2/pokemon/ditto').timeout( const Duration(seconds: 10 ));
      if (response.statusCode == 200) {
        PokeModel pokeModel = PokeModel.fromJson(response.data);
        return pokeModel;
      }

    } on SocketException {
      await Future.delayed(const Duration(milliseconds: 1800));
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('');
    }

    throw Exception('error fetching data');
  }
}