import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:locator/bloc/repository/user_location_cubit.dart';
import 'package:locator/bloc/repository/user_location_state.dart';
import 'package:locator/ui/pages/detailed_location.dart';
import 'package:locator/ui/widgets/icons_widgets.dart';

import '../theme/colors.dart';
import '../theme/styles.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  late List<String> mainListTabToggle = <String>["All", "People", "Items"];

  @override
  void initState() {
    super.initState();

    // Fetch user location when the page is initiated
    context.read<UserLocationCubit>().fetchUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserLocationCubit, UserLocationState>(
        builder: (context, state) {
          if (state is LocationInitial) {
            return  Center(child: Text("Please wait.....", style: CustomTextStyles.meddiumLarge));
          } else if (state is LocationLoaded) {
            return Stack(children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                    target: LatLng(-1.2767338, 36.7879011), zoom: 15),
                markers: Set.from(state.markers),
                zoomControlsEnabled: false,

                onMapCreated: (controller) async {
                  controller.setMapStyle(await rootBundle
                      .loadString('assets/map/maps_style.json'));
                },
              ),
              Positioned(
                top: 56,
                left: 16,
                child:  Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(20), // Set the corner radius
                  ),
                  child: Container(
                    width:40,
                    height: 40,
                    child: Center(
                      child: Icon(
                        Icons.search,
                        color: iconBlack,
                        // Adjust the icon color as needed
                        size: 20.0, // Adjust the icon size as needed
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 56,
                right: 16,
                child:  Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                    BorderRadius.circular(20), // Set the corner radius
                  ),
                  child: Container(
                    width:40,
                    height: 40,
                    child: Center(
                      child: Image.asset(
                        'assets/icons/settings.png',
                        width: 25.0, // Adjust the width of the image
                        height: 25.0, // Adjust the height of the image
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 200,
                left: 16,
                child: Column(
                  children: [
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(20), // Set the corner radius
                      ),
                      child: Container(
                        width:40,
                        height: 40,
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: iconBlack,
                            // Adjust the icon color as needed
                            size: 20.0, // Adjust the icon size as needed
                          ),
                        ),
                      ),
                    ),

                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(20), // Set the corner radius
                      ),
                      child: Container(
                        width:40,
                        height: 40,
                        child: Center(
                          child: Image.asset(
                            'assets/icons/minus.png',
                            width: 20.0, // Adjust the width of the image
                            height: 20.0, // Adjust the height of the image
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Card(
                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(20), // Set the corner radius
                      ),
                      child: Container(
                        width:40,
                        height: 40,
                        child: Center(
                          child: Image.asset(
                            'assets/icons/send.png',
                            width: 20.0, // Adjust the width of the image
                            height: 20.0, // Adjust the height of the image
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),

                  ],
                ),
              ),
              Positioned(
                  top: 366,
                  left: 13,
                  right: 13,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 150.0, // Adjust the width as needed
                            height: 50.0, // Adjust the height as needed
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white, // Container background color
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color:
                                            green, // Background color of the container
                                      ),
                                      child: Icon(Icons.add, size: 25.0)),
                                  const SizedBox(width: 8.0),
                                  const Text(
                                    'Add new tag',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Container(
                            width: 150.0, // Adjust the width as needed
                            height: 50.0, // Adjust the height as needed
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.white, // Container background color
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color:
                                            green, // Background color of the container
                                      ),
                                      child: const Icon(Icons.add, size: 25.0)),
                                  const SizedBox(width: 8.0),
                                  const Text(
                                    'Add new item',
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ])),
              Positioned(
                  top: 446,
                  left: 13,
                  right: 13,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Container(
                      width: 200.0, // Adjust the width as needed
                      height: 210.0, // Adjust the height as needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: green, // Container background color
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Container(
                                      width: 60.0,
                                      // Adjust the width as needed
                                      height: 30.0,
                                      // Adjust the height as needed
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color:
                                            lightgreen, // Container background color
                                      ),
                                      child: Center(
                                          child: Text(
                                        "All",
                                        style: CustomTextStyles.smallText,
                                      )),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Container(
                                      width: 60.0,
                                      // Adjust the width as needed
                                      height: 30.0,
                                      // Adjust the height as needed
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color:
                                            lightgreen, // Container background color
                                      ),
                                      child: Center(
                                          child: Text(
                                        "People",
                                        style: CustomTextStyles.smallText,
                                      )),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Container(
                                      width: 60.0,
                                      // Adjust the width as needed
                                      height: 30.0,
                                      // Adjust the height as needed
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color:
                                            lightgreen, // Container background color
                                      ),
                                      child: Center(
                                          child: Text(
                                        "Items",
                                        style: CustomTextStyles.smallText,
                                      )),
                                    )),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Container(
                                      width: 30.0,
                                      // Adjust the width as needed
                                      height: 30.0,
                                      // Adjust the height as needed
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.green,
                                          // Color of the border
                                          width: 1.0, // Width of the border
                                        ),
                                      ),
                                      child: Image.asset(
                                        'assets/icons/dots.png',
                                        width: 20.0,
                                        // Adjust the width of the image
                                        height:
                                            20.0, // Adjust the height of the image
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemCount: 2,
                              itemBuilder: (context, index) {
                                var location = state.userLocation[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: buildUserDataRow(location),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              Positioned(
                top: 706,
                left: 16,
                right: 16,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35.0),
                  child: Container(
                    color: Colors.white,
                    // Background color of the container
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomIcons(
                            icon: Icons.share_location_sharp, text: 'Location'),
                        SizedBox(width: 35.0),
                        CustomIcons(icon: Icons.route_outlined, text: 'Drive'),
                        SizedBox(width: 35.0),
                        CustomIcons(
                            icon: Icons.safety_check_sharp, text: 'Safery'),
                        SizedBox(width: 35.0),
                        CustomIcons(
                            icon: Icons.chat_bubble_outline_sharp,
                            text: 'Chat'),
                      ],
                    ),
                  ),
                ),
              ),
            ]);
          } else if (state is LocationError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget buildUserDataRow(location) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailedUserLocationPage(data: location)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left Row
            Row(
              children: [
                ClipOval(
                  child: Image(
                    image: NetworkImage(location.avatar),
                    width: 50,
                    height: 50,
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
                // Example icon on the left
                const SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location.name,
                      style: CustomTextStyles.textLarge,
                    ),
                    Text(
                      location.street[0].name,
                      style: CustomTextStyles.smallText,
                    ),
                  ],
                )
                // Optional spacing between icon and text
              ],
            ),

            // Right Row
            Row(
              children: [
                Container(
                  width: 30,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.green, // Color of the border
                      width: 1.0, // Width of the border
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.battery_2_bar_sharp,
                      size: 20.0,
                      color: baseGrey4,
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                // Optional spacing between text and icon
                Icon(Icons.send),
                // Example icon on the right
              ],
            ),
          ],
        ),
      ),
    );
  }
}
