import 'package:cloud_firestore/cloud_firestore.dart';

import 'affichage.dart';

//import 'package:bai_taii/data_helper.dart';

import 'package:bs_flutter/bs_flutter.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'home.dart';


class ajout extends StatefulWidget {

  @override
  _ajoutState createState() => _ajoutState();
}

class _ajoutState extends State<ajout> {

  final formKey = GlobalKey<FormState>();
  final prenomController = TextEditingController();
  final nomController = TextEditingController();
  final adresseController = TextEditingController();
  final numeroController = TextEditingController();
  final epauleController = TextEditingController();
  final poitrineController = TextEditingController();
  final mancheController = TextEditingController();
  final tour_mancheController = TextEditingController();

  final long_boubouController = TextEditingController();
  final long_pantController = TextEditingController();
  final couController = TextEditingController();
  final cuisseController = TextEditingController();

  final tour_poinController = TextEditingController();
  final fesseController = TextEditingController();
  final ceintureController = TextEditingController();
  final pref_mancheController = TextEditingController();
  final pref_pantController = TextEditingController();
  final pref_boutonController = TextEditingController();
    DateTime date1c =DateTime(2022,02,08);

  CollectionReference ref = FirebaseFirestore.instance.collection('clients');

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
   /* prenomController.dispose();
    nomController.dispose();
    adresseController.dispose();
    numeroController.dispose();
    epauleController.dispose();
    poitrineController.dispose();
    mancheController.dispose();
    tour_mancheController.dispose();*/
    super.dispose();
  }

  // late DatabaseHelper db ;

//final dbhelper = DatabaseHelper._instance;

  // final _KeyForm = GlobalKey<FormState>();
  Widget build(BuildContext context) {

   // final isEditing = widget.client != null;
    // final title = isEditing ? 'Modifier information sur un client' : 'Ajouter';


    return Scaffold(
      body: ListView(
          children:[ Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'ENREGISTRER CLIENT',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 30, color: Colors.black),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                controller: prenomController,
                                decoration: InputDecoration(
                                  labelText: 'prenom',
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 2.0)),
                                ),
                                validator: (prenom) =>
                                prenom != null && prenom.isEmpty
                                    ? 'Entrez le prenom du client'
                                    : null,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                controller: nomController,
                                decoration: InputDecoration(
                                  labelText: 'nom',
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 2.0)),
                                ),
                                validator: (nom) => nom != null && nom.isEmpty
                                    ? 'Entrez le nom du client'
                                    : null,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                controller: adresseController,
                                decoration: InputDecoration(
                                  labelText: 'Adresse du client',
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 2.0)),
                                ),
                                validator: (adresse) =>
                                adresse != null && adresse.isEmpty
                                    ? "Entrez l'adresse du client"
                                    : null,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly

                                ],
                                controller: numeroController,
                                decoration: InputDecoration(
                                  labelText: 'Numero',
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 2.0)),
                                ),
                                validator: (numero) =>
                                numero!.length != 8
                                    ? 'Entrez le numero à 8 chiffre !!!'
                                    : null,
                              ),
                            ),
                            //ajout des epaulse details
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d{0,2}\.?\d{0,1}$'))
                                ],
                                controller: epauleController,
                                decoration: InputDecoration(
                                  labelText: 'epaule',
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 2.0)),
                                ),
                                validator: (epaule) =>
                                epaule != null && double.tryParse(epaule) == null
                                    ? 'Entrez un nombre adequat'
                                    : null,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d{0,2}\.?\d{0,1}$'))
                                ],
                                controller: poitrineController,
                                /*     onChanged: (val) {  numero = val as int;
                                  },*/
                                decoration: InputDecoration(
                                  labelText: 'taille de la poitrine',
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 2.0)),
                                ),
                                validator: (poitrine) => poitrine != null &&
                                    double.tryParse(poitrine) == null
                                    ? 'Entrez un nombre'
                                    : null,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d{0,2}\.?\d{0,1}$'))
                                ],
                                controller: mancheController,
                                decoration: InputDecoration(
                                  labelText: 'manche',
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 2.0)),
                                ),
                                validator: (manche) =>
                                manche != null && double.tryParse(manche) == null
                                    ? 'Entrez un nombre'
                                    : null,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              //  child: TextField(keyboardType: TextInputType.numberWithOptions(decimal: true),
                              //  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              child: TextFormField(
                                keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d{0,2}\.?\d{0,1}$'))
                                ],
                                controller: tour_mancheController,
                                decoration: InputDecoration(
                                  labelText: 'tour de manche',
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 2.0)),
                                ),
                                validator: (tour_manche) => tour_manche != null &&
                                    double.tryParse(tour_manche) == null
                                    ? 'Entrez un nombre'
                                    : null,
                              ),
                            ),
