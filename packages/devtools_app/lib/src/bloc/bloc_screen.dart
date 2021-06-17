import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../eval_on_dart_library.dart';
import '../globals.dart';
import '../screen.dart';
import 'bloc_list_cubit.dart';
import 'bloc_list_repo.dart';
import 'bloc_list_view.dart';

class BlocScreen extends Screen {
  const BlocScreen()
      : super.conditional(
          id: id,
          requiresLibrary: 'package:flutter_bloc/',
          title: 'Bloc',
          icon: Icons.palette,
        );

  static const id = 'bloc';

  @override
  Widget build(BuildContext context) {
    final evalOnDartLibrary = EvalOnDartLibrary(
        ['package:flutter_bloc/flutter_bloc.dart'], serviceManager.service);
    final BlocListRepo blocListRepo = BlocListRepo(evalOnDartLibrary);
    return BlocScreenBody(blocListRepo);
  }
}

class BlocScreenBody extends StatelessWidget {
  const BlocScreenBody(this._blocListRepo, {Key key}) : super(key: key);

  final BlocListRepo _blocListRepo;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
        value: _blocListRepo,
        child: BlocProvider(
            create: (context) => BlocListCubit(context.read<BlocListRepo>()),
            child: const BlocListView()));
  }
}
