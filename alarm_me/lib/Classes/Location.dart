class Location{
  double longitude;
  double latitude;

  Location(double longitude,double latitude){
    this.longitude=longitude;
    this.latitude=latitude;
  }

  void set(double longitude,double latitude){
    this.longitude=longitude;
    this.latitude=latitude;    
  }

  List get(){
    return [latitude,longitude];
  }
}
