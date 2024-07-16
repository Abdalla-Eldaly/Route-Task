import 'package:flutter/material.dart';
import 'package:route_task/domain/models/models.dart';

class HomeDetailsScreen extends StatelessWidget {
  const HomeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Product args = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title??"okey"), // Removed the const keyword here
      ),
      body: Center(
        child: Text('Details for ${args.title??"okey"}'),
      ),
    );
  }
}
