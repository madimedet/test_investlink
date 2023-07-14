import 'package:dio/dio.dart';
import 'package:flutter_application_cryptoapi/features/trading_saved/datasourse/url_info.dart';



class PortfolioApiDatasource {

  final apiKey = '4sxtUo15GbGdY9Qg7Fa147DhQQF9S2Jt';
  Map<String, String> headers = {
    "Content-Type": "application/json",
    "accept": "*/*",
  };
 
  Future<Map> getCoinsInfo(String? nameTicker, String period
  ) async {
  //commentariy 
    var response;
   Dio dio = Dio(BaseOptions(
      baseUrl: Api.url,
    ));
    try {
        response = await dio.get('${Api.url}v2/aggs/ticker/$nameTicker/range/1/$period/2023-01-09/2023-01-09?adjusted=true&sort=asc&limit=120&apiKey=4sxtUo15GbGdY9Qg7Fa147DhQQF9S2Jt',
          options: Options(
            validateStatus: (status) => status! < 500,
          ));
         
    } catch (e) {
      print('ERROR >> $e');
      throw 'Повторите попытку позже, возникла внутренняя проблема';
    }
    if (response.statusCode == 200) {
      print('GET crypto info >> ${response.data}');
      return response.data;
    }
    if (response.statusCode != 200)
      throw response.data['error']['message'];
    throw 'Повторите попытку позже, возникла внутренняя проблема';
  }

}