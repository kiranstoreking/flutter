// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';
// import '../constants/app_constants.dart';
// import '../error/failures.dart';
// import '../utils/logger.dart';

// class ApiClient {
//   late final Dio _dio;
  
//   ApiClient() {
//     _dio = Dio(
//       BaseOptions(
//         baseUrl: AppConstants.baseUrl + AppConstants.apiVersion,
//         connectTimeout: Duration(milliseconds: AppConstants.connectionTimeout),
//         receiveTimeout: Duration(milliseconds: AppConstants.receiveTimeout),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//       ),
//     );
    
//     _setupInterceptors();
//   }
  
//   void _setupInterceptors() {
//     // Request Interceptor
//     _dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (options, handler) {
//           AppLogger.info('API Request: ${options.method} ${options.path}');
//           AppLogger.debug('Request Headers: ${options.headers}');
//           AppLogger.debug('Request Data: ${options.data}');
          
//           // Add auth token if available
//           final token = GetIt.instance.isRegistered<String>(instanceName: 'auth_token') 
//               ? GetIt.instance<String>(instanceName: 'auth_token') 
//               : null;
          
//           if (token != null) {
//             options.headers['Authorization'] = 'Bearer $token';
//           }
          
//           handler.next(options);
//         },
//         onResponse: (response, handler) {
//           AppLogger.info('API Response: ${response.statusCode} ${response.requestOptions.path}');
//           AppLogger.debug('Response Data: ${response.data}');
//           handler.next(response);
//         },
//         onError: (error, handler) {
//           AppLogger.error('API Error: ${error.message}', error);
//           handler.next(error);
//         },
//       ),
//     );
    
//     // Error Interceptor
//     _dio.interceptors.add(
//       InterceptorsWrapper(
//         onError: (error, handler) {
//           final failure = _handleError(error);
//           AppLogger.error('API Failure: ${failure.message}', failure);
//           handler.next(error);
//         },
//       ),
//     );
//   }
  
//   Failure _handleError(DioException error) {
//     switch (error.type) {
//       case DioExceptionType.connectionTimeout:
//       case DioExceptionType.sendTimeout:
//       case DioExceptionType.receiveTimeout:
//         return const NetworkFailure(
//           message: 'Connection timeout. Please check your internet connection.',
//           code: 'TIMEOUT',
//         );
        
//       case DioExceptionType.badResponse:
//         final statusCode = error.response?.statusCode;
//         final responseData = error.response?.data;
        
//         switch (statusCode) {
//           case 400:
//             return ValidationFailure(
//               message: responseData?['message'] ?? 'Bad request',
//               code: 'BAD_REQUEST',
//               details: responseData,
//             );
//           case 401:
//             return const AuthenticationFailure(
//               message: 'Unauthorized. Please login again.',
//               code: 'UNAUTHORIZED',
//             );
//           case 403:
//             return const PermissionFailure(
//               message: 'Access denied. You don\'t have permission to perform this action.',
//               code: 'FORBIDDEN',
//             );
//           case 404:
//             return const ServerFailure(
//               message: 'Resource not found.',
//               code: 'NOT_FOUND',
//             );
//           case 500:
//             return const ServerFailure(
//               message: 'Internal server error. Please try again later.',
//               code: 'INTERNAL_SERVER_ERROR',
//             );
//           default:
//             return ServerFailure(
//               message: responseData?['message'] ?? 'Server error occurred.',
//               code: 'SERVER_ERROR',
//               details: responseData,
//             );
//         }
        
//       case DioExceptionType.cancel:
//         return const NetworkFailure(
//           message: 'Request was cancelled.',
//           code: 'CANCELLED',
//         );
        
//       case DioExceptionType.connectionError:
//         return const NetworkFailure(
//           message: 'No internet connection. Please check your network settings.',
//           code: 'NO_CONNECTION',
//         );
        
//       case DioExceptionType.badCertificate:
//         return const NetworkFailure(
//           message: 'SSL certificate error. Please check your connection.',
//           code: 'SSL_ERROR',
//         );
        
//       case DioExceptionType.unknown:
//       default:
//         return const UnknownFailure(
//           message: 'An unknown error occurred. Please try again.',
//           code: 'UNKNOWN',
//         );
//     }
//   }
  
//   // GET Request
//   Future<Response> get(
//     String path, {
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       final response = await _dio.get(
//         path,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return response;
//     } on DioException catch (e) {
//       throw _handleError(e);
//     }
//   }
  
//   // POST Request
//   Future<Response> post(
//     String path, {
//     dynamic data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       final response = await _dio.post(
//         path,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return response;
//     } on DioException catch (e) {
//       throw _handleError(e);
//     }
//   }
  
//   // PUT Request
//   Future<Response> put(
//     String path, {
//     dynamic data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       final response = await _dio.put(
//         path,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return response;
//     } on DioException catch (e) {
//       throw _handleError(e);
//     }
//   }
  
//   // DELETE Request
//   Future<Response> delete(
//     String path, {
//     dynamic data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//   }) async {
//     try {
//       final response = await _dio.delete(
//         path,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//       );
//       return response;
//     } on DioException catch (e) {
//       throw _handleError(e);
//     }
//   }
  
//   // PATCH Request
//   Future<Response> patch(
//     String path, {
//     dynamic data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       final response = await _dio.patch(
//         path,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return response;
//     } on DioException catch (e) {
//       throw _handleError(e);
//     }
//   }
  
//   // Upload File
//   Future<Response> uploadFile(
//     String path, {
//     required FormData data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//   }) async {
//     try {
//       final response = await _dio.post(
//         path,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onSendProgress: onSendProgress,
//       );
//       return response;
//     } on DioException catch (e) {
//       throw _handleError(e);
//     }
//   }
  
//   // Download File
//   Future<Response> downloadFile(
//     String path, {
//     required String savePath,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       final response = await _dio.download(
//         path,
//         savePath,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return response;
//     } on DioException catch (e) {
//       throw _handleError(e);
//     }
//   }
// }
