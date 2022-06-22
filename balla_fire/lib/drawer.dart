import 'Drawer/modeles.dart';
import 'Drawer/settings.dart';
import 'affichage.dart';
import 'home.dart';
import 'package:flutter/material.dart';

class MonDrawer extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 10);
  //const MonDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nom = 'balla';
    final prenom ="";
    final urlimage = AssetImage("assets/sididia.jpg");
    return Drawer(
      child: Material(
        color: Colors.blue,
        child: ListView(
          children: [
        /*    buildHeader(
              image:urlimage,
              //Image.asset('assets/sididia.jpg'),
              nom:nom,
              prenom:prenom,
              onClicked: () {  },
              //onClicked:()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)))
            ),*/
            const SizedBox(height: 48,),
            buildMenuItem(
              text:"Acceuil",
              icon:Icons.people,
              onClicked:() =>selectedItem(context,0),
            /*  {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Affichage()));
                //selectedItem(context,0)
              },*/
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text:"Les models",
              icon:Icons.list,
              onClicked:() =>selectedItem(context,1),
              /*{
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>homep()));
                //selectedItem(context,0)
              },*/
             // onClicked:() =>selectedItem(context,1),
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text:"Paramètres",
              icon:Icons.settings,
              onClicked:() =>selectedItem(context,2),
            ),
            const SizedBox(height: 24,),
            Divider(color:Colors.white70),
            const SizedBox(height: 24,),
            buildMenuItem(
              text:"A Propos",
              icon:Icons.list, onClicked:() =>selectedItem(context,3),

            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text:"Les tendances",
              icon:Icons.star,
              onClicked:() => selectedItem(context,4),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildHeader({
    required  image,
    required String nom,
    required String prenom,
    required VoidCallback onClicked,
  }) => InkWell(
    onTap: onClicked,
    child:Container(
      padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
      child: Row(
        children: [
          //  CircleAvatar(radius: 30,backgroundImage: Image.asset("assets/sididia.jpg"),)
        ],
      ),
    ) ,
  );
  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }){
    final color = Colors.white;
    final hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(icon,color:color),
      title: Text(text,style: TextStyle(color:color),),
      hoverColor: hoverColor,
      onTap: onClicked ,
    );
  }
  void selectedItem(BuildContext context,int index){
    Navigator.of(context).pop();
    switch(index){
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>homep()));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>modeles()));
        break;
      case 2:
         Navigator.of(context).push(MaterialPageRoute(builder: (context) =>settings()));
        break;
      case 4:
      //   Navigator.of(context).push(MaterialPageRoute(builder: (context) =>people()));
        break;
    }
  }
}
