import 'package:flutter/material.dart';

class NewCard extends StatelessWidget {
  int setCount;
  VoidCallback func;
  NewCard({super.key, required this.setCount, required this.func});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // anak1
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // konten
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // gambar
                  Row(
                    children: [
                      Image.network(
                        'https://static.wikia.nocookie.net/undertale/images/a/a6/Sans_overworld.png/revision/latest/scale-to-width/360?cb=20220219115125',
                        width: 200,
                        height: 200,
                      ),

                      // title
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text('Judul'), Text('Sub Judul')],
                      ),
                    ],
                  ),

                  // action
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_right)),
                ],
              ),

              // action
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //tombol klik
                  ElevatedButton(onPressed: func, child: Text("$setCount")),

                  //icon-icon
                  Row(
                    children: [
                      Icon(Icons.access_alarm),
                      Icon(Icons.access_alarm),
                      Icon(Icons.access_alarm),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
