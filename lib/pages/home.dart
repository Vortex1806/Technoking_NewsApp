import 'package:flutter/material.dart';

import '../backend/functions.dart';
import '../components/AppBar.dart';
import '../components/SearchBar.dart' as custom;
import '../components/newsbox.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    news = fetchnews();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: appbar(),
      body: Column(
        children: [
          custom.SearchBar(),
          Expanded(
              child: Container(
            width: w,
            child: FutureBuilder(
              future: fetchnews(),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.data != null) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i) {
                      return NewsBox(
                        imageurl: snapshot.data![i]['urlToImage'] ??
                            Constants.imageurl,
                        title: snapshot.data![i]['title'],
                        time: snapshot.data![i]['publishedAt'],
                        description:
                            snapshot.data![i]['description'] ?? 'Hello',
                        url: snapshot.data![i]['url'],
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
