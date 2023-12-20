import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DistanceCalculator extends StatelessWidget {
   DistanceCalculator({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Distance Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        
      ),
    );
  }
  
}

