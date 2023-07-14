import 'package:flutter/material.dart';
import 'package:flutter_application_cryptoapi/util/di/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/portfolio_page/bloc/portfolio_bloc.dart';
import 'features/trading_saved/bloc/list_crypto_bloc.dart';
import 'features/trading_saved/ui/list_crypto_page.dart';

void main() {
    setupInjections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
      designSize: const Size(360, 960),
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<ListCryptoBloc>()..add(GetCryptoListEvent())),
          BlocProvider(create: (_) => sl<PortfolioBloc>())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const CryptoListPage(),
          
          onUnknownRoute: (RouteSettings settings) {
            return MaterialPageRoute(builder: (_) => const CryptoListPage());
          },
        ),
      ),
    );
    
  }
}
