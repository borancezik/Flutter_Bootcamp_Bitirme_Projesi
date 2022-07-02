import 'package:bitirme_projesi/entity/sepet_yemekler.dart';
import 'package:bitirme_projesi/repository/sepetdao_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YemekDetayCubit extends Cubit<List<SepetYemekler>> {
  YemekDetayCubit():super(<SepetYemekler>[]);

  var kkrepo = SepetDaoRepository();

  /*/Future<void> yemekleriYukle() async {
    var liste = await krepo.tumYemekleriAl();
    emit(liste);
  }

  Future<void> ara(String aramaKelimesi) async {
    var liste = await krepo.yemekAra(aramaKelimesi);
    emit(liste);
  }

  Future<void> sil(int kisi_id) async {
    await krepo.sepettenYemekSil(kisi_id);
    await yemekleriYukle();
  }*/

  Future<void> kayit(String yemek_adi,String yemek_resim_adi,int yemek_fiyat,int yemek_siparis_adet,String kullanici_adi) async {
    await kkrepo.sepetKayit(yemek_adi, yemek_resim_adi,yemek_fiyat,yemek_siparis_adet,kullanici_adi);
  }
}