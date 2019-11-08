

class Location {
  double latitude;
  double longitude;

  Location(double latitude,double longitude) {
    this.latitude=latitude;
    this.longitude=longitude;
  }
  void set(double latitude,double longitude) {
    this.latitude=latitude;
    this.longitude=longitude;    
  }

  List get() {
    return [this.latitude=latitude,this.longitude=longitude];
  }
}