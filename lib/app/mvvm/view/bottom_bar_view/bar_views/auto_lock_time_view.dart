import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:safewallet/app/config/app_colors.dart';
import 'package:safewallet/app/config/padding_extensions.dart';
import 'package:safewallet/app/mvvm/model/body_model/auto_lock_time_model.dart';
import 'package:safewallet/app/mvvm/view_model/auto_lock_time/auto_lock_time_controller.dart';
import 'package:safewallet/app/widgets/custom_app_bar.dart';
import 'package:safewallet/app/widgets/custom_cards/app_custom_card.dart';
import 'package:safewallet/app/widgets/sizedbox_extension.dart';

class AutoLockTimeView extends StatefulWidget {
  const AutoLockTimeView({super.key});

  @override
  State<AutoLockTimeView> createState() => _AutoLockTimeViewState();
}

class _AutoLockTimeViewState extends State<AutoLockTimeView> {
  final AutoLockController controller = Get.put(AutoLockController());
  bool isFromSettings = false;

  @override
  void initState() {
    final Map<String, dynamic> arguments = Get.arguments ?? {};
    isFromSettings = arguments['isFromSetting'] ?? false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: CustomAppBar(
        appBarType: AppBarType.custom,
        title: 'Auto Lock Time',
        addBackButton: true,
        centerTitle: true,
      ),
      body: SafeArea(
        top: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            8.h.height,
            Obx(
              () => Column(
                children: [
                  ...List.generate(controller.lockTimes.length, (index) {
                    AutoLockBodyModel? lockTime = controller.lockTimes[index];
                    return Column(
                      children: [
                        10.h.height,
                        AppCustomCard(
                          language: lockTime.timeLabel,
                          imageUrl: lockTime.imageUrl,
                          isSelected:
                              controller.selectedLockTime.value ==
                              lockTime.timeLabel,
                          onPressed: () {
                            controller.selectLockTime(lockTime.timeLabel);
                          },
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
            Spacer(),
            100.h.height,
          ],
        ).paddingHorizontal(16.h),
      ),
    );
  }
}