import 'dart:convert';
import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:flutter/foundation.dart';
import 'package:foodmagic/models/cartitem/cart.item.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart' as sembast;
import 'package:sembast/sembast_io.dart';

import '../env.dart';
import '../models/fooditem/food.item.dart';
import '../models/order/order.dart';
import '../models/user/user.dart';

class Repository {
  /// Appwrite client
  final Client client = Client();

  /// Appwrite account service

  late Account account;

  /// Appwrite database serivce

  late Database database;

  /// Appwrite storage service

  late Storage storage;

  /// Sembast local database serivce

  sembast.Database? _db;

  /// File path to a file in the current directory
  String dbName = 'foodmagic.db';

  /// dbFactory instance
  sembast.DatabaseFactory dbFactory = databaseFactoryIo;

  // Store
  final _store = sembast.stringMapStoreFactory.store('common_store');

  /// Keys
  static const USERKEY = 'userkey';
  static const SESSIONKEY = 'sessionkey';
  static const CARTKEY = 'cartkey';

  final read = ['*'];
  final write = ['*'];

  /// Call await getDb when modifying the store
  Future<sembast.Database> getDb() async {
    if (_db == null) {
      var path = (await getApplicationSupportDirectory()).path + "/" + dbName;
      _db = await dbFactory.openDatabase(path);
    }
    return _db!;
  }

  Repository() {
    // load environment vairables
    client
        .setEndpoint('https://$IP/v1') // Your Appwrite Endpoint
        .setProject(PROJECT_ID) // Your project ID
        .setSelfSigned();

    //intialize appwrite services
    database = Database(client);
    storage = Storage(client);
    account = Account(client);
  }

  /// Get the current Logged In user
  Future<Map<String, Object?>?> getLoggedInUser() async {
    try {
      final result = await account.get();
      print("LOGGEDINUSER : $result");
      if (result.statusCode == 200) {
        return result.data;
      } else
        return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<Uint8List?> getImage({required String fileId}) async {
    try {
      final image = await storage.getFileView(fileId: fileId);
      return image.data;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<User> getCurrentUser() async {
    final u = await _store.record(USERKEY).get(await getDb());
    final user = User.fromJson(u!);
    return user;
  }

  Future<String?> createUser(
      {required String name,
      required String password,
      required String email}) async {
    try {
      final Response user =
          await account.create(email: email, password: password, name: name);

      if (user.statusCode == 201) {
        // final Response session =
        await account.createSession(email: email, password: password);

        final res = await database.createDocument(
            collectionId: USER_COLLECTION,
            data: {'name': name, 'email': email},
            read: read,
            write: write);

        await _store.record(USERKEY).put(await getDb(), res.data);
      }
      return "success";
    } on AppwriteException catch (e) {
      print(e.message);
      return null;
    }
  }

  Future<void> signInUser(
      {required String password, required String email}) async {
    final Response session =
        await account.createSession(email: email, password: password);
    if (session.statusCode == 201) {
      print(session.data);
    }
  }

  Future signOut() async {
    try {
      await account.deleteSession(sessionId: 'current');
    } catch (e) {}
  }

  Future<List<FoodItem>> getFoodItems() async {
    try {
      List<FoodItem> food = [];
      final result =
          await database.listDocuments(collectionId: FOOD_COLLECTION);

      if (result.statusCode == 200) {
        final items = FoodItemDS.fromJson(result.data);
        food.addAll(items.items);
      }

      return food;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<CartData?> getCart() async {
    try {
      CartData? cart;
      final result = await _store.record(CARTKEY).get(await getDb());
      if (result != null) {
        cart = CartData.fromJson(result);
      }
      if (cart != null && cart.quantity != 0) {
        return cart;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> addCartItem({required CartData cart}) async {
    try {
      await _store.record(CARTKEY).put(await getDb(), cart.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteCartItem({required CartData cartData}) async {
    try {
      final result = await _store.record(CARTKEY).delete(await getDb());
      print(result);
    } on AppwriteException catch (e) {
      print(e.message);
    }
  }

  Future<void> updateCartItem({required CartData cartData}) async {
    try {
      await _store.record(CARTKEY).put(await getDb(), cartData.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateProfile({required User user}) async {
    final user = await getCurrentUser();

    try {
      final result = await database.updateDocument(
          collectionId: USER_COLLECTION,
          documentId: user.userId,
          data: {},
          read: read,
          write: write);
      print(result.data);
    } catch (e) {
      print(e);
    }
  }

  Future<void> placeOrder({required Order order}) async {
    try {
      final result = await database.createDocument(
          collectionId: ORDER_COLLECTION,
          data: order.toJson(),
          read: read,
          write: write);

      print(result.data);
    } on AppwriteException catch (e) {
      print(e.message);
    }
  }

  Future<List<Order>> getOrders() async {
    final user = await getCurrentUser();

    List<Order> orders = [];
    try {
      final result = await database.listDocuments(
          collectionId: ORDER_COLLECTION, filters: ['userId=${user.userId}']);

      print(result.statusCode);

      if (result.statusCode == 200) {
        final o = OrderDS.fromJson(result.data);
        print(o);
        orders.addAll(o.orders);
        return orders;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
