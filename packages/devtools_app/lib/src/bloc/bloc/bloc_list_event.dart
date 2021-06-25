part of 'bloc_list_bloc.dart';

abstract class BlocListEvent extends Equatable {
  const BlocListEvent();

  @override
  List<Object> get props => [];
}

class BlocListRequested extends BlocListEvent {}
