// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:world_wallet/app/config/app_colors.dart';
// import 'package:world_wallet/app/config/app_text_style.dart';
// import 'package:world_wallet/app/custom_widgets/app_custom_button.dart';
// import 'package:world_wallet/app/custom_widgets/loader_show_hide_handle.dart';
// import 'package:world_wallet/app/custom_widgets/sizedbox_extension.dart';
// import 'package:world_wallet/app/mvvm/view_model/exchange_controller.dart';
// import 'package:world_wallet/app/services/global_variables.dart';

// import '../custom_snackbar/custom_snackbar.dart';

// class ExchangeRateSheet extends StatelessWidget {
//   const ExchangeRateSheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ExchangeController controller = Get.find();
//     return SafeArea(
//       top: false,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Drag handle
//           Center(
//             child: Container(
//               width: 48.w,
//               height: 6.h,
//               decoration: BoxDecoration(
//                 color: Color(0xffE6E6E6),
//                 borderRadius: BorderRadius.circular(10.r),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.topRight,
//             child: InkWell(
//               onTap: () {
//                 Get.back();
//               },
//               child: Container(
//                 padding: EdgeInsets.all(8.sp),
//                 decoration: BoxDecoration(
//                   color: Color(0xffE6E6E6),
//                   borderRadius: BorderRadius.circular(50.r),
//                 ),
//                 child: Icon(Icons.close, color: Color(0xff848484), size: 16.sp),
//               ),
//             ),
//           ),

//           30.h.height,

//           // Title
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Current Exchange Rate',
//                 style: AppTextStyles.customText(
//                   color: Colors.black,
//                   fontSize: 24.sp,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               4.h.height,

//               // Subtitle
//               Text(
//                 'Based on live market data (sandbox mode)',
//                 style: AppTextStyles.customText(
//                   color: Colors.black,
//                   fontSize: 14.sp,
//                   fontWeight: FontWeight.w400,
//                 ),
//               ),
//             ],
//           ),

//           32.h.height,

//           // Rate Card
//           Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(28.w),
//                 decoration: BoxDecoration(
//                   color: const Color(0x12FFFFFF),
//                   borderRadius: BorderRadius.circular(24.r),
//                   border: Border.all(color: Color(0xffF4F4F4), width: 1),
//                 ),
//                 child: Column(
//                   children: [
//                     // Main Rate
//                     Obx(
//                       () => Text(
//                         controller.rateText.value,
//                         style: AppTextStyles.customText(
//                           color: Colors.black,
//                           fontSize: 30.sp,
//                           fontWeight: FontWeight.w600,
//                           letterSpacing: -0.5,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),

//                     20.h.height,

//                     // Trend
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.keyboard_arrow_up,
//                           color: AppColors.primary,
//                           size: 20.w,
//                         ),
//                         8.w.width,
//                         Obx(
//                           () => Text(
//                             controller.changeText.value,
//                             style: AppTextStyles.customText(
//                               color: AppColors.primary,
//                               fontSize: 16.sp,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )
//               .animate()
//               .fadeIn(duration: 600.ms, delay: 200.ms)
//               .slideY(begin: 0.15, end: 0, delay: 200.ms)
//               .shimmer(
//                 duration: 2000.ms,
//                 delay: 800.ms,
//                 color: AppColors.primary.withOpacity(0.08),
//               ),

//           40.h.height,

//           // Confirm Button — Using your exact AppCustomButton
//           AppCustomButton(
//                 title: 'Confirm Conversion',
//                 borderRadius: 12.r,
//                 onPressed: () async {
//                   try {
//                     GetLoader.showAppLoader();
//                     bool result = await controller.convertCurrencyMethod();

//                     GetLoader.hideAppLoader();

//                     if (result == true) {
//                       Get.back();
//                       GlobalVariables.errorMessages.showSuccess();
//                     } else {
//                       GlobalVariables.errorMessages.showError();

//                     }
//                   } catch (e) {
//                     GlobalVariables.errorMessages.showError();

//                   } finally {}
//                 },
//                 bgColor: AppColors.primary,
//               )
//               .paddingSymmetric(horizontal: 30.w)
//               .animate()
//               .fadeIn(duration: 600.ms, delay: 600.ms)
//               .slideY(begin: 0.2, end: 0, delay: 600.ms)
//               .scale(
//                 begin: const Offset(0.95, 0.95),
//                 end: const Offset(1, 1),
//                 curve: Curves.easeOutBack,
//                 delay: 600.ms,
//               ),

//           20.h.height,
//         ],
//       ).paddingAll(20.sp),
//     );
//   }
// }
