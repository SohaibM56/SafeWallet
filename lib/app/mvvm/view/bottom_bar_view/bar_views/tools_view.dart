import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/app_routes.dart';
import 'package:safewallet/app/config/app_text_style.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

import '../../../../config/app_assets.dart';
import '../../../view_model/profile_controllers/profile_controller.dart';

class ToolsView extends StatefulWidget {
  const ToolsView({super.key});

  @override
  State<ToolsView> createState() => _ToolsViewState();
}

class _ToolsViewState extends State<ToolsView> {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            26.h.height,

            Text(
                  "Tools",
                  style: AppTextStyles.customText28(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                )
                .animate()
                .fadeIn(duration: 600.ms, delay: 100.ms)
                .slideY(begin: -0.2, curve: Curves.easeOut),

            8.h.height,

            /// Subtitle
            Text(
                  "Solana utilities for power users",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.customText(
                    fontSize: 15,
                    color: Colors.white.withValues(alpha: 0.7),
                    fontWeight: FontWeight.w400,
                  ),
                )
                .animate()
                .fadeIn(duration: 600.ms, delay: 200.ms)
                .slideY(begin: -0.1, curve: Curves.easeOut),
            10.h.height,
            _toolCardWidget(
                  onTap: () {
                    Get.toNamed(AppRoutes.solToolView);
                  },
                  toolImg: AppAssets.solIcon,
                  toolTitle: "SOL Multisender",
                  toolSubtitle: "Send SOL to multiple wallets at once",
                )
                .animate()
                .fadeIn(duration: 600.ms, delay: 200.ms)
                .slideY(begin: 0.3, curve: Curves.easeOutCubic),
            _toolCardWidget(
                  onTap: () {
                    Get.toNamed(AppRoutes.snipperToolView);
                  },
                  toolImg: AppAssets.snipperIcon,
                  toolTitle: "Sniper Tool",
                  toolSubtitle: "Auto-buy tokens on launch or price tngger",
                )
                .animate()
                .fadeIn(duration: 600.ms, delay: 250.ms)
                .slideY(begin: 0.3, curve: Curves.easeOutCubic),
            _toolCardWidget(
                  onTap: () {
                    Get.toNamed(AppRoutes.volumeToolView);
                  },
                  toolImg: AppAssets.volumeIcon,
                  toolTitle: "Volume Booster",
                  toolSubtitle: "Simulate trading volume for tokens",
                )
                .animate()
                .fadeIn(duration: 600.ms, delay: 300.ms)
                .slideY(begin: 0.3, curve: Curves.easeOutCubic),

            30.h.height,

            /// Subtitle
            Text(
                  "All tools operate on Solana Devnet\n(Test Environment)",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.customText(
                    fontSize: 15,
                    color: Colors.white.withValues(alpha: 0.5),
                    fontWeight: FontWeight.w400,
                  ),
                )
                .animate()
                .fadeIn(duration: 600.ms, delay: 200.ms)
                .slideY(begin: -0.1, curve: Curves.easeOut),

            20.h.height,
          ],
        ).paddingHorizontal(20.w),
      ),
    );
  }

  Widget _toolCardWidget({
    required VoidCallback onTap,
    required String toolImg,
    required String toolTitle,
    required String toolSubtitle,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 20.h),
        height: 85.h,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: AppColors.darkGrey),
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          image: DecorationImage(
            image: AssetImage(AppAssets.backgroundCardImg),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Icon
              Container(
                height: 50.w,
                width: 50.w,
                decoration: BoxDecoration(
                  color: AppColors.softgreen.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: ImageIcon(
                    AssetImage(toolImg),
                    size: 25,
                    color: AppColors.white,
                  ).animate().fadeIn(duration: 600.ms, delay: 300.ms),
                ),
              ),

              12.w.width,

              /// ✅ Text Area (Expanded FIX)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      toolTitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.customText16(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ).animate().fadeIn(duration: 600.ms, delay: 400.ms),

                    4.h.height,

                    Text(
                      toolSubtitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.customText12(
                        color: Colors.white.withValues(alpha: 0.6),
                      ),
                    ).animate().fadeIn(duration: 600.ms, delay: 500.ms),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
