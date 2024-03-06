import 'package:flutter/material.dart';
import 'package:rest_api_call/models/HTTPServiceCall.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  HTTPServiceCall httpServiceCall = HTTPServiceCall();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("RestAPI CALL"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: FutureBuilder(
        future: httpServiceCall.getPosts(),
        builder: (BuildContext context,AsyncSnapshot snapshot) {

          if (snapshot.data != null) {

            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context,index) {
                return  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    child: Column(
                      children: [

                        Text(snapshot.data[index].userId.toString(),style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 15),),

                        const SizedBox(height: 5,),

                        Text(snapshot.data[index].id.toString(),style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 15),),

                        const SizedBox(height: 5,),

                        Text(snapshot.data[index].title,style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 15),),

                        const SizedBox(height: 5,),

                        Text(snapshot.data[index].body,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 10),),

                      ],
                    ),
                  ),
                );

              },
            );

          }else {
            return const Center(child: CircularProgressIndicator(),);
          }

        },
      )
    );
  }
}
