import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexana/features/auth/data/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> signUp({
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

      // 2- Send email verification
      await user.sendEmailVerification();

      // 3- Create User Model
      AppUser appUser = AppUser(
        uid: user.uid,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phone: phone,
      );

      // 4- Save user in Firestore
      await _firestore.collection("users").doc(user.uid).set(appUser.toMap());

      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  /// ✅ Login with Email & Password
  Future<User?> login({required String email, required String password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!result.user!.emailVerified) {
        throw FirebaseAuthException(
          code: "email-not-verified",
          message: "Please verify your email before login.",
        );
      }

      return result.user;
    } on FirebaseAuthException catch (e) {
      print("Login Error: ${e.code} - ${e.message}");
      return null;
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
