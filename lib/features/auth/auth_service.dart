import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flexana/features/auth/data/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// ✅ Signup with Email & Password + Save User in Firestore
  Future<AppUser?> signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      // 1- Create user in FirebaseAuth
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User user = result.user!;
      AppUser appUser = AppUser(
        uid: user.uid,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
      );

      // 2- Save user in Firestore
      await _firestore.collection("users").doc(user.uid).set(appUser.toMap());

      return appUser;
    } catch (e) {
      print("Signup Error: $e");
      return null;
    }
  }

  /// ✅ Login with Email & Password
  Future<User?> login({required String email, required String password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return result.user;
    } catch (e) {
      print("Login Error: $e");
      return null;
    }
  }

  /// ✅ Send OTP to Phone
  Future<void> sendOtp({
    required String phoneNumber,
    required Function(String) codeSent,
    required Function(FirebaseAuthException) onError,
  }) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: onError,
      codeSent: (String verificationId, int? resendToken) {
        codeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  /// ✅ Verify OTP
  Future<User?> verifyOtp({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      UserCredential result = await _auth.signInWithCredential(credential);
      return result.user;
    } catch (e) {
      print("OTP Error: $e");
      return null;
    }
  }

  /// ✅ Logout
  Future<void> logout() async {
    await _auth.signOut();
  }
}
