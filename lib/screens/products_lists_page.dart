import 'package:flutter/material.dart';
import 'package:q_art/core/utility/search_page.dart';
import 'package:q_art/models/product.dart';
import 'package:q_art/screens/products_details_page.dart';

import 'package:q_art/services/remote_api.dart';

class ProductsListsPage extends StatefulWidget {
  const ProductsListsPage({Key? key}) : super(key: key);

  @override
  _ProductsListsPageState createState() => _ProductsListsPageState();
}

class _ProductsListsPageState extends State<ProductsListsPage> {
  final RemoteApi _remoteApi = RemoteApi();

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder<List<Product>?>(
        future: _remoteApi.getProductList(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Stack(
              children: [
                SafeArea(
                  child: SizedBox(
                    height: screenSize.height,
                    width: screenSize.width,
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Product myProducts = snapshot.data![index];
                        return ProductTile(myProducts: myProducts);
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: FloatingActionButton(
                    tooltip: 'Search Your Product',
                    onPressed: () => showSearch(
                      context: context,
                      delegate: SearchPage<Product>(
                        // onQueryUpdate: (s) => Fluttertoast.showToast(msg: s),
                        items: snapshot.data!,
                        searchLabel: 'Search for Products',
                        suggestion: const Center(
                          child: Text('Just Search'),
                        ),
                        failure: const Center(
                          child: Text('No Products found :('),
                        ),
                        filter: (product) => [
                          product.imageUrl,
                          product.option,
                          product.qrCode,
                          product.mrp.toString(),
                          ...product.availableSizes,
                        ],
                        builder: (product) => ListTile(
                          title: Text(product.brandRank),
                          subtitle: Text(product.option!),
                          trailing: Text('${product.availableSizes}'),
                        ),
                      ),
                    ),
                    child: const Icon(Icons.search),
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

class ProductTile extends StatelessWidget {
  const ProductTile({
    Key? key,
    required this.myProducts,
  }) : super(key: key);

  final Product myProducts;

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
        child: Text(myProducts.displayName),
      ),
    );
  }
}
