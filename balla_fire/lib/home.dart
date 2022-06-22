import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';

/*
import 'affichage.dart';
import 'ajout_client.dart';
import 'drawer.dart';*/



class homep extends StatefulWidget {
  const homep({Key? key}) : super(key: key);

  @override
  _homepState createState() => _homepState();
}

class _homepState extends State<homep> {
  @override
  Widget build(BuildContext context)=>WillPopScope(
    onWillPop: () async {
      Navigator.push(context,MaterialPageRoute(builder: (context) =>homep()));
      return false;
    },
    child: Scaffold(
        drawer:MonDrawer() ,
        appBar: AppBar(
          centerTitle: true,
          elevation: 5,
          backgroundColor: Colors.blue,
          title: Text('Tailleur'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Image.asset("assets/sididia.jpg",
                height: 400,
                width: 400,
                fit: BoxFit.cover,),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      BsButton(
                        onPressed:(){
                   //       Navigator.push(context, MaterialPageRoute(builder: (context) =>Affichage()));
                        },
                        style:BsButtonStyle.primary,
                        size:BsButtonSize.btnIconMd,
                        prefixIcon:Icons.search,
                      ),

                      Container(
                        height: 3,
                        width: 20,
                        color: Colors.white,
                      ),
                      BsButton(

                        onPressed:(){
                       //   Navigator.push(context, MaterialPageRoute(builder: (context) =>ajout(onClickedDone:addClient ,)));
                        },
                        style:BsButtonStyle.primary,
                        size:BsButtonSize.btnIconMd,
                        prefixIcon:Icons.person_add,
                      ),

                    ]

                ),
              ),
            ],
          ),
        ) ),
  );
}