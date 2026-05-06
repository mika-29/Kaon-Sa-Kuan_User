import 'package:flutter/material.dart';

class AddRestaurantPage extends StatelessWidget {
  const AddRestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Restaurant'),
      ),
      body: const Center(
        child: Text('Add Restaurant Page'),
      ),
    );
  }
}