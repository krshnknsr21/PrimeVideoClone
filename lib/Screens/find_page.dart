import 'package:flutter/material.dart';

class FindPage extends StatefulWidget {
  const FindPage({Key? key}) : super(key: key);

  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  final formKey = GlobalKey<FormState>();

  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final double width= MediaQuery.of(context).size.width;

    Widget browseButton (String buttonText) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        width: width*0.43,
        height: 60.0,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey.shade500),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: () {},
          child: Text(
            buttonText,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      );
    }

    Widget findRowItem(String titleText) {
      return Column(
        children: [
          const Divider(
            height: 2,
            color: Colors.grey,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    titleText,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  const Icon(
                    Icons.chevron_right_outlined,
                    color: Colors.white,
                    size: 25,
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.blueGrey[900],
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: (width*0.05)),
          child: Form(
            key: formKey, //key for form
            child: ListView(
              children: [
                TextField(
                  onChanged: (text) {},
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "SourceSansPro",
                    fontSize: 15.0,
                  ),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search_outlined),
                    prefixIconColor: Colors.white,
                    suffixIcon: Icon(Icons.mic),
                    fillColor: Colors.blueGrey,
                    hintText: 'Search by actor, title..',
                    hintStyle: TextStyle(
                      color: Colors.white54,
                      fontSize: 18.0,
                      fontFamily: "SourceSansPro"
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Container(
                  // height: 100.0,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Browse by',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "SourceSansPro"
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                browseButton('Movies'),
                                browseButton('Amazon Originals'),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                browseButton('TV'),
                                browseButton('Kids'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(bottom: 10),
                        child: const Text(
                          'Genres',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "SourceSansPro"
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          findRowItem('Drama'),
                          findRowItem('Action and Adventure'),
                          findRowItem('Romance'),
                          findRowItem('Comedy'),
                          findRowItem('Thriller'),
                          const Divider(
                            height: 2,
                            color: Colors.grey,
                          ),
                          InkWell(
                            onTap: (){},
                            // hoverColor: Colors.black,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'See more',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          'Languages',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "SourceSansPro"
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          findRowItem('English'),
                          findRowItem('Hindi'),
                          findRowItem('Telugu'),
                          findRowItem('Tamil'),
                          findRowItem('Kannada'),
                          findRowItem('Malayalam'),
                          const Divider(
                            height: 2,
                            color: Colors.grey,
                          ),
                          InkWell(
                            onTap: (){},
                            // hoverColor: Colors.black,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                'See more',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}