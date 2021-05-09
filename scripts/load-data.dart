import 'dart:convert';
import 'dart:io';

import 'package:dart_appwrite/dart_appwrite.dart';

Client client = Client();

// Setup of end-point, project & key
void main() async {
  client.setEndpoint("https://localhost:3010/v1").setProject("608cc913d852b").setKey("25bf15902dc7c476b95516d9c0bf1104d563d592011d474f561a2eddab0db0af1fe002639b30cf6fb34e9dace02fc38aa2d80286cd4e1eea0e3447f024a88b680102a1cd551ca9f8f90665459ebad66154663b199ddd27a8b1e2f493771d376b3e9700d372246a1ad3dd0b5aa2b6412df1398a0ebdb7003c7f88bf4da38501f4");

  File json = File('./food.json');
  // File json = File.fromRawPath('./food.json');
  final foodItems = jsonDecode(json.readAsStringSync());

  Database db = Database(client);
  for(final foodItem in foodItems) {
    await db.createDocument(
      collectionId: "6097ab917d9ad", 
      data: foodItem, 
      read: ['*'], 
      write: ['role:member']);
    print(foodItem);
  }
}