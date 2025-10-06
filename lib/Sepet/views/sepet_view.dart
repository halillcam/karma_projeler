import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karma_projeler/Sepet/controller/sepet_controller.dart';
import 'package:karma_projeler/Sepet/views/sepet_detail.dart';
import 'package:karma_projeler/Sepet/views/sepetim.dart';

class SepetView extends StatefulWidget {
  const SepetView({super.key});

  @override
  State<SepetView> createState() => _SepetViewState();
}

class _SepetViewState extends State<SepetView> {
  late final SepetController sepetim;
  @override
  void initState() {
    super.initState();
    sepetim = Get.put(SepetController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sepet Uygulamasi",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(Sepetim());
            },
            icon: Icon(Icons.add_shopping_cart_rounded),
          ),
          Obx(() => Text("(${sepetim.urunSayisi})")),
          SizedBox(width: 5),
        ],
      ),
      body: ListView.builder(
        itemCount: sepetim.products.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) =>
                      SepetDetail(urun: sepetim.products[index]),
                ),
              ),
              leading: Image.asset(sepetim.products[index].urunResmi),
              title: Text(sepetim.products[index].urunadi.toString()),
              trailing: Text(sepetim.products[index].fiyat.toString()),
            ),
          );
        },
      ),
    );
  }
}
