import 'package:get/get.dart';
import 'package:safewallet/app/mvvm/view/auth_views/forgot_password_view/forgot_password_view.dart';
import 'package:safewallet/app/mvvm/view/auth_views/login_view/login_view.dart';
import 'package:safewallet/app/mvvm/view/auth_views/setup_wallet_view/setup_wallet_view.dart';
import 'package:safewallet/app/mvvm/view/auth_views/signup_view/sign_up_view.dart';
import 'package:safewallet/app/mvvm/view/auth_views/signup_view/verification_view.dart';
import 'package:safewallet/app/mvvm/view/auth_views/signup_view/verification_views/bio_metric_verification_view.dart';
import 'package:safewallet/app/mvvm/view/auth_views/signup_view/verification_views/done_verification.view.dart';
import 'package:safewallet/app/mvvm/view/auth_views/signup_view/verification_views/id_card_verification_view.dart';
import 'package:safewallet/app/mvvm/view/auth_views/signup_view/verification_views/selfie_verification_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/recovery_phase_view/recovery_phase_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/regulatory_identity_view/buy_asset_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/regulatory_identity_view/regulatory_identity_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/setting_views/currency_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/wallet_view/wallet_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/bar_views/tools_views/snipper_tool_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/bar_views/tools_views/sol_tool_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/bar_views/tools_views/volume_tool_view.dart';
import 'package:safewallet/app/mvvm/view/get_started_view/get_started_view.dart';
import 'package:safewallet/app/mvvm/view/splash_view/splash_view.dart';
import 'package:safewallet/app/mvvm/view_model/auth_controller/forgot_password_controller/forgot_password_controller.dart';
import 'package:safewallet/app/mvvm/view_model/auth_controller/login_controller/login_controller.dart';
import 'package:safewallet/app/mvvm/view_model/auth_controller/sign_up_controller/sign_up_controller.dart';
import 'package:safewallet/app/mvvm/view_model/auth_controller/sign_up_controller/verification_controllers/biometric_verification_controller.dart';
import 'package:safewallet/app/mvvm/view_model/auth_controller/sign_up_controller/verification_controllers/done_verification_controller.dart';
import 'package:safewallet/app/mvvm/view_model/auth_controller/sign_up_controller/verification_controllers/id_card_verfication_controller.dart';
import 'package:safewallet/app/mvvm/view_model/auth_controller/sign_up_controller/verification_controllers/selfie_verification_controller.dart';
import 'package:safewallet/app/mvvm/view_model/profile_controllers/profile_controller.dart';
import 'package:safewallet/app/mvvm/view_model/splash_controller/splash_controller.dart';

import '../mvvm/view/bottom_bar_view/bottom_bar_view.dart';
import '../mvvm/view/bottom_bar_view/setting_views/support_view.dart';
import '../mvvm/view_model/bottom_bar_controller/bottom_bar_controller.dart';

/// Defines navigation routes for the LayerX app.
abstract class AppRoutes {
  AppRoutes._();

  static const String splashView = '/splashView';
  static const String getStartedView = '/getStartedView';
  static const String setupWalletView = '/setupWalletView';
  static const String loginView = '/loginView';
  static const String signUpView = '/signUpView';
  static const String forgotPasswordView = '/forgotPasswordView';
  static const String verificationView = '/verificationView';
  static const String selfieVerificationView = '/selfieVerificationView';
  static const String idCardVerificationView = '/idCardVerificationView';
  static const String biometricVerificationView = '/biometriVerificationView';
  static const String doneVerificationView = '/doneVerificationView';
  static const String bottomBarView = '/bottomBarView';
  static const String supportView = '/supportView';
  static const String currencyView = '/currencyView';
  static const String recoveryPhaseView = '/recoveryPhaseView';
  static const String walletView = '/walletView';
  static const String regulatoryIdentityView = '/regulatoryIdentityView';
  static const String buyAssetView = '/buyAssetView';
  static const String solToolView = '/solToolView';
  static const String snipperToolView = '/snipperToolView';
  static const String volumeToolView = '/volumeToolView';
}

