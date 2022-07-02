import 'package:bitirme_projesi/cubit/sepet_cubit.dart';
import 'package:bitirme_projesi/cubit/yemek_detay_cubit.dart';
import 'package:bitirme_projesi/views/anasayfa.dart';
import 'package:bitirme_projesi/views/deneme.dart';
import 'package:bitirme_projesi/views/kay%C4%B1t_ol.dart';
import 'package:bitirme_projesi/views/login.dart';
import 'package:bitirme_projesi/views/sepet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'cubit/anasayfa_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AnasayfaCubit()),
        BlocProvider(create: (context) => YemekDetayCubit()),
    BlocProvider(create: (context) => SepetCubit())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Anasayfa(),
      ),
    );

  }
}

