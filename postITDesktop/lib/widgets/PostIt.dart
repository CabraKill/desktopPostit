import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:overIt/classes/PostItClasses.dart';

import 'WidgetsPostIt.dart';

//import 'package:intl/intl.dart';
///Classe da pagina com a Wall responsiva dos PostIts
class Wall extends StatelessWidget {
  List<List<Notes>> notesEquipe;
  Wall(this.notesEquipe);

  ///Proporção de tamanho dos titulos de time e etapa
  int proportion = 12;
  DateTime now =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return layoutVertical(context);
  }

  ///Layout for a horizontal view
  Widget layoutHorizontal(context) {
    return LayoutBuilder(
      builder: (context, size) {
        double mySize =
            size.maxWidth < size.maxHeight ? size.maxWidth : size.maxHeight;
        mySize = mySize / proportion;
        return Column(
          children: <Widget>[
            new Container(
              height: mySize,
              color: Colors.purple[500],
              child: new Row(
                children: _etapasPostit(context: context, size: mySize),
              ),
            ),
            Flexible(
              flex: 5,
              child: Row(
                children: <Widget>[
                  new Container(
                    width: mySize,
                    child: Center(
                        child: RotatedBox(
                      quarterTurns: 3,
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children:
                              _equipesPostit(context: context, size: mySize)),
                    )),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      /*decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/hashtag.png"),
                          fit: BoxFit.cover,
                        ),
                      ),*/
                      child: LayoutBuilder(
                        builder: (context, constrains) {
                          double h = constrains.maxHeight / 6;
                          double w = constrains.maxWidth / 3;
                          return ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, int index) {
                              return new Row(
                                children: <Widget>[
                                  Container(
                                    width: w,
                                    height: h,
                                    //color: Colors.green,
                                    child: listStack(context, index),
                                  ),
                                  Container(
                                    width: w,
                                    height: h,
                                    //color: Colors.red,
                                  ),
                                  Container(
                                    width: w,
                                    height: h,
                                    //color: Colors.blue,
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  ///Layout for a horizontal view
  Widget layoutVertical(context) {
    return LayoutBuilder(
      builder: (context, size) {
        double mySize =
            size.maxWidth < size.maxHeight ? size.maxWidth : size.maxHeight;
        mySize = mySize / proportion;
        return Column(
          children: <Widget>[
            new Container(
                height: mySize,
                color: Colors.purple[500],
                child: new Row(
                    children: _equipesPostit(
                        context: context,
                        size: mySize,
                        type: true)) //_etapasPostit(context, mySize),
                ),
            Flexible(
              flex: 5,
              child: Row(
                children: <Widget>[
                  new Container(
                    width: mySize,
                    child: Center(
                        child: RotatedBox(
                      quarterTurns: 3,
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: _etapasPostit(
                              context: context, size: mySize, type: true)),
                    )),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      /*decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/hashtag.png"),
                          fit: BoxFit.cover,
                        ),
                      ),*/
                      child: LayoutBuilder(
                        builder: (context, constrains) {
                          double h = constrains.maxHeight / 3;
                          double w = constrains.maxWidth / 6;
                          return ListView.builder(
                            itemCount: 3,
                            itemBuilder: (context, int index) {
                              return new Row(
                                children: <Widget>[
                                  Container(
                                    width: w,
                                    height: h,
                                    //color: Colors.green,
                                    child: listStack(context, index),
                                  ),
                                  Container(
                                    width: w,
                                    height: h,
                                    //color: Colors.red,
                                  ),
                                  Container(
                                    width: w,
                                    height: h,
                                    //color: Colors.blue,
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  ///Cria o Stack com click dos postits espaçados
  Widget listStack(context, int equipe) {
    return InkWell(
        onTap: () {
          showDialog(
              builder: (BuildContext context) => ListPostIDialog(
                    list: List<Widget>.generate(notesEquipe[equipe].length,
                        (int i) {
                      return Container(
                          //color: Colors.red,
                          /*child: _postit(
                              notesEquipe[equipe][i].text,
                              notesEquipe[equipe][i].date,
                              notesEquipe[equipe][i].deadline,
                              notesEquipe[equipe][i].done)
                          */
                          //alignment: Alignment.center,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.pink,
                            border: new Border.all(
                                color: Colors.grey[500], width: 5),
                            borderRadius: BorderRadius.all(Radius.circular(13)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                      child: Container(
                                        alignment: Alignment.centerLeft,
                                    child: Slider(
                                      inactiveColor: Colors.black,
                                      max: notesEquipe[equipe][i]
                                          .deadline
                                          .difference(
                                              notesEquipe[equipe][i].date)
                                          .inDays
                                          .toDouble(),
                                      min: 0,
                                      onChanged: (double value) {},
                                      value: now.isAfter(
                                              notesEquipe[equipe][i].deadline)
                                          ? notesEquipe[equipe][i]
                                              .deadline
                                              .difference(
                                                  notesEquipe[equipe][i].date)
                                              .inDays
                                              .toDouble()
                                          : now
                                              .difference(
                                                  notesEquipe[equipe][i].date)
                                              .inDays
                                              .toDouble(),
                                    ),
                                  )),
                                  Text(textTodate(
                                      notesEquipe[equipe][i]
                                          .deadline
                                          .day
                                          .toString(),
                                      notesEquipe[equipe][i]
                                          .deadline
                                          .month
                                          .toString(),
                                      notesEquipe[equipe][i]
                                          .deadline
                                          .year
                                          .toString()))
                                ],
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                child: SingleChildScrollView(
                                  child: Text(
                                    notesEquipe[equipe][i].text,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.justify,
                                    maxLines: 9,
                                  ),
                                ),
                              )
                            ],
                          ));
                    }),
                  ),
              context: context);
        },
        child: Stack(
          fit: StackFit.expand,
          children: listBuilder(notesEquipe[equipe], 40),
        ));
  }

  ///Cria uma lista de widgets postIt espaçados
  List<Widget> listBuilder(List<Notes> equipe, double dist) {
    return List<Widget>.generate(equipe.length, (int i) {
      return Positioned.fill(
        top: dist * i,
        child: _postit(
            equipe[i].text, equipe[i].date, equipe[i].deadline, equipe[i].done),
      );
    });
  }

  ///Cria o postit responsivo com as informações
  Widget _postit(text, DateTime date, DateTime deadline, DateTime done) {
    //print(now.day.toDouble().toString());
    Color postitC = Colors.green[300];
    if (done != null) {
      postitC = Colors.green[300];

      if (DateTime.now().difference(deadline).inDays > 0) {
        postitC = Colors.red[300];
      } else if (deadline.difference(DateTime.now()).inDays <=
          (deadline.difference(date).inDays * 0.3).toInt())
        postitC = Colors.yellow[300];
    } else {
      if (DateTime.now().difference(deadline).inDays > 0) {
        postitC = Colors.red[300];
      } else if (deadline.difference(DateTime.now()).inDays <=
          (deadline.difference(date).inDays * 0.3).toInt())
        postitC = Colors.yellow[300];
    }

    return Container(
      decoration: BoxDecoration(
          border: new Border.all(color: Colors.grey[500], width: 5),
          borderRadius: BorderRadius.all(Radius.circular(13))),
      child: LayoutBuilder(
        builder: (context, constraints) {
          //print(constraints.maxHeight.toString() + ":" + text);
          if (constraints.maxHeight > 200)
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Positioned(
                  top: 15,
                  left: 5,
                  child: Text(text),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: FractionallySizedBox(
                    widthFactor: 0.45,
                    heightFactor: 0.08,
                    //height: 30,
                    //width: 195,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: Slider(
                        inactiveColor: Colors.black,
                        max: deadline.difference(date).inDays.toDouble(),
                        min: 0,
                        onChanged: (double value) {},
                        value: now.isAfter(deadline)
                            ? deadline.difference(date).inDays.toDouble()
                            : now.difference(date).inDays.toDouble(),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    deadline.day.toString() +
                        "/" +
                        deadline.month.toString() +
                        "/" +
                        deadline.year.toString(),
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
              ],
            );
          else
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Positioned(
                  top: 5,
                  left: 5,
                  child: Text(text),
                ),
              ],
            );
        },
      ),
      //alignment: Alignment.topLeft,
      //padding: EdgeInsets.all(5),
    );
  }

  ///Cria a lista responsiva em tamanho e orientação de widgets das Equipes
  List<Widget> _equipesPostit({context, double size, bool type = false}) {
    if (type)
      return [
        Container(
          width: size,
        ),
        textPostIt(context, "Aerod.", Colors.purple, 1),
        textPostIt(context, "Cargas.&Estr.", Colors.purple, 0),
        textPostIt(context, "Contr.&Estab", Colors.purple, 1),
        textPostIt(context, "P.Elétrico", Colors.purple, 0),
        textPostIt(context, "T.I.", Colors.purple, 1),
        textPostIt(context, "Marketing", Colors.purple, 0),
      ];
    else
      return [
        textPostIt(context, "Aerod.", Colors.purple, 1),
        textPostIt(context, "Cargas.&Estr.", Colors.purple, 0),
        textPostIt(context, "Contr.&Estab", Colors.purple, 1),
        textPostIt(context, "P.Elétrico", Colors.purple, 0),
        textPostIt(context, "T.I.", Colors.purple, 1),
        textPostIt(context, "Marketing", Colors.purple, 0),
      ];
  }

  ///Cria a lista responsiva em tamanho e orientação de widgets das Etapas
  List<Widget> _etapasPostit({context, double size, bool type = false}) {
    /**
   * Constructs a [DateTime] instance specified in the local time zone.
   *
   * For example,
   * to create a new DateTime object representing the 7th of September 2017,
   * 5:30pm
   *
   * ```
   * var dentistAppointment = new DateTime(2017, 9, 7, 17, 30);
   * ```
   */
    /// Retorna a lista de etapas de projeto
    /// modelo padrão para horizontal
    /// Faça type = true para vertical

    if (type)
      return [
        textPostIt(context, "A fazer", Colors.purple, 1),
        textPostIt(context, "Fazendo", Colors.purple, 0),
        textPostIt(context, "Feito", Colors.purple, 1),
      ];
    else
      return [
        Container(width: size),
        textPostIt(context, "A fazer", Colors.purple, 0),
        textPostIt(context, "Fazendo", Colors.purple, 1),
        textPostIt(context, "Feito", Colors.purple, 0),
      ];
  }

  ///Cria um texto Responsivo em tamanho
  Widget textPostIt(context, text, color, int c) {
    int cc = c == 0 ? 500 : 600;
    return Expanded(
      child: Container(
        //color: Colors.purple[500],
        height: double.infinity,
        width: double.infinity,
        child: FittedBox(
          child: Text(
            text,
            //textScaleFactor: 1.5,
            style: Theme.of(context).textTheme.headline,
          ),
        ),
        decoration: BoxDecoration(
            color: color[cc],
            borderRadius:
                BorderRadius.all(Radius.circular(0))), //default value 10
      ),
    );
  }
}
