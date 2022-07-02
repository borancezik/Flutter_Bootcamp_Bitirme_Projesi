import 'package:bitirme_projesi/views/anasayfa.dart';
import 'package:bitirme_projesi/views/kay%C4%B1t_ol.dart';
import 'package:flutter/material.dart';
import '../service/auth.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController _mailcontroller =
  TextEditingController(); // Textfield ın içine yazdığımız text i çekmek için controller tanımlanır ve bu controller ilgili textfield'ın parametresine verilir.
  final TextEditingController _passcontroller =
  TextEditingController(); // aynısı

  AuthService _service = AuthService(); // burada firebase auth işlemleri için oluşturdugumuz classı cagırıyoru
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: Color(0xffFF4F3B)),
          child: Center(
              child: Container(
                width: 300,
                height: 425,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 25.0, bottom: 15.0, left: 5.0, right: 5.0),
                  child: Column(
                    children: [
                      Text(
                        "Giriş Yap",
                        style: TextStyle(fontSize: 25.0, color: Colors.black),
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      TextFormField(
                        controller: _mailcontroller,
                        cursorColor: Color(0xffFF4F3B),
                        maxLength: 20,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.mail,
                            color: Color(0xffFF4F3B),
                          ),
                          hintText: "E-mail",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFF4F3B)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      TextFormField(
                        controller: _passcontroller,
                        cursorColor: Color(0xffFF4F3B),
                        maxLength: 10,
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.lock,
                            color: Color(0xffFF4F3B),
                          ),
                          hintText: "Şifre",
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffFF4F3B)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 15.0),
                        width: double.infinity,
                        child: Text("Şifremi Unuttum !",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Color(0xffFF4F3B),
                          minimumSize: Size(200, 50),
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        child: Text(
                          'Giriş Yap',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        onPressed: () {
                          _service.login(_mailcontroller.text, _passcontroller.text)
                              .then((value) {
                            return Navigator.push(
                              //işlem tamamlandıktan sonra ise sayfayı homepage e yönlenditriyoruz.
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                    const Anasayfa()));
                          });
                        },
                      ),
                      SizedBox(height: 15.0),
                      Text("Bir hesaba sahip değil misin ?"),
                      SizedBox(
                        height: 5.0,
                      ),
                      GestureDetector(
                        onTap: () {
                         Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                  const kayitOl()));
                        },
                        child: Text(
                          "Hemen kayıt ol",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffFF4F3B)),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}