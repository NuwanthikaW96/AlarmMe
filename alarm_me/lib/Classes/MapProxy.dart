import 'Location.dart';

class MapProxy{
  Location location;

  MapProxy(Location location) {
    this.location=location;
  }
  void check(List currlatlong) {
    List latlong=location.get();
    if (((latlong[0]-currlatlong[0]).abs())<5 && ((latlong[1]-currlatlong[1]).abs())<5) {
      //ring bell
    }
  }

}