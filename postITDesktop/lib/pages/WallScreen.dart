//import 'package:example_flutter/widgets/WidgetsPostIT.dart';
import 'package:example_flutter/classes/PostItClasses.dart';
import 'package:example_flutter/widgets/PostIt.dart';
import 'package:flutter/material.dart';

class WallScreen extends StatefulWidget {

  @override
  _WallScreenState createState() => _WallScreenState();
}

class _WallScreenState extends State<WallScreen> {
  NotesArea notesAero = NotesArea([Notes("teste de estático",[10,08,19],[15,08,19],0)], [Notes("teste dinâmico",[10,08,19],[15,08,19],1)], [Notes("teste dinâmico",[10,08,19],[15,08,19],1)]);
  List<Notes> notesCargas = [Notes("fazer asaaaa",[1,08,19],[11,08,19],1)];
  List<Notes> notesControle = [Notes("testar fuselagem",[9,08,19],[22,08,19],2)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Wall"),
      ),
      body: Wall([notesCargas,notesCargas,notesControle]),//Center(child: MyGrid(context)),
      backgroundColor: Colors.grey[700],
      //bottomNavigationBar: AddBottomBar(),
    );
  }
}
