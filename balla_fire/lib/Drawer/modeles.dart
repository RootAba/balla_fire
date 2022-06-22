import 'package:flutter/material.dart';

class modeles extends StatefulWidget {
  const modeles({Key? key}) : super(key: key);

  @override
  _modelesState createState() => _modelesState();
}

class _modelesState extends State<modeles> {

  final List<String> assetNames = [
    'assets/sididia.jpg',
    'assets/model1.jpg',
    'assets/model2.jpg',
    'assets/model3.jpg',
    'assets/model4.jpg',
    'assets/sididia.jpg',

  ];

  EdgeInsets _edgeInsetsForIndex(int index) {
    if (index % 2 == 0) {
      return EdgeInsets.only(top: 4.0, left: 8.0, right: 4.0, bottom: 4.0);
    } else {
      return EdgeInsets.only(top: 4.0, left: 4.0, right: 8.0, bottom: 4.0);
    }
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      elevation: 5,
      backgroundColor: Colors.white70,
      title: Text('MODELES')
      //leading: new Container(),
    ),
    body:
    Container(
      child: CustomScrollView(
          slivers: <Widget> [
      //SliverList(delegate: )


  SliverGrid(
  delegate:
  SliverChildBuilderDelegate((BuildContext context, int index) {
  return Container(
  alignment: Alignment.center,
  padding: _edgeInsetsForIndex(index),
  child: InkWell(
  child : Image.asset(assetNames[index % assetNames.length]),
  onTap: () {
  /*Navigator.push(context,
  MaterialPageRoute(builder: (context) => cate4()));*/
  },
  ),

  );
  },
  childCount: 6,
  ),
  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
  maxCrossAxisExtent: 150.0,
  mainAxisSpacing: 0.0,
  crossAxisSpacing: 0.0,
  childAspectRatio: 0.75,
  )),
  ]
  )
  ),
  );
}
}