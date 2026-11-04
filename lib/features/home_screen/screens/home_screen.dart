import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:my_memories/core/cubit/location_cubit.dart';
import 'package:my_memories/core/cubit/location_state.dart';
import 'package:my_memories/core/theme/app_colors.dart';
import 'package:my_memories/features/home_screen/widgets/home_bottom_bar.dart';
import 'package:my_memories/features/home_screen/widgets/home_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final MapController _mapController=MapController();
  @override
  Widget build(BuildContext context) {
   
   return BlocProvider(
    create: (BuildContext context)=>LocationCubit()..fetchUserLocation(),
    child:BlocConsumer<LocationCubit,LocationState>(
      listener: (context,state){
        if(state is LocationLoaded){
          _mapController.move(state.currentPosition, 15.0);
        }
      }, 
      builder: (context,state){
        String displayLocation = 'Loading location...';
          if (state is LocationLoaded) {
            displayLocation = state.cityName;
          } else if (state is LocationError) {
            displayLocation = 'Location Unknown';
          }
           return Scaffold(
    body: Stack(
      children: [
        FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: LatLng(31.9522, 35.2332),
            initialZoom: 13,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',//this url without street names
              userAgentPackageName: 'com.example.my_memories',
            )
          ]
          ),
       HomeHeader(
        displayLocation: displayLocation
        ),

        Positioned(
          bottom: 30,
          left: 20,
          right: 20,
          child: HomeBottomBar())
      ],
    ),
    );
      })
    );

   
  }
}