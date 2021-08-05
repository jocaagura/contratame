import 'package:rxdart/rxdart.dart';


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
  }


  /// controllers
  final _bitcoinResumeController = BehaviorSubject<ModelBitcoin?>();


  ModelBitcoin? get bitcoinInfo => _bitcoinResumeController.valueOrNull;
  Stream<ModelBitcoin?> get bitcoinInfoStream => _bitcoinResumeController.stream;


  set(ModelBitcoin? bitcoinInfo){
    _bitcoinResumeController.sink.add(bitcoinInfo);
  }






  dispose(){
    _bitcoinResumeController.close();
  }
}