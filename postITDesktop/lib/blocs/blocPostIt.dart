import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:overIt/classes/PostItClasses.dart';
enum PostItEvent {update,add,remove}
/*
class CounterBloc extends Bloc<PostItEvent, List<Note>> {
  NotesArea notesAero = NotesArea([
    Note(
        "teste de estático", DateTime(2019, 08, 10), DateTime(2019, 08, 15), null)
  ], [
    Note("teste dinâmico", DateTime(2019, 08, 10), DateTime(2019, 08, 15), null)
  ], [
    Note("teste dinâmico", DateTime(2019, 08, 10), DateTime(2019, 08, 15), null)
  ]);

  //List<NotesArea> notesEquipe = [notesAero];
  @override
  List<NotesArea> get initialState => [];

  set addNote(Note n,int equipe){_sendNote = n;}

  @override
  Stream<List<NotesArea>> mapEventToState(PostItEvent event) async* {
    switch (event) {
      case PostItEvent.update:
        yield currentState ;
        break;
      case PostItEvent.increment:
        yield currentState ;
        break;
    }
  }
}*/