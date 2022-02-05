import 'package:flutter/material.dart';

class DownloadItem extends StatelessWidget {
  final String mainTitle;
  final String episodeInfo;
  final String fileSize;
  final String thumbnailImage;

  const DownloadItem({Key? key, required this.mainTitle, required this.episodeInfo, required this.fileSize, required this.thumbnailImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: Colors.blueGrey[800],
      margin: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        children: [
          Image.asset('assets/r1c1.jpg'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  mainTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5.0),
                Row(
                  children: <Widget>[
                    Text(
                      episodeInfo,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      fileSize,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                const Text(
                  'prime',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios_outlined),
              color: Colors.grey,
            )
          )
        ],
      ),
    );
  }
}
