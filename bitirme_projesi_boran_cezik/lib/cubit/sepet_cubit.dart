import 'package:bitirme_projesi/entity/sepet_yemekler.dart';
import 'package:bitirme_projesi/repository/sepetdao_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SepetCubit extends Cubit<List<SepetYemekler>> {
  SepetCubit():super(<SepetYemekler>[]);

  var kkrepo = SepetDaoRepository();

  Future<void> tumSepetiGetir(String kullanici_adi) async {
    var liste = await kkrepo.sepetiAl(kullanici_adi);
    if(liste.isNotEmpty){
    emit(liste);
    }
  }
/*
  Future<void> ara(String aramaKelimesi) async {
    var liste = await krepo.yemekAra(aramaKelimesi);
    emit(liste);
  }*/

  Future<void> sil(int sepet_yemek_id, String kullanici_adi) async {
    await kkrepo.sepettenYemekSil(sepet_yemek_id,kullanici_adi);
    await tumSepetiGetir(kullanici_adi);
  }

  Future<void> kayit(String yemek_adi,String yemek_resim_adi,int yemek_fiyat,int yemek_siparis_adet,String kullanici_adi) async {
    await kkrepo.sepetKayit(yemek_adi, yemek_resim_adi,yemek_fiyat,yemek_siparis_adet,kullanici_adi);
  }
}