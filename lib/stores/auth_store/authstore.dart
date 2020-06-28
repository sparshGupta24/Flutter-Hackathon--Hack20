import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hack20_atomica/models/user_model.dart';
import 'package:mobx/mobx.dart';
part 'authstore.g.dart';
class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  User _signedInUser = User(name: " ", email: " ", img: " ");

  @observable
  bool _isTryingSignUp = false;

  @computed
  bool get trying =>_isTryingSignUp;
  User get user => _signedInUser;

  @action
  googleSignIn() async {
    _isTryingSignUp = true;
    final GoogleSignInAccount googleSignInAccount =
        await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final AuthResult authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;
    _signedInUser.name = user.displayName;
    _signedInUser.email = user.email;
    _signedInUser.img = user.photoUrl;
    print("@@@@@@@@@@@@@@@@@@ ${_signedInUser.name} @@@@@@@@@@@@@");
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    final FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    assert(user.uid == currentUser.uid);
    _isTryingSignUp = false;
  }

  @action
  signOut() async {
    GoogleSignIn().signOut();
    _signedInUser.name = " ";
    _signedInUser.email = " ";
    _signedInUser.img = " ";
  }
}
