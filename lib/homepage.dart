// import 'dart:math';

import 'package:fitnessapp/detailspage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final provider = Provider.of<Api>(context, listen: false);
    provider.fetchData();
  }

  PageController _pageController = PageController();
  Widget build(BuildContext context) {
    final provider = Provider.of<Api>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Fitness App', style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    provider.allData.length,
                    (index) => GestureDetector(
                          onTap: () {
                            // provider.color(index);
                            provider.x = index;
                            provider.notifyListeners();
                            // provider;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsPage(index: index),
                                ));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            color: index == provider.x
                                ? Colors.black
                                : Colors.white,
                            child: Text(
                              provider.allData[index].title.toString(),
                              style: TextStyle(
                                  color: index == provider.x
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ),
                        )),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: PageView.builder(
                  // physics: BouncingScrollPhysics(),
                  controller: _pageController,

                  itemCount: provider.allData.length,
                  itemBuilder: (context, index) {
                    // indexs = index;
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsPage(index: index),
                                ));
                          },
                          child: Image.network(
                            provider.allData[index].thumbnail.toString(),
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(provider.allData[index].title.toString())
                      ],
                    );
                  },
                ),
              ),
            ),
            Expanded(
                child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12),
              itemCount: provider.allData.length,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsPage(index: index),
                      )),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Column(
                        children: [
                          SizedBox(
                              height: 100,
                              width: double.infinity,
                              child: Image.network(
                                provider.allData[index].gif.toString(),
                                fit: BoxFit.cover,
                              )),
                          Text(provider.allData[index].title.toString())
                        ],
                      ))),
            ))
          ],
        ));
  }

  // int? indexs;
}
