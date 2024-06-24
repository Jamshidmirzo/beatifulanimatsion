import 'dart:async';

import 'package:flutter/material.dart';

class Planeanimation extends StatefulWidget {
  const Planeanimation({super.key});

  @override
  State<Planeanimation> createState() => _PlaneanimationState();
}

class _PlaneanimationState extends State<Planeanimation> {
  Alignment _alignment = Alignment.centerLeft;
  bool isChanged = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(
      Duration(seconds: 2),
      (timer) {
        setState(() {
          isChanged = !isChanged;
        });
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uzum page'),
      ),
      body: AnimatedCrossFade(
        firstChild: Container(
          width: 500,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: NetworkImage(
                  'https://otzz.ru/wp-content/uploads/2023/10/doroga-multiashnaia-1.webp'),
            ),
          ),
        ),
        secondChild: Container(
          width: 500,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQCtMH6Ntwj8XeCp_glJX9iXP3sZL0T15mAn6GUgFWP9YenWPtbYsaBAZSLzUBoupUETu0&usqp=CAU'),
            ),
          ),
        ),
        crossFadeState:
            isChanged ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
