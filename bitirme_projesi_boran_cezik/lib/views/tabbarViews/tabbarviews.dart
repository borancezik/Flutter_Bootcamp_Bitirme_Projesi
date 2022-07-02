import 'package:bitirme_projesi/cubit/anasayfa_cubit.dart';
import 'package:bitirme_projesi/entity/yemekler.dart';
import 'package:bitirme_projesi/presentation/my_flutter_app_icons.dart';
import 'package:bitirme_projesi/widgets/anasayfa_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButunYemekler extends StatefulWidget {
  const ButunYemekler({Key? key}) : super(key: key);

  @override
  _ButunYemeklerState createState() => _ButunYemeklerState();
}

class _ButunYemeklerState extends State<ButunYemekler> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: BlocBuilder<AnasayfaCubit, List<Yemekler>>(
        builder: (BuildContext context, yemeklerListesi) {
          if (yemeklerListesi.isNotEmpty) {
            //var filtreYemekler = yemeklerListesi.where((x) => x.yemek_adi == 'Ayran').toList();
            return ListView.builder(
                padding: EdgeInsets.all(12.0),
                itemCount: yemeklerListesi.length,
                // burası filtrelenmiş veriler verilecek
                itemBuilder: (BuildContext context, indeks) {
                  var yemek = yemeklerListesi[indeks]; // burası filtrelenmiş veriler verilecek
                  return YemekList(yemek: yemek);
                });
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}


class AnaYemekler extends StatefulWidget {
  const AnaYemekler({Key? key}) : super(key: key);

  @override
  _AnaYemeklerState createState() => _AnaYemeklerState();
}

class _AnaYemeklerState extends State<AnaYemekler> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: BlocBuilder<AnasayfaCubit, List<Yemekler>>(
        builder: (BuildContext context, yemeklerListesi) {
          if (yemeklerListesi.isNotEmpty) {
            var filtreYemekler = yemeklerListesi.where((x) => x.yemek_adi == 'Izgara Somon' || x.yemek_adi == 'Izgara Tavuk' || x.yemek_adi == 'Köfte' || x.yemek_adi == 'Lazanya' || x.yemek_adi == 'Makarna' || x.yemek_adi == 'Pizza').toList();
            return ListView.builder(
                padding: EdgeInsets.all(12.0),
                itemCount: filtreYemekler.length,
                // burası filtrelenmiş veriler verilecek
                itemBuilder: (BuildContext context, indeks) {
                  var yemek = filtreYemekler[indeks]; // burası filtrelenmiş veriler verilecek
                  return YemekList(yemek: yemek);
                });
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class Tatlilar extends StatefulWidget {
  const Tatlilar({Key? key}) : super(key: key);

  @override
  _TatlilarState createState() => _TatlilarState();
}

class _TatlilarState extends State<Tatlilar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: BlocBuilder<AnasayfaCubit, List<Yemekler>>(
        builder: (BuildContext context, yemeklerListesi) {
          if (yemeklerListesi.isNotEmpty) {
            var filtreYemekler = yemeklerListesi.where((x) => x.yemek_adi == 'Sütlaç' || x.yemek_adi == 'Tiramisu' || x.yemek_adi == 'Baklava' || x.yemek_adi == 'Kadayıf').toList();
            return ListView.builder(
                padding: EdgeInsets.all(12.0),
                itemCount: filtreYemekler.length,
                // burası filtrelenmiş veriler verilecek
                itemBuilder: (BuildContext context, indeks) {
                  var yemek = filtreYemekler[indeks]; // burası filtrelenmiş veriler verilecek
                  return YemekList(yemek: yemek);
                });
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

class Icecekler extends StatefulWidget {
  const Icecekler({Key? key}) : super(key: key);

  @override
  _IceceklerState createState() => _IceceklerState();
}

class _IceceklerState extends State<Icecekler> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      child: BlocBuilder<AnasayfaCubit, List<Yemekler>>(
        builder: (BuildContext context, yemeklerListesi) {
          if (yemeklerListesi.isNotEmpty) {
            var filtreYemekler = yemeklerListesi.where((x) => x.yemek_adi == 'Ayran' || x.yemek_adi == 'Fanta' || x.yemek_adi == 'Kahve' || x.yemek_adi == 'Su').toList();
            return ListView.builder(
                padding: EdgeInsets.all(12.0),
                itemCount: filtreYemekler.length,
                // burası filtrelenmiş veriler verilecek
                itemBuilder: (BuildContext context, indeks) {
                  var yemek = filtreYemekler[indeks]; // burası filtrelenmiş veriler verilecek
                  return YemekList(yemek: yemek);
                });
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

