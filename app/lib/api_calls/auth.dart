import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uchow/controllers/user_controller.dart';

class GoogleAuth {
  final GoogleSignIn googleSignIn = GoogleSignIn(
    // Optional clientId
    clientId:
        '771803993642-qhk7f2l689bchtnimtmbhq31102em883.apps.googleusercontent.com',
    scopes: <String>[
      'email',
    ],
  );

  listenForUser() {
    googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      //send info to server
      //get or insert user in db
      //call userControllerLogin with payload
      print(account);
    });
    googleSignIn.signInSilently();
  }

  Future<void> handleSignIn() async {
    try {
      GoogleSignInAccount? account = await googleSignIn.signIn();
      sendToBackend(account);
    } catch (error) {
      print(error);
    }
  }

  sendToBackend(GoogleSignInAccount? account) {
    Get.toNamed("/");
  }

  Future<void> handleSignOut() => googleSignIn.disconnect();
}
