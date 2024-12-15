
import 'package:flutter/material.dart';

class CartScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          
    // Code for Basic screen body with four blocks
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // First Block
        Container(
          height: 100,
          color: Colors.blue,
          child: Center(
            child: Text('Block 1'),
          ),
        ),
        SizedBox(height: 20),
        // Second Block
        Container(
          height: 100,
          color: Colors.green,
          child: Center(
            child: Text('Block 2'),
          ),
        ),
        SizedBox(height: 20),
        // Third Block
        Container(
          height: 100,
          color: Colors.orange,
          child: Center(
            child: Text('Block 3'),
          ),
        ),
        SizedBox(height: 20),
        // Fourth Block
        Container(
          height: 100,
          color: Colors.purple,
          child: Center(
            child: Text('Block 4'),
          ),
        ),
      ],
    )
  
        ],
      ),
    );
  }
}
    