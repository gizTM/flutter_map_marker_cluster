import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';

import 'package:flutter_map_marker_cluster/src/advanced_marker_cluster_layer.dart';
import 'package:flutter_map_marker_cluster/src/advanced_marker_cluster_layer_options.dart';

class AdvancedMarkerClusterLayerWidget<T> extends StatelessWidget {
  final AdvancedMarkerClusterLayerOptions<T> options;

  const AdvancedMarkerClusterLayerWidget({Key? key, required this.options})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapState = MapState.maybeOf(context)!;
    return AdvancedMarkerClusterLayer<T>(options, mapState, mapState.onMoved);
  }
}
