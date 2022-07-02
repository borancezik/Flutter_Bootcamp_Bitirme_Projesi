import 'package:flutter/material.dart';
import 'package:bitirme_projesi/views/login.dart';
import '../service/auth.dart';
import 'login.dart';

class kayitOl extends StatefulWidget {
  const kayitOl({Key? key}) : super(key: key);

  @override
  _kayitOlState createState() => _kayitOlState();
}

class _kayitOlState extends State<kayitOl> {
  final TextEditingController _mailcontroller =
      TextEditingController(); // Textfield ın içine yazdığımız text i çekmek için controller tanımlanır ve bu controller ilgili textfield'ın parametresine verilir.
  final TextEditingController _passcontroller =
      TextEditingController(); // aynısı

  AuthService _service = AuthService(); // burada firebase auth işlemleri için oluşturdugumuz classı cagırıyoruz.

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
                  top: 20.0, bottom: 15.0, left: 5.0, right: 5.0),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          iconSize: 30,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const login()));
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Color(0xffFF4F3B),
                          )),
                      Text(
                        "Kayıt Ol",
                        style: TextStyle(fontSize: 25.0, color: Colors.black),
                      ),
                      Text(
                        " sdssa",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
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
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: Color(0xffFF4F3B),
                      ),
                      hintText: "Şifrenizi Giriniz",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffFF4F3B)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextFormField(
                    controller: _passcontroller,
                    cursorColor: Color(0xffFF4F3B),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock,
                        color: Color(0xffFF4F3B),
                      ),
                      hintText: "Şifrenizi Tekrar Giriniz",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xffFF4F3B)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.0,
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
                      'Kayıt Ol',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    onPressed: () {
                      _service
                          .createUser(
                              _mailcontroller.text, _passcontroller.text)
                          .then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const login()));
                      });
                    },
                  ),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}
