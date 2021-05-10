import 'dart:convert';
import 'dart:io';

import 'package:dart_appwrite/dart_appwrite.dart';
import 'package:dotenv/dotenv.dart' show load, env;

/// Run script only once to avoid duplicate data, delete first if already exisiting
void main() {
  load();

  Client client = Client();
  client.selfSigned = true;

  client
      .setEndpoint(env['ENDPOINT']! + '/v1')
      .setProject(env['PROJECT_ID']!)
      .setKey(env['KEY']!);

  Database db = Database(client);

  /// Upload fooditems
  createAndUploadFoodItems(db);

  // TODO: create function to upload images to storage
  /// uploadImages
}

void createAndUploadFoodItems(Database db) async {
  try {
    File json = File(Directory.current.path + '/data/food.json');

    final foodItems = jsonDecode(json.readAsStringSync());

    final res = await db.createCollection(
        name: "fooItems",
        read: ["*"],
        write: ["role:member"],
        rules: foodRules);

    final foodCollection = res.data['\$id'];

    for (final foodItem in foodItems) {
      await db.createDocument(
          collectionId: foodCollection,
          data: foodItem,
          read: ['*'],
          write: ['role:member']);
      print(foodItem);
    }
    print("collectionID: $foodCollection");
  } on AppwriteException catch (e) {
    print(e.message);
    print(e.response);
    print(e.code);
  }
}

/// Item schema and rules
const foodRules = [
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
    "array": false,
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
    "type": "numeric",
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
    "array": true,
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
    "type": "numeric",
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
    "required": false,
  },
  {
    "type": "url",
    "key": "arModelUrl",
    "label": "arModelUrl",
    "default": "",
    "array": false,
    "required": false,
  },
];