abstract class AppPages {
  AppPages._();

  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.splashView,
      page: () => SplashView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SplashController>(() => SplashController());
        Get.lazyPut<ProfileController>(() => ProfileController());
      }),
    ),
    GetPage(
      name: AppRoutes.getStartedView,
      page: () => GetStartedView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<SplashController>(() => SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.setupWalletView,
      page: () => SetupWalletView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<SplashController>(() => SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.loginView,
      page: () => LoginView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LoginController>(() => LoginController());
      }),
    ),
    GetPage(
      name: AppRoutes.signUpView,
      page: () => SignUpView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SignUpController>(() => SignUpController());
      }),
    ),
    GetPage(
      name: AppRoutes.forgotPasswordView,
      page: () => ForgotPasswordView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
      }),
    ),
    GetPage(
      name: AppRoutes.verificationView,
      page: () => VerificationView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
      }),
    ),
    GetPage(
      name: AppRoutes.selfieVerificationView,
      page: () => SelfieVerificationView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SelfieVerificationController>(
          () => SelfieVerificationController(),
        );
      }),
    ),
    GetPage(
      name: AppRoutes.idCardVerificationView,
      page: () => IDCardVerificationView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<IDCardVerificationController>(
          () => IDCardVerificationController(),
        );
      }),
    ),
    GetPage(
      name: AppRoutes.biometricVerificationView,
      page: () => BioMetricVerificationView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<BiometricVerificationController>(
          () => BiometricVerificationController(),
        );
      }),
    ),
    GetPage(
      name: AppRoutes.doneVerificationView,
      page: () => DoneVerificationView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<DoneVerificationController>(
          () => DoneVerificationController(),
        );
      }),
    ),
    GetPage(
      name: AppRoutes.bottomBarView,
      page: () => BottomBarView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<BottomBarController>(() => BottomBarController());
        Get.lazyPut<ProfileController>(() => ProfileController());
      }),
    ),
    GetPage(
      name: AppRoutes.supportView,
      page: () => SupportView(),
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: AppRoutes.currencyView,
      page: () => CurrencyView(),
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: AppRoutes.recoveryPhaseView,
      page: () => RecoveryPhaseView(),
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: AppRoutes.walletView,
      page: () => WalletView(),
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: AppRoutes.regulatoryIdentityView,
      page: () => RegulatoryIdentityView(),
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: AppRoutes.buyAssetView,
      page: () => BuyAssetView(),
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: AppRoutes.solToolView,
      page: () => SolToolView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<BottomBarController>(() => BottomBarController());
      }),
    ),
    GetPage(
      name: AppRoutes.snipperToolView,
      page: () => SnipperToolView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<BottomBarController>(() => BottomBarController());
      }),
    ),
    GetPage(
      name: AppRoutes.volumeToolView,
      page: () => VolumeToolView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<BottomBarController>(() => BottomBarController());
      }),
    ),
    // GetPage(
    //   name: AppRoutes.currencyDisplayView,
    //   page: () => CurrencyDisplayView(),
    //   binding: BindingsBuilder(() {
    //     // Get.lazyPut<SignupController>(() => SignupController());
    //   }),
    // ),
    // GetPage(
    //   name: AppRoutes.accountSettingView,
    //   page: () => AccountSettingView(),
    //   binding: BindingsBuilder(() {
    //     // Get.lazyPut<ProfileController>(() => ProfileController());
    //   }),
    // ),
    // GetPage(
    //   name: AppRoutes.aboutUsView,
    //   page: () => AboutView(),
    //   binding: BindingsBuilder(() {
    //     // Get.lazyPut<SignupController>(() => SignupController());
    //   }),
    // ),
    // GetPage(
    //   name: AppRoutes.privacyPolicyView,
    //   page: () => PrivacyView(),
    //   binding: BindingsBuilder(() {
    //     // Get.lazyPut<SignupController>(() => SignupController());
    //   }),
    // ),
    // GetPage(
    //   name: AppRoutes.giveFeedbackView,
    //   page: () => FeedbackView(),
    //   binding: BindingsBuilder(() {
    //     Get.lazyPut<FeedbackController>(() => FeedbackController());
    //   }),
    // ),
    // GetPage(
    //   name: AppRoutes.contactSupportView,
    //   page: () => ContactSupportView(),
    //   binding: BindingsBuilder(() {
    //     // Get.lazyPut<SignupController>(() => SignupController());
    //   }),
    // ),
    // GetPage(
    //   name: AppRoutes.helpCenterView,
    //   page: () => HelpCenterView(),
    //   binding: BindingsBuilder(() {
    //     Get.lazyPut<HelpCenterController>(() => HelpCenterController());
    //   }),
    // ),
    // GetPage(
    //   name: AppRoutes.deleteAccountView,
    //   page: () => DeleteAccountView(),
    //   binding: BindingsBuilder(() {
    //     Get.lazyPut<DeleteAccountController>(() => DeleteAccountController());
    //   }),
    // ),
    // GetPage(
    //   name: AppRoutes.viewRateDisplay,
    //   page: () => ViewRateDisplay(),
    //   binding: BindingsBuilder(() {
    //     Get.lazyPut<ExchangeController>(() => ExchangeController());
    //   }),
    // ),
    // GetPage(
    //   name: AppRoutes.bottomBarView,
    //   page: () => BottomBarView(),
    //   binding: BindingsBuilder(() {
    //     Get.lazyPut<BottomBarController>(() => BottomBarController());
    //     Get.lazyPut<HomeController>(() => HomeController());
    //     Get.lazyPut<ExchangeController>(() => ExchangeController());
    //     // Get.lazyPut<PortfolioController>(() => PortfolioController());
    //     Get.lazyPut<ProfileController>(() => ProfileController());
    //   }),
    // ),

    // GetPage(
    //   name: AppRoutes.garageMaintenanceRecordView,
    //   page: () => ImageViewerScreen(),
    // ),
  ];
}
