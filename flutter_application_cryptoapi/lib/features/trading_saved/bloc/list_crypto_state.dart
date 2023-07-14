part of 'list_crypto_bloc.dart';


abstract class ListCryptoState {}

class CryptoListInitial extends ListCryptoState {

}

class CryptoListLoadingState extends ListCryptoState{}


class CryptoListLoadingErrorState extends ListCryptoState{ 
  final String message;
  CryptoListLoadingErrorState({required this.message});
}



class CryptoListLoadingSuccessState extends ListCryptoState{ 
  final CryptoModel cryptoListModel;
  CryptoListLoadingSuccessState({required this.cryptoListModel});
}

