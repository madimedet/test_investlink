class PortfolioModel {
  String ticker;
  int queryCount;
  int resultsCount;
  bool adjusted;
  List<Result> results;
  String status;
  String requestId;
  int count;

  PortfolioModel({
    required this.ticker,
    required this.queryCount,
    required this.resultsCount,
    required this.adjusted,
    required this.results,
    required this.status,
    required this.requestId,
    required this.count,
  });

  factory PortfolioModel.fromMap(Map<dynamic, dynamic> map) {
    return PortfolioModel(
      ticker: map['ticker'],
      queryCount: map['queryCount'],
      resultsCount: map['resultsCount'],
      adjusted: map['adjusted'],
      results: List<Result>.from(
        map['results'].map((result) => Result.fromMap(result)),
      ),
      status: map['status'],
      requestId: map['request_id'],
      count: map['count'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'ticker': ticker,
      'queryCount': queryCount,
      'resultsCount': resultsCount,
      'adjusted': adjusted,
      'results': List<dynamic>.from(results.map((result) => result.toMap())),
      'status': status,
      'request_id': requestId,
      'count': count,
    };
  }
}

class Result {
  double v;
  double vw;
  double o;
  double c;
  double h;
  double l;
  int t;
  int n;

  Result({
    required this.v,
    required this.vw,
    required this.o,
    required this.c,
    required this.h,
    required this.l,
    required this.t,
    required this.n,
  });

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      v: map['v'],
      vw: map['vw'],
      o: map['o'],
      c: map['c'],
      h: map['h'],
      l: map['l'],
      t: map['t'],
      n: map['n'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'v': v,
      'vw': vw,
      'o': o,
      'c': c,
      'h': h,
      'l': l,
      't': t,
      'n': n,
    };
  }
}
