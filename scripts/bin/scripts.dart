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
  Storage storage = Storage(client);

  /// Upload fooditems
  // createAndUploadFoodItems(db);

  uploadImages(storage, db);
}

void uploadImages(Storage storage, Database db) async {
  File json = File(Directory.current.path + '/data/images.json');
  File foodJson = File(Directory.current.path + '/data/food.json');

  final res = await db.createCollection(
      name: "fooItems", read: ["*"], write: ["role:member"], rules: foodRules);
  final foodCollection = res.data['\$id'];

  final images = jsonDecode(json.readAsStringSync());
  final foodItems = jsonDecode(foodJson.readAsStringSync());

  try {
    for (int i = 0; i < images.length; i++) {
      final String path =
          (Directory.current.path + '/data/images/${images[i]['imageName']}');

      final Response result = await storage.createFile(
        read: ['*'],
        write: ['role:member'],
        file: await MultipartFile.fromFile(
          path,
          filename: images[i]['imageName'].split('.')[0],
        ),
      );

      createAndUploadFoodItems(
          db, foodCollection, foodItems[i], result.data['\$id']);
    }
  } on AppwriteException catch (e) {
    print(e.message);
    print(e.response);
    print(e.code);
  }
}

void createAndUploadFoodItems(Database db, String collectionId,
    Map<String, dynamic> data, String imageId) async {
  try {
    data['imageUrl'] = imageId;

    await db.createDocument(
        collectionId: collectionId,
        data: data,
        read: ['*'],
        write: ['role:member']);

    print("collectionID: $collectionId");
  } on AppwriteException catch (e) {
    print(e.message);
    print(e.response);
    print(e.code);
  }
}

const userRules = [
  {
    "type": "text",
    "key": "userName",
    "label": "userName",
    "default": "",
    "array": false,
    "required": true,
  },
  {
    "type": "email",
    "key": "email",
    "label": "email",
    "default": "",
    "array": false,
    "required": true,
  },
  {
    "type": "numeric",
    "key": "phone",
    "label": "phone",
    "default": "",
    "array": false,
    "required": false,
  },
  {
    "type": "text",
    "key": "address",
    "label": "address",
    "default": "",
    "array": false,
    "required": false,
  },
  {
    "type": "text",
    "key": "imageUrl",
    "label": "imageUrl",
    "default": "",
    "array": false,
    "required": false,
  },
  {
    "type": "text",
    "key": "bio",
    "label": "bio",
    "default": "",
    "array": false,
    "required": false,
  },
];

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
    "key": "category",
    "label": "category",
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
    "type": "text",
    "key": "imageUrl",
    "label": "imageUrl",
    "default": "",
    "array": false,
    "required": false,
  },
  {
    "type": "text",
    "key": "arModelUrl",
    "label": "arModelUrl",
    "default": "",
    "array": false,
    "required": false,
  },
];
