import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseTestScreen extends StatefulWidget {
  const FirebaseTestScreen({super.key});

  @override
  State<FirebaseTestScreen> createState() => _FirebaseTestScreenState();
}

class _FirebaseTestScreenState extends State<FirebaseTestScreen> {
  CollectionReference product = FirebaseFirestore.instance.collection('users');

  final TextEditingController IDController = TextEditingController();
  final TextEditingController PWController = TextEditingController();

  Future<void> _create() async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          child: Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: IDController,
                  decoration: InputDecoration(labelText: '아이디'),
                ),
                TextField(
                  controller: PWController,
                  decoration: InputDecoration(labelText: '비밀번호'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final String ID = IDController.text;
                    final String PW = PWController.text;
                    await product.add({"ID": ID, "Password": PW});
                    IDController.text = "";
                    PWController.text = "";
                    Navigator.of(context).pop();
                  },
                  child: Text('Create'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _delete(String productID) async {
    await product.doc(productID).delete();
  }

  Future<void> _update(DocumentSnapshot documentSnapshot) async {
    IDController.text = documentSnapshot['ID'];
    PWController.text = documentSnapshot['Password'];

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          child: Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: IDController,
                  decoration: InputDecoration(labelText: '아이디'),
                ),
                TextField(
                  controller: PWController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final String ID = IDController.text;
                    final String PW = PWController.text;
                    product
                        .doc(documentSnapshot.id)
                        .update({"ID": ID, "Password": PW});
                    IDController.text = "";
                    PWController.text = "";
                    Navigator.of(context).pop();
                  },
                  child: Text('Update'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> alertD(String productID) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("dialog"),
            content: Text("삭제하시겠습니까?"),
            actions: [
              TextButton(
                onPressed: () async {
                  await product.doc(productID).delete();
                  Navigator.of(context).pop();
                },
                child: Text("삭제"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("취소"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase CRUD - Provider X"),
      ),
      body: StreamBuilder(
        stream: product.snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  child: ListTile(
                    title: Text(documentSnapshot['ID']),
                    subtitle: Text(documentSnapshot['Password']),
                    trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                _update(documentSnapshot);
                              },
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                alertD(documentSnapshot.id);
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        )),
                  ),
                );
              },
            );
          }
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          _create();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
