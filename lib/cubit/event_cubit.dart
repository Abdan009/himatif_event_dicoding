import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:himatif_event_info/models/models.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventInitial());

  Future<void> getListEvent() async {
    emit(
      EventLoaded(listEvent: mockEvent),
    );
  }

  Future<void> addEvent(EventInfo event, File filePoster) async {
    emit(EventLoaded(listEvent: (state as EventLoaded).listEvent + [event]));
  }

  Future<void> updateEvent(EventInfo event, File filePoster) async {
    List<EventInfo> listEvent = (state as EventLoaded).listEvent.map((value) {
      if (event.id == value.id) {
        return event;
      } else {
        return value;
      }
    }).toList();

    emit(EventLoaded(listEvent: listEvent));
  }

  Future<void> deleteEvent(int id) async {
    final listEvent = (state as EventLoaded)
        .listEvent
        .where((element) => element.id != id)
        .toList();
    emit(
      EventLoaded(listEvent: listEvent),
    );
  }
}
