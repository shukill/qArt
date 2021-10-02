import 'package:flutter/material.dart';
import 'package:q_art/core/utility/search_page.dart';
import 'package:q_art/elements/loader.dart';
import 'package:q_art/models/news_list.dart';
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
                        title: const Text('News App'),
                        centerTitle: true,
                        bottom: TabBar(
                          isScrollable: true,
                          indicatorWeight: 6.0,
                          indicatorColor: Colors.black,
                          unselectedLabelColor: Colors.amber,
                          tabs: tabs,
                        ),
                      ),
                      floatingActionButton: FloatingActionButton(
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
    return ListView.builder(
      itemCount: mylist.length,
      itemBuilder: (context, index) {
        Hotnew myArticles = mylist[index];
        return ArticleTile(news: myArticles);
      },
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
      // onTap: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (ctx) => ProductsDetailPage(
      //       product: myProducts,
      //     ),
      //   ),
      // ),
      child: Container(
        color: Colors.teal,
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(10.0),
        child: Text(news.videocate.toString()),
      ),
    );
  }
}
