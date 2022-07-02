import 'package:bitirme_projesi/cubit/sepet_cubit.dart';
import 'package:bitirme_projesi/entity/sepet_yemekler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../widgets/anasayfa_widgets.dart';

class Sepet extends StatefulWidget {
  const Sepet({Key? key}) : super(key: key);

  @override
  _SepetState createState() => _SepetState();
}

class _SepetState extends State<Sepet> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SepetCubit>().tumSepetiGetir("Boran");
  }

  void guncelle(){
    setState(() {
      context.read<SepetCubit>().tumSepetiGetir("Boran");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sepet"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.black12,
        child: BlocBuilder<SepetCubit, List<SepetYemekler>>(
          builder: (BuildContext context, sepettekilerListesi) {
            if (sepettekilerListesi.isNotEmpty) {
              return ListView.builder(
                  padding: EdgeInsets.all(12.0),
                  itemCount: sepettekilerListesi.length,
                  itemBuilder: (BuildContext context, indeks) {
                    var sepetYemek = sepettekilerListesi[indeks];
                    return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                        margin: EdgeInsets.only(bottom:10),
                        child: ListTile(
                          leading: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 70,
                              minHeight: 70,
                              maxWidth: 150,
                              maxHeight: 150,
                            ),
                            child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${sepetYemek.yemek_resim_adi}", fit: BoxFit.cover),
                          ),
                          title: Row(children: [Text(sepetYemek.yemek_adi,
                              style: TextStyle(fontSize: 20)), ],),
                          subtitle: Text("${sepetYemek.yemek_fiyat} TL"),
                        ),
                      ),
                      secondaryActions: <Widget>[
                        IconSlideAction(
                          caption: 'Sil',
                          color: Color(0xffFF4F3B),
                          icon: Icons.delete,
                          onTap: () {
                            context.read<SepetCubit>().sil(int.parse(sepetYemek.sepet_yemek_id),"Boran");
                            guncelle();
                          },
                        ),
                      ],
                    );
                  });
            } else {
              return const Center(child: Text("SEPETİNİZDE ÜRÜN BULUNAMAMIŞTIR."),);
            }
          },
        ),
      ),
      bottomNavigationBar: Container(height: 50,color: Colors.red,child:
      ElevatedButton(onPressed: () {
        showDialog(context: context, builder: (BuildContext context) {
          return new AlertDialog(
            title: new Text("Sepetiniz Onaylanmıştır."),
          );
        });
      }, child: Text("Sepeti onayla", style: TextStyle(fontSize: 20),), style: ElevatedButton.styleFrom(primary: Colors.red),)),
    );
  }
}
