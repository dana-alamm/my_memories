import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_memories/core/cubit/location_state.dart';
import 'package:my_memories/core/services/location_services.dart';
import 'package:latlong2/latlong.dart';

class LocationCubit extends Cubit<LocationState>{
LocationCubit():super(LocationInitial());

Future<void>fetchUserLocation()async{
  emit(LocationLoading());

  try {
    final data=await LocationServices.getCurrrentLocationData();
    final position=LatLng(data['latitude'],data['longitude']);

    emit(LocationLoaded(data['cityName'],position));
  } catch (e) {
    emit(LocationError("Cann't find your location"));
  }
}
}