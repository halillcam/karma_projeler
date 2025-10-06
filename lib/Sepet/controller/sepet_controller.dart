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

  void removeToCart(SepetModel urun) {
    if (sepetListesi.isNotEmpty) {
      sepetListesi.remove(urun);
      urunSayisi--;
    } else {
      throw "hata";
    }
  }

  double get totalPrice {
    double toplam = 0;
    for (var urun in sepetListesi) {
      toplam += urun.fiyat;
    }
    return toplam;
  }
}
