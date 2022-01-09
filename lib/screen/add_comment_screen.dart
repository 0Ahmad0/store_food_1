import 'package:fatema_1/helper/helper_app_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddCommentScreen extends StatefulWidget {
  const AddCommentScreen({Key? key}) : super(key: key);

  @override
  _AddCommentScreenState createState() => _AddCommentScreenState();
}

class _AddCommentScreenState extends State<AddCommentScreen> {
  final textInput = TextEditingController();
  List listComments = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comments'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: getScreenSize(context).height * 0.8,
            child: ListView.builder(
              padding: EdgeInsets.all(12.0),
              itemCount: listComments.length,
              itemBuilder: (_,index){
                return Directionality(
                  textDirection: index%2==0
                      ?TextDirection.rtl
                      :TextDirection.ltr,
                  child: Row(
                    children: [
                      CircleAvatar(
                        child: Text('#${listComments[index].substring(0,1)}'),
                      ),
                      Container(
                        width: getScreenSize(context).width /1.5,
                        padding: EdgeInsets.all(10.0),
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: Colors.pink[200],
                            borderRadius: BorderRadius.circular(12.0)
                        ),
                        child: Text(
                          listComments[index],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            // color: Colors.white,
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: TextFormField(
                    controller: textInput,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                    onChanged: (val) {
                      setState(() {
                        textInput.text = val;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.pink),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: IconButton(
                          icon: Icon(
                            FontAwesomeIcons.telegramPlane,
                            color: Colors.pink,
                          ),
                          onPressed: () {
                            if (textInput.text == '') ;
                           setState(() {
                             listComments.add(
                               textInput.text
                             );
                             textInput.clear();
                           });
                          },
                        ))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
