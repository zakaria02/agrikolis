import 'package:AGRIKOLIS/widgets/CircularProgressWidget.dart';
import 'package:AGRIKOLIS/widgets/provider_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../models/colis.dart';
import 'add_colis.dart';
import 'edit_colis.dart';
import 'vide.dart';

// ignore: must_be_immutable
class ColisView extends StatelessWidget {
  static String uid = "";
  List<Colis> colis = [];

  Stream<QuerySnapshot> getColisUIDStreamSnapchots(
      BuildContext context) async* {
    yield* Firestore.instance
        .collection("userData")
        .document(uid)
        .collection('colis')
        .snapshots();
  }

  StreamBuilder getColisUID(BuildContext context) {
    return StreamBuilder(
      stream: getColisUIDStreamSnapchots(context),
      builder: (context, snapshot) {
        colis.clear();
        if (snapshot.hasData) {
          snapshot.data.documents.forEach((val) {
            colis.add(Colis(
                userUID: uid,
                uid: val.documentID,
                client: val["client"],
                poids: val["poids"],
                prix: val["prix"]));
          });
          return colis.length > 0
              ? ColisV(
                  colis: colis,
                )
              : ColisVideView();
        } else
          return CircularProgressWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Provider.of(context).auth.getCurrentUID(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            uid = snapshot.data;
            print(uid);
            return getColisUID(context);
          } else
            return CircularProgressWidget();
        },
      ),
    );
  }
}

class ColisV extends StatefulWidget {
  final List<Colis> colis;
  ColisV({this.colis});
  @override
  State<StatefulWidget> createState() {
    return _ColisState(colis: colis);
  }
}

class _ColisState extends State<ColisV> {
  final primaryColor = Color(0xff327a5e);
  final secondaryColor = Color(0xfff2bb32);

  List<Colis> colis;
  _ColisState({this.colis});

  @override
  void initState() {
    if (colis == null) {
      colis = new List<Colis>();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView.builder(
        itemCount: colis.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: Container(
              width: width,
              child: Card(
                color: Colors.green[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  title: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Quicksand',
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Colis N° : ",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Quicksand",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: "${colis[i].uid == null ? "" : colis[i].uid}\n",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Quicksand',
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Client : ",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Quicksand",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              "${colis[i].client == null ? "" : colis[i].client}\n",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "Poids : ",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Quicksand",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              "${colis[i].poids == null ? 0 : colis[i].poids} Kg\n",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: "Prix : ",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Quicksand",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text:
                              "${colis[i].prix == null ? 0 : colis[i].prix} €",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.start,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => EditColisView(
                          colis: colis[i],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "add_colis",
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => AddColisView(),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: secondaryColor,
          size: 22,
        ),
        backgroundColor: primaryColor,
      ),
    );
  }
}
