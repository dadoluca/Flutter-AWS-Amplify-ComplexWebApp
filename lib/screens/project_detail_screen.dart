import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../variables/device_info.dart';
import 'dart:math';
import '../providers/projects.dart';

class ProjectDetailScreen extends StatelessWidget {
  static const routeName = '/project-detail';

  @override
  Widget build(BuildContext context) {
    Random _random = new Random();
    int _randomNumber = _random.nextInt(6);
    final ProjectId =
        ModalRoute.of(context)?.settings.arguments as String; // is the id!
    final loadedProject = Provider.of<Projects>(
      context,
      listen: false,
    ).findById(ProjectId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProject?.note ?? ''),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                height: 300,
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                    //DeviceInfo.screenWidth! > 600 ?
                      // 'assets/images/desktop.jpg'
                      // :
                      '../assets/images/projectDetailsBackground.jpg',
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.center,
                    ),
                    Positioned.fill(
                      top: 205,
                      left: 30,
                      right: 30,
                      bottom: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 220,
                      left: 0,
                      right: 0,
                      child: Text(
                        'Dettagli Progetto',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                'dettaglio 1',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: DeviceInfo.sizeText,
                ),
                softWrap: true,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                'dettaglio 2',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: DeviceInfo.sizeText,
                ),
                softWrap: true,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                'dettaglio 3',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: DeviceInfo.sizeText,
                ),
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
