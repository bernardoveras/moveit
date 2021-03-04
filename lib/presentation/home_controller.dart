import 'dart:async';

import 'package:get/get.dart';

class HomeController extends GetxController {
  Worker? _ever;

  RxBool _active = false.obs;
  bool get active => _active.value;
  set active(bool value) => _active.value = value;

  RxInt _time = (25 * 60).obs;
  int get time => _time.value;
  set time(int value) => _time.value = value;

  @override
  void onInit() {
    super.onInit();
    _ever = everAll(
      [_active, _time],
      (value) {
        if (active == true && time > 0) {
          Future.delayed(const Duration(seconds: 1), () {
            time = time - 1;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _ever?.dispose();
  }
}
