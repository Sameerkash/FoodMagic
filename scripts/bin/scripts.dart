import 'dart:convert';
import 'dart:io';

import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dotenv/dotenv.dart' show load, clean, isEveryDefined, env;


// Setup of end-point, project & key
void main() async {

  Client client = Client();
  client.selfSigned = true;

  client.setEndpoint(env['ENDPOINT']!).setProject(env['PROJECT_ID']!).setKey(env['KEY']!);

  File json = File(Directory.current.path +'/data/food.json');

  final foodItems = jsonDecode(json.readAsStringSync());

  Database db = Database(client);

   final res = await db.createCollection(name: "fooItems", read: [
    "*"
  ], write: [
    "role:member"
  ], rules: [
    {
      "type": "text",
      "key": "itemId",
      "label": "itemId",
      "default": "",
      "array": false,
      "required": true,
    },
    {
      "type": "text",
      "key": "name",
      "label": "name",
      "default": "",
      "array": true,
      "required": true,
    },
    {
      "type": "text",
      "key": "ingredients",
      "label": "ingredients",
      "default": "",
      "array": true,
      "required": true,
    },
    {
      "type": "text",
      "key": "price",
      "label": "price",
      "default": "",
      "array": false,
      "required": true,
    },
    {
      "type": "text",
      "key": "tags",
      "label": "tags",
      "default": "",
      "array": false,
      "required": true,
    },
    {
      "type": "boolean",
      "key": "isVeg",
      "label": "isVeg",
      "default": "",
      "array": false,
      "required": true,
    },
    {
      "type": "boolean",
      "key": "isEgg",
      "label": "isEgg",
      "default": "",
      "array": false,
      "required": true,
    },
    {
      "type": "text",
      "key": "type",
      "label": "type",
      "default": "",
      "array": false,
      "required": true,
    },
    {
      "type": "text",
      "key": "style",
      "label": "style",
      "default": "",
      "array": false,
      "required": true,
    },
    {
      "type": "text",
      "key": "discount",
      "label": "discount",
      "default": "",
      "array": false,
      "required": true,
    },
    {
      "type": "url",
      "key": "imageUrl",
      "label": "imageUrl",
      "default": "",
      "array": false,
      "required": true,
    },
    {
      "type": "url",
      "key": "arModelUrl",
      "label": "arModelUrl",
      "default": "",
      "array": false,
      "required": true,
    },
  ]);

  final collectionId = res.data['\$id'];

  for(final foodItem in foodItems) {
    await db.createDocument(
      collectionId: "FOOD_COLLECTION_ID", 
      data: foodItem, 
      read: ['*'], 
      write: ['role:member']);
    print(foodItem);
  }
  print("collectionID: $collectionId");
}