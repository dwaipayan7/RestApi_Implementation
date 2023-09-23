import 'package:flutter/material.dart';
import 'package:posts/services/remoteServices.dart';
import '../models/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getData();
  }

  getData() async{
      posts = await RemoteServices().getPosts();
      if(posts != null){
        setState(() {
          isLoaded = true;
        });
      }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: const Text('Posts'),
        ),
   body: Visibility(
     visible: isLoaded,
   child: ListView.builder(
     itemCount: posts?.length,
       itemBuilder: (BuildContext context, int index){
         return Container(
           child: Column(
             children: [
               Text(posts![index].title,
                 maxLines: 2,
                 overflow: TextOverflow.ellipsis,
                 style: TextStyle(
                 fontSize: 24, fontWeight: FontWeight.bold,

               ),
               ),

               Text(posts![index].body,
                 maxLines: 2,
                 overflow: TextOverflow.ellipsis,
                 style: TextStyle(
                   fontSize: 24, fontWeight: FontWeight.bold,

                 ),
               ),

             ],
           ),

         );
       }
   ),
     replacement: const Center(child: CircularProgressIndicator(),),
   ),
    );

  }
}

