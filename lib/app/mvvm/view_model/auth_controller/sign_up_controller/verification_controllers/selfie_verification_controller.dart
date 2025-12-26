import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class SelfieVerificationController extends GetxController {
  CameraController? cameraController;

  /// Reactive states
  final RxBool isCameraReady = false.obs;
  final RxBool isPermissionGranted = false.obs;
  final RxBool isLoading = true.obs;

  /// Entry point: Handles permission check and initializes camera if granted.
  Future<void> handleCameraPermission() async {
    isLoading.value = true;

    final PermissionStatus status = await Permission.camera.status;

    if (status.isGranted) {
      isPermissionGranted.value = true;
      await _initializeCamera();
    } else if (status.isDenied || status.isRestricted) {
      _showPermissionRequestDialog();
    } else if (status.isPermanentlyDenied) {
      _showPermissionBlockedDialog();
    }

    isLoading.value = false;
  }

  /// Requests camera permission explicitly when user clicks "Allow"
  Future<void> requestPermission() async {
    final PermissionStatus result = await Permission.camera.request();

    if (result.isGranted) {
      isPermissionGranted.value = true;
      await _initializeCamera();
    } else if (result.isPermanentlyDenied) {
      _showPermissionBlockedDialog();
    }
  }

  /// Initialize the front camera safely
  Future<void> _initializeCamera() async {
    try {
      final List<CameraDescription> cameras = await availableCameras();
      final CameraDescription frontCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
      );

      cameraController = CameraController(
        frontCamera,
        ResolutionPreset.medium,
        enableAudio: false,
      );

      await cameraController!.initialize();
      isCameraReady.value = true;
    } catch (error) {
      debugPrint('Camera initialization failed: $error');
    }
  }

  /// Dialog shown when permission is denied but not permanently
  void _showPermissionRequestDialog() {
    Get.defaultDialog(
      title: 'Camera Permission Required',
      middleText:
          'Camera access is required to complete the selfie verification process.',
      confirm: TextButton(
        onPressed: () {
          Get.back();
          requestPermission();
        },
        child: const Text('Allow'),
      ),
      cancel: TextButton(
        onPressed: () {
          Get.back();
          Get.back(); // Navigate back to previous screen
        },
        child: const Text('Go Back'),
      ),
    );
  }

  /// Dialog shown when permission is permanently denied
  void _showPermissionBlockedDialog() {
    Get.defaultDialog(
      title: 'Permission Blocked',
      middleText:
          'Camera access has been permanently denied. Please enable it from the app settings to continue.',
      confirm: TextButton(
        onPressed: () => openAppSettings(),
        child: const Text('Open Settings'),
      ),
      cancel: TextButton(
        onPressed: () {
          Get.back();
          Get.back(); // Navigate back to previous screen
        },
        child: const Text('Go Back'),
      ),
    );
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }
}
