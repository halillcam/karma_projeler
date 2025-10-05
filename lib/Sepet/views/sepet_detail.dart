import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:karma_projeler/Sepet/controller/sepet_controller.dart';
import 'package:karma_projeler/Sepet/model/sepet_model.dart';
import 'package:karma_projeler/Sepet/views/sepetim.dart';

class SepetDetail extends StatelessWidget {
  SepetDetail({super.key, required this.urun});

  final SepetModel urun;
  final SepetController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: sepetButton(context),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 400,
              height: 400,
              child: Image.asset(urun.urunResmi),
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 20),
            Text(
              urun.urunadi,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              urun.fiyat.toString(),
              style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }

  TextButton sepetButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        controller.addToCart(urun);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text("${urun.urunadi} sepete eklendi"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Geri"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Sepetim()));
                  },
                  child: Text("Sepete git"),
                ),
              ],
            );
          },
        );
      },
      style: TextButton.styleFrom(
        maximumSize: Size(120, 120),
        minimumSize: Size(120, 120),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.add_shopping_cart_outlined), Text("Sepete ekle")],
      ),
    );
  }
}
