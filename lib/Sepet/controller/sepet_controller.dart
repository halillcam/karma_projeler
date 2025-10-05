import 'package:get/get.dart';
import 'package:karma_projeler/Sepet/datas/sepet_datas.dart';
import 'package:karma_projeler/Sepet/model/sepet_model.dart';

class SepetController extends GetxController {
  RxInt urunSayisi = 0.obs;
  var products = <SepetModel>[].obs; // Tüm ürünler
  var sepetListesi = <SepetModel>[].obs; // Sepete eklenen ürünler

  @override
  void onInit() {
    super.onInit();
    products.value = SepetDatas().getItems();
  }

  void addToCart(SepetModel urun) {
    sepetListesi.add(urun);
    urunSayisi.value = sepetListesi.length;
  }
}
