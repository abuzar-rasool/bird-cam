import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height:200,child: FlareActor("assets/loading.flr", alignment:Alignment.center, fit:BoxFit.contain, animation:"Untitled"));
  }
}
