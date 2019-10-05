import 'package:flutter/material.dart';

class PostIt {
  List<String> notesList;
  PostIt({@required this.notesList});
  Widget wGrid;

  List<Widget> getPostItList(int i) =>
      List<Widget>.generate(notesList.length, (int i) {
        return postIt5(notesList[i]);
      });

  Widget wGridGet(context, index) => Center(
        child: WidgetGrid(context, index, getPostItList(notesList.length)),
      );
}

Widget AddBottomBar() {
  return BottomAppBar(
    child: Container(
      height: 50,
      child: IconButton(
        icon: Icon(Icons.add_box),
        onPressed: () {
          print("a");
        },
      ),
      color: Colors.blueAccent,
      alignment: Alignment.centerRight,
    ),
  );
}

Widget MyGrid(context) {
  return GridView.count(
    crossAxisCount: 4,
    children: List.generate(12, (index) {
      PostIt postIt = PostIt(notesList: ["oi", "será?", "ok"]);
      return Center(
        //child: WidgetGrid(context, index,postIt.getPostItList(index)),
        child: postIt.wGridGet(context, index),
      );
    }),
  );
}

Widget WidgetGrid(context, i, List<Widget> listWidget) {
  var w;
  if (i == 0) {
    w = Container(
      color: Colors.transparent,
    );
    return w;
  } else if (i < 4 && i != 0) {
    w = GridTile(
      child: new Card(
        color: Colors.pink,
        child: Center(
          child: Text(
            'Tipo $i',
            style: Theme.of(context).textTheme.headline,
          ),
        ),
      ),
    );
    return w;
  } else if (i % 4 == 0) {
    w = GridTile(
      child: new Card(
        color: Colors.green,
        child: Center(
          child: Text(
            'Área $i',
            style: Theme.of(context).textTheme.headline,
          ),
        ),
      ),
    );
    return w;
  } else {
    w = GridTile(
      child: new Card(
          //color: Colors.blue,
          //color: Colors.transparent,
          child: Align(
              alignment: Alignment.topCenter,
              child: lista(
                  listWidget)) //listGridPostIt(listWidget)), //postIt(context, 'Lembrete tal:  $i')),
          ),
    );
  }
  return InkWell(
    child: w,
    onTap: () {
      showDialog(
          builder: (BuildContext context) => ListPostIDialog(
                list: listWidget,
              ),
          context: context);
    },
    hoverColor: Colors.red,
    highlightColor: Colors.blueAccent,
  );
}

String textTodate(String day, String month, String year) {
  return day + "/" + month + "/" + year;
}

///Classe dialog da lista de postits de um grupo
class ListPostIDialog extends StatelessWidget {
  final List<Widget> list;

  ListPostIDialog({
    @required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        /*shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),*/
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child:
            BeutifuldialogContent(context, list) //dialogContent(context, list),
        );
  }

  Widget BeutifuldialogContent(context, list) {
    return new Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 1200,
          height: 200,
          color: Colors.green,
          child: new ListView(
            children: list,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.add_box),
                onPressed: () {
                  showDialog(
                      builder: (BuildContext context) => PostItDialog(),
                      context: context);
                },
              )
            ],
          ),
        )
      ],
    );
  }

  Widget dialogContent(context, list) {
    return new Container(
      child: Column(
        children: <Widget>[
          Center(
            child: ListView(
              children: list,
              shrinkWrap: true,
            ),
          )
        ],
      ),
    );
  }
}

///Classe para criação de novos postits
class PostItDialog extends StatelessWidget {
  //final List<Widget> list;

