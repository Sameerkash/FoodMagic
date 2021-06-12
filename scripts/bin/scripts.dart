import 'dart:convert';
import 'dart:io';
import 'package:dart_appwrite/dart_appwrite.dart';

/// envs
/// Be Sure to set environemnt varibales before running this scirpt
const IP = '192.168.29.223';
const ENDPOINT = 'https://localhost';
const PROJECT_ID = '60c4d90c2130d';
const API_KEY = 'd4dba4c257527f3c041b3e55bf453bd5be7161505e8d014015491c251c3a89f244c174a5ea6a176310d0771b2fffa7bd2eab71df6537315f72c2d1b0c36c26c2830df32e4d2f9c9a1f67dc87d58e92b6bf5c1f13e30b70de947e6e6b8a73e1a742c598fc349b59390ac7b410f3a50710b80f626476b5683a093e3f9dc627b422';

/// Run script only once to avoid duplicate data, delete first if already exisiting
void main() {

  Client client = Client();
  client.selfSigned = true;

  client.setEndpoint('$ENDPOINT/v1').setProject(PROJECT_ID).setKey(API_KEY);

  Database db = Database(client);
  Storage storage = Storage(client);

  /// Upload images and fooditems
  uploadImages(storage, db);

  createUsersCollection(db);

  createOrderItemsCollection(db);

  createOrders(db);
}

// void createCartFoodItemCollection(Database db) async {
//   try {
//     final res = await db.createCollection(
//         name: "cartfooditems", read: ["*"], write: ["*"], rules: foodRules);
//     final cartCollection = res.data['\$id'];

//     print("CART_COLLECTION:$cartCollection");
//   } on AppwriteException catch (e) {
//     print(e.message);
//     print(e.response);
//     print(e.code);
//   }
// }

// void createCartCollection(Database db) async {
//   try {
//     final res = await db.createCollection(
//         name: "carts", read: ["*"], write: ["*"], rules: cartRules);
//     final cartCollection = res.data['\$id'];

//     print("CART_COLLECTION:$cartCollection");
//   } on AppwriteException catch (e) {
//     print(e.message);
//     print(e.response);
//     print(e.code);
//   }
// }

void createOrders(Database db) async {
  try {
    final res = await db.createCollection(
        name: "orders", read: ["*"], write: ["*"], rules: orderRules);
    final orderCollection = res.data['\$id'];

    print("ORDERS_COLLECTION:$orderCollection");
  } on AppwriteException catch (e) {
    print(e.message);
    print(e.response);
    print(e.code);
  }
}

void createOrderItemsCollection(Database db) async {
  try {
    final res = await db.createCollection(
        name: "orderItems", read: ["*"], write: ["*"], rules: orderItemRules);
    final orderItemCollection = res.data['\$id'];

    print("ORDERITEMS_COLLECTION:$orderItemCollection");
  } on AppwriteException catch (e) {
    print(e.message);
    print(e.response);
    print(e.code);
  }
}

void createUsersCollection(Database db) async {
  try {
    final res = await db.createCollection(
        name: "users", read: ["*"], write: ["*"], rules: userRules);
    final usersCollection = res.data['\$id'];

    print("USERS_COLLECTION:$usersCollection");
  } on AppwriteException catch (e) {
    print(e.message);
    print(e.response);
    print(e.code);
  }
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
    data['imageUrl'] =
        'http://$IP/v1/storage/files/$imageId/view?project=$PROJECT_ID';

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

const orderRules = [
  {
    "type": "text",
    "key": "orderStatus",
    "label": "orderStatus",
    "default": "",
    "array": false,
    "required": true,
  },
  {
    "type": "text",
    "key": "userId",
    "label": "userId",
    "default": "",
    "array": false,
    "required": true,
  },
  {
    "type": "text",
    "key": "orderItem",
    "label": "orderItem",
    "default": "",
    "array": true,
    "required": true,
  },
  {
    "type": "numeric",
    "key": "total",
    "label": "total",
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
    "key": "time",
    "label": "time",
    "default": "",
    "array": false,
    "required": true,
  },
];

const userRules = [
  {
    "type": "text",
    "key": "name",
    "label": "name",
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
    "type": "text",
    "key": "wallet",
    "label": "wallet",
    "default": "",
    "array": false,
    "required": true,
  },
  {
    "type": "text",
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

// const cartRules = [
//   {
//     "type": "text",
//     "key": "userId",
//     "label": "userId",
//     "default": "",
//     "array": false,
//     "required": true,
//   },
//   {
//     "type": "numeric",
//     "key": "qauntity",
//     "label": "qauntity",
//     "default": "",
//     "array": false,
//     "required": true,
//   },
//   {
//     "type": "text",
//     "key": "cartitems",
//     "label": "cartitems",
//     "default": "",
//     "array": true,
//     "required": true,
//   },
//   {
//     "type": "numeric",
//     "key": "total",
//     "label": "total",
//     "default": "",
//     "array": true,
//     "required": true,
//   },
//   {
//     "type": "numeric",
//     "key": "discount",
//     "label": "discount",
//     "default": "",
//     "array": false,
//     "required": true,
//   },
// ];

const orderItemRules = [
  {
    "type": "numeric",
    "key": "quantity",
    "label": "quantity",
    "default": "",
    "array": false,
    "required": true,
  },
  {
    "type": "numeric",
    "key": "subTotal",
    "label": "subTotal",
    "default": "",
    "array": false,
    "required": true,
  },
  {
    "type": "text",
    "key": "foodItem",
    "label": "foodItem",
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
    "key": "description",
    "label": "description",
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
