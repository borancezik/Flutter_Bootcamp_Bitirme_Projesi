import 'dart:convert';
import 'package:bitirme_projesi/entity/yemekler.dart';
import 'package:bitirme_projesi/entity/yemekler_response.dart';
import 'package:http/http.dart' as http;

class YemeklerDaoRepository {

  List<Yemekler> parseYemeklerCevap(String cevap){
    return YemeklerCevap.fromJson(json.decode(cevap)).yemekler;
  }


  Future<List<Yemekler>> tumYemekleriAl() async {
    var url = Uri.parse("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php");
    //GET : Bizden veri göndermemizi istemiyorsa
    //POST : Bizden veri göndermemizi istiyorsa
    var cevap = await http.get(url);
    return parseYemeklerCevap(cevap.body);
  }

  Future<List<Yemekler>> yemekAra(String aramaKelimesi) async {
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php");
    var veri = {"kisi_ad":aramaKelimesi};
    var cevap = await http.post(url,body: veri);
    return parseYemeklerCevap(cevap.body);
  }

}