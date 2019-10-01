import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:example_flutter/classes/PostItClasses.dart';

//import 'package:intl/intl.dart';
class Wall extends StatelessWidget {
  List<List<Notes>> notesEquipe;
  Wall(this.notesEquipe);

  int proportion = 12;
  var now = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return layoutVertical(context);
  }

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
                children: _etapasPostit(context: context,size: mySize),
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
                          children: _equipesPostit(context: context,size: mySize)),
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
                                    child: listStack(index),
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
                    children: _equipesPostit(context: context,size: mySize,type: true)) //_etapasPostit(context, mySize),
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
                          children: _etapasPostit(context: context,size: mySize,type: true)),
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
                                    child: listStack(index),
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

  Widget listStack(int equipe) {
    return Stack(
      fit: StackFit.expand,
      children: listBuilder(notesEquipe[equipe], 40),
    );
  }

  List<Widget> listBuilder(List<Notes> equipe, double dist) {
    return List<Widget>.generate(equipe.length, (int i) {
      return Positioned.fill(
        top: dist * i,
        child: _postit(equipe[i].color, equipe[i].text, equipe[i].date,
            equipe[i].deadline),
      );
    });
  }

  Widget _postit(int color, text, List<int> date, List<int> deadline) {
    //print(now.day.toDouble().toString());
    return Container(
      decoration: BoxDecoration(
          color: (color == 0
              ? Colors.yellow[300]
              : (color == 1 ? Colors.red[300] : Colors.green[300])),
          border: new Border.all(color: Colors.grey[500], width: 5),
          borderRadius: BorderRadius.all(Radius.circular(13))),
      child: Stack(
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
                  max: deadline[0].toDouble() - date[0].toDouble(),
                  min: 0,
                  onChanged: (double value) {},
                  value: (deadline[0].toDouble() - now.day.toDouble() < 0
                      ? (deadline[0].toDouble() - date[0].toDouble())
                      : (now.day.toDouble() - date[0].toDouble())),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              deadline[0].toString() +
                  "/" +
                  deadline[1].toString() +
                  "/" +
                  deadline[2].toString(),
              style: TextStyle(color: Colors.grey[500]),
            ),
          ),
        ],
      ),
      //alignment: Alignment.topLeft,
      //padding: EdgeInsets.all(5),
    );
  }

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
