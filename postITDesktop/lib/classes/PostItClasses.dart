class Note{
  String text;
  ///primeira posição ano, segunda posição mês, terceira posição dia
  DateTime date;
  ///primeira posição ano, segunda posição mês, terceira posição dia
  DateTime deadline;
  ///primeira posição ano, segunda posição mês, terceira posição dia
  DateTime done;
  ///0 para amarelo, 1 para vemelho, 2 para verde
  //int color;
  //color no longer used since the math works inside the postit
  Note(this.text,this.date,this.deadline,this.done);
}

class NotesArea{
  List<Note> feito;
  List<Note> fazendo;
  List<Note> afazer;
  NotesArea(this.feito,this.fazendo,this.afazer);
}