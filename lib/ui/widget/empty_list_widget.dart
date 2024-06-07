
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyListWidget extends StatelessWidget{
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {

       return Center(
         child:Column(
         mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Lottie.asset(
               'assets/lotties/animation.json',
               width: 200,
               height: 200,
               fit: BoxFit.scaleDown
           ),
            const SizedBox(height: 8,),
             const Text('Empty Todo List!',style: TextStyle(fontSize: 16,color: Colors.grey),)
    ]
         )

       );



  }

}