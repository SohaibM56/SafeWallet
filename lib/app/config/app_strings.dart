/// Defines string constants for the LayerX app.
abstract class AppStrings {
  AppStrings._();

  // ==================== Splash Screen ====================
  static const String continueText = "Continue";
  static const String language = "Language";

  // ==================== Get Started Screen ====================
  static const String getStarted = 'Get Started';
  static const String getStartedText = 'Secure Non-\nCustodial Wallet';
  static const String getStartedDesc = 'Your private keys stay on your device.\nYou have full control over your Bitcoin and assets.';

  // ==================== Login Password Screen ====================
  static const String logIn = "Log In";
  static const String welcome = "Welcome";
  static const String loginText = "Login to your account to continue";
  static const String forgotPassword = "Forgot Password?";
  static const String dontHaveAccount = "Don't have an acocunt?";
  static const String emailAddress = "Email Address";
  static const String enter = "Enter";
  static const String password = "Password";
  static const String passwordPlaceholder = '***********';
  static const String recoveryPhrase = "Generate a new 12-word recovery phrase";
  static const String restoreRecoveryPhrase = "Restore using your recovery phrase";
  static const String setupWallet = "Setup Your Wallet";
  static const String setupWalletDesc = "Create a new wallet or import an existing one";
  static const String createNewWallet = "Create New Wallet";
  static const String importWallet = "Import Existing Wallet";

  // ==================== Sign Up Password Screen ====================
  static const String signUp = "Sign Up";
  static const String signUpText = "Complete the form and join Safe Wallet";
  static const String next = "Next";
  static const String signIn = "Sign In";
  static const String fullName = "Full Name";
  static const String confirmPassword = 'Confirm Password';
  static const String alreadyHaveAccount = 'Already have an account?';
  static const String phoneNumber = "Phone Number";

  // ==================== Forgot Password Screen ====================
  static const String forgotPasswordSubtitle = 'Enter your registered Email address for verification.';
  static const String send = 'Send';

  // ==================== Verification Strings ====================
  static const String indetityVerification = 'Identity Verification';
  static const String indetityVerificationText = 'Enjoy more benefits on your Account by upgrading your KYC.';

  static const String selfieVerification = 'Selfie Verification';
  static const String selfieVerificationText = 'Verify your identity by uploading a selfie on our platform';
  static const String selfieVerificationAdditionalText = 'Make sure your face is clearly visible and well-lit for accurate verification.';
  static const String selfieVerificationBTN = 'Start Verification.';
  static const String frontSide = "Front Side";
  static const String backSide = "Back Side";
  static const String idCardVerificationAdditionalText = 'Place your ID on a flat surface, then take a clear photo from above';

  static const String idCardVerification = 'ID Card Verification';
  static const String idCardVerificationText = 'Verify your National Identity number in less than 1min';
  static const String bioMetric = 'Enable Biometric';
  static const String bioMetricText = 'Protect your wallet with Face ID or fingerprint authentication';
  static const String skipNow = 'Skip For Now';
  static const String sompleteKYCTxt = "Complete KYC to unlock all features";
  static const String walletLinking = "Wallet Linking";
  static const String walletLinkingTxt = "We link your identity to your Bitcoin testnet wallet for compliance visibility (UI only).";
  static const String walletAddress = "Your Wallet Address";
  static const String walletGenerated = "Wallet generated successfully";
  static const String nonKeys = "Non-custodial keys secured";
  static const String confirLinkWallet = "Confirm & Link Wallet";

  // ==================== Bottom Nav Bar ====================
  static const String home = 'Home';
  static const String booking = 'Booking';
  static const String favorites = 'Favorites';
  static const String profile = 'Profile';

  // Profile Screen
  static const String myProfile = 'My Profile';
  static const String pending = 'Pending';
  static const String confirmed = 'Confirmed';
  static const String completed = 'Completed';
  static const String personalInformation = 'Personal Information';
  static const String personalInfo = 'Personal Info';
  static const String pushNotifications = 'Push Notifications';
  static const String termsOfService = 'Terms of Service';
  static const String signOut = 'Sign out';
  static const String deleteAccount = 'Delete account';
  static const String cancel = 'Cancel';
  static const String logoutBtnText = 'Log Out';
  static const String logoutTitle = 'Logout';
  static const String notAvailable = 'N/A';
  static const String tuesdayApril29 = 'Tuesday, April 29';
  static const String time1000 = '10:00';
  static const String paradiseRoad = 'Paradise Rd, Las Vegas';
  static const String theStyleLounge = 'The Style Lounge';
  static const String theHairLoft = 'The Hair Loft';
  static const String deleteBtnText = 'Delete';
  static const String enterPasswordHere = 'Enter Password Here';
  static const String deleteAccountMessage = 'Your account will be permanently deleted. You\nno longer can access it.';
  static const String deleteAccountMessageDialog = 'Are you sure you want to delete\nthis account?';

  // ==================== Validation Messages ====================
  static const String emailRequired = 'Email is required';
  static const String enterValidEmail = 'Enter a valid email address';
  static const String invalidEmail = 'Enter a valid email address';
  static const String passwordRequired = 'Password is required';
  static const String passwordMinLength = 'Password must be at least 6 characters';
  static const String fullNameRequired = 'Full name is required';
  static const String passLengthError = 'Password must be at least 6 characters';
  static const String passCapLetterError = 'Password must contain at least one uppercase letter';
  static const String passSmallLetterError = 'Password must contain at least one lowercase letter';
  static const String passNumError = 'Password must contain at least one number';

  static const String confirmPasswordRequired = 'Please confirm your password';
  static const String passwordsDoNotMatch = 'Passwords do not match';
  static const String logoutMessage = 'Are you sure you want\nto logout from this account?';

  // ==================== Success & Error Messages ====================
  static const String success = 'Success';
  static const String error = 'Error';
  static const String userLoggedInSuccessfully = 'User logged in successfully';
  static const String userRegisteredSuccessfully = 'User registered successfully';
}
