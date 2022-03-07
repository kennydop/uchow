export interface GoogleSignInAccount {
  displayName: String;
  email: String;
  id: number;
  photoUrl?: String;
  serverAuthCode: String;
  _idToken: String;
}

export interface LoginDetails {
  name?: String;
  email: String;
  password: String;
}
