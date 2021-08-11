import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../config.dart';
import '../models/model_version.dart';
import '../pages/home_page.dart';
import '../widgets/action_bottom_button_widget.dart';
import '../widgets/alert_widget.dart';
import '../widgets/menu_app_bar_widget.dart';

class BlocProvider {
  /// [drawerMenu] permite saber si el menu esta expandido
  /// o contraido
  bool drawerMenu = false;

  /// [showMenu] permite mostrar u ocultar el menú
  bool showMenu = true;

  /// [cover] Contiene el widget que se muestra en la parte frontal del
  /// menu desplegable
  Widget _cover = Image.asset('assets/logo.png');

  set cover(Widget tmp) {
    _cover = tmp;
    menuItems = menuItems;
  }

  Widget get cover => _cover;



  // usamos el patron singleton para mantener la información completa del provider
  static final BlocProvider _blocProvider = BlocProvider._internal();

  /// Zona de controladores
  final _navigatorController = BehaviorSubject<Map<String, Widget>?>();
  final _loadingMessageController = BehaviorSubject<String?>();
  final _menuController = BehaviorSubject<Map<String, MenuAppBarItem>>();
  final _bottomMenuController =
      BehaviorSubject<Map<String, BotonAccionInferior>?>();
  final _alertController = BehaviorSubject<Widget?>();
  final _versionController = BehaviorSubject<ModelVersion?>();

  List<String> historial = [];

  addToHistory(String clave) {
    List<String> listaTmp = [];
    if (historial.length > 0) {
      historial.forEach((pagina) {
        if (pagina != clave) {
          listaTmp.add(pagina);
        }
      });
    }
    listaTmp.add(clave);
    historial = listaTmp;
  }

  removeFromHistory(String clave) {
    historial.remove(clave);
  }

  /// setters para los controladores
  set navigatorMap(Map<String, Widget>? mapaNavegacionTmp) {
    if (mapaNavegacionTmp == null) {
      final Map<String, Widget> tmp = new Map();
      historial = ["home"];
      tmp["home"] = HomePage();
      mapaNavegacionTmp = tmp;
    }
    _navigatorController.sink.add(mapaNavegacionTmp);
  }

  mostrarMenuSuperior([bool mostrar = true]) {
    showMenu = mostrar;
    menuItems = menuItems;
  }

  /// [menuItems] guarda el menu para la barra de applicacion
  set menuItems(Map<String, MenuAppBarItem>? menuItems) {
    if (menuItems == null) {
      menuItems = {};
    }
    _menuController.sink.add(menuItems);
  }

  reloadMenuItems() {
    menuItems = menuItems;
  }

  /// [loadingMessage] muestra la pagina de procesamiento
  /// para la pantalla de carga
  set loadingMessage(String? mensajeCarga) {
    _loadingMessageController.sink.add(mensajeCarga);
  }

  Future<void> cargando2(String mensajeCarga) async {
    loadingMessage = mensajeCarga;
    await Future.delayed(Duration(milliseconds: 500));
    return;
  }

  /// [alert] muestra el mensaje de alerta
  /// para la ventana de alerta de acuerdo a la aplicacion realizada
  set alert(Widget? alertaWidget) {
    _alertController.sink.add(alertaWidget);
  }

  set actionButtons(Map<String, BotonAccionInferior>? botoneraInf) {
    if (botoneraInf == null) {
      botoneraInf = {};
    }
    _bottomMenuController.sink.add(botoneraInf);
  }

  /// getters de los controladores
  Map<String, Widget>? get navigatorMap => (_navigatorController.value == null
      ? {"home", HomePage()}
      : _navigatorController.value) as Map<String, Widget>?;

  Map<String, MenuAppBarItem> get menuItems => _menuItems() ?? {};

  Map<String, MenuAppBarItem>? _menuItems() {
    if (_menuController.valueOrNull != null) {
      return _menuController.valueOrNull;
    }
    return {};
  }

  Map<String, BotonAccionInferior> get actionButtons => _botonesAccion();

  Map<String, BotonAccionInferior> _botonesAccion() {
    if (_bottomMenuController.valueOrNull != null) {
      return _bottomMenuController.value!;
    }
    return {};
  }

  String? get loadingMessage => _cargandoCtrl();

  String? _cargandoCtrl() {
    if (_loadingMessageController.valueOrNull != null) {
      return _loadingMessageController.valueOrNull;
    }
    return '';
  }

  Widget? get alert => _alertController.valueOrNull;

  /// streams
  Stream<Map<String, Widget>?> get navigatorMapStream =>
      _navigatorController.stream;

