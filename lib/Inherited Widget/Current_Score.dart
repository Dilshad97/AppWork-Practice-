import 'package:appwork/Inherited%20Widget/Info.dart';
import 'package:flutter/cupertino.dart';

class CurrentScore extends StatelessWidget {

  const CurrentScore();

  @override
  Widget build(BuildContext context) {
    print('CurrentScore rebuilt');
    final Info? info = Info.of(context);

    return Container(
      child: Text(info!.score.toString()),
    );
  }
}