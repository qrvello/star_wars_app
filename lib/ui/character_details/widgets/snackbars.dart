import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Snackbars {
  void successful() {
    Get.snackbar(
      'Acción exitosa',
      'Reporte de avisamiento subido correctamente',
      icon: Icon(
        Icons.check_circle_outline_rounded,
        color: Color(0xff25C0B7),
      ),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(20),
      backgroundColor: Color(0xff4a4e69).withOpacity(0.6),
    );
  }

  void error() {
    Get.snackbar(
      'Error',
      'Error al reportar el avistamiento',
      icon: Icon(
        Icons.error_outline_rounded,
        color: Color(0xffee6c4d),
      ),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(20),
      backgroundColor: Color(0xffee6c4d).withOpacity(0.5),
    );
  }
}
