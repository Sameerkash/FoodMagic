import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodmagic/models/cartitem/cart.item.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart' as sembast;
import 'package:sembast/sembast_io.dart';

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

  // ignore: non_constant_identifier_names
  static String FOOD_COLLECTION = env['FOOD_COLLECTION']!;
  // ignore: non_constant_identifier_names
  static String USER_COLLECTION = env['USER_COLLECTION']!;
  // ignore: non_constant_identifier_names
  static String ORDER_COLLECTION = env['ORDER_COLLECTION']!;
  // ignore: non_constant_identifier_names
  static String CART_COLLECTION = env['CART_COLLECTION']!;

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
        .setEndpoint('https://${env['IP']}/v1') // Your Appwrite Endpoint
        .setProject(env['PROJECT_ID']) // Your project ID
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
      print(user.statusCode);
      print("USER $USER_COLLECTION");

      if (user.statusCode == 201) {
        // final Response session =
        await account.createSession(email: email, password: password);

        final res = await database.createDocument(
            collectionId: USER_COLLECTION,
            data: {'name': name, 'email': email},
            read: read,
            write: write);

        print("USERCREATE : $res");

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
    print(session);
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
        print(result.data);

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

      final result =
          await database.listDocuments(collectionId: FOOD_COLLECTION);

      if (result.statusCode == 200) {
        cart = CartData.fromJson(result.data);
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

  Future<void> addCartItem({required Order order}) async {
    try {
      // final result =
      await database.createDocument(
          collectionId: CART_COLLECTION, data: {}, read: read, write: write);
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteCartItem({required Order order}) async {
    try {
      // final result =
      await database.deleteDocument(
          collectionId: CART_COLLECTION, documentId: order.orderId);
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateCartItem({required Order order}) async {
    try {
      final result = await database.updateDocument(
          collectionId: CART_COLLECTION,
          documentId: order.orderId,
          data: {},
          write: write,
          read: read);

      print(result.data);
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
          collectionId: ORDER_COLLECTION, data: {}, read: read, write: write);

      print(result.data);
    } catch (e) {
      print(e);
    }
  }

  Future<Order?> getOrders() async {
    final user = await getCurrentUser();
    try {
      final result = await database.listDocuments(
          collectionId: ORDER_COLLECTION, filters: ['userId=${user.userId}']);
      if (result.statusCode == 201) {
        return Order.fromJson(result.data);
      }
    } catch (e) {
      return null;
    }
  }
}
