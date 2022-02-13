import 'package:flutter/material.dart';

class WrapPage extends StatelessWidget {
  const WrapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> _list = [_image(), _image(), _image(), _image(), _image()];

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            // 要素が画面幅に収まらず、エラーが発生してしまう。(A RenderFlex overflowed by 〜 pixels on the right.)
            Row(
              children: _list,
            ),
            const SizedBox(
              height: 100,
            ),
            // 要素が画面幅を超える場合、良い感じに折り返して表示してくれる。（4つ目の画像が折り返されている）
            Wrap(
              children: _list,
            ),
          ],
        ),
      ),
    );
  }

  Widget _image() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        'assets/images/wrap.png',
        height: 100,
        width: 100,
        fit: BoxFit.cover,
      ),
    );
  }
}
