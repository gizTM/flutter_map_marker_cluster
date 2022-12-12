import 'package:flutter/material.dart';
import 'package:flutter_map_marker_cluster/src/node/marker_node.dart';

class MarkerWidget extends StatelessWidget {
  final MarkerNode marker;
  final VoidCallback onTap;
  final bool partial;
  final WidgetBuilder? partialBuilder;

  MarkerWidget({
    required this.marker,
    required this.onTap,
    required this.partial,
    this.partialBuilder,
  }) : super(key: ObjectKey(marker));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: partial 
        ? (partialBuilder?.call(context) ?? marker.builder(context))
        : marker.builder(context),
    );
  }
}
