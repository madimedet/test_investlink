part of 'portfolio_bloc.dart';

@immutable
abstract class PortfolioState {}

class PortfolioInitial extends PortfolioState {

}

class ErrorPortfolioState extends PortfolioState {
 final String message;
  ErrorPortfolioState({required this.message});
}

class LoadingPortfolioState extends PortfolioState {}

class SuccessPortfolioState extends PortfolioState {
  final PortfolioModel portfolioModel;
  SuccessPortfolioState({required this.portfolioModel});
}