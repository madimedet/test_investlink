import 'package:flutter_application_cryptoapi/features/portfolio_page/datasourse/portfolio_api.dart';
import '../model/portfolioModel.dart';

class PortfolioRepository {
  
      PortfolioApiDatasource portfolioApiDatasource = PortfolioApiDatasource();
  

  Future<PortfolioModel> fetchCryptoInfo(String? nameTicker, String period) async {
    final object = await portfolioApiDatasource. getCoinsInfo(nameTicker, period);
    final portfolio = PortfolioModel.fromMap(object);

    return portfolio;
  }
}
