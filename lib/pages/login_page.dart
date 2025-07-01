// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuthException;
<<<<<<< HEAD

import '../services/login_service.dart';
import 'package:flutter/material.dart';
=======
import 'package:flutter/material.dart';
import '../services/login_service.dart';
>>>>>>> 32ecd53 (Menambahkan fitur lupa password)

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final LoginService _loginService = LoginService();

  String _error = '';
  bool _isLoading = false;
  bool _obscurePassword = true;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;
<<<<<<< HEAD
    
=======

>>>>>>> 32ecd53 (Menambahkan fitur lupa password)
    setState(() {
      _error = '';
      _isLoading = true;
    });
<<<<<<< HEAD
    
=======

>>>>>>> 32ecd53 (Menambahkan fitur lupa password)
    try {
      await _loginService.loginWithEmail(
        _emailController.text,
        _passwordController.text,
      );

<<<<<<< HEAD
      // Navigasi ke halaman diagnosis setelah login berhasil
      Navigator.pushReplacementNamed(context, '/diagnosis');
    } on FirebaseAuthException catch (e) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Login Gagal'),
        content: Text(_getReadableErrorMessage(e.code)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  } catch (e) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Kesalahan'),
        content: const Text('Terjadi kesalahan saat login. Silakan coba lagi.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  } finally {
    setState(() => _isLoading = false);
  }
}

  // Fungsi helper untuk menampilkan pesan error yang lebih jelas
String _getReadableErrorMessage(String code) {
  switch (code) {
    case 'user-not-found':
      return 'Email tidak ditemukan. Silakan periksa kembali.';
    case 'wrong-password':
      return 'Password salah. Coba lagi.';
    case 'invalid-email':
      return 'Format email tidak valid.';
    case 'user-disabled':
      return 'Akun Anda telah dinonaktifkan.';
    default:
      return 'Login gagal. Silakan coba lagi.';
  }
}
=======
      Navigator.pushReplacementNamed(context, '/diagnosis');
    } on FirebaseAuthException catch (e) {
      _showErrorDialog('Login Gagal', _getReadableErrorMessage(e.code));
    } catch (e) {
      _showErrorDialog('Kesalahan', 'Terjadi kesalahan saat login.');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _loginWithGoogle() async {
    setState(() {
      _error = '';
      _isLoading = true;
    });

    try {
      await _loginService.loginWithGoogle();
      Navigator.pushReplacementNamed(context, '/diagnosis');
    } on FirebaseAuthException catch (e) {
      _showErrorDialog('Login Gagal', _getReadableErrorMessage(e.code));
    } catch (e) {
      _showErrorDialog('Login Gagal', 'Login dengan Google gagal.');
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  String _getReadableErrorMessage(String code) {
    switch (code) {
      case 'user-not-found':
        return 'Email tidak ditemukan.';
      case 'wrong-password':
        return 'Password salah.';
      case 'invalid-email':
        return 'Email tidak valid.';
      case 'user-disabled':
        return 'Akun dinonaktifkan.';
      default:
        return 'Login gagal. Silakan coba lagi.';
    }
  }
>>>>>>> 32ecd53 (Menambahkan fitur lupa password)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Masuk',
<<<<<<< HEAD
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
=======
          style: TextStyle(color: Colors.white),
>>>>>>> 32ecd53 (Menambahkan fitur lupa password)
        ),
        backgroundColor: const Color(0xFF4FACFE),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
<<<<<<< HEAD
            colors: [
              Color(0xFF4FACFE), 
              Color(0xFF00F2FE),
            ],
=======
            colors: [Color(0xFF4FACFE), Color(0xFF00F2FE)],
>>>>>>> 32ecd53 (Menambahkan fitur lupa password)
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Form(
              key: _formKey,
              child: Column(
<<<<<<< HEAD
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
                  
                  // Logo/Icon
=======
                children: [
                  const SizedBox(height: 40),
>>>>>>> 32ecd53 (Menambahkan fitur lupa password)
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
<<<<<<< HEAD
                          spreadRadius: 2,
=======
>>>>>>> 32ecd53 (Menambahkan fitur lupa password)
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
<<<<<<< HEAD
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: Color(0xFF2E7D32),
                    ),
                  ),
                  
                  const SizedBox(height: 30),
                  
                  // Welcome Text
=======
                    child: const Icon(Icons.person, size: 50, color: Color(0xFF2E7D32)),
                  ),
                  const SizedBox(height: 30),
>>>>>>> 32ecd53 (Menambahkan fitur lupa password)
                  const Text(
                    'Selamat Datang Kembali!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
<<<<<<< HEAD
                      shadows: [
                        Shadow(
                          color: Colors.black26,
                          offset: Offset(1, 1),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  const SizedBox(height: 10),
                  
                  const Text(
                    'Masuk ke akun Anda untuk melanjutkan',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Login Form Card
=======
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Masuk ke akun Anda untuk melanjutkan',
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
>>>>>>> 32ecd53 (Menambahkan fitur lupa password)
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
<<<<<<< HEAD
                          spreadRadius: 2,
=======
>>>>>>> 32ecd53 (Menambahkan fitur lupa password)
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
<<<<<<< HEAD
                        // Email Field
=======
>>>>>>> 32ecd53 (Menambahkan fitur lupa password)
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
<<<<<<< HEAD
                            if (value == null || value.isEmpty) {
                              return 'Email tidak boleh kosong';
                            }
                            if (!value.contains('@')) {
                              return 'Format email tidak valid';
                            }
=======
                            if (value == null || value.isEmpty) return 'Email tidak boleh kosong';
                            if (!value.contains('@')) return 'Email tidak valid';
>>>>>>> 32ecd53 (Menambahkan fitur lupa password)
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
<<<<<<< HEAD
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Color(0xFF2E7D32),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFF2E7D32),
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
=======
                            prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFF2E7D32)),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
>>>>>>> 32ecd53 (Menambahkan fitur lupa password)
                            filled: true,
                            fillColor: Colors.grey[50],
                          ),
                        ),
<<<<<<< HEAD
                        
                        const SizedBox(height: 20),
                        
                        // Password Field
=======
                        const SizedBox(height: 20),
>>>>>>> 32ecd53 (Menambahkan fitur lupa password)
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          validator: (value) {
<<<<<<< HEAD
                            if (value == null || value.isEmpty) {
                              return 'Password tidak boleh kosong';
                            }
                            if (value.length < 6) {
                              return 'Password minimal 6 karakter';
                            }
=======
                            if (value == null || value.isEmpty) return 'Password tidak boleh kosong';
                            if (value.length < 6) return 'Password minimal 6 karakter';
>>>>>>> 32ecd53 (Menambahkan fitur lupa password)
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Password',
<<<<<<< HEAD
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Color(0xFF2E7D32),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Color(0xFF2E7D32),
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Color(0xFF2E7D32),
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
=======
                            prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF2E7D32)),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                color: Color(0xFF2E7D32),
                              ),
                              onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                            ),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
