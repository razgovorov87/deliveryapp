import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:progressivemobileapp/domain/model/product.dart';
import 'package:progressivemobileapp/domain/state/home_state.dart';
import 'package:progressivemobileapp/internal/dependencies/home_module.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeState _homeState;
  List categories = [
    'Популярные блюда',
    'Комбо',
    'Креветки',
    'Гриль',
    'Бургеры'
  ];
  int selectedIdx = 0;

  @override
  void initState() {
    super.initState();
    _homeState = HomeModule.homeState();
    _homeState.getProduct();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        title: Text('Бургер Кинг'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.info_outline),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories
                    .asMap()
                    .map((i, e) =>
                        MapEntry(i, _categoryHeader(title: e, index: i)))
                    .values
                    .toList(),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Observer(
                builder: (_) {
                  if (_homeState.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return GridView.builder(
                    itemCount: _homeState.products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.6,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (context, int index) =>
                        _itemCard(item: _homeState.products[index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemCard({required item}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(14),
            child: Image.asset('assets/${item.imgPath}.png'),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 100,
              padding:
                  EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 14),
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    '${item.price.toString()} ₽',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _categoryHeader({required String title, required int index}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MaterialButton(
          onPressed: () {},
          color: index == selectedIdx ? Colors.yellow : Colors.transparent,
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: index == selectedIdx ? Colors.black : Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
