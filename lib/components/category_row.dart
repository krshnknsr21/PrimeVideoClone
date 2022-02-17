import 'package:flutter/material.dart';

class ImageList {
  final String source;
  const ImageList({required this.source});
}

const List<ImageList> row1 = <ImageList>[
  ImageList(source: 'assets/r1c1.jpg'),
  ImageList(source: 'assets/r1c2.jpg'),
  ImageList(source: 'assets/r1c3.jpg'),
  ImageList(source: 'assets/r1c4.jpg'),
];

const List<ImageList> row2 = <ImageList>[
  ImageList(source: 'assets/r2c1.jpg'),
  ImageList(source: 'assets/r2c2.jpg'),
  ImageList(source: 'assets/r2c3.jpg'),
  ImageList(source: 'assets/r2c4.jpg'),
];

class CategoryRow extends StatelessWidget {
  final String mainTitle;
  final String secondaryTitle;
  final List<ImageList> thumbnailImages;
  final bool addSecondaryTitle;
  final bool rightArrowTrue;

  const CategoryRow({Key? key,required this.mainTitle,required this.secondaryTitle, required this.addSecondaryTitle, required this.rightArrowTrue, required this.thumbnailImages}) : super(key: key);

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                      Visibility(
                        visible: rightArrowTrue,
                        child: const Icon(
                          Icons.chevron_right_outlined,
                          color: Colors.white70,
                        ),
                      )
                    ],
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
