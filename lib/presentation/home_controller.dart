import 'dart:js' as js;
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:moveit/domain/entities/user.dart';
import 'package:moveit/shared/cycle_states.dart';
import 'package:moveit/shared/services/message_service.dart';

class HomeController extends GetxController {
  late IMessageService messageService;

  Rx<User?>? user;

  List<int> get maxPoints => [
        120,
        360,
        1080,
        3240,
        9720,
        29160,
        87480,
        262440,
      ];

  Worker? _ever;

  Rx<CycleState> _state = CycleState.Initial.obs;
  CycleState get state => _state.value!;
  set state(CycleState value) => _state.value = value;
  resetState() => _state.value = CycleState.Initial;

  RxInt _time = (0 * 60).obs;
  int get time => _time.value;
  set time(int value) => _time.value = value;
  resetTime() => _time.value = (0 * 60);

  @override
  void onInit() {
    super.onInit();
    user = User(
      name: 'Bernardo Veras',
      photo: 'https://avatars.githubusercontent.com/u/56937988?v=4',
    ).obs;
    messageService = Get.find<IMessageService>();
    _ever = everAll(
      [_state, _time],
      (value) {
        if (state == CycleState.Started && time > 0) {
          Future.delayed(const Duration(seconds: 1), () {
            time = time - 1;
          });
        } else if (state == CycleState.Started && time == 0) {
          playAudioSuccess();
          state = CycleState.Finish;
        }
      },
    );
  }

  void completeChallenge() {
    user!.value!.points = user!.value!.points + (maxPoints[user!.value!.level] * 0.15) .toInt();
    if (user!.value!.points >= maxPoints[user!.value!.level])
      user!.value!.level = user!.value!.level + 1;
    user!.value!.completedChallenges = user!.value!.completedChallenges + 1;
    user!.value!.totalChallenges = user!.value!.totalChallenges + 1;
    user!.refresh();

    state = CycleState.Initial;
  }

  void playAudioSuccess() {
    if (kIsWeb) {
      js.context.callMethod('playAudio', ['assets/notification.mp3']);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _ever?.dispose();
  }
}
