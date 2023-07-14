import 'package:flutter_application_cryptoapi/features/trading_saved/model/crypto_model.dart';
import 'package:flutter_application_cryptoapi/features/trading_saved/datasourse/list_crypto_datasourse.dart';



class CryptoRepository {

  CryptoListApiDatasource cryptoListApiDatasource = CryptoListApiDatasource();

 

  Future<CryptoModel> fetchCryptoList() async {    
    final object = await cryptoListApiDatasource.getCoinsList(
    );
    final cryptoList = CryptoModel.fromMap(object);
   
    return cryptoList;
  }
}