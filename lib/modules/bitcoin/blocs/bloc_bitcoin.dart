import 'dart:async';

import 'package:rxdart/rxdart.dart';

import '../../../blocs/bloc_central.dart';
import '../models/model_bitcoin_only_day.dart';
import '../models/model_bitcoin_resume.dart';

class BlocBitcoin {
  /// This class acts like main bloc of users module
  /// Singleton pattern
  static final BlocBitcoin _blocBitcoin = BlocBitcoin._internal();

  factory BlocBitcoin() {
    return _blocBitcoin;
  }

  BlocBitcoin._internal() {
    /// All of initial checks will be here and
    /// will be executed once
    ///  we have to polling info each 60 seconds the info of bitcoin for today
    subscribeBitcoinTodayInfo();
  }

  /// controllers
  final _bitcoinResumeController = BehaviorSubject<ModelBitcoin?>();

  final _bitcoinOnlyDayController = BehaviorSubject<ModelBitcoinOnlyDay?>();

  ModelBitcoin? get bitcoinInfo => _bitcoinResumeController.valueOrNull;

  Stream<ModelBitcoin?> get bitcoinInfoStream =>
      _bitcoinResumeController.stream;

  ModelBitcoinOnlyDay? get modelBitcoinOnlyDay =>
      _bitcoinOnlyDayController.valueOrNull;

  Stream<ModelBitcoinOnlyDay?> get modelBitcoinDayStream =>
      _bitcoinOnlyDayController.stream;

  getTodayBitcoinInfo([String moneyCode = 'COP']) async {
    final url = 'https://api.coindesk.com/v1/bpi/currentprice/$moneyCode.json';
    final json = await BlocCentral().jsonGetRequestHttp(url: url);
    ModelBitcoinOnlyDay? modelBitcoinOnlyDayTmp;
    try {
      print(json);

      modelBitcoinOnlyDayTmp = ModelBitcoinOnlyDay.fromJson(json);
    } catch (e) {
      print('Error');
      print(e);
    }
    modelBitcoinOnlyDay = modelBitcoinOnlyDayTmp;
  }

  set bitcoinInfo(ModelBitcoin? bitcoinInfo) {
    _bitcoinResumeController.sink.add(bitcoinInfo);
  }

  set modelBitcoinOnlyDay(ModelBitcoinOnlyDay? modelBitcoinOnlyDay) {
    /// todo: save into device the info for the day if the info is not NULl
    _bitcoinOnlyDayController.sink.add(modelBitcoinOnlyDay);
  }

  double returnUSDtoCopValue(double value) {
    return value * 3917.0;
  }

  double returnUSDtoEURValue(double value) {
    return value * 0.84;
  }

  /// Subscriptions
  ///  handle evry 60 seconds query
  Timer? timerQueryBitCoinOnlyDay;

  subscribeBitcoinTodayInfo() {
    getTodayBitcoinInfo();
    if (timerQueryBitCoinOnlyDay != null) {
      timerQueryBitCoinOnlyDay?.cancel();
      timerQueryBitCoinOnlyDay = null;
    }
    timerQueryBitCoinOnlyDay = Timer.periodic(Duration(seconds: 60), (timer) {
      print('consultando bitcoin ${timer.tick}');
      getTodayBitcoinInfo();
    });
  }

  dispose() {
    _bitcoinResumeController.close();
    _bitcoinOnlyDayController.close();

    timerQueryBitCoinOnlyDay?.cancel();
  }
}
