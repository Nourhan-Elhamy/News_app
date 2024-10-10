import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:userapp/features/auth/register/data/repos/register_repo.dart';

import '../../../../../core/errors/failure.dart';
import '../../presentation/controller/register_state.dart';

class RegisterFirebaseImplementation implements RegisterRepo{
  @override
  Future<Either<Failure, void>> register({required String email, required String pas, required BuildContext context})async{
    // TODO: implement register
    if (pas.length < 6) {
      return left(FirebaseFailure(message: "Password should be at least 6 characters."));
    }
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pas,
      );
      return right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {

        return left(FirebaseFailure(message: "weak-password"));

      } else if (e.code == 'email-already-in-use') {

        return left(FirebaseFailure(message: "Email Already In Use"));
      }
      else{
        return left(FirebaseFailure(message: "error"));
      }
    } catch (e) {
     return left(FirebaseFailure(message: "error"));
      print(e.toString());
    }
  }





  Future<Either<Failure, void>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      return right(userCredential.user);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure(message: "Error signing in with Google: ${e.message}"));
    } catch (e) {
      return left(FirebaseFailure(message: "Error signing in with Google"));
    }
  }
  }



