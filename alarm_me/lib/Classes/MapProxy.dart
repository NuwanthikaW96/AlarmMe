import 'Location.dart';

class MapProxy {
  Location location;
  
  MapProxy(Location location){
    this.location=location;
  }

  void update(List currLatLon){
    List latLon=location.get();
    if ((latLon[0]-currLatLon[0]).abs()<1 && (latLon[1]-currLatLon[1]).abs()<1) {
      //TODO ring alarm
    }
  }
}