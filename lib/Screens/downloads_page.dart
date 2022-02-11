import 'package:flutter/material.dart';
import 'package:prime_video_clone/components/download_item.dart';

class DownloadsPage extends StatelessWidget {
  const DownloadsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.01, 0.08, 0.18, 0.25, 0.3, 1],
            colors: [Color(0xFF0f4e71), Color(0xFF103751), Color(0xFF0e202e), Color(0xFF0f1b27), Color(0xFF0e171e), Color(0xFF0E171E)]
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Center(
              child: Text('Downloads')),
          titleTextStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20.0,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        '2 videos',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down_rounded,
                        color: Colors.grey,
                      ),
                      Text(
                        '65 min',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down_rounded,
                        color: Colors.grey,
                      ),
                      Text(
                        '482 MB',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      'Edit',
                  ))
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  const DownloadItem(mainTitle: 'The Big Bang Theory', episodeInfo: '1 episode', fileSize: '236 MB', thumbnailImage: 'assets/r1c1.jpg'),
                  const DownloadItem(mainTitle: 'The Big Bang Theory', episodeInfo: '1 episode', fileSize: '236 MB', thumbnailImage: 'assets/r1c1.jpg'),
                  const DownloadItem(mainTitle: 'The Big Bang Theory', episodeInfo: '1 episode', fileSize: '236 MB', thumbnailImage: 'assets/r1c1.jpg'),
                  const DownloadItem(mainTitle: 'The Big Bang Theory', episodeInfo: '1 episode', fileSize: '236 MB', thumbnailImage: 'assets/r1c1.jpg'),
                  TextButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            'Downloads settings',
                            style: TextStyle(
                              color: Colors.white38,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 16.0,
                            color: Colors.white38,
                          )
                        ],
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
