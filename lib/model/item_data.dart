import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_cafeteria/model/item_model.dart';

/// item data for backend operation
class ItemData {
  final collection = FirebaseFirestore.instance.collection('Items');

  /// Save a new item to Firestore
  Future<void> saveToFirestore(ItemModel item) async {
    try {
      await collection.add(item.toJson());
    } catch (e) {
      throw "Error saving item: $e";
    }
  }

  /// Update an existing item in Firestore
  Future<void> updateInFirestore(ItemModel item) async {
    try {
      await collection.doc(item.id).update(item.toJson());
    } catch (e) {
      throw "Error updating item: $e";
    }
  }

  /// Update a single field in Firestore
  Future<void> updateField(String itemId, String fieldName, dynamic value) async {
    try {
      await collection.doc(itemId).update({fieldName: value});
    } catch (e) {
      throw "Error updating field: $e";
    }
  }

  /// Delete an item from Firestore
  Future<void> deleteFromFirestore(String itemId) async {
    try {
      await collection.doc(itemId).delete();
    } catch (e) {
      throw "Error deleting item: $e";
    }
  }

  /// Fetch all items from Firestore
  Future<List<ItemModel>> fetchAllItems() async {
    try {
      // final snapshot = await collection.orderBy('Name', descending: false).get();
      final snapshot = await collection.orderBy('CreateDate', descending: true).get();
      return snapshot.docs.map((doc) => ItemModel.fromSnapshot(doc)).toList();
    } catch (e) {
      throw "Error fetching items: $e";
    }
  }

  /// Fetch a single item by ID
  Future<ItemModel> fetchItemById(String itemId) async {
    try {
      final document = await collection.doc(itemId).get();
      return ItemModel.fromSnapshot(document);
    } catch (e) {
      throw "Error fetching item: $e";
    }
  }

  /// Upload an image to Firebase Storage and return the URL
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw "Firebase Error: ${e.message}";
    } on PlatformException catch (e) {
      throw "Platform Error: ${e.message}";
    } catch (e) {
      throw "Something went wrong while uploading the image. Please try again.";
    }
  }
}
