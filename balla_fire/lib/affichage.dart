
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'home.dart';


class Affichage extends StatefulWidget {
  const Affichage({Key? key}) : super(key: key);

  @override
  _AffichageState createState() => _AffichageState();
}

class _AffichageState extends State<Affichage> {

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('clients').snapshots();

  // final box = Boxes.getTransactions();
  @override
  void dispose() {
   // Hive.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>WillPopScope(
      onWillPop: () async {
        Navigator.push(context, MaterialPageRoute(builder: (context) =>homep()));
        return false;
      },



      child:Scaffold(
    appBar: AppBar(
      title: Text('La liste des clients'),
      centerTitle: true,
    ),
    body:StreamBuilder(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child:ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (_,index) {
                return Card(
                  //  onTap: (){
                  /*  Navigator.push(context, MaterialPageRoute(builder: (_)=>editnote(docid: snapshot.data!.docs[index]),
                    ),
                    );*/
                  // },
                  child: ExpansionTile(
                    title: Text(
                      snapshot.data!.docChanges[index].doc['prenom'],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    subtitle: Text(
                      snapshot.data!.docChanges[index].doc['nom'],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    /*  children: [
                      SizedBox(
                        height: 4,
                      ),
                      Padding(padding: EdgeInsets.only(left: 3,right: 3,
                      ),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          title: Text(
                            snapshot.data!.docChanges[index].doc['prenom'],
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          subtitle: Text(
                            snapshot.data!.docChanges[index].doc['nom'],
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),*/

                    children: [
                      //   Text("Date du prise: " +date,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      SizedBox(height: 7),
                      Text('Date  du rendez vous :' + snapshot.data!.docChanges[index]
                          .doc['date'], style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),),
                      SizedBox(height: 7),
                      Text("adresse: " + snapshot.data!.docChanges[index]
                          .doc['adresse'], style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),),
                      SizedBox(height: 7),
                      Text("Numero: " + snapshot.data!.docChanges[index]
                          .doc['numero'], style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),),
                      SizedBox(height: 7),

                      /*   Text("epaule: "+epaule,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            SizedBox(height: 7),
                            Text("poitrine: "+poitrine,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            SizedBox(height: 7),
                            Text("manche: "+manche,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            SizedBox(height: 7),
                            Text("tour manche: "+tour_manche,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            SizedBox(height: 7),
                            Text("long boubou: " +long_boubou,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5),
                            Text("long pantalon: "+long_pant,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5),
                            Text("cou: "+cou,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5),
                            Text("cuisse: "+cuisse,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5),
                            Text("Tour du poignet: "+tour_poin,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5),
                            Text("fesse: "+fesse,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5),
                            Text("ceinture: "+ceinture,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5),
                            Text("pref pantalon: " +client.pref_pant,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5),
                            Text("pref manche: "+client.pref_manche,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                            SizedBox(height: 5),
                            Text("pref bouton: "+client.pref_bouton,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),*/
                      //buildButtons(context, transaction),
                    ],

                  /*  contentPadding: EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 16,
                    ),*/
                  ),
                );
              }
                   // ],
                  )
                );
              }) ,
        ),
        );
      }


   /* ValueListenableBuilder<Box<Client>>(
      valueListenable: Boxes.getClient().listenable(),
      builder: (context, box, _) {
        final client = box.values.toList().cast<Client>();

        return buildContent(client);
      },


    ),*/
 /*
  Widget buildContent(List<Client> clients) {
    if (clients.isEmpty) {
      return Center(
        child: Text(
          'Desoler pas de client pour l\'instant',
          style: TextStyle(fontSize: 24),
        ),
      );
    } else {

      return Column(
        children: [

          SizedBox(height: 24),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8),
              itemCount: clients.length,
              itemBuilder: (BuildContext context, int index) {
                final client = clients[index];

                return buildTransaction(context, client);
              },
            ),
          ),
        ],
      );
    }
  }

  Widget buildTransaction(
      BuildContext context,
      Client client,
      ) {
    final adresse = client.adresse;
    final long_boubou = client.long_boubou.toStringAsFixed(2);
    final long_pant = client.long_pant.toStringAsFixed(2);
    final numero =  client.numero.toStringAsFixed(0);
    final epaule = client.epaule.toStringAsFixed(2);
    final poitrine = client.poitrine.toStringAsFixed(2);
    final manche =  client.manche.toStringAsFixed(2);
    final tour_manche =  client.tour_manche.toStringAsFixed(2);
    final cou = client.cou.toStringAsFixed(2);
    final cuisse =  client.cuisse.toStringAsFixed(2);
    final tour_poin =  client.tour_poin.toStringAsFixed(2);
    final fesse = client.fesse.toStringAsFixed(2);
    final ceinture =  client.ceinture.toStringAsFixed(2);
    final date1 =  DateFormat.yMMMd().format(client.date1);

    // final color = transaction.isExpense ? Colors.red : Colors.green;
    final date = DateFormat.yMMMd().format(client.createdDate);
    //   final amount = '\$' + transaction.amount.toStringAsFixed(2);

    return Card(
      color: Colors.white,
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        title: Text(
          client.prenom,
          maxLines: 2,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(date),
        trailing: Text(
          client.nom,

        ),
        children: [
          Text("Date du prise: " +date,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 7),
          Text('Date  du rendez vous :'+date1,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 7),
          Text("adresse: " +client.adresse,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 7),
          Text("Numero: "+numero,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 7),
          Text("epaule: "+epaule,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 7),
          Text("poitrine: "+poitrine,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 7),
          Text("manche: "+manche,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 7),
          Text("tour manche: "+tour_manche,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 7),
          Text("long boubou: " +long_boubou,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 5),
          Text("long pantalon: "+long_pant,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 5),
          Text("cou: "+cou,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 5),
          Text("cuisse: "+cuisse,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 5),
          Text("Tour du poignet: "+tour_poin,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 5),
          Text("fesse: "+fesse,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 5),
          Text("ceinture: "+ceinture,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 5),
          Text("pref pantalon: " +client.pref_pant,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 5),
          Text("pref manche: "+client.pref_manche,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          SizedBox(height: 5),
          Text("pref bouton: "+client.pref_bouton,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
          //buildButtons(context, transaction),
        ],
      ),
    );
  }
}*/
