class Notes{
  String text;
  ///primeira posição ano, segunda posição mês, terceira posição dia
  DateTime date;
  ///primeira posição ano, segunda posição mês, terceira posição dia
  DateTime deadline;
  ///0 para amarelo, 1 para vemelho, 2 para verde
  int color;
  Notes(this.text,this.date,this.deadline,this.color);
}

class NotesArea{
  List<Notes> feito;
  List<Notes> fazendo;
  List<Notes> afazer;
  NotesArea(this.feito,this.fazendo,this.afazer);
}