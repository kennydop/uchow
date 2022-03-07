export interface GoogleSignInAccount {
  displayName: String;
  email: String;
  id: number;
  photoUrl?: String;
  serverAuthCode: String;
  _idToken: String;
}

export interface LoginDetails {
  login_name?: String;
  login_email: String;
  login_password: String;
}
