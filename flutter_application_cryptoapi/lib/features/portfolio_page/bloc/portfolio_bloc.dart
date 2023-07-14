

import 'package:flutter/cupertino.dart';
import 'package:flutter_application_cryptoapi/features/portfolio_page/datasourse/portfolio_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../model/portfolioModel.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final PortfolioRepository portfolioRepository;
  PortfolioBloc(this.portfolioRepository) : super(PortfolioInitial()){
 on<PortfolioEvent>((event, emit)async{
 if(event is SendQuerryEvent){  
  emit(LoadingPortfolioState());
  try{   
   final porfolioInfo = await portfolioRepository.fetchCryptoInfo(event.nameTicker,event.period);
   debugPrint(porfolioInfo.toString());
   emit(SuccessPortfolioState(portfolioModel: porfolioInfo));
  
  }catch(e){
 debugPrint(e.toString());
 emit(ErrorPortfolioState(message: e.toString()));
  }
 }
 } );
  }



 
}
