import 'package:flutter/material.dart';
import 'package:flutter_map_marker_cluster/src/node/marker_node.dart';

class AdvancedMarkerWidget<T> extends StatelessWidget {
  final MarkerNode marker;
  final VoidCallback onTap;
  final bool? partial;
  final T? data;
  final Widget Function(BuildContext, T)? partialBuilder;

  AdvancedMarkerWidget({
    required this.marker,
    required this.onTap,
    this.partial,
    this.partialBuilder,
    required this.data,
  }) : super(key: ObjectKey(marker));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: (partial ?? false) && data != null
        ? (partialBuilder?.call(context, data!) ?? marker.builder(context))
        : marker.builder(context),
    );
  }
}
