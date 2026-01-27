import 'package:get/get.dart';
import 'package:safewallet/app/mvvm/view/auth_views/forgot_password_view/forgot_password_view.dart';
import 'package:safewallet/app/mvvm/view/auth_views/language_screen.dart/language_view.dart';
import 'package:safewallet/app/mvvm/view/auth_views/login_view/login_view.dart';
import 'package:safewallet/app/mvvm/view/auth_views/onboarding_view/onboarding_view.dart';
import 'package:safewallet/app/mvvm/view/auth_views/setup_wallet_view/setup_wallet_view.dart';
import 'package:safewallet/app/mvvm/view/auth_views/signup_view/sign_up_view.dart';
import 'package:safewallet/app/mvvm/view/auth_views/signup_view/verification_view.dart';
import 'package:safewallet/app/mvvm/view/auth_views/signup_view/verification_views/bio_metric_verification_view.dart';
import 'package:safewallet/app/mvvm/view/auth_views/signup_view/verification_views/done_verification.view.dart';
import 'package:safewallet/app/mvvm/view/auth_views/signup_view/verification_views/id_card_verification_view.dart';
import 'package:safewallet/app/mvvm/view/auth_views/signup_view/verification_views/selfie_verification_view.dart';
import 'package:safewallet/app/mvvm/view/auth_views/verificaion_steps_view/complete_verfication_view.dart';
import 'package:safewallet/app/mvvm/view/auth_views/verificaion_steps_view/verificaion_steps_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/bar_views/all_activity_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/bar_views/auto_lock_time_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/bar_views/change_pin_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/bar_views/privacy_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/bar_views/tools_views/about_us_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/bar_views/tools_views/snipper_tool_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/bar_views/tools_views/sol_tool_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/bar_views/tools_views/terms_service_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/bar_views/tools_views/volume_tool_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/initiate_transfer/initiate_transfer.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/recovery_phase_view/recovery_phase_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/regulatory_identity_view/buy_asset_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/regulatory_identity_view/regulatory_identity_view.dart';
import 'package:safewallet/app/mvvm/view/bottom_bar_view/setting_views/currency_view.dart';
import 'package:safewallet/app/mvvm/view/get_started_view/get_started_view.dart';
import 'package:safewallet/app/mvvm/view/splash_view/splash_view.dart';
import 'package:safewallet/app/mvvm/view_model/auth_controller/forgot_password_controller/forgot_password_controller.dart';
import 'package:safewallet/app/mvvm/view_model/auth_controller/login_controller/login_controller.dart';
import 'package:safewallet/app/mvvm/view_model/auth_controller/sign_up_controller/sign_up_controller.dart';
import 'package:safewallet/app/mvvm/view_model/auth_controller/sign_up_controller/verification_controllers/biometric_verification_controller.dart';
import 'package:safewallet/app/mvvm/view_model/auth_controller/sign_up_controller/verification_controllers/done_verification_controller.dart';
import 'package:safewallet/app/mvvm/view_model/auth_controller/sign_up_controller/verification_controllers/id_card_verfication_controller.dart';
import 'package:safewallet/app/mvvm/view_model/auth_controller/sign_up_controller/verification_controllers/selfie_verification_controller.dart';
import 'package:safewallet/app/mvvm/view_model/auto_lock_time/auto_lock_time_controller.dart';
import 'package:safewallet/app/mvvm/view_model/change_pin_controller/change_pin_controller.dart';
import 'package:safewallet/app/mvvm/view_model/language_controller/language_controlller.dart';
import 'package:safewallet/app/mvvm/view_model/profile_controllers/profile_controller.dart';
import 'package:safewallet/app/mvvm/view_model/splash_controller/splash_controller.dart';
import 'package:safewallet/app/mvvm/view_model/tools_controller/snipper_tool_controller.dart';

import '../mvvm/view/bottom_bar_view/bottom_bar_view.dart';
import '../mvvm/view/bottom_bar_view/setting_views/support_view.dart';
import '../mvvm/view_model/bottom_bar_controller/bottom_bar_controller.dart';
import '../mvvm/view_model/phrase_controller/phrase_controller.dart';

/// Defines navigation routes for the LayerX app.
abstract class AppRoutes {
  AppRoutes._();

  static const String splashView = '/splashView';
  static const String onboardingView = '/onboardingView';
  static const String languageView = '/languageView';
  static const String getStartedView = '/getStartedView';
  static const String verificationStepsView = '/verificationStepsView';
  static const String completeVerificationView = '/completeVerificationView';
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
  static const String allActivityView = '/allActivityView';
  static const String supportView = '/supportView';
  static const String currencyView = '/currencyView';
  static const String recoveryPhaseView = '/recoveryPhaseView';
  static const String initiateTransfer = '/initiateTransfer';
  static const String regulatoryIdentityView = '/regulatoryIdentityView';
  static const String buyAssetView = '/buyAssetView';
  static const String solToolView = '/solToolView';
  static const String snipperToolView = '/snipperToolView';
  static const String volumeToolView = '/volumeToolView';
  static const String autoLockTimeView = '/autoLocTimeView';
  static const String aboutusView = '/aboutusView';
  static const String privacyView = '/privacyView';
  static const String termServiceView = '/termServiceView';
  static const String changePinView = '/changePinView';
}

abstract class AppPages {
  AppPages._();

  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.splashView,
      page: () => SplashView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<SplashController>(() => SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.onboardingView,
      page: () => OnboardingView(),
      binding: BindingsBuilder(() {}),
    ),
    GetPage(
      name: AppRoutes.languageView,
      page: () => LanguageView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<LanguageControlller>(() => LanguageControlller());
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
      name: AppRoutes.verificationStepsView,
      page: () => VerificationStepsView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<SplashController>(() => SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.completeVerificationView,
      page: () => ComleteVerificationView(),
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
      name: AppRoutes.allActivityView,
      page: () => AllActivityView(),
      binding: BindingsBuilder(() {}),
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
      binding: BindingsBuilder(() {
        Get.lazyPut<PhraseController>(() => PhraseController());
      }),
    ),
    GetPage(
      name: AppRoutes.initiateTransfer,
      page: () => InitiateTransfer(),
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
        Get.lazyPut<SnipperToolController>(() => SnipperToolController());
      }),
    ),
    GetPage(
      name: AppRoutes.volumeToolView,
      page: () => VolumeToolView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<BottomBarController>(() => BottomBarController());
      }),
    ),
    GetPage(
      name: AppRoutes.autoLockTimeView,
      page: () => AutoLockTimeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<AutoLockController>(() => AutoLockController());
      }),
    ),
    GetPage(
      name: AppRoutes.aboutusView,
      page: () => AboutUsView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<LanguageControlller>(() => LanguageControlller());
      }),
    ),
    GetPage(
      name: AppRoutes.privacyView,
      page: () => PrivacyView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<LanguageControlller>(() => LanguageControlller());
      }),
    ),
    GetPage(
      name: AppRoutes.termServiceView,
      page: () => TermServiceView(),
      binding: BindingsBuilder(() {
        // Get.lazyPut<LanguageControlller>(() => LanguageControlller());
      }),
    ),
    GetPage(
      name: AppRoutes.changePinView,
      page: () => ChangePinView(),
      binding: BindingsBuilder(() {
        Get.lazyPut<ChangePinController>(() => ChangePinController());
      }),
    ),
  ];
}
