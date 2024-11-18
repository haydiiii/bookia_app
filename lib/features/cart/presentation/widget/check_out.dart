import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading:
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
          automaticallyImplyLeading: false,
          title: Text(
            'CheckOut',
          )),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(),
            Gap(10),
            TextFormField(),
            Gap(10),
            TextFormField(),
            Gap(10),
            TextFormField(),
            Gap(10),
            TextFormField(
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
