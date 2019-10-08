//import 'package:example_flutter/widgets/WidgetsPostIT.dart';
import 'package:overIt/classes/PostItClasses.dart';
import 'package:overIt/widgets/PostIt.dart';
import 'package:flutter/material.dart';

class WallScreen extends StatefulWidget {
  @override
  _WallScreenState createState() => _WallScreenState();
}

class _WallScreenState extends State<WallScreen> {
  NotesArea notesAero = NotesArea([
    Note(
        "teste de estático", DateTime(2019, 08, 10), DateTime(2019, 08, 15), null)
  ], [
    Note("teste dinâmico", DateTime(2019, 08, 10), DateTime(2019, 08, 15), null)
  ], [
    Note("teste dinâmico", DateTime(2019, 08, 10), DateTime(2019, 08, 15), null)
  ]);
  List<Note> notesCargas = [
    Note("fazer asa direita", DateTime(2019, 08, 1), DateTime(2019, 08, 11), null),
    Note("cronograma de eletrica", DateTime(2019, 08, 1), DateTime(2019, 10, 22), null),
    Note("pesar cargas", DateTime(2019, 08, 1), DateTime(2019, 10, 31), null),
    Note("cronograma geral", DateTime(2019, 10, 1), DateTime(2019, 10, 31), null)
  ];
  List<Note> notesControle = [
    Note("testar fuselagem", DateTime(2019, 08, 9), DateTime(2019, 10, 15), null)
  ];

  List<Note> notesTI = [
    Note("testar fuselagem", DateTime(2019, 08, 9), DateTime(2019, 10, 22), DateTime(2019, 08, 12))
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Wall"),
      ),
      body: Wall([
        notesCargas,
        notesControle,
        notesTI
      ]), //Center(child: MyGrid(context)),
      backgroundColor: Colors.grey[700],
      //bottomNavigationBar: AddBottomBar(),
    );
  }
}
