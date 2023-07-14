import 'package:flutter/material.dart';
// import 'package:flutter_application_cryptoapi/features/trading_saved/model/crypto_model.dart';
import 'package:flutter_application_cryptoapi/util/helpers/text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../util/widgets/cryptoListBuilder.dart';
import '../../portfolio_page/ui/portfolio_page.dart';
import '../bloc/list_crypto_bloc.dart';
// import 'package:flutter_application_cryptoapi/util/widgets/cryptoListBuilder.dart';

class CryptoListPage extends StatelessWidget {
  const CryptoListPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ListCryptoBloc>().add(GetCryptoListEvent());
        },
        child: BlocBuilder<ListCryptoBloc, ListCryptoState>(
          builder: (context, state) {
            print(state);

            if (state is CryptoListLoadingErrorState) {
              return const Center(child: Text("Ошибка при загрузке данных"));
            }
            if (state is CryptoListLoadingSuccessState) {
              return SingleChildScrollView(
                primary: true,
                child: SafeArea(
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0, left: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Криптовалюта",
                            style: TextStyle(color: Colors.black, fontSize: 26),
                          ),
                          IconButton(
                            onPressed: () async {},
                            icon: const Icon(Icons.search_outlined),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset('assets/icons/editSquare.png'),
                              const Text(
                                "Тикер/Название",
                                style: FontTextStyle.textStyle,
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    const Text(
                                      "Цена",
                                      style: FontTextStyle.textStyle,
                                    ),
                                    Image.asset('assets/icons/maxMin.png'),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 30),
                              Container(
                                child: Row(
                                  children: [
                                    const Text(
                                      "Изм.%/\$",
                                      style: FontTextStyle.textStyle,
                                    ),
                                    Image.asset('assets/icons/maxMin.png'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: ListView.separated(
                        primary: false,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: state.cryptoListModel.results.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PorfolioPage(
                                    titleTicker:
                                        state.cryptoListModel.results[i].t,
                                    cost: state.cryptoListModel.results[i].c.toString(),
                                  ),
                                ),
                              );
                            },
                            child: CryptoListBuilder(
                              nameTicker:
                                  state.cryptoListModel.results[i].t.toString(),
                              cost: state.cryptoListModel.results[i].c,
                              higth: state.cryptoListModel.results[i].h,
                              low: state.cryptoListModel.results[i].l,
                            ),
                          );
                        },
                      ),
                    )
                  ]),
                ),
              );
            }
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.green,
            ));
          },
        ),
      ),
    );
  }
}
