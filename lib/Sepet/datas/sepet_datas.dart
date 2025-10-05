import 'package:karma_projeler/Sepet/model/sepet_model.dart';

class SepetDatas {
  List<SepetModel> getItems() {
    return [
      SepetModel(
        urunadi: "Galatasaray Ceketi",
        fiyat: 250,
        urunResmi: "assets/images/gs_ceket.png",
      ),
      SepetModel(
        urunadi: "Iphone 15",
        fiyat: 1250,
        urunResmi: "assets/images/iphone_15.png",
      ),
      SepetModel(
        urunadi: "Kapsun",
        fiyat: 250,
        urunResmi: "assets/images/kapsun.png",
      ),
      SepetModel(
        urunadi: "Macbook Pro",
        fiyat: 2250,
        urunResmi: "assets/images/macbook_pro.png",
      ),
      SepetModel(
        urunadi: "Samsung Telefon",
        fiyat: 800,
        urunResmi: "assets/images/samsung_telefon.png",
      ),
    ];
  }
}
