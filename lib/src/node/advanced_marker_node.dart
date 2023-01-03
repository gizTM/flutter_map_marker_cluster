import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/src/node/marker_node.dart';
import 'package:latlong2/latlong.dart';

class AdvancedMarkerNode<T> extends MarkerNode {
  final Marker marker;
  final T data;
  final Widget Function(BuildContext, T) partialBuilder;

  AdvancedMarkerNode(this.marker, {
    required this.partialBuilder, 
    required this.data,
  }) : super(marker);

  @override
  Key? get key => marker.key;

  @override
  Anchor get anchor => marker.anchor;

  @override
  WidgetBuilder get builder => marker.builder;

  @override
  double get height => marker.height;

  @override
  LatLng get point => marker.point;

  @override
  double get width => marker.width;

  @override
  bool? get rotate => marker.rotate;

  @override
  AlignmentGeometry? get rotateAlignment => marker.rotateAlignment;

  @override
  Offset? get rotateOrigin => marker.rotateOrigin;
}
