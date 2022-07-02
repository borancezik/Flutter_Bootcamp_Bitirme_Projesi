import 'package:bitirme_projesi/cubit/sepet_cubit.dart';
import 'package:bitirme_projesi/entity/yemekler.dart';
import 'package:bitirme_projesi/views/login.dart';
import 'package:bitirme_projesi/views/sepet.dart';
import 'package:bitirme_projesi/views/tabbarViews/tabbarviews.dart';
import 'package:bitirme_projesi/widgets/anasayfa_widgets.dart';
import 'package:bitirme_projesi/cubit/anasayfa_cubit.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bitirme_projesi/presentation/my_flutter_app_icons.dart';

import '../main.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  final List dummyList = List.generate(10, (index) {
    return {
      "id": index,
      "title": "This is the title $index",
      "subtitle": "This is the subtitle $index"
    };
  });


  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().yemekleriYukle();
  }

  bool aramaYapiliyorMu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xffFF4F3B) ,centerTitle: true,title: Text("Komşuda Pişti"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Boran Cezik"),
              accountEmail: Text("borancezik.@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://img.freepik.com/free-photo/handsome-confident-smiling-man-with-hands-crossed-chest_176420-18743.jpg?w=2000"),
              ),
              decoration: BoxDecoration(
                color: Color(0xffFF4F3B),
                image: DecorationImage(
                  image: NetworkImage(
                    "https://appmaking.co/wp-content/uploads/2021/08/android-drawer-bg.jpeg",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart_outlined),
              title: Text("Sepet"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Sepet()));
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Çıkış Yap"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
              },
            ),
          ],
        ),
      ),

        body: DefaultTabController(
            length: 4,
            child: NestedScrollView(
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                     SliverAppBar(

                       automaticallyImplyLeading: false,
                      expandedHeight: 300.0,
                       collapsedHeight: 60.0,
                      backgroundColor: Color(0xffFF4F3B),//Color(0xffFF4F4B),
                      floating: false,
                      pinned: true,
                      actions: [
                      ],
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text("En Sağlıklı Yemekler", style: TextStyle(color: Colors.white),),
                        centerTitle: true,
                        background: OnerilenYemekler(),
                      ),
                    ),
                    SliverPersistentHeader(
                      delegate: _SliverAppBarDelegate(
                        const TabBar(
                          indicatorColor: Colors.white,
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.white,
                          tabs: [
                            Tab(icon: Icon(MyFlutterApp.grid), text: "Hepsi"),
                            Tab(icon: Icon(MyFlutterApp.hot), text: "Ana Yemekler"),
                            Tab(icon: Icon(MyFlutterApp.cupcake), text: "Tatlılar"),
                            Tab(icon: Icon(MyFlutterApp.drink), text: "içecekler"),
                          ],
                        ),
                      ),
                      pinned: true,
                    ),
                  ];
                },
                body: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                  ButunYemekler(),AnaYemekler(),Tatlilar(),Icecekler()
                ],),
            )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Sepet())).then((value){ context.read<SepetCubit>().tumSepetiGetir("Boran"); });
        },
        backgroundColor: Color(0xffFF4F3B),
        child: const Icon(Icons.shopping_cart_outlined),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return new Container(
      color: Color(0xffFF4F3B),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}




