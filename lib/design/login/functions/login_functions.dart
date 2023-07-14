import 'package:firebase_auth/firebase_auth.dart';

class LoginFunctionsProvider {
 static Future<UserCredential> signInWithApple() async {
    final appleProvider = AppleAuthProvider();
    return await FirebaseAuth.instance.signInWithProvider(appleProvider);
  }



 static Future logout() async {
    try {
 
       FirebaseAuth.instance.signOut();

      
    } catch (e) {
      print(e.toString());
    }

  }
}
