import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wareef/src/config/Colors/colors.dart';
import 'package:wareef/src/config/localization/app_localizations_delegates.dart';
import 'package:wareef/src/core/utils/custom_snackbar.dart';
import 'package:wareef/src/services/image_picker_service.dart';
import 'package:wareef/src/widgets/custom_circle_avatar.dart';

import '../../../../wareef_icons.dart';

class ProfilePicturePicker extends StatefulWidget {
  const ProfilePicturePicker({Key? key}) : super(key: key);

  @override
  _ProfilePicturePickerState createState() => _ProfilePicturePickerState();
}

class _ProfilePicturePickerState extends State<ProfilePicturePicker> {
  final ImagePickerService _picker = ImagePickerService();
  // ignore: unused_field
  bool _uploadingProfilePicture = false;
  String profilePicture = "assets/imgs/avatar.png";

  void changeProfilePicture() {
    _showPicker(context).then((image) async {
      if (image != null) {
        setState(() {
          _uploadingProfilePicture = true;
          profilePicture = image.path;
        });
        // context.read<EditprofilepictureBloc>().add(ChangeProfilePicture(image));
      } else {
        Snackbar().showErrorSnackBar(context, "لم تقم بإختار صورة");
        setState(() {
          _uploadingProfilePicture = false;
        });
      }
    });
  }

  Future<File> _imgFromCamera() async {
    final File? image = await _picker.imgFromCamera();
    return image!;
  }

  Future<File> _imgFromGallery() async {
    final File? image = await _picker.imgFromGallery();
    return image!;
  }

  Future<File?> _showPicker(BuildContext context) {
    return showModalBottomSheet<File>(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: SizedBox(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: const Icon(Icons.photo_library),
                      title: Text(AppLocalizations.of(context)!
                          .translate("registrationScreen", "photo_gallery")!),
                      onTap: () async {
                        final File? image = await _imgFromGallery();
                        if (!mounted) return;
                        Navigator.pop(context, image);
                      }),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: Text(AppLocalizations.of(context)!
                        .translate("registrationScreen", "camera")!),
                    onTap: () async {
                      final File? image = await _imgFromCamera();
                      if (!mounted) return;
                      Navigator.pop(context, image);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        CustomCircleAvatar(
          image: profilePicture,
          height: 120,
          width: 120,
        ),
        Positioned(
          bottom: -5,
          right: -80,
          left: 0,
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () => changeProfilePicture(),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.kDarkGreyColor,
              ),
              height: 40,
              width: 40,
              child: Icon(
                WareefIcons.camera,
                size: 15,
                color: _theme.scaffoldBackgroundColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
