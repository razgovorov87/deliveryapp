import 'package:flutter/material.dart';
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
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            _categoryHeader(text: 'Меню ресторана'),
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
                        childAspectRatio: 0.75,
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
      ),
    );
  }

  Widget _itemCard({required item}) {
    return Container(
      height: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            offset: Offset(5, 5),
            blurRadius: 10,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
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
              padding: EdgeInsets.only(bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    item.title,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 6),
                  Text(
                    '${item.price.toString()} ₽',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
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

  Widget _categoryHeader({required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 24,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 6),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.only(right: 6),
                    height: 7,
                    color: Colors.black.withOpacity(0.1),
                  ),
                ),
              ],
            ),
          ),
          MaterialButton(
            onPressed: () {},
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Text('Подробнее'),
          )
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      margin: EdgeInsets.only(bottom: 36),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 15,
            color: Colors.black.withOpacity(0.07),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'DeliveryApp',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                SizedBox(width: 6),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/men/32.jpg'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}



// Observer(builder: (_) {
//           if (_homeState.isLoading) {
//             return CircularProgressIndicator();
//           }
//           return ListView.builder(
//               itemCount: _homeState.products.length,
//               itemBuilder: (context, int idx) {
//                 return Text(_homeState.products[idx].title);
//               });
//         }),