import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'item_public.dart';

class ForYouPage extends StatelessWidget {
  ForYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FirestoreListView(
        query: FirebaseFirestore.instance
            .collection('posts')
            .where('public', isEqualTo: true),
        itemBuilder: (context, doc) {
          return ItemPublic(publicFData: doc.data());
        });
  }
}
