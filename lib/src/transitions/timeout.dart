import 'dart:async';

import '../callback.dart';
import '../transition.dart';

/// A transition that happens automatically after a certain duration elapsed.
class TimeoutTransition extends Transition {
  TimeoutTransition(this.duration, this.callback);

  /// The duration to wait before the timer triggers.
  final Duration duration;

  /// The callback to be evaluated when the timer triggers.
  final Callback0 callback;

  /// Time triggering after a timeout.
  Timer? _timer;

  /// The number of elapsed timer ticks since the transition was activated.
  int get tick => _timer?.tick ?? 0;

  @override
  void activate() {
    assert(_timer == null, 'timer must be null');
    _timer = Timer(duration, callback);
  }

  @override
  void deactivate() {
    _timer?.cancel();
    _timer = null;
  }
}
