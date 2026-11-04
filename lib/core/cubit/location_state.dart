import 'package:latlong2/latlong.dart';


abstract class LocationState {

}
class LocationInitial extends LocationState{}

class LocationLoading extends LocationState{}

class LocationLoaded extends LocationState{
  final String cityName;
  final LatLng currentPosition;

  LocationLoaded(this.cityName,this.currentPosition);
}
class LocationError extends LocationState{
  final String message;
  LocationError(this.message);
}
