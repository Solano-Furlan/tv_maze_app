import 'package:injectable/injectable.dart';
import 'package:tv_maze_app/core/event_bus/event_bus.service.dart';

@module
abstract class EventBusModule {
  @lazySingleton
  EventBus eventBus() => EventBus();
}
