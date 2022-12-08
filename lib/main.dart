import 'package:flutter/material.dart';
import 'package:task1_ieee/todoScreen.dart';

void main() {
  runApp(const Home_Screen());
}
 class Home_Screen extends StatelessWidget {
   const Home_Screen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return const Todo();
   }
 }

