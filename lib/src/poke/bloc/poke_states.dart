import 'package:equatable/equatable.dart';
import 'package:task_demo/src/poke/model/poke_model.dart';

enum PokeStatus { initial, loading, failure, success }

class PokeState extends Equatable {
  const PokeState({
    this.abilities = const [],
    this.types = const [],
    this.status = PokeStatus.initial,
    this.msg = '',
    this.height = 0,
    this.weight = 0
  });

  final PokeStatus status;
  final String msg;
  final List<Abilities> abilities;
  final List<Types> types;
  final int height;
  final int weight;

  PokeState copyWith({
     PokeStatus? status,
     String? msg,
     List<Abilities>? abilities,
     List<Types>? types,
     int? height,
     int? weight
}){
    return PokeState(
      status: status?? this.status,
      msg: msg?? this.msg,
      abilities: abilities?? this.abilities,
      types: types?? this.types,
      height: height?? this.height,
      weight: weight ?? this.weight
    );
  }

  @override
  List<Object?> get props => [status, msg, abilities, types, height, weight];
}
