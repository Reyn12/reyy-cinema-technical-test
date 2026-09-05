import 'package:event_bus/event_bus.dart';

class AppEventBus {
  AppEventBus._();

  static final EventBus instance = EventBus();
}
