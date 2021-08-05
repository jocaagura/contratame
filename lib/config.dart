import 'models/model_version.dart';


class Config{
  /// usamos el patron singleton para las configuraciones de la clase
  /// Este archivo guarda las configuraciones básicas de la aplicacion
  /// para sus respectivas parametrizaciones iniciales globales
  static final Config _config = Config._internal();

  factory Config(){
    return _config;
  }
  Config._internal();

  /// [kVersion] permite llevar el control de la version y las actualizaciónes de
  /// la aplicacion conforme se van liberando al publico para mantener controlado
  /// en el usuario la version de la app que esta usando.

  final kVersion = ModelVersion(
    id: '2',
    versionApp: 1,
    version: "0.0.1",
    url: "https://jocaagura.com",
    nombre: "com.jocaagura.base_dev",
  );

  final String nombreTablaVersion = 'apps';

}