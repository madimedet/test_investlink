import 'package:flutter/material.dart';
import 'package:flutter_application_cryptoapi/features/portfolio_page/bloc/portfolio_bloc.dart';
import 'package:flutter_application_cryptoapi/util/widgets/portfolio_open_close_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../util/di/injection_container.dart';
import '../../../util/helpers/text_styles.dart';
import '../../../util/widgets/period_widget.dart';

class PorfolioPage extends StatelessWidget {
  final String titleTicker;
  final String cost;

  const PorfolioPage(
      {super.key, required this.titleTicker, required this.cost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          titleTicker.replaceFirst(RegExp(r'X:'), ''),
          style: FontTextStyle.textStyle1,
        ),
      ),
      body: BlocProvider(
        create: (_) => sl<PortfolioBloc>()
          ..add(SendQuerryEvent(period: 'day', nameTicker: titleTicker)),
          
        child: BlocBuilder<PortfolioBloc, PortfolioState>(
          builder: (context, state) {
            if (state is PortfolioInitial) {
              debugPrint("NAMETICKER: $titleTicker ");
            }
            if (state is ErrorPortfolioState) {
              return const Center(
                  child: Text('ошибка подключение с интернетом'));
            }
            if (state is SuccessPortfolioState) {
              return Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 10),
                  child: Row(
                    children: [
                      const Text(
                        'Цена: ',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        cost,
                        style: FontTextStyle.textStyle1,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 41,
                  color: Colors.white10,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          PeriodButton(
                            choiseColor: Colors.green,
                            function: () {
                             
                              context.read()<PortfolioBloc>().add(
                                  SendQuerryEvent(
                                      nameTicker: titleTicker,
                                      period:'day'));   
                            },
                            period: '1Д',
                          ),
                           PeriodButton(
                            choiseColor: Colors.white,
                           function: () {
                             
                              context.read()<PortfolioBloc>().add(
                                  SendQuerryEvent(
                                      nameTicker: titleTicker,
                                      period:'week'));   
                            },
                            period: '1Н',
                          ),
                          PeriodButton(
                            choiseColor: Colors.white,
                           function: () {                             
                              context.read()<PortfolioBloc>().add(
                                  SendQuerryEvent(
                                      nameTicker: titleTicker,
                                      period:'month')); 
                            debugPrint("PERIOD!!: month");            
                            },
                            period: '1МЕС',
                          ),
                           PeriodButton(
                              choiseColor: Colors.white,
                               function: () {
                             
                              context.read()<PortfolioBloc>().add(
                                  SendQuerryEvent(
                                      nameTicker: titleTicker,
                                      period:'quarter'));   
                            },
                              period: '3МЕС'),
                           PeriodButton(
                              choiseColor: Colors.white,
                               function: () {
                             
                              context.read()<PortfolioBloc>().add(
                                  SendQuerryEvent(
                                      nameTicker: titleTicker,
                                      period:'year'));   
                            },
                              period: '1ГОД')
                        ]),
                  ),
                ),
                Container(
                  height: 300,
                  padding: const EdgeInsets.all(16),
                  child: SfCartesianChart(
                    primaryXAxis: DateTimeAxis(),
                    series: <ChartSeries>[
                      LineSeries<SalesData, DateTime>(
                        dataSource: <SalesData>[
                          SalesData(DateTime(2023,1,9),state.portfolioModel.results.first.c),
                        ],
                        xValueMapper: (SalesData sales, _) => sales.date,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                OpenCloseContainer(
                    high: state.portfolioModel.results.first.h,
                    low: state.portfolioModel.results.first.l,
                    open: state.portfolioModel.results.first.o,
                    close: state.portfolioModel.results.first.c)
              ]);
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          },
        ),
      ),
    );
  }
}

class SalesData {
  final DateTime date;
  final double sales;

  SalesData(this.date, this.sales);
}
