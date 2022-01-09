import 'package:fatema_1/helper/helper_app_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List itemUser = [];

  @override
  void initState() {
    testMap.forEach((key, value) {
      value.forEach((element) {
        // print(element['name']);
        itemUser.add(element);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Container(
            width: getScreenSize(context).width * 0.3,
            height: getScreenSize(context).width * 0.3,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.pink.shade200),
            child: Image.asset(
              'images/banana.png',
              width: getScreenSize(context).width * 0.15,
              height: getScreenSize(context).width * 0.15,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('FatimaBs'),
              Container(
                width: 1,
                height: 30.0,
                color: Colors.grey,
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.edit))
            ],
          ),
          Expanded(
              child: itemUser.length==0?
                  Center(
                    child: Column(
                      children: [
                       Image.asset('images/emptyCart.png'),
                        Text('Add Products Now!!',style: TextStyle(
                          fontSize: getScreenSize(context).width * 0.08
                        ),),
                      ],
                    ),
                  )
                  :ListView.builder(
            itemCount: itemUser.length,
            itemBuilder: (_, index) {
              return InkWell(
                onTap: () {},
                child: Stack(
                  children: [
                    Container(
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
                          Image.asset(
                            '${itemUser[index]['image']}',
                            height: getScreenSize(context).width * 0.3,
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            height: getScreenSize(context).width * 0.1,
                            decoration: BoxDecoration(
                                color: Colors.black45,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(8.0),
                                  bottomLeft: Radius.circular(8.0),
                                )),
                            child: Text(
                              '${itemUser[index]['name']}',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                              'images/category2.png',
                            width: getScreenSize(context).width *0.25,
                            height: getScreenSize(context).width *0.2,
                            color: Colors.pink[200],
                          ),
                          Text('${itemUser[index]['category']}')
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ))
        ],
      ),
    ));
  }
}
