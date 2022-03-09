import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uchow/helpers/api.dart';
import 'package:uchow/controllers/user_controller.dart';

import '../interfaces/interfaces.dart';

class GoogleAuth {
  static GoogleAuth _instance = GoogleAuth._internal();
  GoogleAuth._internal() {
    _instance = this;
  }
  factory GoogleAuth() => _instance;

  var server = dotenv.env["SERVER_BASE_URL"]!;
  final api = Api();
  final UserController userController = Get.find<UserController>();
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
      print(account);
    });
    googleSignIn.signInSilently();
  }

  Future handleSignIn() async {
    try {
      GoogleSignInAccount? account = await googleSignIn.signIn();
      return sendToBackend(account);
    } catch (error) {
      return LocalResponse(
          success: false,
          message:
              "There was an error logging in with Google, please try again.");
    }
  }

  Future<LocalResponse> sendToBackend(GoogleSignInAccount? account) async {
    var res = await api.post(server + "/auth/glogin", body: {
      "name": account?.displayName,
      "email": account?.email,
      "id": account?.id,
      "image": account?.photoUrl,
      "serverAuthCode": account?.serverAuthCode
    });
    if (res["success"] == null) {
      userController.setUser(res);
      return LocalResponse(success: true);
    } else {
      return LocalResponse(success: false, message: res["message"]);
    }
  }

  Future<void> handleSignOut() => googleSignIn.disconnect();
}
