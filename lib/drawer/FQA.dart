import 'package:flutter/material.dart';

class FQA extends StatelessWidget {
  const FQA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("most common questions")),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Text('1. How long has the house been on the market?',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text(
                  'All homes displayed during the application are constantly monitored and updated',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400, height: 1.5)),
              const Divider(
                height: 15,
                thickness: 3,
                indent: 50,
                endIndent: 50,
                color: Colors.red,
              ),
              Text('2. How much interest has there been in the property? ',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text(
                  'How many people have viewed the house? How many offers have there been? ',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400, height: 1.5)),
              const Divider(
                height: 15,
                thickness: 3,
                indent: 50,
                endIndent: 50,
                color: Colors.red,
              ),
              Text("3. Why is the owner selling the property? ",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text(
                  'This is vitally important. The owner might just be moving to a different area or a bigger property,',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400, height: 1.5)),
              const Divider(
                height: 15,
                thickness: 3,
                indent: 50,
                endIndent: 50,
                color: Colors.red,
              ),
              Text(
                '4. Are there any problems with the neighbours?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Text(
                'Also remember to ask how long the owner has lived there – as a quick move is another sure sign of issues.',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w400, height: 1.5),
              ),
              const Divider(
                height: 15,
                thickness: 3,
                indent: 50,
                endIndent: 50,
                color: Colors.red,
              ),
              Text("5. Whats the area like?",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text(
                  'Most importantly, do your own research. Keep in mind that any house can be renovated but it can’t be moved.',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400, height: 1.5)),
              Divider(
                height: 15,
                thickness: 3,
                indent: 50,
                endIndent: 50,
                color: Colors.red,
              ),
              Text("6. How’s the water pressure? ",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text(
                  'Check the taps and shower yourself as you’re looking around the property.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  )),
              Divider(
                height: 15,
                thickness: 3,
                indent: 50,
                endIndent: 50,
                color: Colors.red,
              ),
              Text('7. Is the property leasehold or freehold?',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text(
                  'you own the property (subject to the terms of the leasehold) for the length of your lease agreement',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400, height: 1.5)),
            ],
          ),
        ));
  }
}
