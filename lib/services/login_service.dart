// ignore_for_file: unused_catch_clause

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> loginWithEmail(String email, String password) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      
      // Check if email is verified
      if (!credential.user!.emailVerified) {
        // Sign out the user if email is not verified
        await _auth.signOut();
        throw FirebaseAuthException(
          code: 'email-not-verified',
          message: 'Email belum diverifikasi. Silakan cek email Anda dan klik link verifikasi.',
        );
      }
      
      return credential;
    } on FirebaseAuthException catch (e) {
      rethrow;
    } catch (e) {
      throw Exception('Terjadi kesalahan saat login: ${e.toString()}');
    }
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<void> logout() async {
    await _auth.signOut();
    await GoogleSignIn().signOut(); // Logout juga dari Google
  }

  Future<UserCredential> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        throw Exception('Login dengan Google dibatalkan oleh pengguna.');
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      rethrow;
    } catch (e) {
      throw Exception('Login dengan Google gagal: ${e.toString()}');
    }
  }

  // Method to resend verification email during login process
  Future<void> resendVerificationEmail(String email, String password) async {
    try {
      // Sign in temporarily to send verification email
      final credential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      
      if (!credential.user!.emailVerified) {
        await credential.user!.sendEmailVerification();
      }
      
      // Sign out after sending verification email
      await _auth.signOut();
    } catch (e) {
      throw Exception('Gagal mengirim ulang email verifikasi');
    }
  }
}
