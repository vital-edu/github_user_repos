import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

Future<void> showNoConnectionToast({
  required BuildContext context,
  required String message,
}) async {
  await showFlash(
    context: context,
    duration: const Duration(seconds: 4),
    builder: (context, controller) {
      return Flash<Widget>.dialog(
        controller: controller,
        backgroundColor: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(8),
        margin: const EdgeInsets.all(8),
        barrierColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            message,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      );
    },
  );
}
