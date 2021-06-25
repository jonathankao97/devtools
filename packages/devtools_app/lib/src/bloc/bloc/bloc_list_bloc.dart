import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../eval_on_dart_library.dart';
import '../../globals.dart';
import '../models/bloc_object.dart';

part 'bloc_list_event.dart';
part 'bloc_list_state.dart';

class BlocListBloc extends Bloc<BlocListEvent, BlocListState> {
  BlocListBloc(this._evalOnDartLibrary) : super(BlocListInitial()) {
    _postEventSubscription =
        serviceManager.service.onExtensionEvent.where((event) {
      return event.extensionKind == 'bloc:bloc_list_changed';
    }).listen((_) {
      add(BlocListRequested());
    });
  }

  final EvalOnDartLibrary _evalOnDartLibrary;
  StreamSubscription<void> _postEventSubscription;

  @override
  Future<void> close() {
    _postEventSubscription.cancel();
    return super.close();
  }

  @override
  Stream<BlocListState> mapEventToState(
    BlocListEvent event,
  ) async* {
    if (event is BlocListRequested) {
      yield* _mapBlocListRequestedToState(event);
    }
  }

  Stream<BlocListState> _mapBlocListRequestedToState(
      BlocListEvent event) async* {
    yield BlocListLoadInProgress();
    try {
      final List<BlocObject> blocList = await _getBlocList();
      yield BlocListLoadSuccess(blocList);
    } catch (_) {
      yield BlocListLoadFailure();
    }
  }

  Future<List<BlocObject>> _getBlocList() async {
    final observerRef = await _evalOnDartLibrary
        .safeEval('Bloc.observer.blocList', isAlive: null);
    final observers = await _evalOnDartLibrary.getInstance(observerRef, null);

    final List<BlocObject> blocs = [];
    for (var element in observers.elements) {
      final BlocObject next = BlocObject(element.id);
      blocs.add(next);
    }
    return blocs;
  }
}
