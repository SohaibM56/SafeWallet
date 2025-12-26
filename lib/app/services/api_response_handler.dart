import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../mvvm/model/api_response_model/api_response.dart';
import 'json_extractor.dart';
import 'logger_service.dart';

/// Handles API responses with standardized processing.
class ApiResponseHandler {
  /// Processes an API response and returns an [ApiResponse<T>].
  /// Uses [fromJson] to parse the data field into type [T].
  static Future<ApiResponse<T>> process<T>(
    dynamic response,
    String? endPoint,
    T Function(dynamic dataJson) fromJson,
  ) async {
    MessageExtractor().extractAndStoreMessage(endPoint ?? '', response.body);

    switch (response.statusCode) {
      case 200:
      case 201:
        final parsedJson = response.body.length > 100000
            ? await compute<String, dynamic>(_parseJson, response.body)
            : jsonDecode(response.body);
        LoggerService.i('API response processed successfully: $endPoint');
        return ApiResponse<T>.fromJson(parsedJson, fromJson);

      case 401:
        _handleUnauthorized();
        break;

      case 422:
        _handleError(response, 'Validation Error');
        break;

      case 500:
        _handleError(response, 'Internal Server Error');
        break;

      default:
        _handleError(
          response,
          'API Error: ${response.statusCode} - ${response.reasonPhrase}',
        );
    }
    throw Exception('Unexpected error occurred.');
  }

  static dynamic _parseJson(String responseBody) {
    return jsonDecode(responseBody);
  }

  static void _handleUnauthorized() {
    LoggerService.w('Unauthorized access. Redirecting to login.');
    // Get.offAllNamed(AppRoutes.loginView);
    throw Exception('Unauthorized access. Please log in.');
  }

  static void _handleError(dynamic response, String errorMessage) {
    try {
      final errorResponse = jsonDecode(response.body);
      final message =
          'errorMessage: ${errorResponse['message'] ?? 'No details available'}';
      LoggerService.e(message);
      throw Exception(message);
    } catch (e, stack) {
      LoggerService.e('Error handling failed: $e', error: e, stackTrace: stack);
      throw Exception(errorMessage);
    }
  }

  static void logUnhandledError(dynamic e, StackTrace stackTrace) {
    LoggerService.e('Unhandled error: $e', error: e, stackTrace: stackTrace);
  }
}
