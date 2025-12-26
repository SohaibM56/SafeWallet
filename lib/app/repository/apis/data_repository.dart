// import 'package:http/http.dart' as http;
// import '../../config/app_urls.dart';
// import '../../mvvm/model/api_response_model/api_response.dart';
// import '../../mvvm/model/body_model/add_car_body_model.dart';
// import '../../mvvm/model/body_model/buy_car_request.dart';
// import '../../services/api_response_handler.dart';
// import '../../services/https_calls.dart';
// import '../../services/logger_service.dart';

// /// Repository for data-related API calls (e.g., car operations).
// class DataRepository {
//   final HttpsCalls _httpsCalls = HttpsCalls();

//   Future<ApiResponse<void>> addCarApi(AddCarBodyModel carDataModel) async {
//     try {
//       const endPoint = AppUrls.signup; // TODO: Update with correct endpoint
//       LoggerService.d('Initiating add car API call');
//       final response = await _httpsCalls.crudCarMultipartApi(endPoint, carDataModel);
//       return await ApiResponseHandler.process(response, endPoint, (dataJson) {});
//     } catch (e, stackTrace) {
//       ApiResponseHandler.logUnhandledError(e, stackTrace);
//       rethrow;
//     }
//   }

//   Future<ApiResponse<void>> buyCarApi(BuyCarRequestModel buyRequestModel) async {
//     try {
//       const endPoint = AppUrls.signup; // TODO: Update with correct endpoint
//       LoggerService.d('Initiating buy car API call');
//       final response =
//           await _httpsCalls.multipartBuyCarRequestApi(endPoint, buyRequestModel);
//       return await ApiResponseHandler.process(response, endPoint, (dataJson) {});
//     } catch (e, stackTrace) {
//       ApiResponseHandler.logUnhandledError(e, stackTrace);
//       rethrow;
//     }
//   }
// }
