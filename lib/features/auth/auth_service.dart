import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flexana/features/auth/data/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// ✅ Map Firebase Errors to Friendly Messages
  String _handleFirebaseAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return "The email address is not valid.";
      case 'user-disabled':
        return "This account has been disabled.";
      case 'user-not-found':
        return "No account found with this email.";
      case 'wrong-password':
        return "Incorrect password. Please try again.";
      case 'email-already-in-use':
        return "This email is already registered.";
      case 'weak-password':
        return "Password is too weak. Please use a stronger one.";
      case 'email-not-verified':
        return "Please verify your email before logging in.";
      default:
        return "An unexpected error occurred. Please try again.";
    }
  }

  /// ✅ Signup with Email & Password + Save User in Firestore
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

      return null; // success
    } on FirebaseAuthException catch (e) {
      return _handleFirebaseAuthError(e);
    } catch (e) {
      return "Something went wrong. Please try again.";
    }
  }

  /// ✅ Login with Phone & Password
  Future<String?> login({
    required String phone,
    required String password,
  }) async {
    try {
      // 🔍 Step 1: Get user by phone from Firestore
      QuerySnapshot snapshot = await _firestore
          .collection("users")
          .where("phone", isEqualTo: phone)
          .limit(1)
          .get();

      if (snapshot.docs.isEmpty) {
        return "No account found with this phone number.";
      }

      // Get user data
      var userData = snapshot.docs.first.data() as Map<String, dynamic>;
      String email = userData["email"];

      // 🔑 Step 2: Login using email & password
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!result.user!.emailVerified) {
        return "Please verify your email before logging in.";
      }

      return null; // success
    } on FirebaseAuthException catch (e) {
      return _handleFirebaseAuthError(e);
    } catch (e) {
      return "Something went wrong. Please try again.";
    }
  }

  /// ✅ Send OTP
  Future<String?> sendOtp({
    required String phoneNumber,
    required Function(String) codeSent,
  }) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          throw e;
        },
        codeSent: (String verificationId, int? resendToken) {
          codeSent(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      return null;
    } on FirebaseAuthException catch (e) {
      return _handleFirebaseAuthError(e);
    } catch (e) {
      return "Failed to send OTP. Please try again.";
    }
  }

  /// ✅ Verify OTP
  Future<String?> verifyOtp({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      return null; // success
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-verification-code':
          return "The OTP you entered is incorrect.";
        case 'session-expired':
          return "The OTP has expired. Please request a new one.";
        case 'invalid-verification-id':
          return "Something went wrong. Please try again.";
        default:
          return "Verification failed. Please try again.";
      }
    } catch (e) {
      return "An unexpected error occurred. Please try again.";
    }
  }

  /// ✅ Logout
  Future<void> logout() async {
    await _auth.signOut();
  }
}
