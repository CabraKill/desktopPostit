//import 'package:example_flutter/widgets/WidgetsPostIT.dart';
import 'package:example_flutter/classes/PostItClasses.dart';
import 'package:example_flutter/widgets/PostIt.dart';
import 'package:flutter/material.dart';

class WallScreen extends StatefulWidget {
  @override
  _WallScreenState createState() => _WallScreenState();
}

class _WallScreenState extends State<WallScreen> {
  NotesArea notesAero = NotesArea([
    Notes(
        "teste de estático", DateTime(2019, 08, 10), DateTime(2019, 08, 15), 0)
  ], [
    Notes("teste dinâmico", DateTime(2019, 08, 10), DateTime(2019, 08, 15), 1)
  ], [
    Notes("teste dinâmico", DateTime(2019, 08, 10), DateTime(2019, 08, 15), 1)
  ]);
  List<Notes> notesCargas = [
    Notes("fazer asaaaa", DateTime(2019, 08, 1), DateTime(2019, 08, 11), 1),
    Notes("fazer cronograma", DateTime(2019, 08, 1), DateTime(2019, 08, 11), 0),
    Notes("fazer cronograma", DateTime(2019, 08, 1), DateTime(2019, 08, 11), 0),
    Notes("fazer cronograma", DateTime(2019, 08, 1), DateTime(2019, 08, 11), 0)
  ];
  List<Notes> notesControle = [
    Notes("testar fuselagem", DateTime(2019, 08, 9), DateTime(2019, 10, 22), 2)
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
        notesControle
      ]), //Center(child: MyGrid(context)),
      backgroundColor: Colors.grey[700],
      //bottomNavigationBar: AddBottomBar(),
    );
  }
}
