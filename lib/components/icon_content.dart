import 'package:flutter/material.dart';
import '../constants.dart';

/// A StatelessWidget that represents an icon with a label.
/// This widget is used inside the `ReusableCard` to display an icon and a label together.
class IconContent extends StatelessWidget {
  // The icon to be displayed inside the card.
  final IconData icon;

  // The text label below the icon.
  final String label;

  // Constructor to initialize the icon and label when creating an instance of IconContent.
  IconContent(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      // Centers the icon and text vertically in the column.
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Displays the icon.
        Icon(
          icon,
          size: 80.0, // Sets the size of the icon.
        ),
        SizedBox(
          height: 15.0, // Adds spacing between the icon and the text.
        ),
        // Displays the label text.
        Text(
          label,
          style: kLabelTextStyle, // Applies the predefined text style.
        ),
      ],
    );
  }
}
