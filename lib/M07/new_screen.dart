import 'package:flutter/material.dart';
import 'package:flutter_app/M07/new_card.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  bool? isLoad;
  int setCount = 0;
  @override
  void initState() {
    isLoad = true;
    tungguLoading();
    super.initState();
  }

  tungguLoading() async {
    await Future.delayed(Duration(seconds: 4));
    setState(() {
      isLoad = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:
          isLoad == true
              ? Center(child: CircularProgressIndicator())
              : NewCard(
                setCount: setCount,
                func: () {
                  setState(() {
                    setCount++;
                  });
                },
              ),
    );
  }
}
