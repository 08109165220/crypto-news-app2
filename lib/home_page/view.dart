import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../YahooFinace/view.dart';
import '../all__news/view.dart';
import '../coin_journal/view.dart';
import '../coin_telegraph/view.dart';
import '../dupliwidgets/Container.dart';
import '../dupliwidgets/customIndicator.dart';
import '../topnews/view.dart';
import 'logic.dart';

class Home_pagePage extends StatefulWidget {
  Home_pagePage({Key? key}) : super(key: key);

  @override
  State<Home_pagePage> createState() => _Home_pagePageState();
}

class _Home_pagePageState extends State<Home_pagePage>
    with TickerProviderStateMixin {
  final logic = Get.put(Home_pageLogic());
  final state = Get.find<Home_pageLogic>().state;
  late TabController _tabController;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black
    ));
    _tabController = TabController(length: 5, vsync: this);
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView( scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                AnimatedContainer(
                    decoration: ShapeDecoration.fromBoxDecoration(BoxDecoration(
                      //     image: DecorationImage(
                      //     image: AssetImage(
                      //     'kanchanara-5ixVD22x22o-unsplash.jpg',
                      // ),fit: BoxFit.cover,opacity:10 ),
                      gradient: LinearGradient(
                          colors: [Colors.orange, Colors.pinkAccent]),
                      boxShadow: [BoxShadow(color: Colors.blue)],
                    )),
                    height: 150,
                    duration: Duration(milliseconds: 10)),
                Opacity(
                  opacity: 0.2,
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    child: Image(
                      image: AssetImage(
                          'images/_7fec223c-b2c0-4a96-adf5-0f0ccbd592f1.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Crypto News",
                    style: TextStyle(fontStyle: FontStyle.italic, fontSize: 35),
                  ),
                ),
              ],
            ),
            // cryptoappbar(
            //     name: 'Crypto News',
            //     description: 'Crypto Bugle',
            //     icon: const Icon(
            //       Icons.notifications,
            //       size: 20,
            //       color: Colors.amber,
            //     )),
            SizedBox(
              height: 5,
            ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                    isScrollable: true,
                    labelPadding: EdgeInsets.only(left: 20, right: 20),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    controller: _tabController,
                    indicator:
                        CircularIndicator(color: Colors.black, radius: 4),
                    tabs: const [
                      Tab(
                        text: "TopNews",
                      ),
                      Tab(text: "CoinDesk"),
                      Tab(
                        text: "CoinTelegraph",
                      ),
                      Tab(
                        text: "CoinJournal",
                      ),
                      Tab(
                        text: "YahooFinance",
                      )
                    ]),
              ),
            ),
            Container(
              width: double.maxFinite,
              height: 500,
              child: TabBarView(controller: _tabController, children: [
                TopnewsPage(),
                All_NewsPage(),
                CoinTelegraphPage(),
                CoinJournalPage(),
                YahooFinance(),
              ]),
            ),
          ],
        ),
      ),
    ));
  }
}
