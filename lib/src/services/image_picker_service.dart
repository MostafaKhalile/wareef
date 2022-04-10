import 'dart:async';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<File?> imgFromCamera() async {
    final XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    final File? pickedImage = File(image!.path);
    return pickedImage;
  }

  Future<File?> imgFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    final File? pickedImage = File(image!.path);
    return pickedImage;
  }
}
