import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoder/geocoder.dart';

class Incident {
  String id;
  Timestamp dateTime;
  GeoPoint location;
  String img;
  String details;

  Incident({this.id, this.dateTime, this.img, this.details, this.location});

  Incident.fromMap(Map snapshot, String id)
      : id = id ?? '',
        dateTime = snapshot['dateTime'] ?? '',
        img = snapshot['img'] ?? '',
        location = snapshot['location'] ?? 0.0,
        details = snapshot["details"] ?? '';

  getAddress() async {
    final coordinates =
        new Coordinates(this.location.latitude, this.location.longitude);
    List<Address> addressList =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    Address address = addressList.first;

    return "${address.featureName} : ${address.addressLine}";
  }

  toJson() {
    return {
      "dateTime": dateTime,
      "img": img,
      "detials": details,
      "location": location,
    };
  }
}
