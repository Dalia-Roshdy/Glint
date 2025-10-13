import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class WorkLoadTestCall {
  static Future<ApiCallResponse> call({
    String? startDate = '08/20/2025',
    String? endDate = '08/26/2025',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'WorkLoadTest',
      apiUrl:
          'https://us-central1-glint-firebase.cloudfunctions.net/userWorkloadFlat',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'start_date': startDate,
        'end_date': endDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SingleResourceWorkLoadCall {
  static Future<ApiCallResponse> call({
    String? userId = 'kdoDwsbsLdU9Kk1WruEaxiJSxKE2',
    String? startDate = '2025-10-05',
    String? endDate = '2025-10-11',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'singleResourceWorkLoad',
      apiUrl:
          'https://us-central1-glint-firebase.cloudfunctions.net/singleResourceWorkLoad',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'user_id': userId,
        'start_date': startDate,
        'end_date': endDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
