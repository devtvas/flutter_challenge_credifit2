import 'package:flutter/material.dart';

class ThemeWidget extends StatelessWidget {
  const ThemeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
        colors: [
          Color.fromARGB(255, 253, 72, 72),
          Color.fromARGB(255, 87, 97, 249),
        ],
        stops: [0.0, 1.0],
      )),
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            'D E V T V A S',
            style: textTheme.headline1!.copyWith(
                color: Colors.grey.shade800.withOpacity(0.8),
                fontWeight: FontWeight.bold,
                fontSize: 50),
          ),
        ),
      ),
    );
  }
}
