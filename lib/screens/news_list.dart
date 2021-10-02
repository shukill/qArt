import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marquee/marquee.dart';
import 'package:q_art/core/utility/search_page.dart';
import 'package:q_art/elements/loader.dart';
import 'package:q_art/models/news_list.dart';
import 'package:q_art/screens/products_details_page.dart';
import 'package:q_art/services/remote_api.dart';

class NewsListPage extends StatefulWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  final RemoteApi _remoteApi = RemoteApi();
  List<Hotnew> airlines = [];
  List<Hotnew> destinations = [];
  List<Hotnew> hotels = [];
  List<Hotnew> miscellaneous = [];
  List<Hotnew> tourism = [];
  List<Hotnew> tour = [];
  List<Hotnew> travel = [];
  List<Hotnew> myList = [];

  final List<Tab> tabs = [
    const Tab(text: 'All'),
    const Tab(text: 'Airlines'),
    const Tab(text: 'Destinations'),
    const Tab(text: 'Hotels'),
    const Tab(text: 'Tourism Boards'),
    const Tab(text: 'Tour Operators'),
    const Tab(text: 'Travel Agents'),
    const Tab(text: 'Miscellaneous'),
  ];

  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<List<Hotnew>?>(
        future: _remoteApi.getArticlesList(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return buildLoadingWidget();
          } else {
            myList = snapshot.data!;
            airlines = snapshot.data!
                .where((news) => news.videocate == Videocate.AIRLINES)
                .toList();
            destinations = snapshot.data!
                .where((news) => news.videocate == Videocate.DESTINATIONS)
                .toList();
            hotels = snapshot.data!
                .where((news) => news.videocate == Videocate.HOTELS)
                .toList();
            miscellaneous = snapshot.data!
                .where((news) => news.videocate == Videocate.MISCELLANEOUS)
                .toList();
            tourism = snapshot.data!
                .where((news) => news.videocate == Videocate.TOURISM_BOARDS)
                .toList();
            tour = snapshot.data!
                .where((news) => news.videocate == Videocate.TOUR_OPERATORS)
                .toList();
            travel = snapshot.data!
                .where((news) => news.videocate == Videocate.TRAVEL_AGENTS)
                .toList();
            return Stack(
              children: [
                SafeArea(
                  child: DefaultTabController(
                    length: tabs.length,
                    child: Scaffold(
                      appBar: AppBar(
                        backgroundColor: Colors.black87,
                        title: const Text('Travel World Online'),
                        centerTitle: true,
                        bottom: TabBar(
                          isScrollable: true,
                          indicatorWeight: 6.0,
                          indicatorColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          tabs: tabs,
                        ),
                      ),
                      drawer: Drawer(
                        // Add a ListView to the drawer. This ensures the user can scroll
                        // through the options in the drawer if there isn't enough vertical
                        // space to fit everything.
                        child: ListView(
                          // Important: Remove any padding from the ListView.
                          padding: EdgeInsets.zero,
                          children: [
                            DrawerHeader(
                              decoration: BoxDecoration(
                                color: Colors.black87,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 6,
                                  ),
                                  Image.network(
                                    'https://image.shutterstock.com/image-vector/news-label-folded-paper-logo-260nw-1564577314.jpg',
                                    height: 80,
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    'Travel World Online',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'support@travelworldonline.com',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            ListTile(
                              title: Row(
                                children: [
                                  Icon(
                                    Icons.share_rounded,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  const Text('Share App'),
                                ],
                              ),
                              onTap: () {
                                // Update the state of the app
                                // ...
                                // Then close the drawer
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: Row(
                                children: [
                                  Icon(
                                    Icons.dashboard,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  const Text('More Apps'),
                                ],
                              ),
                              onTap: () {
                                // Update the state of the app
                                // ...
                                // Then close the drawer
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: Row(
                                children: [
                                  Icon(
                                    Icons.checklist_sharp,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  const Text('Privacy Policy'),
                                ],
                              ),
                              onTap: () {
                                // Update the state of the app
                                // ...
                                // Then close the drawer
                                Navigator.pop(context);
                              },
                            ),
                            ListTile(
                              title: Row(
                                children: [
                                  Icon(
                                    Icons.people,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  const Text('About Us'),
                                ],
                              ),
                              onTap: () {
                                // Update the state of the app
                                // ...
                                // Then close the drawer
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                      floatingActionButton: FloatingActionButton(
                        backgroundColor: Colors.black87,
                        tooltip: 'Search Your Product',
                        onPressed: () => showSearch(
                          context: context,
                          delegate: SearchPage<Hotnew>(
                            items: myList,
                            searchLabel: 'Search for News',
                            suggestion: const Center(
                              child: Text('Just Search'),
                            ),
                            failure: const Center(
                              child: Text('No News found :('),
                            ),
                            filter: (news) => [
                              news.videoid,
                              news.videocate.toString(),
                              news.videoname,
                              news.detail,
                            ],
                            builder: (news) => ListTile(
                              title: Text(news.videoname),
                              subtitle: Text(news.cateimg),
                              trailing: Text(news.state),
                            ),
                          ),
                        ),
                        child: const Icon(Icons.search),
                      ),
                      body: TabBarView(
                        children: [
                          MyList(mylist: myList),
                          MyList(mylist: airlines),
                          MyList(mylist: destinations),
                          MyList(mylist: hotels),
                          MyList(mylist: tourism),
                          MyList(mylist: tour),
                          MyList(mylist: travel),
                          MyList(mylist: miscellaneous),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

class MyList extends StatelessWidget {
  const MyList({
    Key? key,
    required this.mylist,
  }) : super(key: key);

  final List<Hotnew> mylist;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              color: Colors.black26,
              height: 20,
              child: Marquee(
                text: 'Some sample text that takes some space.',
                style: TextStyle(fontWeight: FontWeight.bold),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                blankSpace: 20.0,
                velocity: 100.0,
                pauseAfterRound: Duration(seconds: 1),
                startPadding: 10.0,
                accelerationDuration: Duration(seconds: 1),
                accelerationCurve: Curves.linear,
                decelerationDuration: Duration(milliseconds: 500),
                decelerationCurve: Curves.easeOut,
              )),
          ListView.builder(
            shrinkWrap: true,
            itemCount: mylist.length,
            itemBuilder: (context, index) {
              Hotnew myArticles = mylist[index];
              return ArticleTile(news: myArticles);
            },
          ),
        ],
      ),
    );
  }
}

class ArticleTile extends StatelessWidget {
  const ArticleTile({
    Key? key,
    required this.news,
  }) : super(key: key);

  final Hotnew news;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => ProductsDetailPage(
            hotnew: news,
          ),
        ),
      ),
      child: Card(
          // padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                news.image,
                height: 100,
                width: MediaQuery.of(context).size.width * 0.3,
                fit: BoxFit.cover,
              ),
              Container(
                height: 120,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Center(
                  child: Text(
                    news.videoname,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          )),
    );
  }
}
