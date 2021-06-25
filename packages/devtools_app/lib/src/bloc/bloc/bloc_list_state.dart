part of 'bloc_list_bloc.dart';

abstract class BlocListState extends Equatable {
  const BlocListState();

  @override
  List<Object> get props => [];
}

class BlocListInitial extends BlocListState {}

class BlocListLoadInProgress extends BlocListState {}

class BlocListLoadSuccess extends BlocListState {
  const BlocListLoadSuccess(this.blocs) : assert(blocs != null);

  final List<BlocObject> blocs;

  @override
  List<Object> get props => [blocs];
}

class BlocListLoadFailure extends BlocListState {}