  //PostIDialog({
  //@required this.list,
  //});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        /*shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),*/
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: postItDialogContent(context) //dialogContent(context, list),
        );
  }

  Widget postItDialogContent(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          decoration: BoxDecoration(
              border: new Border.all(width: 2, color: Colors.black),
              //shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.yellow),
          child: TextField(),
          padding: EdgeInsets.all(20),
          alignment: Alignment.topCenter,
          //color: Colors.yellow,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new IconButton(
                icon: Icon(Icons.indeterminate_check_box, color: Colors.green),
                onPressed: () {},
              ),
              new IconButton(
                icon: Icon(Icons.indeterminate_check_box, color: Colors.yellow),
                onPressed: () {},
              ),
              new IconButton(
                icon: Icon(Icons.indeterminate_check_box, color: Colors.red),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: new IconButton(
            icon: Icon(Icons.check_box),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}

Widget listGridPostIt(List<Widget> list) {
  //List<Widget> wl => return
  List<Widget> listWidget = List<Widget>.generate(list.length, (int i) {
    return Positioned(
      child: Align(
        child: list[i],
        //alignment: Alignment.topCenter,
        alignment: Alignment(0, -1.0 + 4 * i),
      ), //postIt2(list[i]), //postIt(list[i]),
      //top: 50.0 * i,
      //left: 20.0 * i,
      //bottom: 10,
    );
  });

  return new Stack(
    //fit: StackFit.expand,
    children: listWidget,
  );
}

Widget lista(List<Widget> l) {
  return ListView(
    children: l,
    shrinkWrap: true,
  );
}

Widget postIt5(text) {
  return Container(
    //color: Colors.blue[100],
    decoration: BoxDecoration(
      color: Colors.blue[100],
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    //border: new Border.all(width: 0), color: Colors.blue[900]),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: new AssetImage('assets/blackline.png'),
                  fit: BoxFit.fitWidth)),
          child: Align(
            child: Icon(
              Icons.arrow_drop_down_circle,
              color: Colors.green,
            ),
            alignment: Alignment(0.5, 0),
          ),
        ),
        Text(text)
      ],
    ),
  );
}

Widget teste(text) {
  return Text(text);
}

Widget postIt4(text) {
  return LayoutBuilder(
    builder: (context, size) {
      return Container(
        decoration: BoxDecoration(
            border: new Border.all(width: 2, color: Colors.black),
            color: Colors.blue[900]),
        //color: Colors.blue[900],
        width: size.maxWidth * .9,
        height: size.maxHeight * .9,
        //width: 100,
        //height: 100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Slider(
              max: 10,
              onChanged: (double value) {},
              value: 1,
            ),
            Text(text)
          ],
        ),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 0),
      );
    },
  );
}

Widget postIt3(text) {
  return LayoutBuilder(
    builder: (context, size) {
      var imgSize = size.maxHeight * .9;
      return Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Align(
            alignment: Alignment(0, -1),
            child: Container(
              color: Colors.blue[900],
              width: imgSize * .9,
              height: imgSize * .9,
            ),
          ),
          Align(
            alignment: Alignment(0, 0),
            child: Container(
              color: Colors.blue[800],
              width: imgSize,
              height: imgSize,
            ),
          ),
          Align(
            alignment: Alignment(0, 1),
            child: Container(
              color: Colors.blue,
              width: double.infinity,
              height: imgSize,
            ),
          ),
        ],
      );
    },
  );
  return FractionallySizedBox(
      //heightFactor: 0.5,
      //widthFactor: 0.75,
      alignment: Alignment.topCenter,
      child: Container(
        //constraints: BoxConstraints.tightFor(height: 100, width: 100),
        //constraints: BoxConstraints.expand(),
        //constraints: BoxConstraints.loose(Size(200,200)),
        decoration: BoxDecoration(
            border: new Border.all(width: 2, color: Colors.black),
            //shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.yellow),
        child: Text(text),
        padding: EdgeInsets.all(20),
        alignment: Alignment.topCenter,
        //color: Colors.yellow,
      ));
}

Widget postIt2(text) {
  return Container(
    child: Text(text),
    alignment: Alignment.topCenter,
    padding: EdgeInsets.only(top: 30),
    //color: Colors.yellow,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/postit.png'), fit: BoxFit.fill)),

    width: 150,
    height: 150,
    //constraints: BoxConstraints.loose(Size.square(20)),
  );
}

Widget postIt(String text) {
  return new Stack(
    children: <Widget>[
      Image.asset(
        'assets/postit.png',
      ),
      /*Text(
        text,
        //style: Theme.of(context).textTheme.headline,
      )*/
    ],
  );
}
