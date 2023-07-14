part of 'portfolio_bloc.dart';

@immutable
abstract class PortfolioEvent {}

class SendQuerryEvent extends PortfolioEvent {
  final String? nameTicker;
  final String period;
  SendQuerryEvent({
     this.nameTicker,
    required this.period,
  });
}
