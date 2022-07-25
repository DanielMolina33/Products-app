// Flutter
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import '../providers/ProductsProvider.dart';
import '../models/ProductModel.dart';
import '../providers/LoginProvider.dart';

// Components
import 'Loading.dart';
import 'package:flutter_app/components/ProductCard.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<ProductData>? products = [];

  @override
  void initState() {
    super.initState();
    getData("");
  }

  void getData(String query) async {
    final data = await Provider.of<ProductsProvider>(context, listen: false).getProducts(query, "", context);
    setState((){ products = data; });
  }

  void logout(){
    LocalStorage storage = LocalStorage("session");
    String token = storage.getItem("user_logged")['token'];
    final provider = Provider.of<LoginProvider>(context, listen: false);
    provider.logout(token, context, true);
  }

  List<Widget>? productCard(){
    List<Widget> cards = [];

    if(products!.isNotEmpty){
      for (var product in products!){
        cards.add(
          ProductCard(
            image: product.imgprod1,
            title: product.nombreprod,
            price: product.preciofinal,
          )
        );
      }
    }

    return cards;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 3.5;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: const Color(0xffe9ecf4),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppBar(
              toolbarHeight: 70,
              centerTitle: true,
              elevation: 0,
              title: const Text(
                "Productos",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                )
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.logout_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: (){
                    logout();
                  },
                ),
              ],
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false
            ),
          ],
        ),
      ),
      body: productCard()!.isEmpty ? const Loading() : GridView.count(
        padding: const EdgeInsets.all(20),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        childAspectRatio: (itemWidth / itemHeight),
        children: [...productCard()!]
      )
    );
  }
}
