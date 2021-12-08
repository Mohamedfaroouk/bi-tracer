import 'package:flutter/material.dart';

class Mothers extends StatefulWidget {
  const Mothers({Key? key}) : super(key: key);

  @override
  _MothersState createState() => _MothersState();
}

class _MothersState extends State<Mothers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mothers'),
        centerTitle: true,
      ),
body:StreamBuilder(
  stream: null,
  builder: (snapshot , context ){
    if (context.hasError) {
      return Center(child: Text('Something went wrong'));
    }
    if (context.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    }
   return Padding(
     padding: const EdgeInsets.symmetric(horizontal:10 , vertical: 15 ),
     child: ListView.builder(itemBuilder: (context , index){
       return ListTile(
       );
     },
       //itemCount: context.data.docs.length,
     ),
   );
  },
) ,
    );
  }
}
