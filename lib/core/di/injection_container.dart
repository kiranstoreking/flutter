// import 'package:get_it/get_it.dart';
// import '../network/api_client.dart';
// import '../utils/logger.dart';

// final GetIt getIt = GetIt.instance;

// Future<void> initializeDependencies() async {
//   AppLogger.info('Initializing dependencies...');
  
//   try {
//     // Core Services
//     _registerCoreServices();
    
//     // Network Services
//     _registerNetworkServices();
    
//     // Data Sources
//     _registerDataSources();
    
//     // Repositories
//     _registerRepositories();
    
//     // Use Cases
//     _registerUseCases();
    
//     // View Models
//     _registerViewModels();
    
//     // External Services
//     _registerExternalServices();
    
//     AppLogger.info('Dependencies initialized successfully');
//   } catch (e, stackTrace) {
//     AppLogger.error('Failed to initialize dependencies', e, stackTrace);
//     rethrow;
//   }
// }

// void _registerCoreServices() {
//   // Logger
//   if (!getIt.isRegistered<AppLogger>()) {
//     getIt.registerLazySingleton<AppLogger>(() => AppLogger());
//   }
  
//   // Shared Preferences
//   // getIt.registerLazySingletonAsync<SharedPreferences>(() async {
//   //   return await SharedPreferences.getInstance();
//   // });
  
//   // Connectivity
//   // getIt.registerLazySingleton<Connectivity>(() => Connectivity());
// }

// void _registerNetworkServices() {
//   // API Client
//   if (!getIt.isRegistered<ApiClient>()) {
//     getIt.registerLazySingleton<ApiClient>(() => ApiClient());
//   }
  
//   // Network Info
//   // getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(
//   //   connectivity: getIt<Connectivity>(),
//   // ));
// }

// void _registerDataSources() {
//   // Remote Data Sources
//   // getIt.registerLazySingleton<AuthRemoteDataSource>(
//   //   () => AuthRemoteDataSourceImpl(apiClient: getIt<ApiClient>()),
//   // );
  
//   // Local Data Sources
//   // getIt.registerLazySingleton<AuthLocalDataSource>(
//   //   () => AuthLocalDataSourceImpl(sharedPreferences: getIt<SharedPreferences>()),
//   // );
// }

// void _registerRepositories() {
//   // Auth Repository
//   // getIt.registerLazySingleton<AuthRepository>(
//   //   () => AuthRepositoryImpl(
//   //     remoteDataSource: getIt<AuthRemoteDataSource>(),
//   //     localDataSource: getIt<AuthLocalDataSource>(),
//   //     networkInfo: getIt<NetworkInfo>(),
//   //   ),
//   // );
// }

// void _registerUseCases() {
//   // Auth Use Cases
//   // getIt.registerLazySingleton<LoginUseCase>(
//   //   () => LoginUseCase(repository: getIt<AuthRepository>()),
//   // );
  
//   // getIt.registerLazySingleton<LogoutUseCase>(
//   //   () => LogoutUseCase(repository: getIt<AuthRepository>()),
//   // );
// }

// void _registerViewModels() {
//   // Auth View Model
//   // getIt.registerFactory<AuthViewModel>(
//   //   () => AuthViewModel(
//   //     loginUseCase: getIt<LoginUseCase>(),
//   //     logoutUseCase: getIt<LogoutUseCase>(),
//   //   ),
//   // );
// }

// void _registerExternalServices() {
//   // External APIs
//   // getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn());
  
//   // Analytics
//   // getIt.registerLazySingleton<AnalyticsService>(
//   //   () => AnalyticsService(),
//   // );
// }

// // Helper method to check if a dependency is registered
// bool isRegistered<T extends Object>([String? instanceName]) {
//   return getIt.isRegistered<T>(instanceName: instanceName);
// }

// // Helper method to get a dependency
// T get<T extends Object>([String? instanceName]) {
//   return getIt<T>(instanceName: instanceName);
// }

// // Helper method to get a dependency asynchronously
// Future<T> getAsync<T extends Object>([String? instanceName]) {
//   return getIt.getAsync<T>(instanceName: instanceName);
// }

// // Helper method to reset all dependencies (useful for testing)
// Future<void> reset() async {
//   await getIt.reset();
// }
