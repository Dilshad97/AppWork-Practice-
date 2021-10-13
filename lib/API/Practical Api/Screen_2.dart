import 'dart:convert';
import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class Screen_2 extends StatefulWidget {
  const Screen_2( {Key? key}) : super(key: key);

  @override
  _Screen_2State createState() => _Screen_2State();
}

class _Screen_2State extends State<Screen_2> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onNotificationLoad();
  }
  final List items = [
    {
      "image": "https://www.gstatic.com/images/branding/product/2x/photos_96dp.png",
      "tittle":"dilshad",
    },
    {
      "image": "https://www.gstatic.com/images/branding/product/2x/photos_96dp.png",
      "tittle":"dilshad",
    },
  ];
TextEditingController cntrl =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title:Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
               onChanged: onItemChanged,
                controller: cntrl,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(

                        borderRadius: BorderRadius.circular(10)
                    ),
                    hintText: 'Search'
                ),
              ),
            ),
            leading: IconButton(icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text("Kirtan(55)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: notificationList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return  Container(
                        child: Column(
                          children: [
                            Card(
                              child: Container(
                                  width: 160,
                                  height: 160,
                                  child:CachedNetworkImage(
                                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                    imageUrl: notificationList[index]["thumbnail_image"] ,
                                  ),
                              ),
                            ),
                            Container(
                                width: 180,
                                child: Text(notificationList[index]["gallery_id"],textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                          ],
                        ),
                      );

                    },),
                ),
                Text("Album (7)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                Container(
                  height: 220,
                  child: ListView.builder(
                    itemCount: albumList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [

                          Card(
                            child: Container(
                                width: 160,
                                height: 160,
                                child:  CachedNetworkImage(
                                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                    imageUrl: albumList[index]["thumbnail_name"]),
                            ),
                          ),
                          Container(
                          width: 160,
                              child: Text(albumList[index]["gallery_name"],textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                        ],
                      );

                    },),
                ),
                Text("Occasion (1)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                Container(
                  height: 220,
                  child: ListView.builder(
                    itemCount: occasionList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [

                          Card(
                            child: Container(
                                width: 160,
                                height: 160,
                                child: CachedNetworkImage(
                                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                imageUrl:occasionList[index]["occasion_image"] ,
                                ),
                            ),
                          ),
                          Container(
                              width: 180,
                              child: Text(occasionList[index]["occasion_name"],textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold))),
                        ],
                      );

                    },),
                ),
                Text("Singer (1)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                SizedBox(height: 15,),
                Container(
                  height: 170,
                  child: ListView.builder(
                    itemCount: singerList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [

                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.blueGrey,
                            backgroundImage:CachedNetworkImageProvider(
                              singerList[index]["singer_image"],
                            )

                            // NetworkImage(singerList[index]["singer_image"]),
                          ),
                          Container(
                              width: 160,
                              child: Text(singerList[index]["singer_name"],textAlign: TextAlign.center,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400))),
                        ],
                      );

                    },),
                ),
                Text("Creater (2)",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                Container(
                  height: 200,
                  child: ListView.builder(
                    itemCount: items.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [

                          Card(
                            child: Container(
                                width: 160,
                                height: 160,

                                child: CachedNetworkImage(
                                  placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                  imageUrl: items[index]["image"],
                                ),
                            ),
                          ),
                          Text(items[index]["tittle"],style: TextStyle(fontSize: 22,fontWeight: FontWeight.w400)),
                        ],
                      );

                    },),
                ),
              ],
            ),
          ),
        ));
  }





  onItemChanged(String value) {
    setState(() {
      notificationList
          .where((string) => string.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }


/*
taking dynamic List variables for listview.builder
*/

  List<dynamic> notificationList= [];
  List<dynamic> albumList= [];
  List<dynamic> occasionList= [];
  List<dynamic> singerList= [];
  List<dynamic> creatorList= [];

 /*
 making function to call http api
 */
  onNotificationLoad() async {
    {
      var response =
      await http.post(Uri.parse('https://www.rajkotgurukul.org/api/search'),
          headers: {
            'Accept': 'application/json',
          },
          body: {
            'api_key':'MjgyfmNpcGhwN34yMDIxLTA0LTE0',
            'search_keyword':'b',
            'language':'1',
          }
      );
      print(response);

      /*
      making condition to check status code
      */

      if (response.statusCode == 200) {
        var decode = jsonDecode(response.body) ;
       log(decode.toString());

      /* 1. checking loop for the list in json
         2. search data is Model name in json file*/

        for (int i = 0; i < decode['search_data'].length; i++) {
          setState(() {
          /* 1. kirtan_data data is Class name in json file
             2. decoded json data of kirtan_data from Model search_data will add in dynamic type of list variable notificationList which is declared above*/

            notificationList.add(decode['search_data']['kirtan_data'][i]);

          });
         /* 1.checking responce on terminal for search_data => kirtan_data =>crator_name
            2.creator name is object of class Kirtan in json file*/

         log('notificationLis ${decode['search_data']['kirtan_data'][i]['creator_name']}');
        }
       /* 1. checking loop for the list in json
          2. search data is Model name in json file*/
        for (int i = 0; i < decode['search_data'].length; i++) {
          setState(() {
       /*
        album_data data is Class name in json file
        */

            albumList.add(decode['search_data']['album_data'][i]);

          });
          /* 1. checking responce on terminal for search_data => album_data =>gallery_name
             2. gallery_name is object of class album_data in json file*/

          log('albumList ${decode['search_data']['album_data'][i]['gallery_name']}');
        }
        /*
        checking loop for the list in json
        */

        for (int i = 0; i < decode['search_data'].length; i++) {
          setState(() {
        /*
        occasion_data & singer_data is Class name in json file
        */

            occasionList.add(decode['search_data']['occasion_data'][i]);
            singerList.add(decode['search_data']['singer_data'][i]);
            // creatorList.add(decode['search_data']['creatorList'][i]);
         });

          /* 1.checking responce on terminal for search_data => occasion_data =>crator_name
             2.checking responce on terminal for search_data => singer_data =>singer_name
             3.occasion_name is object of class Kirtan in json file
             4.singer_name is object of class Kirtan in json file*/


          log('occasionList ${decode['search_data']['occasion_data'][i]['occasion_name']}');
          log('singerList ${decode['search_data']['singer_data'][i]['singer_name']}');
          // log('creatorList ${decode['search_data']['creatorList'][i]['creator_name']}');
        }
        // for (int i = 0; i < decode['search_data'].length; i++) {
        //   setState(() {
        //     singerList.add(decode['search_data']['singer_data'][i]);
        //
        //   });
        //   log('singerList ${decode['search_data']['singer_data'][i]['singer_name']}');
        // }

      }

      return;
    }
  }



}
