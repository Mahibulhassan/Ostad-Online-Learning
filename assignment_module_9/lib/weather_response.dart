
class ApiResponse {

  String condition;
  int temp;
  double feelLike;
  int tempMin;
  int tempMax;
  String Country;
  String location;
  String icon;

  ApiResponse(this.condition,this.Country,this.feelLike,this.location,this.temp,this.tempMax,this.tempMin,this.icon);

}