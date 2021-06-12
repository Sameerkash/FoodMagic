import 'dart:async';

import 'package:dart_appwrite/dart_appwrite.dart';

const IP = '192.168.29.223';
const ENDPOINT = 'https://$IP';
// const ENDPOINT = 'https://localhost';

const PROJECT_ID = '60c4d90c2130d';
const API_KEY =
    'd4dba4c257527f3c041b3e55bf453bd5be7161505e8d014015491c251c3a89f244c174a5ea6a176310d0771b2fffa7bd2eab71df6537315f72c2d1b0c36c26c2830df32e4d2f9c9a1f67dc87d58e92b6bf5c1f13e30b70de947e6e6b8a73e1a742c598fc349b59390ac7b410f3a50710b80f626476b5683a093e3f9dc627b422';
const ORDERS_COLLECTION = "60c4d9d66cae8";

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


