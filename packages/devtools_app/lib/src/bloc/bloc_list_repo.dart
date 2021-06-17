import '../eval_on_dart_library.dart';

class BlocListRepo {
  BlocListRepo(EvalOnDartLibrary evalOnDartLibrary)
      : _evalOnDartLibrary = evalOnDartLibrary;

  final EvalOnDartLibrary _evalOnDartLibrary;

  Future<List<int>> getBlocIds() async {}
}
