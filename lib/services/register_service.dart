import 'package:firebase_auth/firebase_auth.dart';

/// Service class untuk menangani proses registrasi pengguna
/// 
/// Kelas ini menyediakan berbagai method untuk:
/// - Registrasi pengguna baru dengan email dan password
/// - Verifikasi email pengguna
/// - Mengelola status verifikasi email
/// - Reload data pengguna untuk memperbarui status
class RegisterService {
  /// Instance Firebase Authentication untuk operasi autentikasi
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Method untuk mendaftarkan pengguna baru
  /// 
  /// Proses registrasi meliputi:
  /// 1. Membuat akun baru dengan email dan password
  /// 2. Mengupdate display name pengguna
  /// 3. Mengirim email verifikasi
  /// 
  /// Parameters:
  /// - [email]: Alamat email pengguna (akan di-trim whitespace)
  /// - [password]: Password untuk akun baru
  /// - [name]: Nama display yang akan ditampilkan
  /// 
  /// Returns: [UserCredential] yang berisi informasi pengguna yang baru dibuat
  /// 
  /// Throws: 
  /// - [FirebaseAuthException] jika terjadi error saat registrasi
  /// - [Exception] untuk error umum lainnya
  Future<UserCredential> register({
    required String email,
    required String password,
    required String name,
  }) async {
    // Membuat akun baru dengan email dan password
    final credential = await _auth.createUserWithEmailAndPassword(
      email: email.trim(), // Menghapus whitespace dari email
      password: password,
    );
    
    // Update display name pengguna
    await credential.user?.updateDisplayName(name);
    
    // Mengirim email verifikasi ke alamat email pengguna
    await credential.user?.sendEmailVerification();
    
    return credential;
  }

  /// Method untuk memeriksa status verifikasi email pengguna saat ini
  /// 
  /// Method ini mengecek apakah email pengguna yang sedang login
  /// sudah diverifikasi atau belum
  /// 
  /// Returns: 
  /// - [true] jika email sudah diverifikasi
  /// - [false] jika email belum diverifikasi atau tidak ada pengguna yang login
  bool isEmailVerified() {
    final user = _auth.currentUser;
    return user?.emailVerified ?? false;
  }

  /// Method untuk mengirim ulang email verifikasi
  /// 
  /// Method ini akan mengirim ulang email verifikasi ke pengguna yang sedang login,
  /// tetapi hanya jika email belum diverifikasi. Berguna ketika pengguna tidak
  /// menerima email verifikasi pertama atau email hilang.
  /// 
  /// Kondisi pengiriman:
  /// - Harus ada pengguna yang sedang login
  /// - Email pengguna belum diverifikasi
  /// 
  /// Throws: [FirebaseAuthException] jika terjadi error saat mengirim email
  Future<void> resendVerificationEmail() async {
    final user = _auth.currentUser;
    // Kirim email verifikasi hanya jika user ada dan email belum diverifikasi
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }

  /// Method untuk me-reload data pengguna dari server Firebase
  /// 
  /// Method ini memperbarui data pengguna lokal dengan data terbaru dari server.
  /// Berguna untuk memperbarui status verifikasi email setelah pengguna
  /// mengklik link verifikasi di email mereka.
  /// 
  /// Setelah memanggil method ini, status emailVerified akan diperbarui
  /// sesuai dengan status terbaru di server Firebase.
  /// 
  /// Throws: [FirebaseAuthException] jika terjadi error saat reload data
  Future<void> reloadUser() async {
    await _auth.currentUser?.reload();
  }
}