>>>>>>> 32ecd53 (Menambahkan fitur lupa password)
                            filled: true,
                            fillColor: Colors.grey[50],
                          ),
                        ),
<<<<<<< HEAD
                        
                        const SizedBox(height: 30),
                        
                        // Login Button
=======
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                            // Arahkan ke halaman reset password (buat halaman ini jika belum)
                            Navigator.pushNamed(context, '/reset');
                            },
                              child: const Text(
                              'Lupa Password?',
                              style: TextStyle(
                              color: Color(0xFF2E7D32),
                              fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
>>>>>>> 32ecd53 (Menambahkan fitur lupa password)
                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: _isLoading ? null : _login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2E7D32),
<<<<<<< HEAD
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 3,
                              shadowColor: const Color(0xFF2E7D32).withOpacity(0.3),
                            ),
                            child: _isLoading
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white,
                                      ),
                                      strokeWidth: 2,
                                    ),
                                  )
                                : const Text(
                                    'Masuk',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                        
                        // Error Message
=======
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: _isLoading
                                ? const CircularProgressIndicator(color: Colors.white, strokeWidth: 2)
                                : const Text('Masuk', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Tombol Google
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton.icon(
                            icon: Image.asset('assets/google-logo.png', height: 24),
                            label: const Text('Masuk dengan Google'),
                            onPressed: _isLoading ? null : _loginWithGoogle,
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              side: const BorderSide(color: Colors.grey),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),

>>>>>>> 32ecd53 (Menambahkan fitur lupa password)
                        if (_error.isNotEmpty)
                          Container(
                            margin: const EdgeInsets.only(top: 20),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.red[50],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.red[200]!),
                            ),
                            child: Row(
                              children: [
<<<<<<< HEAD
                                Icon(
                                  Icons.error_outline,
                                  color: Colors.red[700],
                                  size: 20,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    _error,
                                    style: TextStyle(
                                      color: Colors.red[700],
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
=======
                                Icon(Icons.error_outline, color: Colors.red[700]),
                                const SizedBox(width: 8),
                                Expanded(child: Text(_error, style: TextStyle(color: Colors.red[700]))),
>>>>>>> 32ecd53 (Menambahkan fitur lupa password)
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
<<<<<<< HEAD
                  
                  const SizedBox(height: 30),
                  
                  // Additional Info
=======
                  const SizedBox(height: 30),
>>>>>>> 32ecd53 (Menambahkan fitur lupa password)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
<<<<<<< HEAD
                        Icon(
                          Icons.info_outline,
                          color: Color(0xFF2E7D32),
                          size: 20,
                        ),
=======
                        Icon(Icons.info_outline, color: Color(0xFF2E7D32)),
>>>>>>> 32ecd53 (Menambahkan fitur lupa password)
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Pastikan Anda menggunakan email dan password yang benar',
<<<<<<< HEAD
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF666666),
                            ),
=======
                            style: TextStyle(fontSize: 13, color: Color(0xFF666666)),
>>>>>>> 32ecd53 (Menambahkan fitur lupa password)
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
<<<<<<< HEAD
}
=======
}
>>>>>>> 32ecd53 (Menambahkan fitur lupa password)
