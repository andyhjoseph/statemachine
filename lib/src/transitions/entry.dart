import '../callback.dart';
import '../transition.dart';

/// A callback that is triggered when the state activates.
class EntryTransition extends Transition {
  /// The callback to be evaluated when the state activates.
  final Callback0 callback;

  EntryTransition(this.callback);

  @override
  void activate() => callback();
}
