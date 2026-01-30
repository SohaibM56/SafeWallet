// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:safewallet/app/config/app_assets.dart';
// import 'package:safewallet/app/config/app_colors.dart';
// import 'package:safewallet/app/config/app_text_style.dart';
// import 'package:safewallet/app/widgets/app_custom_button.dart';
// import 'package:safewallet/app/widgets/sizedbox_extension.dart';

// class SecurityConfirmSheet extends StatelessWidget {
//   final String title;
//   final String description;
//   final VoidCallback onConfirm;

//   const SecurityConfirmSheet({
//     super.key,
//     required this.title,
//     required this.description,
//     required this.onConfirm,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(20.sp),
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           12.h.height,

//           Image.asset(
//                 AppAssets.fingerprintIcon, // demo icon
//                 height: 48.h,
//                 color: AppColors.primary,
//               )
//               .animate()
//               .fadeIn(duration: 600.ms)
//               .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1)),

//           20.h.height,

//           Text(
//             title,
//             style: AppTextStyles.customText18(
//               color: Colors.black,
//               fontWeight: FontWeight.w600,
//             ),
//           ),

//           8.h.height,

//           Text(
//             description,
//             textAlign: TextAlign.center,
//             style: AppTextStyles.customText12(
//               color: Colors.black.withValues(alpha: 0.6),
//             ),
//           ),

//           24.h.height,

//           AppCustomButton(
//             title: "Confirm",
//             onPressed: () {
//               Navigator.pop(context);
//               onConfirm();
//             },
//           ).animate().fadeIn(duration: 600.ms),

//           12.h.height,
//         ],
//       ),
//     );
//   }
// }
