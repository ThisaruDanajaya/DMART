
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class hometab extends StatelessWidget {
  final CollectionReference _productRef =
  FirebaseFirestore.instance.collection("Products");

  get imagesHT => 'images';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(

        children: [

          FutureBuilder<QuerySnapshot>(
            future: _productRef.get(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) if (snapshot
                  .hasError) {
                return Center(
                  child: Text(snapshot.data.toString()),
                );
              }
              if (snapshot.data != null ) {
                return ListView(
                  children: snapshot.data!.docs.map((document) {
                    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                    return Container(
                    );
                  }).toList(),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
