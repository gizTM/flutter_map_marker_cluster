import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_map_marker_cluster/src/node/marker_cluster_node.dart';

class AdvancedMarkerClusterLayerOptions<T> extends LayerOptions {
  /// Cluster builder
  final ClusterWidgetBuilder builder;

  /// List of markers
  final List<Marker> markers;

  /// If true markers will be counter rotated to the map rotation
  final bool? rotate;

  /// The origin of the coordinate system (relative to the upper left corner of
  /// this render object) in which to apply the matrix.
  ///
  /// Setting an origin is equivalent to conjugating the transform matrix by a
  /// translation. This property is provided just for convenience.
  final Offset? rotateOrigin;

  /// The alignment of the origin, relative to the size of the box.
  ///
  /// This is equivalent to setting an origin based on the size of the box.
  /// If it is specified at the same time as the [rotateOrigin], both are applied.
  ///
  /// An [AlignmentDirectional.centerStart] value is the same as an [Alignment]
  /// whose [Alignment.x] value is `-1.0` if [Directionality.of] returns
  /// [TextDirection.ltr], and `1.0` if [Directionality.of] returns
  /// [TextDirection.rtl].	 Similarly [AlignmentDirectional.centerEnd] is the
  /// same as an [Alignment] whose [Alignment.x] value is `1.0` if
  /// [Directionality.of] returns	 [TextDirection.ltr], and `-1.0` if
  /// [Directionality.of] returns [TextDirection.rtl].
  final AlignmentGeometry? rotateAlignment;

  /// Cluster size
  final Size size;

  /// Cluster compute size
  final Size Function(List<Marker>)? computeSize;

  /// Cluster anchor
  final AnchorPos? anchor;

  /// A cluster will cover at most this many pixels from its center
  final int maxClusterRadius;

  final List<T> data;

  final Widget Function(BuildContext, T) partialBuilder;

  final bool partialCluster;

  /// Options for fit bounds
  final FitBoundsOptions fitBoundsOptions;

  /// Zoom buonds with animation on click cluster
  final bool zoomToBoundsOnClick;

  /// animations options
  final AnimationsOptions animationsOptions;

  /// When click marker, center it with animation
  final bool centerMarkerOnClick;

  /// Increase to increase the distance away that circle spiderfied markers appear from the center
  final int spiderfyCircleRadius;

  /// If set, at this zoom level and below, markers will not be clustered. This defaults to 20 (max zoom)
  final int disableClusteringAtZoom;

  /// Increase to increase the distance away that spiral spiderfied markers appear from the center
  final int spiderfySpiralDistanceMultiplier;

  /// Show spiral instead of circle from this marker count upwards.
  /// 0 -> always spiral; Infinity -> always circle
  final int circleSpiralSwitchover;

  /// Make it possible to provide custom function to calculate spiderfy shape positions
  final List<Point> Function(int, Point)? spiderfyShapePositions;

  /// If true show polygon then tap on cluster
  final bool showPolygon;

  /// Polygon's options that shown when tap cluster.
  final PolygonOptions polygonOptions;

  /// Function to call when a Marker is tapped
  final void Function(Marker)? onMarkerTap;

  /// Function to call when markers are clustered
  final void Function(List<Marker>)? onMarkersClustered;

  /// Function to call when a cluster Marker is tapped
  final void Function(MarkerClusterNode)? onClusterTap;

  /// Popup's options that show when tapping markers or via the PopupController.
  final PopupOptions? popupOptions;

  AdvancedMarkerClusterLayerOptions({
    required this.builder,
    this.rotate,
    this.rotateOrigin,
    this.rotateAlignment,
    this.markers = const [],
    this.size = const Size(30, 30),
    this.computeSize,
    this.anchor,
    this.maxClusterRadius = 80,
    required this.data,
    this.partialCluster = false,
    required this.partialBuilder,
    this.disableClusteringAtZoom = 20,
    this.animationsOptions = const AnimationsOptions(),
    this.fitBoundsOptions = const FitBoundsOptions(padding: EdgeInsets.all(12)),
    this.zoomToBoundsOnClick = true,
    this.centerMarkerOnClick = true,
    this.spiderfyCircleRadius = 40,
    this.spiderfySpiralDistanceMultiplier = 1,
    this.circleSpiralSwitchover = 9,
    this.spiderfyShapePositions,
    this.polygonOptions = const PolygonOptions(),
    this.showPolygon = true,
    this.onMarkerTap,
    this.onClusterTap,
    this.onMarkersClustered,
    this.popupOptions,
  });
}

