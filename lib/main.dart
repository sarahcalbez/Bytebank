import 'package:flutter/material.dart';

void main() => runApp(
      Column(
        children: <Widget>[
          Text(
            '4 Deliver features faster',
            textDirection: TextDirection.ltr,
          ),
          Text(
            '3 Craft beautiful UIs',
            textDirection: TextDirection.ltr,
          ),
          Text(
            '2 Craft beautiful UIs',
            textDirection: TextDirection.ltr,
          ),
          Column(children: <Widget>[
            Text(
              '1 Craft beautiful UIs',
              textDirection: TextDirection.ltr,
            ),
          ])
        ],
      ), //Column
    );
