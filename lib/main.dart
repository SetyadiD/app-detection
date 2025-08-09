import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/diagnosis_page.dart';
import 'pages/history_page.dart';
import 'pages/profile_page.dart';
import 'pages/reset_page.dart';

/// Entry point utama aplikasi
/// Function ini dijalankan pertama kali saat aplikasi dimulai
/// 
/// Menginisialisasi:
/// - Widget binding untuk memastikan Flutter framework siap
/// - Firebase dengan konfigurasi platform yang sesuai
/// - Menjalankan aplikasi MyApp
void main() async {
  // Memastikan widget binding telah diinisialisasi sebelum Firebase
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inisialisasi Firebase dengan konfigurasi platform yang sesuai
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  // Menjalankan aplikasi utama
  runApp(const MyApp());
}

/// Widget utama aplikasi Diagnosis Penyakit Kulit
/// 
/// Kelas ini merupakan root widget yang mengatur:
/// - Konfigurasi tema aplikasi
/// - Routing dan navigasi antar halaman
/// - Pengaturan judul aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// Method build untuk membangun widget tree aplikasi
  /// 
  /// Returns [MaterialApp] yang berisi:
  /// - Konfigurasi tema dengan warna teal
  /// - Routing untuk navigasi antar halaman
  /// - Halaman awal (home) sebagai entry point
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Judul aplikasi yang ditampilkan di task manager
      title: 'Diagnosis Penyakit Kulit',
      
      // Tema aplikasi dengan primary color teal
      theme: ThemeData(primarySwatch: Colors.teal),
      
      // Route awal yang ditampilkan saat aplikasi dibuka
      initialRoute: '/home',
      
      // Definisi semua route/halaman dalam aplikasi
      routes: {
        '/home': (context) => const HomePage(),        // Halaman utama
        '/login': (context) => const LoginPage(),      // Halaman login
        '/register': (context) => const RegisterPage(), // Halaman registrasi
        '/diagnosis': (context) => const DiagnosisPage(), // Halaman diagnosis
        '/history': (context) => const HistoryPage(),   // Halaman riwayat
        '/profile': (context) => const ProfilePage(),   // Halaman profil
        '/reset': (context) => const ResetPasswordPage(), // Halaman reset password
      },
    );
  }
}
