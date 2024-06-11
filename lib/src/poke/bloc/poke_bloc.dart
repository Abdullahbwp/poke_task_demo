import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:task_demo/src/poke/bloc/poke_event.dart';
import 'package:task_demo/src/poke/bloc/poke_states.dart';
import 'package:task_demo/src/poke/model/poke_model.dart';

class PokeBloc extends Bloc<PokeEvents, PokeState> {
  PokeBloc() : super(const PokeState()) {
    on<FetchPokeData>(_fetchPokeData);
  }

  Dio dio = Dio();

  FutureOr<void> _fetchPokeData(
      FetchPokeData event, Emitter<PokeState> emit) async {
    try {
      emit(state.copyWith(status: PokeStatus.loading));

      final response = await dio.get('https://pokeapi.co/api/v2/pokemon/ditto');
      if (response.statusCode == 200) {
        PokeModel pokeModel = PokeModel.fromJson(response.data);
        emit(state.copyWith(
            status: PokeStatus.success,
            msg: 'Success',
            abilities: pokeModel.abilities ?? [],
            types: pokeModel.types ?? [],
            height: pokeModel.height,
            weight: pokeModel.weight));
      } else {
        emit(state.copyWith(status: PokeStatus.failure, msg: 'Error'));
      }
    } catch (e) {
      emit(state.copyWith(status: PokeStatus.failure, msg: e.toString()));
    }
  }
}
