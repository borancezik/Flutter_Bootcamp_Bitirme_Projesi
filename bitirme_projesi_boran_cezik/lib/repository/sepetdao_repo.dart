import 'dart:convert';
import 'package:bitirme_projesi/entity/sepet_yemekler.dart';
import 'package:bitirme_projesi/entity/sepet_yemekler_response.dart';
import 'package:http/http.dart' as http;

class SepetDaoRepository {

  List<SepetYemekler> parseSepetCevap(String cevap){
    return SepetYemeklerCevap.fromJson(json.decode(cevap)).sepet_yemekler;
  }

  Future<void> sepetKayit(String yemek_adi,String yemek_resim_adi,int yemek_fiyat,int yemek_siparis_adet,String kullanici_adi) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php");
    var veri = {"yemek_adi":yemek_adi,"yemek_resim_adi":yemek_resim_adi,"yemek_fiyat":yemek_fiyat.toString(),"yemek_siparis_adet":yemek_siparis_adet.toString(),"kullanici_adi":kullanici_adi};
    var cevap = await http.post(url,body: veri);
    print("Sepeete ekle : ${cevap.body}");
  }

  Future<List<SepetYemekler>> sepetiAl(String kullanici_adi) async {
    var url = Uri.parse(
        "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php");
    var veri = {"kullanici_adi": kullanici_adi.toString()};
    //GET : Bizden veri göndermemizi istemiyorsa
    //POST : Bizden veri göndermemizi istiyorsa
    var cevap = await http.post(url, body: veri,
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        encoding: Encoding.getByName('utf-8'));
    return parseSepetCevap(cevap.body);
  }


 /* Future<void> sepetGuncelle(int kisi_id,String kisi_ad,String kisi_tel) async{
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/update_kisiler.php");
    var veri = {"kisi_id":kisi_id.toString(),"kisi_ad":kisi_ad,"kisi_tel":kisi_tel};
    var cevap = await http.post(url,body: veri);
    print("Kişi güncelle : ${cevap.body}");
  }*/

  Future<void> sepettenYemekSil(int sepet_yemek_id, String kullanici_adi) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php");
    var veri = {"sepet_yemek_id":sepet_yemek_id.toString(),"kullanici_adi":kullanici_adi};
    var cevap = await http.post(url,body: veri, headers: {"Content-Type": "application/x-www-form-urlencoded"},encoding: Encoding.getByName('utf-8'));
    print("Sepet sil : ${cevap.body}");
  }
}