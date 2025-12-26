// import 'package:http/http.dart' as http;
// import '../../config/app_urls.dart';
// import '../../mvvm/model/api_response_model/api_response.dart';
// import '../../mvvm/model/body_model/driver_signup_body_model.dart';
// import '../../mvvm/model/body_model/garage_signup_body_model.dart';
// import '../../services/api_response_handler.dart';
// import '../../services/https_calls.dart';
// import '../../services/logger_service.dart';

// /// Repository for authentication-related API calls.
// class AuthRepository {
//   final HttpsCalls _httpsCalls = HttpsCalls();

//   Future<ApiResponse<void>> driverSignUpApi(
//       DriverSignupBodyModel signUpBodyModel) async {
//     try {
//       const endPoint = AppUrls.signup;
//       LoggerService.d('Initiating driver signup API call');
//       final response =
//           await _httpsCalls.multipartDriverProfileApiHits(endPoint, signUpBodyModel);
//       return await ApiResponseHandler.process(response, endPoint, (dataJson) {});
//     } catch (e, stackTrace) {
//       ApiResponseHandler.logUnhandledError(e, stackTrace);
//       rethrow;
//     }
//   }

//   Future<ApiResponse<void>> updateDriver(
//       DriverSignupBodyModel signUpBodyModel) async {
//     try {
//       const endPoint = AppUrls.updateAccount;
//       LoggerService.d('Initiating driver update API call');
//       final response =
//           await _httpsCalls.multipartDriverProfileApiHits(endPoint, signUpBodyModel);
//       return await ApiResponseHandler.process(response, endPoint, (dataJson) {});
//     } catch (e, stackTrace) {
//       ApiResponseHandler.logUnhandledError(e, stackTrace);
//       rethrow;
//     }
//   }

//   Future<ApiResponse<void>> garageSignUpApi(
//       GarageSignupBodyModel signUpBodyModel) async {
//     try {
//       const endPoint = AppUrls.signup;
//       LoggerService.d('Initiating garage signup API call');
//       final response =
//           await _httpsCalls.multipartGarageProfileApiHits(endPoint, signUpBodyModel);
//       return await ApiResponseHandler.process(response, endPoint, (dataJson) {});
//     } catch (e, stackTrace) {
//       ApiResponseHandler.logUnhandledError(e, stackTrace);
//       rethrow;
//     }
//   }
// }
