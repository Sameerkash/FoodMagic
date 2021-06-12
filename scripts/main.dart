import 'dart:async';

import 'package:dart_appwrite/dart_appwrite.dart';

const IP = '192.168.29.223';
const ENDPOINT = 'https://$IP';
// const ENDPOINT = 'https://localhost';

const PROJECT_ID = '608adfe8f0dc4';
const API_KEY =
    '1f4dcdc82e64a32d15e5f81479aed759dd115f851bf008d3da432597d0a89c6aae407fd42d177a985a63bf00754acc863c49d8f22e29caba93725557388dcd4741014d175c9253beb750984ad8571e1da83ce8e9f5a80016ddb56ad8a57f50273979652b00094a62546282de1809aa37b1ac96d3c9bc94d824fe0d5f2c47a72a';
const ORDERS_COLLECTION = "60afba84b7015";

void main() {
  Client client = Client();
  client.selfSigned = true;

  client.setEndpoint('$ENDPOINT/v1').setProject(PROJECT_ID).setKey(API_KEY);
  Database db = Database(client);

  changeOrderStatus(db);
}

void changeOrderStatus(Database db) async {
  var rec = await db.listDocuments(
      collectionId: ORDERS_COLLECTION, filters: ["orderStatus=Received"]);
  var otw = await db.listDocuments(
      collectionId: ORDERS_COLLECTION, filters: ["orderStatus=OTW"]);

  List recD = rec.data["documents"];
  List otwD = otw.data["documents"];

  for (Map<String, dynamic> d in recD) {
    Timer(Duration(seconds: 10), () async {
      final r = await db.updateDocument(
          collectionId: ORDERS_COLLECTION,
          documentId: d['\$id'],
          data: {"orderStatus": "OTW"},
          read: ["*"],
          write: ["*"]);
      print(r);
    });
  }

  for (Map<String, dynamic> d in otwD) {
    Timer(Duration(seconds: 10), () async {
      await db.updateDocument(
          collectionId: ORDERS_COLLECTION,
          documentId: d['\$id'],
          data: {"orderStatus": "DEL"},
          read: ["*"],
          write: ["*"]);
    });
  }
}


