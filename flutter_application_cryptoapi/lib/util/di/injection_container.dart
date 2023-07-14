import 'package:dio/dio.dart';
import 'package:flutter_application_cryptoapi/features/trading_saved/datasourse/crypto_repo.dart';
import 'package:flutter_application_cryptoapi/features/trading_saved/datasourse/list_crypto_datasourse.dart';
import 'package:get_it/get_it.dart';
import '../../features/portfolio_page/bloc/portfolio_bloc.dart';
import '../../features/portfolio_page/datasourse/portfolio_api.dart';
import '../../features/portfolio_page/datasourse/portfolio_repo.dart';
import '../../features/trading_saved/bloc/list_crypto_bloc.dart';
import '../../features/trading_saved/datasourse/url_info.dart';

final sl = GetIt.instance;
void setupInjections() {
  sl.registerFactory<Dio>(
    () => Dio(BaseOptions(
      baseUrl: Api.url,
    )),
  );

//Datasources

  sl.registerLazySingleton<CryptoListApiDatasource>(
    () => CryptoListApiDatasource(),
  );
sl.registerLazySingleton<PortfolioApiDatasource>(
    () => PortfolioApiDatasource(),
  );

  // bloc
  sl.registerFactory<ListCryptoBloc>(() => ListCryptoBloc(sl()));
  sl.registerFactory<PortfolioBloc>(() => PortfolioBloc(sl()));
  //Repositories
  sl.registerLazySingleton<CryptoRepository>(
    () => CryptoRepository(),
  );
   sl.registerLazySingleton<PortfolioRepository>(
    () => PortfolioRepository(),
  );
}
