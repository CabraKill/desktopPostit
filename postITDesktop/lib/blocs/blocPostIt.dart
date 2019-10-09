import 'package:bloc/bloc.dart';
import 'package:overIt/classes/PostItClasses.dart';
import 'dart:io';
void a(){
  bool i = Platform.i
}

/// Enumeração de eventos do bloc
enum EventType { update, add, remove }

/// Classe Evento para controlar o Bloc
class PostItEventt {
  PostItEventt({this.type, this.removeIt, this.addIt});

  /// Tipe de evento a ser realizado
  EventType type;

  /// PosIt para ser adiconado
  Note addIt;

  /// index do PostIt para ser retirado
  ///
  /// index 0 para a area
  /// index 1 para a note
  /// index 2 para o tipo da note
  List<int> removeIt = List(3);
  /// Configurar um update no bloc
  PostItEventt.update() {
    type = EventType.update;
  }
  /// Inicializar uma adição de PostIt
  PostItEventt.add({this.type = EventType.add, this.addIt});
  /// Inicializar uma remoção de PostIt
  PostItEventt.remove({this.type = EventType.remove, this.removeIt});
}

class CounterBloc extends Bloc<PostItEventt, List<NotesArea>> {
  NotesArea notesAero = NotesArea([
    Note("teste de estático", DateTime(2019, 08, 10), DateTime(2019, 08, 15),
        null)
  ], [
    Note("teste dinâmico", DateTime(2019, 08, 10), DateTime(2019, 08, 15), null)
  ], [
    Note("teste dinâmico", DateTime(2019, 08, 10), DateTime(2019, 08, 15), null)
  ]);

  
  @override
  List<NotesArea> get initialState => null;

  @override
  Stream<List<NotesArea>> mapEventToState(PostItEventt event) async* {
    switch (event.type) {
      case EventType.update:
        yield currentState;
        break;
      case EventType.add:
        yield currentState;
        break;
      case EventType.remove:
        List<NotesArea> a = currentState;
        //a[event.removeIt[0]].
        yield currentState;
        break;
    }
  }
}
