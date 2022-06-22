import 'package:flutter/material.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.white70,
        title: Text('Parametres'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 48,),
          Divider(color:Colors.black),
          const SizedBox(height: 48,),
          Row(

            children: [
                  InkWell(
                    onTap: (){

                    },
                    child: RichText(
                        text: TextSpan(
                            children: [

                              WidgetSpan(
                                  child: Icon(Icons.color_lens)),

                              TextSpan(
                                text: 'Theme Noir',style: TextStyle(color: Colors.black,fontSize: 15),
                              )
                            ]
                        )),
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: RichText(
                        text: TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Icon(Icons.color_lens_outlined)),
                              TextSpan(
                                  text: 'Theme Orange',style: TextStyle(color: Colors.orange)
                              )
                            ]
                        )),
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: RichText(
                        text: TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Icon(Icons.color_lens_outlined)),
                              TextSpan(
                                  text: 'Theme Jaune',style: TextStyle(color: Colors.yellowAccent)
                              )
                            ]
                        )),
                  ),
                  InkWell(
                    onTap: (){

                    },
                    child: RichText(

                        text: TextSpan(
                            children: [
                              WidgetSpan(
                                  child: Icon(Icons.color_lens_outlined)),
                              TextSpan(
                                  text: 'Theme Blue',style: TextStyle(color: Colors.blue)
                              )
                            ]
                        )),
                  ),


            ],
          )
        ],
      ),
    );
  }
}
