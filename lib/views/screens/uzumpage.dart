import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'dart:async';

class Uzumpage extends StatefulWidget {
  const Uzumpage({super.key});

  @override
  State<Uzumpage> createState() => _UzumpageState();
}

class _UzumpageState extends State<Uzumpage> {
  Alignment _alignment = Alignment.centerLeft;
  bool isChanged = false;
  double _cloud1Left = -50;
  double _cloud4Left = -40;

  double _cloud2Left = 350;
  double _cloud3Left = 200;

  @override
  void initState() {
    super.initState();
    // Start the cloud animation timer
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (!mounted) {
        timer.cancel();
      } else {
        setState(() {
          _cloud1Left += 2;
          _cloud2Left -= 2;
          _cloud3Left -= 2;
          _cloud4Left += 2;

          if (_cloud1Left > 350) {
            _cloud1Left = -50;
          }
          if (_cloud4Left > 350) {
            _cloud4Left = -30;
          }
          if (_cloud2Left < -50) {
            _cloud2Left = 350;
          }
          if (_cloud3Left < -50) {
            _cloud3Left = 200;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plane page'),
      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 500,
          color: isChanged ? Colors.grey : Colors.blue.shade100,
          child: Container(
            width: 350,
            height: 100,
            decoration: BoxDecoration(
              color: isChanged ? Colors.blue.shade200 : Colors.grey.shade600,
              borderRadius: BorderRadius.circular(60),
            ),
            child: AnimatedAlign(
              alignment: _alignment,
              duration: const Duration(seconds: 1),
              child: ZoomTapAnimation(
                onTap: () {
                  setState(() {
                    if (_alignment == Alignment.centerLeft) {
                      _alignment = Alignment.centerRight;
                    } else {
                      _alignment = Alignment.centerLeft;
                    }
                    isChanged = !isChanged;
                  });
                },
                child: SizedBox(
                  width: 350,
                  child: Stack(
                    children: [
                      if (isChanged)
                        Positioned(
                          right: 0,
                          top: 0,
                          left: 0,
                          bottom: 0,
                          child: Container(
                            width: 140,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  'https://otzz.ru/wp-content/uploads/2023/10/doroga-multiashnaia-1.webp',
                                ),
                              ),
                            ),
                          ),
                        )
                      else
                        Positioned(
                          left: 0,
                          top: 0,
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 40,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                      AnimatedPositioned(
                        duration: const Duration(seconds: 1),
                        right: isChanged ? 0 : 250,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.black),
                          ),
                          width: 100,
                          height: 100,
                          child: Icon(
                            CupertinoIcons.paperplane,
                            size: 50,
                            color: isChanged ? Colors.grey : Colors.blue,
                          ),
                        ),
                      ),
                      if (!isChanged) ...[
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 50),
                          left: _cloud1Left,
                          top: 20,
                          child: const Icon(
                            Icons.cloud,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 50),
                          left: _cloud2Left,
                          top: 50,
                          child: const Icon(
                            Icons.cloud,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 50),
                          left: _cloud3Left,
                          top: 30,
                          child: const Icon(
                            Icons.cloud,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 50),
                          left: _cloud4Left,
                          child: const Icon(
                            Icons.cloud,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
