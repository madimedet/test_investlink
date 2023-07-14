import 'dart:convert';

CryptoModel cryptoModelFromMap(String str) => CryptoModel.fromMap(json.decode(str));

String cryptoModelToMap(CryptoModel data) => json.encode(data.toMap());

class CryptoModel {
    int queryCount;
    int resultsCount;
    bool adjusted;
    List<Result> results;
    String status;
    String requestId;
    int count;

    CryptoModel({
        required this.queryCount,
        required this.resultsCount,
        required this.adjusted,
        required this.results,
        required this.status,
        required this.requestId,
        required this.count,
    });

    factory CryptoModel.fromMap(Map<dynamic, dynamic> json) => CryptoModel(
        queryCount: json["queryCount"],
        resultsCount: json["resultsCount"],
        adjusted: json["adjusted"],
        results: List<Result>.from(json["results"].map((x) => Result.fromMap(x))),
        status: json["status"],
        requestId: json["request_id"],
        count: json["count"],
    );

    Map<String, dynamic> toMap() => {
        "queryCount": queryCount,
        "resultsCount": resultsCount,
        "adjusted": adjusted,
        "results": List<dynamic>.from(results.map((x) => x.toMap())),
        "status": status,
        "request_id": requestId,
        "count": count,
    };
}

class Result {
    String t;
    double v;
    double? vw;
    double o;
    double c;
    double h;
    double l;
    int resultT;
    int n;

    Result({
        required this.t,
        required this.v,
        this.vw,
        required this.o,
        required this.c,
        required this.h,
        required this.l,
        required this.resultT,
        required this.n,
    });

    factory Result.fromMap(Map<dynamic, dynamic> json) => Result(
        t: json["T"],
        v: json["v"]?.toDouble(),
        vw: json["vw"]?.toDouble(),
        o: json["o"]?.toDouble(),
        c: json["c"]?.toDouble(),
        h: json["h"]?.toDouble(),
        l: json["l"]?.toDouble(),
        resultT: json["t"],
        n: json["n"],
    );

    Map<dynamic, dynamic> toMap() => {
        "T": t,
        "v": v,
        "vw": vw,
        "o": o,
        "c": c,
        "h": h,
        "l": l,
        "t": resultT,
        "n": n,
    };
}