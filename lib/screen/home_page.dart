import 'dart:io';

import 'package:fatema_1/helper/helper_app_function.dart';
import 'package:fatema_1/models/products.dart';
import 'package:fatema_1/screen/add_edit_page.dart';
import 'package:fatema_1/screen/details_page.dart';
import 'package:fatema_1/screen/login_page.dart';
import 'package:fatema_1/screen/profile_page.dart';
import 'package:fatema_1/screen/sign_up_page.dart';
import 'package:fatema_1/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'search_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();
  int? currentIndex = 0;
  List<Widget>? _screens;

  @override
  void initState() {
    setState(() {

    });
    super.initState();
    _screens = [
      TabBarItemSection(),
      ToolbarSearch(),
      ProfileScreen(),
      AddAndEditProductScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabsBar.length,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.pink,
          selectedItemColor: Colors.pink,
          unselectedItemColor: Colors.black45,
          currentIndex: currentIndex!,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), title: Text('Search')),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), title: Text('Profile')),
            BottomNavigationBarItem(
                icon: Icon(Icons.store_mall_directory),
                title: Text('Products')),
          ],
        ),
        appBar: (currentIndex == 1 || currentIndex == 3)
            ? null
            : AppBar(
                title: Text(currentIndex == 0
                    ? 'Home'
                    : currentIndex == 2
                        ? 'Profile'
                        : 'Products'),
                centerTitle: true,
                bottom: currentIndex == 0
                    ? TabBar(
                        isScrollable: true,
                        tabs: tabsBar
                            .map((e) => Tab(
                                  child: Text(e),
                                ))
                            .toList(),
                      )
                    : null),
        key: drawerKey,
        // body: ListView.builder(
        //   itemCount: testMap.length,
        //   itemBuilder: (_,index){
        //     return Container(
        //       alignment: Alignment.center,
        //       height:100 ,
        //       margin: EdgeInsets.all(10.0),
        //       color: Colors.pinkAccent,
        //       child: Text('${testMap['Fruits']![1]['name']}'),
        //     );
        //   },
        // )
        //*************************//
        body: _screens![currentIndex!],
        drawer: Drawer(
          child: Consumer<Auth>(
            builder: (context, auth, child) {
              return Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                      Colors.grey,
                      Colors.pink,
                    ])),
                width: getScreenSize(context).width / 2,
                child: ListView(
                  children: [
                    // [Header Drawer]
                    DrawerHeader(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/snow.gif'))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('images/banana.png'),
                                radius: getScreenSize(context).width * 0.15,
                              )),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Text('Fatema',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1)),
                            ],
                          ),
                          Expanded(
                              child: Text('fatemaBasha@gmail.com',
                                  style:
                                      Theme.of(context).textTheme.headline2)),
                        ],
                      ),
                    ),

                    auth.authunticated
                        ? SizedBox()
                        : buildListTile(
                            context: context,
                            icon: Icons.login,
                            text: 'Login',
                            onTap: () {
                              Navigator.pop(context);
                              goTo(context: context, widget: LoginScreen());
                            }),
                    Divider(
                      color: Colors.white,
                    ),
                    buildListTile(
                        context: context,
                        icon: Icons.app_registration_outlined,
                        text: 'SignUp',
                        onTap: () {
                          Navigator.pop(context);
                          goTo(context: context, widget: SignUpScreen());
                        }),
                    Divider(
                      color: Colors.white,
                    ),
                    buildListTile(
                        context: context,
                        icon: Icons.logout,
                        text: 'Log out',
                        onTap: () {
                          Navigator.pop(context);
                          Provider.of<Auth>(context, listen: false).logOut();
                        }),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  ListTile buildListTile({
    required context,
    required text,
    required onTap,
    required icon,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text, style: Theme.of(context).textTheme.headline3),
      onTap: onTap,
    );
  }
}

class TabBarItemSection extends StatelessWidget {
  const TabBarItemSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBarView(
        children: tabsBar
            .map((e) => testMap[tabsBar[tabsBar.indexOf(e)]]?.length == 0
                ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/nodata.png'),
                    Text.rich(
                        TextSpan(
                            text: 'No',
                            children: <InlineSpan>[
                              TextSpan(
                                text: '${tabsBar[tabsBar.indexOf(e)]}',
                                style: TextStyle(fontSize: getScreenSize(context).width*0.1,fontWeight: FontWeight.bold),
                              ), TextSpan(
                                text: 'Yet💔🥺',
                              ),
                            ]
                        ),
                    ),
                  ],
                )
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: testMap[tabsBar[tabsBar.indexOf(e)]]?.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onTap: () {
                          print(tabsBar.indexOf(e));
                          goTo(
                              context: context,
                              widget: DetailsScreen(
                                product: Product(
                                  id: testMap[tabsBar[tabsBar.indexOf(e)]]![
                                      index]['id'],
                                  img:
                                      '${testMap[tabsBar[tabsBar.indexOf(e)]]![index]['image']}',
                                  name:
                                      '${testMap[tabsBar[tabsBar.indexOf(e)]]![index]['name']}',
                                  price: 30,
                                  numView: 102,
                                  quantity: 65,
                                  category:
                                      '${testMap[tabsBar[tabsBar.indexOf(e)]]![index]['category']}',
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
                              Expanded(
                                  flex: 2,
                                  child: Hero(
                                    tag:
                                        '${testMap[tabsBar[tabsBar.indexOf(e)]]![index]['image']}',
                                    child: Image.asset(
                                        '${testMap[tabsBar[tabsBar.indexOf(e)]]![index]['image']}'),
                                  )),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.black45,
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(8.0),
                                        bottomLeft: Radius.circular(8.0),
                                      )),
                                  child: Text(
                                    '${testMap[tabsBar[tabsBar.indexOf(e)]]![index]['name']}',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ))
            .toList());
  }
}
