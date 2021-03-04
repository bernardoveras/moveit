import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'message_widget.dart';

abstract class IMessageService {
  FutureOr<void> show(String message, BuildContext context,
      {int seconds = 400});
}

class MessageService implements IMessageService {
  @override
  FutureOr<void> show(
    String message,
    BuildContext context, {
    int seconds = 4000,
  }) async {
    return await _buildNotifier(message, context, seconds: seconds);
  }

  Future<void> _buildNotifier(String message, BuildContext context,
      {int seconds = 4000}) async {
    OverlayState overlayState = Overlay.of(context)!;
    OverlayEntry overlayEntry = OverlayEntry(builder: (_) {
      return MessageWidget(message);
    });
    overlayState.insert(overlayEntry);
    await Future.delayed(Duration(seconds: seconds + 1));
    overlayEntry.remove();
  }
}
