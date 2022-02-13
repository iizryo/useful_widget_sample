import 'package:flutter/material.dart';

class FittedBoxPage extends StatelessWidget {
  const FittedBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          // FittedBoxを使わない場合、はみ出てしまう。
          Center(
            child: Container(
              width: 300,
              height: 150,
              color: Colors.deepOrange,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'はみ出るぞ!',
                style: TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          // FittedBoxを使う場合、fontSizeそのままでもはみ出ない。
          Center(
            child: Container(
              width: 300,
              height: 150,
              color: Colors.deepOrange,
              padding: const EdgeInsets.all(10),
              child: const FittedBox(
                child: Text(
                  'はみ出ない!',
                  style: TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          // FittedBoxを使う場合、fontSizeそのままで高さを縮めてもはみ出ない。
          Center(
            child: Container(
              width: 300,
              height: 80,
              color: Colors.deepOrange,
              padding: const EdgeInsets.all(10),
              child: const FittedBox(
                child: Text(
                  'はみ出ない!',
                  style: TextStyle(
                    fontSize: 80,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
