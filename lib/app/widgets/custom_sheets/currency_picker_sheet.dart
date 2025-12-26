// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:world_wallet/app/config/app_colors.dart';
// import 'package:world_wallet/app/config/app_text_style.dart';
// import 'package:world_wallet/app/custom_widgets/sizedbox_extension.dart';
// import 'package:world_wallet/app/mvvm/model/home/balances_model/balances_data_model.dart';

// class CurrencyPickerSheet extends StatelessWidget {
//   final List<BalanceCurrency> currencies;
//   final BalanceCurrency selectedCurrency;
//   final Function(BalanceCurrency) onCurrencySelected;

//   const CurrencyPickerSheet({
//     super.key,
//     required this.currencies,
//     required this.selectedCurrency,
//     required this.onCurrencySelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: false,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           12.h.height,

//           // Drag Handle
//           Container(
//             width: 48.w,
//             height: 6.h,
//             decoration: BoxDecoration(
//               color: Color(0xffE6E6E6),
//               borderRadius: BorderRadius.circular(2.r),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(right: 8.0),
//             child: Align(
//               alignment: Alignment.topRight,
//               child: InkWell(
//                 onTap: () {
//                   Get.back();
//                 },
//                 child: Container(
//                   padding: EdgeInsets.all(8.sp),
//                   decoration: BoxDecoration(
//                     color: Color(0xffE6E6E6),
//                     borderRadius: BorderRadius.circular(50.r),
//                   ),
//                   child: Icon(
//                     Icons.close,
//                     color: Color(0xff848484),
//                     size: 16.sp,
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           20.h.height,

//           // Title
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20.w),
//             child: Text(
//               'Select Currency',
//               style: AppTextStyles.customText(
//                 color: Colors.black,
//                 fontSize: 20.sp,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),

//           20.h.height,

//           // Currency List
//           ListView.separated(
//             shrinkWrap: true,
//             physics: const NeverScrollableScrollPhysics(),
//             padding: EdgeInsets.symmetric(horizontal: 20.w),
//             itemCount: currencies.length,
//             separatorBuilder: (context, index) => 12.h.height,
//             itemBuilder: (context, index) {
//               final currency = currencies[index];
//               final isSelected =
//                   currency.currencyCode == selectedCurrency.currencyCode;

//               return GestureDetector(
//                 onTap: () {
//                   onCurrencySelected(currency);
//                   Navigator.pop(context);
//                 },
//                 child: Container(
//                   padding: EdgeInsets.all(16.w),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16.r),
//                     border: Border.all(color: AppColors.grey, width: 1),
//                   ),
//                   child: Row(
//                     children: [
//                       // Flag
//                       // Container(
//                       //   width: 50.w,
//                       //   height: 40.h,
//                       //   decoration: BoxDecoration(
//                       //     borderRadius: BorderRadius.circular(8.r),
//                       //     // image:
//                       //     // DecorationImage(
//                       //     //   image: AssetImage(currency.currencyFlag),
//                       //     //   fit: BoxFit.cover,
//                       //     // ),
//                       //   ),
//                       Container(
//                         width: 50.w,
//                         height: 40.w,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10.r),
//                         ),
//                         child: CachedNetworkImage(
//                           imageUrl: currency.currencyFlag,
//                           fit: BoxFit.cover,
//                           placeholder: (context, url) => Icon(Icons.flag),
//                           errorWidget: (context, url, error) =>
//                               Icon(Icons.flag),
//                         ),
//                       ),

//                       16.w.width,

//                       // Currency Info
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               currency.currencyCode,
//                               style: AppTextStyles.customText(
//                                 color: Colors.black,
//                                 fontSize: 18.sp,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             4.h.height,
//                             Text(
//                               currency.currencyCountry,
//                               style: AppTextStyles.customText(
//                                 color: Colors.black,
//                                 fontSize: 13.sp,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),

//                       // Selected Indicator
//                       if (isSelected)
//                         Icon(
//                           Icons.check_circle,
//                           color: AppColors.primary,
//                           size: 24.sp,
//                         ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),

//           30.h.height,
//         ],
//       ),
//     );
//   }
// }
