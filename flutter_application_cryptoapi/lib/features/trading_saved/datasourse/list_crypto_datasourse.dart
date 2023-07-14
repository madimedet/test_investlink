import 'package:dio/dio.dart';

import 'package:flutter_application_cryptoapi/features/trading_saved/datasourse/url_info.dart';

class CryptoListApiDatasource {
  
  CryptoListApiDatasource();
  final  apiKey = '4sxtUo15GbGdY9Qg7Fa147DhQQF9S2Jt';
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "accept": "*/*",
  };

  Future<Map> getCoinsList(
  ) async {
  //commentariy 
    var response;
   Dio dio = Dio(BaseOptions(
      baseUrl: Api.url,
    ));
    try {
        response = await dio.get('${Api.url}v2/aggs/grouped/locale/global/market/crypto/2023-01-09?adjusted=true&apiKey=$apiKey',
          options: Options(
            validateStatus: (status) => status! < 500,
          ));
         
    } catch (e) {
      print('ERROR >> $e');
      throw 'Повторите попытку позже, возникла внутренняя проблема';
    }
    if (response.statusCode == 200) {
      print('GET CARD DETAILS >> ${response.data}');
      return response.data;
    }
    if (response.statusCode != 200)
      throw response.data['error']['message'];
    throw 'Повторите попытку позже, возникла внутренняя проблема';
  }

}
