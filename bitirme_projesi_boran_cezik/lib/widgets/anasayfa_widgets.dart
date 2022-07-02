import 'package:bitirme_projesi/cubit/anasayfa_cubit.dart';
import 'package:bitirme_projesi/cubit/yemek_detay_cubit.dart';
import 'package:bitirme_projesi/entity/yemekler.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/src/provider.dart';

class YemekKutusu extends StatefulWidget {
  const YemekKutusu({Key? key}) : super(key: key);

  @override
  _YemekKutusuState createState() => _YemekKutusuState();
}

class _YemekKutusuState extends State<YemekKutusu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                  color: Colors.red,
                  child: IconButton(
                    icon: Icon(Icons.face),
                    onPressed: () {},
                  )),
              Text("Hepsi")
            ],
          ),
          Column(
            children: [
              Container(
                  color: Colors.red,
                  child: IconButton(
                    icon: Icon(Icons.face),
                    onPressed: () {},
                  )),
              Text("Ana Yemekler")
            ],
          ),
          Column(
            children: [
              Container(
                color: Colors.red,
                child: IconButton(
                  icon: Icon(Icons.face),
                  onPressed: () {},
                ),
              ),
              Text("Tatlılar")
            ],
          ),
          Column(
            children: [
              Container(
                color: Colors.red,
                child: IconButton(
                  icon: Icon(Icons.face),
                  onPressed: () {
                  },
                ),
              ),
              Text("İçecekler")
            ],
          ),
        ],
      ),
    );
  }
}

//---------------------------------------------------------------------------

class YemekList extends StatefulWidget {
  const YemekList({
    Key? key,
    required this.yemek,
  }) : super(key: key);

  final Yemekler yemek;

  @override
  State<YemekList> createState() => _YemekListState();
}

class _YemekListState extends State<YemekList> {
  @override
  Widget build(BuildContext context) {
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
              child: Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${widget.yemek.yemek_resim_adi}", fit: BoxFit.cover),
            ),
            title: Text(widget.yemek.yemek_adi,
                style: TextStyle(fontSize: 20)),
            subtitle: Text("${widget.yemek.yemek_fiyat.toString()} ₺"),
            onTap: () {
              showModalBottomSheet<void>(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                context: context,
                builder: (BuildContext context) {
                  return YemekDetayPop(yemek: widget.yemek);
                },
              );
            },
          ),
        ),
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Sepete Ekle',
            color: Color(0xffFF4F3B),
            icon: Icons.shopping_cart_outlined,
            onTap: () {
              context.read<YemekDetayCubit>().kayit(widget.yemek.yemek_adi.toString(), widget.yemek.yemek_resim_adi.toString(),widget.yemek.yemek_fiyat,1,"Boran");
            },
          ),
        ],
      );
  }
}

//---------------------------------------------------------------------------

class YemekDetayPop extends StatefulWidget {
  const YemekDetayPop({
    Key? key,
    required this.yemek,
  }) : super(key: key);

  final Yemekler yemek;

  @override
  _YemekDetayPopState createState() => _YemekDetayPopState();
}

class _YemekDetayPopState extends State<YemekDetayPop> {
  int yemekSayisi = 1;
  String isim = "Boran";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black12),
      height: 400,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      )
                    ],),
                  Image.network("http://kasimadalan.pe.hu/yemekler/resimler/${widget.yemek.yemek_resim_adi}",width: 200,height: 180,),
                  Text(widget.yemek.yemek_adi, style: TextStyle(fontSize: 25)),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.green),
                      width: 40,
                      height: 20,
                      child:
                  Text("${widget.yemek.yemek_fiyat.toString()} ₺",textAlign: TextAlign.center,)
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10,bottom: 10) ,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white),
                    width: 120,
                    height: 30,
                    child: Row(
                      children: [
                        IconButton(onPressed: () {
                          setState(() {
                            yemekSayisi--;
                          });}, icon: Icon(Icons.remove,color: Colors.green, size: 15,)),
                        SizedBox(width: 5),
                        Text("$yemekSayisi"),
                        SizedBox(width: 5),
                        IconButton(onPressed: () {
                          setState(() {
                            yemekSayisi++;
                          });
                        }, icon: Icon(Icons.add,color: Colors.red, size: 15,))
                      ],
                    ),
                  ),
                  ElevatedButton(onPressed: () {
                    for( var i = 0 ; i < yemekSayisi; i++ )
                      {
                    context.read<YemekDetayCubit>().kayit(widget.yemek.yemek_adi.toString(), widget.yemek.yemek_resim_adi.toString(),widget.yemek.yemek_fiyat,1,isim);
                  }
                    Navigator.pop(context);
                    }, child: Text("Sepete Ekle"),style: ElevatedButton.styleFrom(
                    primary: Color(0xffFF4F3B),))
                ],),
            ),
          ],
        ),
      ),
    );
  }
}

//---------------------------------------------------------------------------

class OnerilenYemekler extends StatefulWidget {
  const OnerilenYemekler({Key? key}) : super(key: key);

  @override
  _OnerilenYemeklerState createState() => _OnerilenYemeklerState();
}

class _OnerilenYemeklerState extends State<OnerilenYemekler> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: Column(children: [
      //Text("Önerilen Yemekler", style: TextStyle(color: Colors.red),),
        ImageSlideshow(
          width: double.infinity,
          height: 250,
          initialPage: 0,
          indicatorColor: Colors.blue,
          indicatorBackgroundColor: Colors.grey,
          children: [
            Image.network(
              'http://kasimadalan.pe.hu/yemekler/resimler/izgaratavuk.png',
              fit: BoxFit.cover,
            ),
            Image.network(
              'http://kasimadalan.pe.hu/yemekler/resimler/izgarasomon.png',
              fit: BoxFit.cover,
            ),
            Image.network(
              'http://kasimadalan.pe.hu/yemekler/resimler/pizza.png',
              fit: BoxFit.cover,
            ),
            Image.network(
              'http://kasimadalan.pe.hu/yemekler/resimler/lazanya.png',
              fit: BoxFit.cover,
            ),
            Image.network(
              'http://kasimadalan.pe.hu/yemekler/resimler/makarna.png',
              fit: BoxFit.cover,
            ),
          ],

          autoPlayInterval: 3000,
          isLoop: true,
        ),
        /*ListView(
        shrinkWrap: true,
        children: [
          CarouselSlider(
            items: [
              //1st Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffFF4F3B)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage("http://kasimadalan.pe.hu/yemekler/resimler/izgaratavuk.png",),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //2nd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffFF4F3B)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage("http://kasimadalan.pe.hu/yemekler/resimler/izgarasomon.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //3rd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffFF4F3B)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage("http://kasimadalan.pe.hu/yemekler/resimler/pizza.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //4th Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffFF4F3B)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage("http://kasimadalan.pe.hu/yemekler/resimler/lazanya.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //5th Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffFF4F3B)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage("http://kasimadalan.pe.hu/yemekler/resimler/makarna.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 260.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),
        ],
      ),*/
      ],)
    );
  }
}

//--------------------------------------------------------------------------



