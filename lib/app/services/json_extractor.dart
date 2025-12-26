import 'dart:convert';

import 'package:safewallet/app/services/global_variables.dart';

import 'logger_service.dart';

/// Extracts and stores error messages from API responses.
class MessageExtractor {
  void extractAndStoreMessage(String endPoint, String responseBody) {
    try {
      LoggerService.i('Api EndPoint: $endPoint - Body: $responseBody');
      final jsonMap = jsonDecode(responseBody);
      GlobalVariables.errorMessages.clear();
      if (jsonMap['errors'] is List) {
        GlobalVariables.errorMessages = List<String>.from(jsonMap['errors']);
      } else if (jsonMap['message'] != null) {
        GlobalVariables.errorMessages.add(jsonMap['message']);
      } else {
        GlobalVariables.errorMessages.add('Unknown error occurred.');
      }
      LoggerService.i(
        'Stored Error Messages: ${GlobalVariables.errorMessages}',
      );
    } catch (e) {
      LoggerService.e('Error extracting and storing message: $e');
      GlobalVariables.errorMessages.add('Error extracting message.');
    }
  }
}
