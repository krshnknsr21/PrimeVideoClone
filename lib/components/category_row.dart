import 'package:flutter/material.dart';
import 'package:prime_video_clone/Screens/home_page.dart';
// import 'package:prime_video_clone/main.dart';

class CategoryRow extends StatelessWidget {
  final String mainTitle;
  final String secondaryTitle;
  final List<ImageList> thumbnailImages;
  final bool addSecondaryTitle;

  const CategoryRow({Key? key,required this.mainTitle,required this.secondaryTitle, required this.addSecondaryTitle, required this.thumbnailImages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      // color: Colors.blueGrey[900],
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: addSecondaryTitle,
                    child: Text(
                      secondaryTitle,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.2,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Text(
                    mainTitle,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 100.0,
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: thumbnailImages.map(
                      (e) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Image.asset(e.source),
                    );
                  }
              ).toList(),
            ),
          )
        ],
      ),
    );
  }
}
