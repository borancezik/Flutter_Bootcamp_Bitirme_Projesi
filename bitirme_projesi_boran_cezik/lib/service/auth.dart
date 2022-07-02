import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  //servis işlemi için bir class oluşturuyoruz
  final FirebaseAuth _auth = FirebaseAuth
      .instance; // burada auth işlemini _auth isimli bir değişkene atıyoruz
  final FirebaseFirestore _firestore = FirebaseFirestore
      .instance; // burada database e veri eklemek için firestore'u _firestore isimli değişkene aktarıyoruz.

  Future<User?> login(String email, String password) async {
    // bu hesaba giriş yapmak için oluşturduğumuz future fonksiyonu
    var user = await _auth.signInWithEmailAndPassword(
      // login işlemini parametleri belirtip user isimli değişkene atıyoruz.
        email: email,
        password: password);

    return user.user;
  }

  signOut() async {
    // hesaptan çıkış yapma fonksiyonu
    return await _auth.signOut();
  }

  Future<User?> createUser(String email, String password) async {
    // bu ise yeni kullanıcı oluşturmak için oluşturdugumuz fonksiyon
    var user = await _auth.createUserWithEmailAndPassword(
      // bu değişkende ilgili parametreleri verip hesap oluşturma işlemini yapıyoruz.
        email: email,
        password: password);
    await _firestore // daha sonra oluşturmuş oldugumuz hesabı alt tarafta yazmış oldugumuz kod ile database kısmına kaydediyoruz.
        .collection('Users')
        .doc(user.user!.uid)
        .set({'mail': email, 'pass': password});

    return user.user;
  }
}
