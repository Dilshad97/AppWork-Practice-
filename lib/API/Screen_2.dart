import 'package:flutter/material.dart';

class Screen_2 extends StatefulWidget {
  const Screen_2({Key? key}) : super(key: key);

  @override
  _Screen_2State createState() => _Screen_2State();
}

class _Screen_2State extends State<Screen_2> {

  final List Items = [
    {
      "image": "https://www.gstatic.com/images/branding/product/2x/photos_96dp.png",
      "tittle":"dilshad",
    },
    {
      "image": "https://www.gstatic.com/images/branding/product/2x/photos_96dp.png",
      "tittle":"dilshad",
    },
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search'
                    ),
                  ),
                ),


                Text("Kirtan(55)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: Items.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [

                          Card(
                            child: Container(
                              width: 160,
                              height: 160,
                              child:Image.network(Items[index]["image"])
                            ),
                          ),
                          Text(Items[index]["tittle"],style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400),),
                        ],
                      );

                  },),
                ),
                Text("Album (7)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: Items.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [

                          Card(
                            child: Container(
                                width: 160,
                                height: 160,
                                child:Image.network(Items[index]["image"])
                            ),
                          ),
                          Text(Items[index]["tittle"],style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400)),
                        ],
                      );

                    },),
                ),
                Text("Occasion (1)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: Items.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [

                          Card(
                            child: Container(
                                width: 160,
                                height: 160,
                                child:Image.network(Items[index]["image"])
                            ),
                          ),
                          Text(Items[index]["tittle"],style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400)),
                        ],
                      );

                    },),
                ),
                Text("Singer (1)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: Items.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [

                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey,
                            backgroundImage: NetworkImage(Items[index]["image"]),
                          ),
                          Text(Items[index]["tittle"],style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400)),
                        ],
                      );

                    },),
                ),
                Text("Creater (2)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: Items.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [

                          Card(
                            child: Container(
                                width: 160,
                                height: 160,
                                child:Image.network(Items[index]["image"])
                            ),
                          ),
                          Text(Items[index]["tittle"],style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400)),
                        ],
                      );

                    },),
                ),
              ],
            ),
          ),
        ));
  }
}
