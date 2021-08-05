import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Helpers {
  /// helpers multipurpose
  static final Helpers _helpers = Helpers._internal();

  factory Helpers() {
    return _helpers;
  }

  Helpers._internal() {
    print('test made for Albert J. Jiménez P.');
  }

  /// [validateUrl] checks if the url has a correct format

  bool validateUrl(String url) {
    if (url == "") {
      return false;
    }
    Pattern pattern = r'^https?:\/\/[\w\-]+(\.[\w\-]+)+[/#?]?.*$';
    RegExp regExp = new RegExp(pattern as String);
    bool tmp = false;
    try {
      tmp = regExp.hasMatch(url);
    } catch (e) {}

    return tmp;
  }

  /// [validateEmail] checks true if email address have a correct format
  bool validateEmail(String email) {
    if (email == "") {
      return false;
    }
    Pattern pattern =
        r'^([a-z0-9-_.])+@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern as String);
    bool tmp = false;
    try {
      tmp = regExp.hasMatch(email);
    } catch (e) {}
    return tmp;
  }

  /// formating
  /// money format
  /// Devolver formato moneda
  String returnMoneyFormat(String valor) {
    String moneda = "\$";
    String numero = "";
    int? tmp = double.tryParse(valor)?.toInt();
    if (tmp == null) {
      return '\$0';
    }
    final number = valor.split('.');
    final decimals = number[1];
    final integer = number[0];
    int check = 0;
    for (int i = integer.length - 1; i >= 0; i--) {
      if (check != 0) {
        if (check % 6 == 0) {
          numero = "'" + numero;
        } else if (check % 3 == 0) {
          numero = "." + numero;
        }
      }

      check++;
      numero = integer[i] + numero;
    }
    return moneda + numero + ',' + decimals;
  }

  /// Icon data
  /// returns icondata
  IconData returnIcondata(String iconFlavor) {
    iconFlavor = iconFlavor.toLowerCase();
    IconData icono = FontAwesomeIcons.question;
    if (kIcons.containsKey(iconFlavor)) {
      final tmp = kIcons[iconFlavor];
      if (tmp is IconData) {
        icono = tmp;
      }
    }
    return icono;
  }

  /// Categoria
  final Map<String, IconData> kIcons = {
    'megusta': FontAwesomeIcons.solidHeart,
    'nomegusta': FontAwesomeIcons.heart,
    'alimentos': FontAwesomeIcons.shoppingCart,
    'version': FontAwesomeIcons.codeBranch,
    'home': FontAwesomeIcons.home,
    'qr': FontAwesomeIcons.qrcode,
    'calendario': FontAwesomeIcons.calendar,
    'activo': FontAwesomeIcons.check,
    'inactivo': FontAwesomeIcons.timesCircle,
    'pantalla': FontAwesomeIcons.desktop,
    'configuracion': FontAwesomeIcons.cog,
    'login': FontAwesomeIcons.signInAlt,
    'password': FontAwesomeIcons.fingerprint,
    'codigobarras': FontAwesomeIcons.barcode,
    'tabla': FontAwesomeIcons.table,
    'imprimir': FontAwesomeIcons.print,
    'fila': FontAwesomeIcons.database,
    'pintar': FontAwesomeIcons.palette,
    'pdf': FontAwesomeIcons.filePdf,
    'musica': FontAwesomeIcons.music,
    'vibrar': FontAwesomeIcons.water,
    'antojos': FontAwesomeIcons.cookieBite,
    'asistencia': FontAwesomeIcons.userShield,
    'atencion': FontAwesomeIcons.businessTime,
    'boutique': FontAwesomeIcons.tshirt,
    'casa': FontAwesomeIcons.home,
    'clasificados': FontAwesomeIcons.newspaper,
    'comidas': FontAwesomeIcons.utensils,
    'domicilios': FontAwesomeIcons.biking,
    'edificio': FontAwesomeIcons.building,
    'farmacia': FontAwesomeIcons.clinicMedical,
    'fastfood': FontAwesomeIcons.hamburger,
    'ferreteria': FontAwesomeIcons.screwdriver,
    'general': FontAwesomeIcons.whmcs,
    'helados': FontAwesomeIcons.iceCream,
    'libreria': FontAwesomeIcons.book,
    'licores': FontAwesomeIcons.glassMartiniAlt,
    'mandados': FontAwesomeIcons.parachuteBox,
    'map': FontAwesomeIcons.mapMarkedAlt,
    'mascotas': FontAwesomeIcons.paw,
    'mercado': FontAwesomeIcons.shoppingBasket,
    'muebles': FontAwesomeIcons.couch,
    'pan': FontAwesomeIcons.breadSlice,
    'bebes': FontAwesomeIcons.babyCarriage,
    'pasteleria': FontAwesomeIcons.birthdayCake,
    'regalos': FontAwesomeIcons.gift,
    'tecnologia': FontAwesomeIcons.laptop,
    'tutorial': FontAwesomeIcons.chalkboardTeacher,
    'laboratorio': FontAwesomeIcons.flask,
// pagos
    'android': FontAwesomeIcons.google,
    'apple': FontAwesomeIcons.apple,
    'tarjeta': FontAwesomeIcons.solidCreditCard,
// Iconos relevantes a funcionamientos
    'salir': FontAwesomeIcons.signOutAlt,
    'perfil': FontAwesomeIcons.user,
    'scanqr': FontAwesomeIcons.qrcode,
    'calificacion1': FontAwesomeIcons.grinStars,
    'calificacion2': FontAwesomeIcons.grinBeam,
    'calificacion3': FontAwesomeIcons.tired,
    'llamar': FontAwesomeIcons.phoneAlt,
    'store': FontAwesomeIcons.store,
    'tienda': FontAwesomeIcons.store,
    'guardar': FontAwesomeIcons.save,
    'web': FontAwesomeIcons.globe,
    'usuario': FontAwesomeIcons.user,
    'direccion': FontAwesomeIcons.locationArrow,
    'telefono': FontAwesomeIcons.phoneAlt,
    'editar': FontAwesomeIcons.edit,
    'foto': FontAwesomeIcons.cameraRetro,
    'play': FontAwesomeIcons.play,
    'stop': FontAwesomeIcons.stop,
    'producto': FontAwesomeIcons.boxOpen,
    'money': FontAwesomeIcons.moneyBill,
    'agregar': FontAwesomeIcons.plus,
    'quitar': FontAwesomeIcons.minus,
    'archivo': FontAwesomeIcons.cloudUploadAlt,
    'buscar': FontAwesomeIcons.search,
    'mensajeria': FontAwesomeIcons.biking,
    'chat': FontAwesomeIcons.comment,
    'carrito': FontAwesomeIcons.shoppingCart,
    'borrar': FontAwesomeIcons.trash,
    'lista': FontAwesomeIcons.listUl,
    'listaord': FontAwesomeIcons.listOl,
    'whatsapp': FontAwesomeIcons.whatsapp,
    'oficina': FontAwesomeIcons.coffee,
    'fecha': FontAwesomeIcons.calendar,
    'error': Icons.error,
    'go': Icons.arrow_forward_ios,
    'godown': Icons.keyboard_arrow_down,
    // Mensajería
    'mapa': FontAwesomeIcons.locationArrow,
    'reloj': FontAwesomeIcons.clock,
    'moneda': FontAwesomeIcons.moneyBillAlt,
    'peso': FontAwesomeIcons.weightHanging,
    'volumen': FontAwesomeIcons.box,
    // horarios
    'horario': FontAwesomeIcons.calendar,
    // vehiculos
    'vehiculo': FontAwesomeIcons.car,
    'combustible': FontAwesomeIcons.gasPump,
    'velocidad': FontAwesomeIcons.tachometerAlt,
    'texto': FontAwesomeIcons.clipboardList,
    'energiaCompleta': FontAwesomeIcons.batteryFull,
    'energiaTresCuartos': FontAwesomeIcons.batteryThreeQuarters,
    'energiaMitad': FontAwesomeIcons.batteryHalf,
    'energiaUnCuarto': FontAwesomeIcons.batteryQuarter,
    'energiaVacia': FontAwesomeIcons.batteryEmpty,
    'conectado': FontAwesomeIcons.plug,
    'nitro': FontAwesomeIcons.burn,
    'pintura': FontAwesomeIcons.sprayCan,
    'firma': FontAwesomeIcons.sign,
    'portapapeles': FontAwesomeIcons.clipboard,
    'portapapelesok': FontAwesomeIcons.clipboardCheck,
    'compartir': FontAwesomeIcons.shareAlt,
    'adelante': Icons.arrow_forward_ios,
    'atras': FontAwesomeIcons.history,
    'asc': FontAwesomeIcons.angleDoubleDown,
    'desc': FontAwesomeIcons.angleDoubleUp,
    'email': FontAwesomeIcons.envelope,
    'id': FontAwesomeIcons.idCard,
    'planes': FontAwesomeIcons.paperPlane,
  };
}