// class AdvancedMarkerClusterLayerOptions extends LayerOptions {
//   /// Cluster builder
//   final ClusterWidgetBuilder builder;

//   /// List of markers
//   final List<Marker> markers;

//   /// If true markers will be counter rotated to the map rotation
//   final bool? rotate;

//   /// The origin of the coordinate system (relative to the upper left corner of
//   /// this render object) in which to apply the matrix.
//   ///
//   /// Setting an origin is equivalent to conjugating the transform matrix by a
//   /// translation. This property is provided just for convenience.
//   final Offset? rotateOrigin;

//   /// The alignment of the origin, relative to the size of the box.
//   ///
//   /// This is equivalent to setting an origin based on the size of the box.
//   /// If it is specified at the same time as the [rotateOrigin], both are applied.
//   ///
//   /// An [AlignmentDirectional.centerStart] value is the same as an [Alignment]
//   /// whose [Alignment.x] value is `-1.0` if [Directionality.of] returns
//   /// [TextDirection.ltr], and `1.0` if [Directionality.of] returns
//   /// [TextDirection.rtl].	 Similarly [AlignmentDirectional.centerEnd] is the
//   /// same as an [Alignment] whose [Alignment.x] value is `1.0` if
//   /// [Directionality.of] returns	 [TextDirection.ltr], and `-1.0` if
//   /// [Directionality.of] returns [TextDirection.rtl].
//   final AlignmentGeometry? rotateAlignment;

//   /// Cluster size
//   final Size size;

//   /// Cluster compute size
//   final Size Function(List<Marker>)? computeSize;

//   /// Cluster anchor
//   final AnchorPos? anchor;

//   /// A cluster will cover at most this many pixels from its center
//   final int maxClusterRadius;

//   final WidgetBuilder? partialBuilder;

//   final bool partialCluster;

//   /// Options for fit bounds
//   final FitBoundsOptions fitBoundsOptions;

//   /// Zoom buonds with animation on click cluster
//   final bool zoomToBoundsOnClick;

//   /// animations options
//   final AnimationsOptions animationsOptions;

//   /// When click marker, center it with animation
//   final bool centerMarkerOnClick;

//   /// Increase to increase the distance away that circle spiderfied markers appear from the center
//   final int spiderfyCircleRadius;

//   /// If set, at this zoom level and below, markers will not be clustered. This defaults to 20 (max zoom)
//   final int disableClusteringAtZoom;

//   /// Increase to increase the distance away that spiral spiderfied markers appear from the center
//   final int spiderfySpiralDistanceMultiplier;

//   /// Show spiral instead of circle from this marker count upwards.
//   /// 0 -> always spiral; Infinity -> always circle
//   final int circleSpiralSwitchover;

//   /// Make it possible to provide custom function to calculate spiderfy shape positions
//   final List<Point> Function(int, Point)? spiderfyShapePositions;

//   /// If true show polygon then tap on cluster
//   final bool showPolygon;

//   /// Polygon's options that shown when tap cluster.
//   final PolygonOptions polygonOptions;

//   /// Function to call when a Marker is tapped
//   final void Function(Marker)? onMarkerTap;

//   /// Function to call when markers are clustered
//   final void Function(List<Marker>)? onMarkersClustered;

//   /// Function to call when a cluster Marker is tapped
//   final void Function(MarkerClusterNode)? onClusterTap;

//   /// Popup's options that show when tapping markers or via the PopupController.
//   final PopupOptions? popupOptions;

//   AdvancedMarkerClusterLayerOptions({
//     required this.builder,
//     this.rotate,
//     this.rotateOrigin,
//     this.rotateAlignment,
//     this.markers = const [],
//     this.size = const Size(30, 30),
//     this.computeSize,
//     this.anchor,
//     this.maxClusterRadius = 80,
//     this.partialCluster = false,
//     this.partialBuilder,
//     this.disableClusteringAtZoom = 20,
//     this.animationsOptions = const AnimationsOptions(),
//     this.fitBoundsOptions = const FitBoundsOptions(padding: EdgeInsets.all(12)),
//     this.zoomToBoundsOnClick = true,
//     this.centerMarkerOnClick = true,
//     this.spiderfyCircleRadius = 40,
//     this.spiderfySpiralDistanceMultiplier = 1,
//     this.circleSpiralSwitchover = 9,
//     this.spiderfyShapePositions,
//     this.polygonOptions = const PolygonOptions(),
//     this.showPolygon = true,
//     this.onMarkerTap,
//     this.onClusterTap,
//     this.onMarkersClustered,
//     this.popupOptions,
//   });
// }
