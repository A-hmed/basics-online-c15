import 'package:flutter/material.dart';
import 'package:flutter_basics_c15/main.dart';
import 'package:flutter_basics_c15/model/hotel.dart';

class HotelWidget extends StatelessWidget {
  HotelDM hotel;

  HotelWidget(this.hotel);

  @override
  Widget build(BuildContext context) {
    return Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
    Image.asset(hotel.image),
    Container(
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(8),
        width: double.infinity,
        decoration: blueRoundedBox,
        child: Text(
           hotel.name,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        )),
          ],
        );
  }
}
