import '/flutter_flow/flutter_flow_util.dart';
import 'details05_event_widget.dart' show Details05EventWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class Details05EventModel extends FlutterFlowModel<Details05EventWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController.dispose();
  }
}