// ======================================================================================================
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d{0,2}\.?\d{0,1}$'))
                                ],
                                controller: long_boubouController,
                                /*     onChanged: (val) {  numero = val as int;
                                  },*/
                                decoration: InputDecoration(
                                  labelText: 'long boubou',
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 2.0)),
                                ),
                                validator: (long_boubou) => long_boubou != null &&
                                    double.tryParse(long_boubou) == null
                                    ? 'Entrez un nombre'
                                    : null,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d{0,2}\.?\d{0,1}$'))
                                ],
                                controller: long_pantController,
                                decoration: InputDecoration(
                                  labelText: 'longue pantalon',
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 2.0)),
                                ),
                                validator: (long_pant) =>
                                long_pant != null && double.tryParse(long_pant) == null
                                    ? 'Entrez un nombre'
                                    : null,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              //  child: TextField(keyboardType: TextInputType.numberWithOptions(decimal: true),
                              //  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              child: TextFormField(
                                keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d{1}\.?\d{0,1}$'))
                                ],
                                controller: couController,
                                decoration: InputDecoration(
                                  labelText: 'cou',
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 2.0)),
                                ),
                                validator: (cou) => cou != null &&
                                    double.tryParse(cou) == null
                                    ? 'Entrez un nombre'
                                    : null,
                              ),
                            ),
                            //=====================================================================================

                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d{0,2}\.?\d{0,1}$'))
                                ],
                                controller: cuisseController,
                                /*     onChanged: (val) {  numero = val as int;
                                  },*/
                                decoration: InputDecoration(
                                  labelText: 'cuisse',
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 2.0)),
                                ),
                                validator: (cuisse) => cuisse != null &&
                                    double.tryParse(cuisse) == null
                                    ? 'Entrez un nombre'
                                    : null,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d{0,2}\.?\d{0,1}$'))
                                ],
                                controller: tour_poinController,
                                decoration: InputDecoration(
                                  labelText: 'tour du poignet',
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 2.0)),
                                ),
                                validator: (tour_poin) =>
                                tour_poin != null && double.tryParse(tour_poin) == null
                                    ? 'Entrez un nombre'
                                    : null,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              //  child: TextField(keyboardType: TextInputType.numberWithOptions(decimal: true),
                              //  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              child: TextFormField(
                                keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d{0,2}\.?\d{0,1}$'))
                                ],
                                controller: fesseController,
                                decoration: InputDecoration(
                                  labelText: 'fesse',
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 2.0)),
                                ),
                                validator: (fesse) => fesse != null &&
                                    double.tryParse(fesse) == null
                                    ? 'Entrez un nombre'
                                    : null,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              //  child: TextField(keyboardType: TextInputType.numberWithOptions(decimal: true),
                              //  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                              child: TextFormField(
                                keyboardType:
                                TextInputType.numberWithOptions(decimal: true),
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'^\d{0,2}\.?\d{0,1}$'))
                                ],
                                controller: ceintureController,
                                decoration: InputDecoration(
                                  labelText: 'ceinture',
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 2.0)),
                                ),
                                validator: (ceinture) => ceinture != null &&
                                    double.tryParse(ceinture) == null
                                    ? 'Entrez un nombre'
                                    : null,
                              ),
                            ),

                            //===========================================================================
                            Container( color: Colors.lightBlue,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Preferences du Manche',textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20,color: Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                controller: pref_mancheController,
                                decoration: InputDecoration(
                                  labelText: 'preference du manche',
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 2.0)),
                                ),
                                validator: (pref_manche) => pref_manche != null && pref_manche.isEmpty
                                    ? 'Entrez la preference du manche'
                                    : null,
                              ),
                            ),


                            Container(color: Colors.lightBlue,
                              height: 40,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Preferences Pantalon' ,textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20,color: Colors.white),

                                ),

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                controller: pref_pantController,
                                decoration: InputDecoration(

                                  labelText: 'preference du pantalon',
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 2.0)),
                                ),
                                validator: (pref_pant) =>
                                pref_pant != null && pref_pant.isEmpty
                                    ? 'Entrez la preference du pantalon'
                                    : null,
                              ),
                            ),

                            Container( color: Colors.lightBlue,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Preferences Boutons',textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20,color:Colors.white),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: TextFormField(
                                controller: pref_boutonController,
                                decoration: InputDecoration(
                                  labelText: 'preference du bouton',
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.blue, width: 2.0)),
                                ),
                                validator: (pref_bouton) =>
                                pref_bouton != null && pref_bouton.isEmpty
                                    ? "Entrez la preference du bouton"
                                    : null,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child:     ElevatedButton(
                                onPressed: () async{
                                  DateTime? newDate1 = await
                                  showDatePicker(context: context,
                                    initialDate:  DateTime(2022,02,08),
                                    firstDate: DateTime(2015),
                                    lastDate: DateTime(2050),
                                  );
                                  validator: (newDate1) =>
                                  newDate1 != null && newDate1.isEmpty
                                      ? "Entrez la date de retour"
                                      : null;
                                  date1c = newDate1!;
 if(newDate1 == null ){
   Text('Entrez la date de retour');
 }else {
   return;
 }
               setState(() => date1c = newDate1);
                                //  setState(() => date1c = newDate1);

                                },
                                child: Text('selectionner la date de livraison'),),
                            ),
                            SizedBox(
                              width: 350.0,
                              height: 80.0,
                              child:BsButton(
                                //  child: Text(text),
                                onPressed: () async {
                                  final isValid = formKey.currentState!.validate();
                                  // addClient;

                                  if (isValid) {

                                    ref.add({
                                      'prenom':prenomController.text,
                                      'nom': nomController.text,

                                      'adresse':adresseController.text,
                                      'numero': int.tryParse(numeroController.text),

                                      'epaule':double.tryParse(epauleController.text) ?? 0,
                                      'poitrine': double.tryParse(poitrineController.text) ?? 0,

                                      'manche':double.tryParse(mancheController.text) ?? 0,
                                      'tour_manche': double.tryParse(tour_mancheController.text) ?? 0,
                                      'long_boubou':double.tryParse(long_boubouController.text) ?? 0,
                                      'long_pantalon': double.tryParse(long_pantController.text) ?? 0,

                                      'cou':double.tryParse(couController.text) ?? 0,
                                      'cuisse': double.tryParse(cuisseController.text) ?? 0,

                                      'tour_poignet':double.tryParse(tour_poinController.text) ?? 0,
                                      'fesse': double.tryParse(fesseController.text) ?? 0,

                                      'ceinture':double.tryParse(ceintureController.text) ?? 0,
                                      'pref_manche': pref_mancheController.text,

                                      'pref_pantalon':pref_pantController.text,
                                      'pref_bouton':pref_boutonController.text,
                                      'date' : date1c,
                                    }).whenComplete(() {
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> Affichage()));
                                    });
                                  /*
                                    final prenom = prenomController.text;
                                    final nom = nomController.text;
                                    final adresse = adresseController.text;
                                    final numero = int.tryParse(numeroController.text) ;
                                    final epaule = double.tryParse(epauleController.text) ?? 0;
                                    final poitrine = double.tryParse(poitrineController.text) ?? 0;
                                    final manche = double.tryParse(mancheController.text) ?? 0;
                                    final tour_manche = double.tryParse(tour_mancheController.text) ?? 0;
                                    final long_boubou = double.tryParse(long_boubouController.text) ?? 0;
                                    final long_pant = double.tryParse(long_pantController.text) ?? 0;
                                    final cou = double.tryParse(couController.text) ?? 0;
                                    final cuisse = double.tryParse(cuisseController.text) ?? 0;
                                    final tour_poin = double.tryParse(tour_poinController.text) ?? 0;
                                    final fesse = double.tryParse(fesseController.text) ?? 0;
                                    final ceinture = double.tryParse(ceintureController.text) ?? 0;
                                    final pref_manche = pref_mancheController.text;
                                    final pref_pant = pref_pantController.text;
                                    final pref_bouton = pref_boutonController.text;
                                    final date1 = date1c;*/

                                   // widget.onClickedDone(prenom,nom,adresse,numero!,epaule,poitrine,manche,tour_manche,long_boubou,long_pant,cou,cuisse,tour_poin,fesse,ceinture,pref_manche,pref_pant,pref_bouton,date1);

                                   // Navigator.push(
                                     //   context, MaterialPageRoute(builder: (context) => Affichage()));
                                  }

                                },
                                style: BsButtonStyle.primary,
                                size: BsButtonSize.btnIconMd,
                                prefixIcon: Icons.check_box,
                              ),


                              //buildAddButton(context)

                              /*    BsButton(
                          onPressed: () async {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp()));
                            /*    var cliet = new Client(

                                      nom:nom.text,
                                      prenom:prenom.text,
                                      adresse:adresse.text,
                                      numero:numero.text,
                                      epaule:epaule.text,
                                      taille_coud:taille_coud.text,
                                      manche:manche.text,
                                      tour_manche: tour_manche.text
                                  );
                                  var db = DatabaseHelper();
                                  await db.create(cliet);*/
                          },
                          style: BsButtonStyle.primary,
                          size: BsButtonSize.btnIconMd,
                          prefixIcon: Icons.check_box,
                        ),*/

                              /*InkWell(
                                onTap: () async {    Navigator.push(context,MaterialPageRoute(builder: (context)=>details_cli()));
    var cliet = new client(

    nom:nom.text,
    prenom:prenom.text,
    adresse:adresse.text,
    numero:numero.text,
    epaule:epaule.text,
    taille_coud:taille_coud.text,
    manche:manche.text,
    tour_manche: tour_manche.text
    );
    var db = DatabaseHelper();
    await db.create(cliet);
                                },

                                child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.bounceOut,
                                    height: 50,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            colors: [
                                              // const Color(0xFF4CAF50),
                                              const Color(0xff318ce7),
                                              const Color(0xff00faff)
                                            ]),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(0),
                                          bottomLeft: Radius.circular(0),
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        )),
                                    child: Center(
                                        child: Text(
                                          'Ajouter Client',
                                          textAlign: TextAlign.center,
                                          style:
                                          TextStyle(
                                              color: Colors.white, fontSize: 12),
                                        ))),
                              ),*/
                            ),
                          ])),
                    )),
              ],
            ),
          ),
          ]
      ),
    );
  }



}
