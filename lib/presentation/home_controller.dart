import 'dart:async';
import 'package:get/get.dart';
import 'package:moveit/shared/cycle_states.dart';
import 'package:moveit/shared/services/message_service.dart';

class HomeController extends GetxController {
  late IMessageService messageService;

  Worker? _ever;

  Rx<CycleState> _state = CycleState.Initial.obs;
  CycleState get state => _state.value!;
  set state(CycleState value) => _state.value = value;
  resetState() => _state.value = CycleState.Initial;

  RxInt _time = (25 * 60).obs;
  int get time => _time.value;
  set time(int value) => _time.value = value;
  resetTime() => _time.value = (25 * 60);

  @override
  void onInit() {
    super.onInit();
    messageService = Get.find<IMessageService>();
    _ever = everAll(
      [_state, _time],
      (value) {
        if (state == CycleState.Started && time > 0) {
          Future.delayed(const Duration(seconds: 1), () {
            time = time - 1;
          });
        } else if (state == CycleState.Initial && time > 0) {
          resetTime();
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
