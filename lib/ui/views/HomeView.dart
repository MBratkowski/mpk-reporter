import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mpk_reporter/core/models/incidentModel.dart';
import 'package:mpk_reporter/core/viewmodels/CRUDModel.dart';
import 'package:mpk_reporter/ui/widgets/IncidentCard.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Incident> incidents;

  @override
  Widget build(BuildContext context) {
    final incidentProvider = Provider.of<CRUDModel>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "addIncident");
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Center(
            child: Text("Czy MPK Jebło?"),
          ),
        ),
        body: Container(
          child: StreamBuilder(
            stream: incidentProvider.fetchIncidentsAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                incidents = snapshot.data.documents
                    .map((doc) => Incident.fromMap(doc.data, doc.documentID))
                    .toList();

                return ListView.builder(
                    itemCount: incidents.length,
                    itemBuilder: (buildContext, index) => IncidentCard(
                          incidentDetails: incidents[index],
                        ));
              } else {
                return Text('fetching');
              }
            },
          ),
        ));
  }
}
