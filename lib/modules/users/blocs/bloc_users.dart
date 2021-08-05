import 'package:rxdart/rxdart.dart';

import '../../../blocs/bloc_central.dart';
import '../models/model_users.dart';
import '../services/service_sqllite.dart';

class BlocUsers {
  /// This class acts like main bloc of users module
  /// Singleton pattern
  static final BlocUsers _blocUsers = BlocUsers._internal();

  factory BlocUsers() {
    return _blocUsers;
  }

  BlocUsers._internal() {
    /// All of initial checks will be here and
    /// will be executed once
  }

  /// for observables in realtime database com
  final _userListController = BehaviorSubject<List<ModelUser>>();
  final _userController = BehaviorSubject<ModelUser?>();

  /// getters and setters for controllers
  ModelUser? get user => _userController.valueOrNull;

  Stream<ModelUser?> get userStream => _userController.stream;

  final _kUrlBase = 'https://reqres.in/api/users/';

  set user(ModelUser? modelUser) {
    _userController.sink.add(modelUser);
  }

  List<ModelUser> get userList => _userListController.valueOrNull ?? [];

  Stream<List<ModelUser>?> get userListStream => _userListController.stream;

  set userList(List<ModelUser>? userListTmp) {
    _userListController.sink.add(userListTmp ?? []);
  }

  /// Methods for the class
  void createNewUser() {
    user = ModelUser(
        firstName: '',
        lastName: '',
        email: '',
        avatar: 'https://jocaagura.github.io/hvalbertjimenez/img/joao.jpg');
  }

  /// NETWORK methods
  Future<List<ModelUser>> listUsers({int page = 1, int perPage = 12}) async {
    final List<ModelUser> tmpList = [];
    try {
      final tempData = await BlocCentral().jsonGetRequestHttp(
          url: _kUrlBase,
          parameters: {'page': "$page", "per_page": "$perPage"});
      final data = tempData["data"];
      for (int i = 0; i < data.length; i++) {
        try {
          final tmpUser = ModelUser.fromJson(data[i]);
          tmpList.add(tmpUser);
        } catch (e) {}
      }
    } catch (e) {}
    return tmpList;
  }

  Future<ModelUser> singleUser(int id) async {
    final tmp = await readUserById(id);
    if (tmp != null) {
      return tmp;
    }
    ModelUser tmp2 = ModelUser(
      firstName: "firstName",
      lastName: "lastName",
      email: "email@email.co",
      avatar: 'https://jocaagura.github.io/hvalbertjimenez/img/joao.jpg',
      id: id,
    );

    try {
      final tempData = await BlocCentral()
          .jsonGetRequestHttp(url: _kUrlBase, parameters: {'id': "$id"});
      final data = tempData["data"];
      try {
        final tmp2 = ModelUser.fromJson(data);
        await insertNewUserInSQL(tmp2);
      } catch (e) {}
    } catch (e) {}

    return tmp2;
  }

  Future<ModelUser> createUserIntoDataBase(ModelUser modelUser) async {
    final objectApi = await BlocCentral()
        .jsonPostRequestHttp(url: _kUrlBase, parameters: modelUser.toJson());
    if (objectApi["id"] != null) {
      modelUser = ModelUser(
          id: int.tryParse(objectApi["id"].toString()) ?? 0,
          firstName: modelUser.firstName,
          lastName: modelUser.lastName,
          email: modelUser.email,
          avatar: modelUser.avatar);
    }
    return modelUser;
  }

  /// methods for sqlite
  Future<ModelUser?> readUserById(int id) async {
    return await ServiceUsersSQL().readModelUser(id);
  }

  Future<ModelUser> insertNewUserInSQL(ModelUser modelUser) async {
    if (modelUser.sqlId == null) {
      return await ServiceUsersSQL().createModelUser(modelUser);
    }

    return modelUser;
  }

  dispose() {
    _userListController.close();
    _userController.close();
  }
}
