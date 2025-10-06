import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karma_projeler/Sepet/controller/sepet_controller.dart';

class Sepetim extends StatelessWidget {
  const Sepetim({super.key});

  @override
  Widget build(BuildContext context) {
    final SepetController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text("Sepetimdeki ürünler")),
      body: Obx(() {
        if (controller.sepetListesi.isEmpty) {
          return const Center(child: Text("Sepetiniz boş"));
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.sepetListesi.length,
                itemBuilder: (context, index) {
                  final urun = controller.sepetListesi[index];
                  return Card(
                    child: ListTile(
                      leading: Image.asset(urun.urunResmi),
                      title: Text(urun.urunadi),
                      trailing: IconButton(
                        onPressed: () {
                          controller.removeToCart(urun);
                        },
                        icon: Icon(Icons.remove_circle_outline),
                      ),
                    ),
                  );
                },
              ),
            ),
            Divider(),
            Padding(
              padding: EdgeInsetsGeometry.all(8),
              child: Obx(() {
                return Text(
                  "Toplam = ${controller.totalPrice} ₺ ",
                  style: TextStyle(fontSize: 20),
                );
              }),
            ),
          ],
        );
      }),
    );
  }
}