  Stream<Map<String, MenuAppBarItem>> get menuItemsStream =>
      _menuController.stream;

  Stream<String?> get loadingStream => _loadingMessageController.stream;

  Stream<Widget?> get alertStream => _alertController.stream;

  Stream<Map<String, BotonAccionInferior>?> get actionBottomStream =>
      _bottomMenuController.stream;

  addPage(String nombrePagina, Widget pagina, [bool pop = false]) {
    /// se agrega la pagina a la ruta de navegacion impidiendo que se duplique el widget
    if (pop) {
      removePage(historial.last);
    }
    this.navigatorMap![nombrePagina] = pagina;
    addToHistory(nombrePagina);
    this.navigatorMap = this.navigatorMap;
    showMenu = true;
    clearBottomMenu();
  }

  removePage(String clave) {
    /// se agrega la pagina a la ruta de navegacion impidiendo que se duplique el widget
    this.navigatorMap!.remove(clave);
    removeFromHistory(clave);
    this.navigatorMap = this.navigatorMap;
  }

  /// limpiar mapaNavegacion
  clearNavigatorMap() {
    navigatorMap = null;
  }

  clearrMenu() {
    menuItems = {};
  }

  clearBottomMenu() {
    actionButtons = {};
  }

  addBottomButton(String key, BotonAccionInferior botonAccionInferior) {
    /// se agrega el boton y se evita que se duplique el widget
    Map<String, BotonAccionInferior> botoneraTmp = actionButtons;
    botoneraTmp[key] = botonAccionInferior;
    actionButtons = botoneraTmp;
  }

  removeBottomButton(String key) {
    /// remove the wigdget
    Map<String, BotonAccionInferior> botoneraTmp = actionButtons;
    botoneraTmp.remove(key);
    actionButtons = botoneraTmp;
  }

  agregarMenuItem(String key, MenuAppBarItem item) {
    /// se agrega la pagina a la ruta de navegacion impidiendo que se duplique el widget
    Map<String, MenuAppBarItem> menuItemTmp = menuItems;

    /// Evitamos paginas duplicadas en el stack

    menuItemTmp[key] = item;
    this.menuItems = menuItems;

    /// guardamos el estado de la app
    // guardarEstadoApp();
  }

  eliminarMenuItem(String key) {
    Map<String, MenuAppBarItem> menuItemTmp = menuItems;
    menuItemTmp.remove(key);
    menuItems = menuItemTmp;
  }

  generalAlert(String titulo, String mensaje, [IconData? icono]) {
    alert = AlertWidget(
      title: titulo,
      contentWidget: Container(
        alignment: Alignment.center,
        child: AutoSizeText(mensaje),
      ),
      iconTitle: icono,
    );
  }

  final Map<String, Function> backFunction = {};

  agregarFuncionesAtras(String key, Function funcion) {
    backFunction[key] = funcion;
  }

  removerFuncionesAtras(String key) {
    backFunction.remove(key);
  }

  Future<bool> back() async{
    if (loadingMessage != '') {
      return false;
    }

    if (alert != null) {
      alert = null;
      return false;
    }

    removePage(historial.last);
    clearBottomMenu();
    return false;
  }

  factory BlocProvider() {
    return _blocProvider;
  }

  BlocProvider._internal() {
    init();
  }

  void init() {
    // inicializamos la clase aqui
    navigatorMap = null;
    menuItems = {};
    loadingMessage = '';
    _suscribirVersion();
  }

  // Aqui vamos a agregar las cosas relacionadas con la aplicacion

  /// sistema de versiones
  dispose() {
    _navigatorController.close();
    _menuController.close();
    _loadingMessageController.close();
    _bottomMenuController.close();
    _alertController.close();
    _versionController.close();

    /// Subscripciones
    _version?.cancel();
  }

  /// para el procesador de carga
  bool? processLoad = false;
  StreamSubscription? _version;

  _suscribirVersion() {
    /// TODO: generar verificacion de version online para la app
  }

  bool actualizar() {
    bool tmp = false;
    if (modeloVersion != null) {
      if (modeloVersion!.versionApp > Config().kVersion.versionApp) {
        tmp = true;
      }
    }
    return tmp;
  }

  set modelVersion(ModelVersion? modeloVersionTmp) {
    _versionController.sink.add(modeloVersionTmp);
  }

  ModelVersion? get modeloVersion => _versionController.value;

  Stream<ModelVersion?> get modeloVersionStream => _versionController.stream;

  /// [guardarEstadoApp] guarda el estado actual de la app para
  /// re-activar en el lugar que estabamos
  guardarEstadoApp() async {}
}
