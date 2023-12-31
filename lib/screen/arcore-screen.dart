import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;

class ArCorePage extends StatefulWidget {
  final Uint8List img;
  const ArCorePage({super.key, required this.img});

  @override
  State<ArCorePage> createState() => _ArCorePageState();
}

class _ArCorePageState extends State<ArCorePage> {
  ArCoreController? augmentRealityCoreController;
  @override
  void initState() {
    super.initState();
  }

  augmentedRealityCoreViewCreated(ArCoreController coreController) {
    augmentRealityCoreController = coreController;
    displayEarthMapSpKere(augmentRealityCoreController!);
  }

  displayEarthMapSpKere(ArCoreController coreController) async {
    
    final node = ArCoreNode(
      image: ArCoreImage(bytes: widget.img, width: 500, height: 500),
      position: vector64.Vector3(0, -1, -2),
    );

    augmentRealityCoreController!.addArCoreNode(node);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('ARDeco Studio')),
      ),
      body: ArCoreView(
        onArCoreViewCreated: augmentedRealityCoreViewCreated,
        enableUpdateListener: true,
      ),
    );
  }

  @override
  void dispose() {
    augmentRealityCoreController?.dispose();
    super.dispose();
  }
}
