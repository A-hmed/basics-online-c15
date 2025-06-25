import 'package:flutter/material.dart';
import 'package:flutter_basics_c15/model/hotel.dart';
import 'package:flutter_basics_c15/screens/hotels/hotel_widget.dart';

class HotelsScreen extends StatelessWidget {
  List<HotelDM> models = [
    HotelDM(name: "hotel 1", image: "assets/hotel_image.png"),
    HotelDM(name: "hotel 3", image: "assets/hotel_image.png"),
    HotelDM(name: "hotel 4", image: "assets/hotel_image.png"),
    HotelDM(name: "hotel 5", image: "assets/hotel_image.png"),
    HotelDM(name: "hotel 6", image: "assets/hotel_image.png"),
  ];

  @override
  Widget build(BuildContext context) {
    // List<String> strings = ["1", "2", "3", "4"];
    // List<int> numbers = strings.map(
    //         (string){
    //   return int.parse(string);
    // }
    // ).toList();

    // List<Widget> hotelsWidgets = models.map((model) {
    //   return HotelWidget(model);
    // }).toList();

    // for(int i = 0; i < models.length; i ++){
    //   hotelsWidgets.add(
    //       HotelWidget(models[i])
    //   );
    // }
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: ListView.builder(
            itemCount: models.length,
            itemBuilder: (context, index) => HotelWidget(models[index])
            ),
      ),
    );
  }

  Widget mapHotelDMToWidget(HotelDM model) {
    return HotelWidget(model);
  }
}
