import 'package:flutter/material.dart';
import 'package:prime_video_clone/components/carousel.dart';
import 'package:prime_video_clone/components/category_row.dart';

class ChannelsPage extends StatefulWidget {
  const ChannelsPage({Key? key}) : super(key: key);

  @override
  _ChannelsPageState createState() => _ChannelsPageState();
}

class _ChannelsPageState extends State<ChannelsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0E171E),
      child: ListView(
          children: const <Widget>[
            ShowCarousel(),
            CategoryRow(mainTitle: 'Most Popular', secondaryTitle: 'Eros Now', addSecondaryTitle: true, thumbnailImages: row1, rightArrowTrue: true),
            CategoryRow(mainTitle: 'Most Popular', secondaryTitle: 'Lionsgate Play', addSecondaryTitle: true, thumbnailImages: row2, rightArrowTrue: true),
            CategoryRow(mainTitle: 'Most Popular', secondaryTitle: 'DocuBay', addSecondaryTitle: true, thumbnailImages: row1, rightArrowTrue: true),
            CategoryRow(mainTitle: 'Most Popular', secondaryTitle: 'discovery+', addSecondaryTitle: true, thumbnailImages: row2, rightArrowTrue: true),
          ]
      ),
    );
  }
}
