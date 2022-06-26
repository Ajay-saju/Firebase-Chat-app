import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<QuerySnapshot>(
          
          stream: FirebaseFirestore.instance
              .collection('Chatt collection/o8r7KjqokN9E9UKZpXSy/Messages')
              .snapshots(),
          builder: ( context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator());
            }
            final docs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child:  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(docs[index]['text']),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text('Add '),
        onPressed: () async {
          FirebaseFirestore.instance
              .collection('Chatt collection/o8r7KjqokN9E9UKZpXSy/Messages')
              .add({
                'text' : 'I want to learn more about flutter'
              });
             
        },
      ),
    );
  }
}
