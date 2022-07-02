import 'package:bitirme_projesi/entity/yemekler.dart';
import 'package:bitirme_projesi/repository/sepetdao_repo.dart';
import 'package:bitirme_projesi/repository/yemeklerdao_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<List<Yemekler>> {
  AnasayfaCubit():super(<Yemekler>[]);

  var krepo = YemeklerDaoRepository();
  var kkrepo = SepetDaoRepository();

  Future<void> yemekleriYukle() async {
    var liste = await krepo.tumYemekleriAl();
    emit(liste);

  }

  Future<void> ara(String aramaKelimesi) async {
    var liste = await krepo.yemekAra(aramaKelimesi);
    emit(liste);
  }


  /*Future<void> kayit(String yemek_adi,String yemek_resim_adi,int yemek_fiyat,int yemek_siparis_adet,String kullanici_adi) async {
    await kkrepo.sepetKayit(yemek_adi, yemek_resim_adi,yemek_fiyat,yemek_siparis_adet,kullanici_adi);
  }*/
}