import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:locator/models/users.dart';
import 'package:locator/ui/theme/colors.dart';
import 'package:locator/ui/theme/styles.dart';

import '../widgets/icons_widgets.dart';


class DetailedUserLocationPage extends StatefulWidget {
  final UserLocation data;

   const DetailedUserLocationPage({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailedUserLocationPage> createState() => _DetailedUserLocationPage();
}

class _DetailedUserLocationPage extends State<DetailedUserLocationPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        children: [
          Column(
              children: [
                SizedBox(height: 50.0,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Left Row
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white // Adjust the color as needed
                        ),
                        child:  Center(
                          child: GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: iconBlack, // Adjust the icon color as needed
                              size: 20.0, // Adjust the icon size as needed
                            ),
                          ),
                        ),
                      ),

                      Container(
                        width: 40,
                        height: 40,
                        child:  Center(
                            child: Text(widget.data.name, style: CustomTextStyles.meddiumLarge,)
                        ),
                      ),
                      // Right Row
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black // Adjust the color as needed
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.send,
                            color: white, // Adjust the icon color as needed
                            size: 20.0, // Adjust the icon size as needed
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0,),

                ClipOval(
                  child: Image(
                    image: NetworkImage(widget.data.avatar),
                    width: 100,
                    height: 100,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return const CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 20,
                        );
                      }
                    },
                  ),
                ),
                SizedBox(height: 20.0,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    width: 350.0,
                    // Adjust the width as needed
                    height: 60.0,
                    color: Colors.white,
                    // Background color of the container
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 30,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black54, // Color of the border
                              width: 1.0, // Width of the border
                            ),
                          ),
                          child:  const Center(child:  Icon(Icons.info_outline, size: 20.0, color:baseGrey4,),
                          ),
                        ),
                        SizedBox(width: 25.0),
                        ClipRRect(
                            child: Container(
                              width: 60.0,
                              height: 30.0,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(20.0),
                                color: green,
                              ),
                              child: Center(
                                  child: Text(
                                    widget.data.id,
                                    style: CustomTextStyles.smallText,
                                  )),
                            )),
                        SizedBox(width: 35.0),
                        Container(
                          width: 30,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black54, // Color of the border
                              width: 1.0, // Width of the border
                            ),
                          ),
                          child:  Center(child:  Icon(Icons.message_outlined, size: 20.0, color:baseGrey4,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.0,),


                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20),
                    child: Container(
                      width: double.infinity, // Adjust the width as needed
                      height: 100.0, // Adjust the height as needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: white, // Container background color
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Left Row
                            Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                Text("Now is", style: CustomTextStyles.meddiumLarge,),
                                SizedBox(height: 5.0,),
                                Text(widget.data.street[0].name),
                                SizedBox(height: 5.0,),

                                Text(widget.data.place),
                              ],
                            ),


                            // Right Row
                            Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: black, // Adjust the icon color as needed
                                  size: 20.0, // Adjust the icon size as needed
                                ),
                                SizedBox(height: 5.0,),

                                Text(widget.data.street[0].time),
                                SizedBox(height: 5.0,),

                                const Text("9 min updated"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.0,),


                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0,right: 20),
                    child: Container(
                      width: double.infinity, // Adjust the width as needed
                      height: 300.0, // Adjust the height as needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: white, // Container background color
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(13.0),
                          child:Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Last Update", style: CustomTextStyles.meddiumLarge,),
                                  const Icon(
                                    Icons.upload,
                                    color: black, // Adjust the icon color as needed
                                    size: 20.0, // Adjust the icon size as needed
                                  ),
                                ],

                              ),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: widget.data.street.length,
                                  itemExtent: 30, // Set the height of each item
                                  itemBuilder: (context, index) {
                                    Street street = widget.data.street[index];
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Left Row
                                        Column(
                                          crossAxisAlignment:CrossAxisAlignment.start,
                                          children: [
                                            Text(street.name, style: CustomTextStyles.normalText,),
                                          ],
                                        ),


                                        // Right Row
                                        Column(
                                          crossAxisAlignment:CrossAxisAlignment.start,
                                          children: [
                                            Text(street.time, style: CustomTextStyles.textLarge),
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          )



                      ),
                    ),
                  ),
                ),

              ]
          ),

            Positioned(
            top: 666,
            left: 16,
            right: 16,
            child:  ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: 350.0,
                // Adjust the width as needed
                height: 60.0,
                color: Colors.transparent,
                // Background color of the container
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 30,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: black,
                        border: Border.all(
                          color: Colors.black54, // Color of the border
                          width: 1.0, // Width of the border
                        ),
                      ),
                      child:  Center(child:  Icon(Icons.phone, size: 20.0, color:white,),
                      ),
                    ),
                    SizedBox(width: 25.0),
                    ClipRRect(
                        child: Container(
                          width: 100.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(20.0),
                            color: black,
                          ),
                          child: const Center(
                              child: Text(
                                "Follow",
                                style: TextStyle(color: white, fontSize: 16),
                              )),
                        )),
                    SizedBox(width: 35.0),
                    Container(
                      width: 30,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: black,
                        border: Border.all(
                          color: Colors.black54, // Color of the border
                          width: 1.0, // Width of the border
                        ),
                      ),
                      child:  Center(child:  Icon(Icons.battery_2_bar_sharp, size: 20.0, color:white,),
                      ),
                    ),
                  ],
                ),
              ),
            ),)
        ],

      ),
      );
  }
}


