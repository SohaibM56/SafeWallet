import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/mvvm/view_model/auth_controller/sign_up_controller/verification_controllers/selfie_verification_controller.dart';
import 'package:safewallet/app/widgets/app_custom_button.dart';
import 'package:safewallet/app/widgets/custom_back_button.dart';
import 'package:safewallet/app/widgets/face_hole_painter.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../../../config/app_colors.dart';
import '../../../../../config/app_strings.dart';
import '../../../../../config/app_text_style.dart';

class SelfieVerificationView extends StatefulWidget {
  const SelfieVerificationView({super.key});

  @override
  State<SelfieVerificationView> createState() => _SelfieVerificationViewState();
}

class _SelfieVerificationViewState extends State<SelfieVerificationView> {
  final SelfieVerificationController controller = Get.find();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.handleCameraPermission();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBackButton()
                  .animate()
                  .fadeIn(duration: 400.ms)
                  .slideX(begin: -0.3),

              30.h.height,

              Text(
                AppStrings.selfieVerification,
                style: AppTextStyles.customText24(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),

              8.h.height,

              // /// 👇 YE container ab sari remaining space le ga
              // Expanded(
              //   child: Container(width: double.infinity, color: Colors.amber),
              // ),
              /// Camera Container (Expanded)
              Expanded(
                child: Obx(() {
                  if (controller.isLoading.value) {
                    // Loading spinner while checking permission
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!controller.isPermissionGranted.value) {
                    // Permission not granted → show info
                    return Center(
                      child: Text(
                        'Camera permission is required to continue.',
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  if (!controller.isCameraReady.value) {
                    // Camera is initializing
                    return const Center(child: CircularProgressIndicator());
                  }

                  // ✅ Camera is ready → show preview
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CameraPreview(controller.cameraController!),

                        /// 👇 DARK OVERLAY WITH FACE CUTOUT
                        CustomPaint(painter: FaceHolePainter()),
                      ],
                    ),
                  );
                  // ClipRRect(
                  //   borderRadius: BorderRadius.circular(12),
                  //   child: CameraPreview(controller.cameraController!),
                  // );
                }),
              ),

              15.h.height,

              Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.white),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.info_outline, color: AppColors.white),
                        10.w.width,
                        Expanded(
                          child: Text(
                            AppStrings.selfieVerificationAdditionalText,
                            style: AppTextStyles.customText12(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ).paddingAll(13.sp),
                  )
                  .animate()
                  .fadeIn(duration: 600.ms, delay: 300.ms)
                  .scale(
                    begin: const Offset(0.7, 0.7),
                    curve: Curves.easeOutBack,
                  ),

              30.h.height,
              AppCustomButton(
                    onPressed: () {},
                    title: AppStrings.selfieVerificationBTN,
                  )
                  .paddingSymmetric(horizontal: 20.w)
                  .animate(delay: 1000.ms)
                  .fadeIn(duration: 600.ms)
                  .scale(
                    begin: const Offset(0.95, 0.95),
                    curve: Curves.easeOutBack,
                  ),
              30.h.height,
            ],
          ),
        ).paddingSymmetric(horizontal: 24.w),
      ),
    );
  }
}
