// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authstore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStore, Store {
  final _$_signedInUserAtom = Atom(name: '_AuthStore._signedInUser');

  @override
  User get _signedInUser {
    _$_signedInUserAtom.reportRead();
    return super._signedInUser;
  }

  @override
  set _signedInUser(User value) {
    _$_signedInUserAtom.reportWrite(value, super._signedInUser, () {
      super._signedInUser = value;
    });
  }

  final _$_isTryingSignUpAtom = Atom(name: '_AuthStore._isTryingSignUp');

  @override
  bool get _isTryingSignUp {
    _$_isTryingSignUpAtom.reportRead();
    return super._isTryingSignUp;
  }

  @override
  set _isTryingSignUp(bool value) {
    _$_isTryingSignUpAtom.reportWrite(value, super._isTryingSignUp, () {
      super._isTryingSignUp = value;
    });
  }

  final _$googleSignInAsyncAction = AsyncAction('_AuthStore.googleSignIn');

  @override
  Future googleSignIn() {
    return _$googleSignInAsyncAction.run(() => super.googleSignIn());
  }

  final _$signOutAsyncAction = AsyncAction('_AuthStore.signOut');

  @override
  Future signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
