import 'package:bloc/bloc.dart';
import 'bloc_list_repo.dart';

class BlocListCubit extends Cubit<List<int>> {
  BlocListCubit(BlocListRepo blocListRepo)
      : _blocListRepo = blocListRepo,
        super([]);

  final BlocListRepo _blocListRepo;

  void update() async {
    emit(await _blocListRepo.getBlocIds());
  }
}
