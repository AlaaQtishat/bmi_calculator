import 'package:flutter/material.dart';
// This is the widget that we created to represent a reusable card.
// Whenever we need to create a card, we just create an instance of this class (widget).

class ReusableCard extends StatelessWidget {
  final Color? colour;
  final Widget? cardChild; // The child widget to be displayed inside the card
  // The function to be executed when the card is tapped
  final VoidCallback? onPress;

  ReusableCard({this.colour, this.cardChild, this.onPress});
  @override
  Widget build(BuildContext context) {
    //the GestureDetector is to detect a tap
    return GestureDetector(
      // onTap is triggered when the card is tapped. It calls the onPress function
      onTap: onPress,
      // The card itself is a Container widget that can hold other widgets.
      child: Container(
        // cardChild is the widget that will be shown inside the card.
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
