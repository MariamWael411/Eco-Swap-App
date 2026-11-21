import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:eco_swap_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageService {
  final ImagePicker _picker = ImagePicker();

  /// Pick from gallery. Returns null if cancelled or permission denied.
  Future<File?> pickFromGallery(BuildContext context) async {
    final status = await _requestGallery();
    if (!context.mounted) return null;
    if (!_isAllowed(status)) {
      _handleDenied(context, status);
      return null;
    }
    return _pick(ImageSource.gallery);
  }

  /// Pick from camera. Returns null if cancelled or permission denied.
  Future<File?> pickFromCamera(BuildContext context) async {
    final status = await Permission.camera.request();
    if (!context.mounted) return null;
    if (!_isAllowed(status)) {
      _handleDenied(context, status);
      return null;
    }
    return _pick(ImageSource.camera);
  }

  Future<File?> _pick(ImageSource source) async {
    final XFile? file = await _picker.pickImage(
      source: source,
      imageQuality: 80,
      maxWidth: 1080,
    );
    return file == null ? null : File(file.path);
  }

  Future<PermissionStatus> _requestGallery() async {
    if (Platform.isAndroid) {
      final sdkInt = (await DeviceInfoPlugin().androidInfo).version.sdkInt;
      if (sdkInt >= 33) return Permission.photos.request();
      return Permission.storage.request();
    }
    return Permission.photos.request();
  }

  bool _isAllowed(PermissionStatus s) => s.isGranted || s.isLimited;

  void _handleDenied(BuildContext context, PermissionStatus status) {
    if (status.isPermanentlyDenied) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Permission required'),
          content: const Text(
            'Please enable the permission from app settings.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                openAppSettings();
              },
              child: const Text('Open Settings'),
            ),
          ],
        ),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Permission denied')));
    }
  }

  /// Shows a bottom sheet to choose Gallery or Camera, then opens the chosen one.
  Future<File?> pickImage(BuildContext context) async {
    var theme = Theme.of(context);
    var language = AppLocalizations.of(context)!;
    final source = await showModalBottomSheet<ImageSource>(
      backgroundColor: theme.colorScheme.inverseSurface,
      context: context,
      builder: (_) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(
                  Icons.photo_library,
                  color: theme.colorScheme.primary,
                ),
                title: Text(
                  language.gallery,
                  style: theme.textTheme.headlineMedium,
                ),
                onTap: () => Navigator.pop(context, ImageSource.gallery),
              ),
              Divider(color: theme.colorScheme.primary),
              ListTile(
                leading: Icon(
                  Icons.photo_camera,
                  color: theme.colorScheme.primary,
                ),
                title: Text(
                  language.camera,
                  style: theme.textTheme.headlineMedium,
                ),
                onTap: () => Navigator.pop(context, ImageSource.camera),
              ),
            ],
          ),
        );
      },
    );

    if (source == null || !context.mounted)
      return null; // المستخدم قفل الـ sheet

    return source == ImageSource.gallery
        ? pickFromGallery(context)
        : pickFromCamera(context);
  }
}
