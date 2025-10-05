import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:karma_projeler/getx_tekrar/controller/increment_controller.dart';
import 'package:karma_projeler/login_panel/login_panel_package.dart';

class Increment extends StatefulWidget {
  const Increment({super.key});

  @override
  State<Increment> createState() => _IncrementState();
}

class _IncrementState extends State<Increment> {
  late final IncrementController _mainController;
  @override
  void initState() {
    super.initState();
    _mainController = Get.put(IncrementController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Obx(
              () => Text(
                _mainController.counter.toString(),
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _mainController.incrementCounter,
              child: Text("Artır"),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LoginPanelPackage()),
                );
              },
              child: Text("gec"),
            ),
          ],
        ),
      ),
    );
  }
}
