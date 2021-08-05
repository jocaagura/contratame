import 'package:flutter/material.dart';

import '../helpers.dart';
import '../modules/users/blocs/bloc_users.dart';
import '../services/service_http.dart';
import '../services/service_shared_preferences.dart';
import '../widgets/action_bottom_button_widget.dart';
import '../widgets/menu_app_bar_widget.dart';
import 'bloc_provider.dart';
import 'bloc_theme.dart';

class BlocCentral {
  /// This class acts like main bloc of app
  /// Singleton pattern
  static final BlocCentral _blocCentral = BlocCentral._internal();

  factory BlocCentral() {
    return _blocCentral;
  }

  BlocCentral._internal() {
    /// All of initial checks will be written here and
    /// will be executed once
    /// Initialization of user app theme
    /// Warning this class could contain references to static services put above
    Future.delayed(Duration(milliseconds: 1000), () {
      BlocTheme();
    });
  }

  /// Helpers Section
  bool validateEmail(String email) {
    return Helpers().validateEmail(email);
  }

  bool validateUrl(String url) {
    return Helpers().validateUrl(url);
  }

  /// Network requests
  Future<Map<String, dynamic>> jsonGetRequestHttp(
      {required String url, Map<String, String> parameters = const {}}) async {
    return ServiceHttp().jsonGetRequestHttp(url: url, parameters: parameters);
  }

  Future<Map<String, dynamic>> jsonPostRequestHttp(
      {required String url, Map<String, dynamic> parameters = const {}}) async {
    return ServiceHttp().jsonPostRequestHttp(url: url, parameters: parameters);
  }

  /// shared preferences
  Future<bool> saveIntoSharedPreferences(String key, dynamic value) async {
    return await ServiceUserSharedPreferences()
        .saveIntoSharedPreferences(key, value);
  }

  Future<int> getIntValue(String key) async {
    return await ServiceUserSharedPreferences().getIntValue(key);
  }

  Future<double> getDoubleValue(String key) async {
    return await ServiceUserSharedPreferences().getDoubleValue(key);
  }

  Future<String> getStringValue(String key) async {
    return await ServiceUserSharedPreferences().getStringValue(key);
  }

  Future<bool> getBooleanValue(String key) async {
    return await ServiceUserSharedPreferences().getBoolValue(key);
  }

  Future<List<String>> getListStringValue(String key) async {
    return await ServiceUserSharedPreferences().getListStringValue(key);
  }

  /// users demo
  void newUser() {
    BlocUsers().createNewUser();
  }

  /// Theme data
  Stream<ThemeData> get streamTheme => BlocTheme().streamTheme;

  Stream<Size?> get sizeStream => BlocTheme().sizeStream;

  ThemeData get theme => BlocTheme().theme;

  int get displayModo => BlocTheme().modoDisplay;

  Size get size => BlocTheme().size;

  double get sizeDrawer => BlocTheme().sizeDrawer;

  set size(Size? sizeTmp) {
    BlocTheme().size = sizeTmp;
  }

  /// Section about navigation
  /// projector display controlers
  ///
  /// Interceptor for back button
  back() {
    BlocProvider().back();
  }

  ///
  ///
  set alert(Widget? alertWidget) {
    BlocProvider().alert = alertWidget;
  }

  generalAlert(String titulo, String mensaje, [IconData? icono]) {
    BlocProvider().generalAlert(titulo, mensaje, icono);
  }

  /// show or hide the drawer expanded section
  bool get drawerMenu => BlocProvider().drawerMenu;

  set drawerMenu(token) {
    BlocProvider().drawerMenu = token;
  }

  switchDrawer() {
    BlocProvider().drawerMenu = !BlocProvider().drawerMenu;
  }

  /// access to main menu items
  Map<String, MenuAppBarItem> get menuItems => BlocProvider().menuItems;

  Stream<Map<String, MenuAppBarItem>> get menuItemsStream =>
      BlocProvider().menuItemsStream;

  /// Access to secondary or bottom menu items
  Map<String, BotonAccionInferior> get actionButtons =>
      BlocProvider().actionButtons;

  bool areButtonsIntoBottomMenu() {
    bool answer = actionButtons.isNotEmpty;
    return answer;
  }

  Stream<Map<String, BotonAccionInferior>?> get actionButtonsStream =>
      BlocProvider().actionBottomStream;

  /// access to alert widget
  Stream<Widget?> get alertStream => BlocProvider().alertStream;

  /// Navigator log for one only activity projector
  Stream<Map<String, Widget>?> get navigatorMapStream =>
      BlocProvider().navigatorMapStream;

  /// Loading widget
  ///
  Stream<String?> get loadingStream => BlocProvider().loadingStream;

  bool get processLoad => BlocProvider().processLoad ?? false;

  set processLoad(bool token) {
    BlocProvider().processLoad = token;
  }

  String get loadingMessage => BlocProvider().loadingMessage ?? '';

  set loadingMessage(String? message) {
    BlocProvider().loadingMessage = message;
  }

  /// Widgets in a logic pile to remember the unique way to
  /// navigate
  List<String> get historial => BlocProvider().historial;

  reloadMenuItems() {
    BlocProvider().reloadMenuItems();
  }

  addPage(String nombrePagina, Widget pagina, [bool pop = false]) {
    BlocProvider().addPage(nombrePagina, pagina, pop);
  }

  /// widget portada
  Widget get cover => BlocProvider().cover;

  /// section Icon
  ///
  IconData returnIcondata(String iconFlavor) {
    return Helpers().returnIcondata(iconFlavor);
  }

  /// Section for security options
  /// check and make security options
  bool ckeckPolicyAccsess(String acceso) {
    return true;
  }
}
