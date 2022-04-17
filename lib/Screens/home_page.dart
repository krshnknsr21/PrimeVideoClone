import 'package:flutter/material.dart';
import 'package:prime_video_clone/components/category_row.dart';
import 'package:prime_video_clone/components/carousel.dart';
// import 'package:prime_video_clone/models/user.dart';
// import 'package:provider/provider.dart';

// TODO: To pass arguments to the next page after clearing the route stack
// Navigator.pushNamedAndRemoveUntil(context, "/newRouteName", (r) => false, arguments: {
// "arg_1": firstArgument,
// "arg_2": secondArgument
// });

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: choices.length,
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Image.asset(
                'assets/prime_logo.png',
                height: 80.0,
              ),
            ),
            centerTitle: true,
            // backgroundColor: Colors.blueGrey[900],
            backgroundColor: const Color(0xFF0E171E),
            bottom: TabBar(
              isScrollable: false,
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14.0
              ),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(width: 3.0, color: Colors.white),
                insets: EdgeInsets.symmetric(horizontal: 10.0),
              ),
              tabs: choices.map<Widget>((Choice choice) {
                return Tab(
                  text: choice.title,
                );
              }).toList(),
            ),
          ),
          backgroundColor: const Color(0xFF0E171E),
          body: Builder(
            builder: (context) {
              return TabBarView(
                children: choices.map((Choice choice) {
                  return ChoicePage(
                    choice: choice,
                  );
                }).toList(),
              );
            }
          ),
        ),
      );
  }
  // void showSnackBar() {
  //   final snackBar = SnackBar(
  //       content: Text(
  //         'Welcome back, ${Provider.of<PrimeVideoUser>(context).getUsername}',
  //       )
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }
}

class Choice {
  final String title;
  const Choice({required this.title});
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Home'),
  Choice(title: 'TV Shows'),
  Choice(title: 'Movies'),
  Choice(title: 'Kids'),
];

class ChoicePage extends StatelessWidget {
  const ChoicePage({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: const <Widget>[
          ShowCarousel(),
          CategoryRow(mainTitle: 'Continue watching', secondaryTitle: '', thumbnailImages: row1, addSecondaryTitle: false, rightArrowTrue: false),
          CategoryRow(mainTitle: 'Binge-worthy TV', secondaryTitle: '', thumbnailImages: row2, addSecondaryTitle: false, rightArrowTrue: false),
          CategoryRow(mainTitle: 'Top-rated shows', secondaryTitle: '', thumbnailImages: row1, addSecondaryTitle: false, rightArrowTrue: false),
          CategoryRow(mainTitle: 'Top-rated categories', secondaryTitle: '', thumbnailImages: row2, addSecondaryTitle: false, rightArrowTrue: false),
        ]
    );
  }
}
