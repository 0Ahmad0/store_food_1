import 'package:fatema_1/helper/helper_app_function.dart';
import 'package:fatema_1/models/products.dart';
import 'package:flutter/material.dart';

import 'details_page.dart';

class ToolbarSearch extends StatefulWidget {
  static const routeName = '/ToolbarSearch';

  @override
  _ToolbarSearchState createState() => _ToolbarSearchState();
}

class _ToolbarSearchState extends State<ToolbarSearch> {
  Widget appBarTitle = Text(
    "Search",
    style: TextStyle(color: Colors.white),
  );
  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.white,
  );
  final key = GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = TextEditingController();
  late List<String> _list;
  bool _isSearching = false;
  String _searchText = "";


  @override
  void initState() {
    super.initState();
    _isSearching = false;
    init();
  }

  void init() {
    _list = [];
    testMap.forEach((key, value) {
      value.forEach((element) {
        // print(element['name']);
        _list.add(element['name']);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildBar(context),
      body: myBody(),
    );
  }

  Widget myBody() => Container(
        child: _list.length==0?
            Image.asset('images/nodata.png')
            :ListView(
          children: _isSearching
              ? _buildSearchList()
              : _buildList(),
        ),
      );

  List<ChildItem> _buildList() {
    return _list.map((contact) => ChildItem(contact)).toList();
  }

  List<ChildItem> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _list.map((contact) => ChildItem(contact)).toList();
    } else {
      List<String> _searchList = [];
      for (int i = 0; i < _list.length; i++) {
        String name = _list.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }
      return _searchList.map((contact) => ChildItem(contact)).toList();
    }
  }

  buildBar(BuildContext context) {
    return AppBar(
        centerTitle: true,
        title: appBarTitle,
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (this.actionIcon.icon == Icons.search) {
                  this.actionIcon = Icon(
                    Icons.close,
                    color: Colors.white,
                  );
                  this.appBarTitle = TextField(
                    controller: _searchQuery,
                    onChanged: (value) {
                      setState(() {
                        _searchText = value;
                      });
                    },
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.white),
                        hintText: "Search...",
                        hintStyle: TextStyle(color: Colors.white)),
                  );
                  _handleSearchStart();
                } else {
                  _handleSearchEnd();
                }
              });
            },
          ),
        ]);
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = Text(
        "Search Sample",
        style: TextStyle(color: Colors.white),
      );
      _isSearching = false;
      _searchQuery.clear();
    });
  }
}

class ChildItem extends StatelessWidget {
  final String name;

  ChildItem(this.name);

  @override
  Widget build(BuildContext context) {
    List searchMap = [];
    testMap.forEach((key, value) {
      value.forEach((element) {
        if(element['name'] == name){
         searchMap.add(element);
        }
        else{
        }
      });
    });
        return  GestureDetector(
          onTap: () {
            goTo(
                context: context,
                widget: DetailsScreen(
                  product: Product(
                    id: searchMap[0]['id'],
                    img:
                    '${searchMap[0]['image']}',
                    name:
                    '${searchMap[0]['name']}',
                    price: 30,
                    numView: 102,
                    quantity: 65,
                    category:
                    '${searchMap[0]['category']}',
                  ),
                ));
          },
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.grey,
                      Colors.pink.shade300,
                    ]),
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 8.0,
                    offset: Offset(5, 1.5),
                  )
                ]),
            alignment: Alignment.center,
            margin: EdgeInsets.all(10.0),
            child: Column(
              children: [
                Hero(
                  tag:
                  '${searchMap[0]['image']}',
                  child: Image.asset(
                      '${searchMap[0]['image']}'),
                ),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  height: getScreenSize(context).width * 0.2,
                  decoration: BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(8.0),
                        bottomLeft: Radius.circular(8.0),
                      )),
                  child: Text(
                    '${searchMap[0]['name']}',
                    style: TextStyle(
                        color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
        );
  }
}