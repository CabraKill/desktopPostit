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
    Notes(
        "teste de estático", DateTime(2019, 08, 10), DateTime(2019, 08, 15), null)
  ], [
    Notes("teste dinâmico", DateTime(2019, 08, 10), DateTime(2019, 08, 15), null)
  ], [
    Notes("teste dinâmico", DateTime(2019, 08, 10), DateTime(2019, 08, 15), null)
  ]);
  List<Notes> notesCargas = [
    Notes("fazer asaaaa", DateTime(2019, 08, 1), DateTime(2019, 08, 11), null),
    Notes("fazer cronograma", DateTime(2019, 08, 1), DateTime(2019, 08, 11), null),
    Notes("fazer cronograma", DateTime(2019, 08, 1), DateTime(2019, 08, 11), null),
    Notes("fazer cronograma", DateTime(2019, 08, 1), DateTime(2019, 08, 11), null)
  ];
  List<Notes> notesControle = [
    Notes("testar fuselagem", DateTime(2019, 08, 9), DateTime(2019, 10, 22), null)
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
