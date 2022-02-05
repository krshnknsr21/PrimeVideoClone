import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:card_swiper/card_swiper.dart';
// import 'package:prime_video_clone/Screens/home_page.dart';

class ShowCarousel extends StatefulWidget {
  const ShowCarousel({Key? key}) : super(key: key);
  @override
  State<ShowCarousel> createState() => _ShowCarouselState();
}

class _ShowCarouselState extends State<ShowCarousel> {
  int current = 0;
  final List<String> thumbnailImages = [
    'assets/r1c1.jpg',
    'assets/r1c2.jpg',
    'assets/r1c3.jpg',
    'assets/r1c4.jpg',
    'assets/r2c1.jpg',
    'assets/r2c2.jpg',
    'assets/r2c3.jpg',
    'assets/r2c4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.grey[300],
          scaffoldBackgroundColor: Colors.grey[600],
        ),
        child: Swiper(
          // itemWidth: width,
          itemBuilder: (BuildContext context, int index) {
            final image = thumbnailImages[index];
            return InkWell(
              onTap: () {
                print('tapped on image');
              },
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            );
          },
          itemCount: 8,
          pagination: const SwiperPagination(),
          autoplay: true,
        ),
      ),
    );
  }
}