import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class DiagnosisService {
  final String apiKey = 'd45bb2b1b4564450a9c7e771a254dd34';
  final String userId = 'lwailvmm1850';
  final String appId = 'diagnosis-penyakit-jamur-kulit';
  final String modelId = 'skin-disease-diagnosis-v1';
  final String modelVersionId = '85c6f6bd89ca4e74b5241498297f72a1';

  Future<List<dynamic>> diagnoseImage(File imageFile) async {
    final bytes = await imageFile.readAsBytes();
    final base64Image = base64Encode(bytes);

    final response = await http.post(
      Uri.parse('https://api.clarifai.com/v2/models/$modelId/versions/$modelVersionId/outputs'),
      headers: {
        'Authorization': 'Key $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'user_app_id': {
          'user_id': userId,
          'app_id': appId,
        },
        'inputs': [
          {
            'data': {'image': {'base64': base64Image}}
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      final results = jsonResponse['outputs'][0]['data']['concepts'];
      return results;
    } else {
      throw Exception('Gagal mendiagnosis gambar: ${response.body}');
    }
  }
   /// Berikan saran pengobatan berdasarkan hasil diagnosis
  String getTreatmentSuggestion(List<dynamic> results) {
    for (var result in results) {
      final name = result['name'].toString().toLowerCase();
      if (name.contains('selulitis')) {
        return 'Segera konsultasi ke dokter. Pengobatan biasanya melibatkan antibiotik oral atau intravena.';
      } else if (name.contains('impetigo')) {
        return 'Jaga kebersihan area kulit. Gunakan salep antibiotik seperti mupirocin. Konsultasikan ke dokter bila meluas.';
      } else if (name.contains('nail fungus')) {
        return 'Gunakan antijamur topikal atau obat oral seperti terbinafine. Hindari lingkungan lembap.';
      } else if (name.contains('athelets foot')) {
        return 'Gunakan bedak atau krim antijamur seperti clotrimazole. Jaga kaki tetap kering dan bersih.';
      } else if (name.contains('ringworm')) {
        return 'Gunakan krim antijamur seperti ketoconazole. Cuci tangan setelah menyentuh area infeksi.';
      }
    }
    return 'Tidak ada saran khusus ditemukan untuk deteksi ini.';
  }
}
