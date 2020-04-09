import 'package:flutter/material.dart';

import 'create_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder:(context) => CreatePage()));
      },
        child: Icon(Icons.create),
        backgroundColor: Colors.blue,
      ),
    );
  }

 Widget _buildBody() {
    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      childAspectRatio: 1.0,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
    ),
        itemCount: 6,
        itemBuilder: (context,index){
      return _buildListItem(context,index);
    });
 }

  Widget _buildListItem(BuildContext context, int index) {
    return Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSYtsU12YMqJ0kmN0rDq0x5EPMo-SPELZzwxOIHy60lROwBHMND&usqp=CAU',
    fit: BoxFit.cover,);
  }
}
