import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class myInf extends StatefulWidget {
  var idKey;
  myInf({required this.idKey});
  @override
  State<myInf> createState() => _myInfState();
}

class _myInfState extends State<myInf> {
  @override
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('/Users/${widget.idKey}/userInf/')
            .snapshots(),
        builder: ((context, snapshot) {
          print(widget.idKey);
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<DocumentSnapshot> s1 = snapshot.data!.docs;
          // '${(s1[0] as dynamic)['userName']}'
          return Container();
        }),
      ),
    );
  }
}
