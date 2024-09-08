import 'dart:convert';

import 'package:flutter_demo/model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<SamplePosts> samplePosts=[];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(),
      builder: (context,snapshot) {
        if(snapshot.hasData){
          return ListView.builder(
            itemCount: samplePosts.length,
            itemBuilder: (context,index){
              return Container(
                height: 130,
                color: Colors.greenAccent,
                padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                margin: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('latitude: ${samplePosts[index].latitude}',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(" longitude: ${samplePosts[index].latitude}",
                      style: TextStyle(fontSize: 18),
                    ),


                  ],
                ),
              );

            },

            // This trailing comma makes auto-formatting nicer for build methods.
          );

        }
        else{
          return Center(child: CircularProgressIndicator(),);
        }
      }
    );

  }
  Future<List<SamplePosts>> getData() async{
    final response=await http.get(Uri.parse('https://c7e1-2402-3a80-43b9-c5f1-194a-2f9c-8fb2-6c2f.ngrok-free.app/'));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      print(data);
      for(Map<String,dynamic> index in data){
        
      samplePosts.add(SamplePosts.fromJson(index));

    }
      return samplePosts;
    }else{

      return samplePosts;
    }
  }
}


