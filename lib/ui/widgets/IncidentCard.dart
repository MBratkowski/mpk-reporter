import 'package:flutter/material.dart';
import 'package:mpk_reporter/core/models/incidentModel.dart';

class IncidentCard extends StatelessWidget {
  final Incident incidentDetails;

  IncidentCard({@required this.incidentDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          elevation: 5,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: <Widget>[
                Hero(
                  tag: incidentDetails.id,
                  child: Image.network(
                    incidentDetails.img,
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        incidentDetails.details,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        incidentDetails.dateTime.toDate().toIso8601String(),
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
