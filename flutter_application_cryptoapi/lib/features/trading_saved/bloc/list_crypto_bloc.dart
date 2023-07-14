import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_application_cryptoapi/features/trading_saved/model/crypto_model.dart';
import 'package:flutter_application_cryptoapi/features/trading_saved/datasourse/crypto_repo.dart';
part 'list_crypto_event.dart';
part 'list_crypto_state.dart';

class ListCryptoBloc extends Bloc<ListCryptoEvent, ListCryptoState> {
 final CryptoRepository cryptoRepo;
 
  ListCryptoBloc(this.cryptoRepo) : super(CryptoListInitial()){
     on<ListCryptoEvent>((event, emit) async {
      
    if(event is GetCryptoListEvent){
      emit(CryptoListLoadingState());
       try {
        final cryptoList = await cryptoRepo.fetchCryptoList();
        debugPrint(cryptoList.toString());
       emit(CryptoListLoadingSuccessState(cryptoListModel: cryptoList));
      } catch (e) {
        debugPrint(e.toString());
      emit(CryptoListLoadingErrorState(message: e.toString()));
      }
     
    }
 });
  }
  
  
 
}
