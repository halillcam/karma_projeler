import 'package:get/get.dart';
import 'package:karma_projeler/Sepet/datas/sepet_datas.dart';
import 'package:karma_projeler/Sepet/model/sepet_model.dart';

class SepetController extends GetxController {
  RxInt urunSayisi = 0.obs;

  void addtoCard() => urunSayisi.value++;

  var products = <SepetModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    products.value = SepetDatas().getItems();
  }
}
