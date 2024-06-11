import 'package:equatable/equatable.dart';

abstract class PokeEvents extends Equatable {}

class FetchPokeData extends PokeEvents {
  @override
  List<Object?> get props => [];
}

class FilterType extends PokeEvents {
  final int slot;

  FilterType({required this.slot});

  @override
  List<Object?> get props => [slot];
}
