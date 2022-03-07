import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uchow/api_calls/api.dart';
import 'package:uchow/controllers/user_controller.dart';

class GoogleAuth {
  static GoogleAuth _instance = GoogleAuth._internal();
  GoogleAuth._internal() {
    _instance = this;
  }
  factory GoogleAuth() => _instance;

  final api = Api();
  final GoogleSignIn googleSignIn = GoogleSignIn(
    // Optional clientId
    // clientId:
    //     '771803993642-qhk7f2l689bchtnimtmbhq31102em883.apps.googleusercontent.com',
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

  Future<void> sendToBackend(GoogleSignInAccount? account) async {
    print(account);
    Response res =
        await api.post("http://192.168.43.108:5000/api/auth/glogin", body: {
      "name": account?.displayName,
      "email": account?.email,
      "id": account?.id,
      "image": account?.photoUrl,
      "serverAuthCode": account?.serverAuthCode
    });
    print("done::::::::::::::");
    print(res);
    // Get.toNamed("/");
  }

  Future<void> handleSignOut() => googleSignIn.disconnect();
}
