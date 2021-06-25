import 'package:flutter/material.dart';

import '../../provider/instance_viewer/instance_details.dart';
import '../../provider/instance_viewer/instance_viewer.dart';
import '../models/bloc_object.dart';

class BlocListView extends StatelessWidget {
  const BlocListView(this._blocs, {Key key}) : super(key: key);

  final List<BlocObject> _blocs;

  @override
  Widget build(BuildContext context) {
    return InstanceViewer(
      showInternalProperties: false,
      rootPath: InstancePath.fromInstanceId(_blocs[0].instanceId),
    );
  }
}
