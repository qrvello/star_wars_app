import 'package:flutter/material.dart';

class CharacterDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Luke Skywalker'),
      ),
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Adasdasd'),
                  Text('Adasdasd'),
                  Text('Adasdasd'),
                  Text('Adasdasd'),
                  Text('Adasdasd'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
