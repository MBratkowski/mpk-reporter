import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/incidentModel.dart';
import '../services/api.dart';

class CRUDModel extends ChangeNotifier {
  Api _api = Api("incidents");

  List<Incident> incidents;

  Future<List<Incident>> fetchIncidents() async {
    var result = await _api.getDataCollection();
    incidents = result.documents
        .map((doc) => Incident.fromMap(doc.data, doc.documentID))
        .toList();
    return incidents;
  }

  Stream<QuerySnapshot> fetchIncidentsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Incident> getIncidentById(String id) async {
    var doc = await _api.getDocumentById(id);
    return Incident.fromMap(doc.data, doc.documentID);
  }

  Future removeIncident(String id) async {
    await _api.removeDocument(id);
    return;
  }

  Future updateIncident(Incident incident, String id) async {
    await _api.updateDocument(incident.toJson(), id);
    return;
  }
}
