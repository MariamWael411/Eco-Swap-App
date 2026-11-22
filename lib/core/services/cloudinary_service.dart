import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class CloudinaryService {
  static const String cloudName = 'bauhdfc2';
  static const String uploadPreset = 'eco_swap_images';

  Future<String> uploadImage(File image) async {
    final url = Uri.parse(
      'https://api.cloudinary.com/v1_1/$cloudName/image/upload',
    );

    final request = http.MultipartRequest('POST', url);

    request.fields['upload_preset'] = uploadPreset;

    request.files.add(await http.MultipartFile.fromPath('file', image.path));

    final response = await request.send();

    final responseData = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final data = jsonDecode(responseData);

      return data['secure_url'];
    } else {
      throw Exception('Image upload failed: $responseData');
    }
  }
}
