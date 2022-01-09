import 'package:fatema_1/helper/helper_app_function.dart';
import 'package:fatema_1/models/products.dart';
import 'package:fatema_1/screen/add_comment_screen.dart';
import 'package:fatema_1/screen/add_edit_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';
class DetailsScreen extends StatefulWidget {
  final Product?product;

  const DetailsScreen({Key? key, this.product}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            goTo(context: context, widget: AddAndEditProductScreen(
              isEdit: true,
              product: Product(
                id: widget.product!.id,
                name: widget.product!.name,
                img: widget.product!.img,
                price: widget.product!.price,
                quantity: widget.product!.quantity,
                numView: widget.product!.numView,
                category: widget.product!.category,
              ),
            ));
          }, icon: Icon(Icons.edit))
        ],
        title: Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.grey,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                            flex:4,child: Hero(
                            tag: '${widget.product!.img}',
                            child: Image.asset('${widget.product!.img}'))),
                        Expanded(child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15.0),
                              bottomLeft: Radius.circular(15.0),
                            ),
                            color: Colors.black38,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(icon:Icon(Icons.comment),onPressed: (){
                                goTo(context: context, widget: AddCommentScreen());
                              },),
                              Container(
                                width: .5,
                                height: 30,
                                color: Colors.white,
                              ),
                              LikeButton(
                                likeCount: widget.product!.numView,
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                  IconButton(onPressed: (){
                    testMap.forEach((key, value) {
                      if(key == widget.product!.category){
                     value.forEach((element) {
                       value.removeWhere((element)
                       => element['name']==widget.product!.name);
                       Navigator.pop(context);
                     });
                      }
                    });
                    setState(() {

                    });

                  }, icon: Icon(Icons.delete)),
                ],
              ),
            ),
            const SizedBox(height: 20.0,),
            ///Details
            Text('Details Details Details Details Details Details '
                'Details Details Details Details Details Details ',textAlign: TextAlign.center,),
            const SizedBox(height: 20.0,),
            Row(children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.monetization_on_outlined,color: Colors.grey,),
                      Text('100\$',style: Theme.of(context).textTheme.headline2,),
                    ],),
                ),
              ),
              const SizedBox(width: 15.0,),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: Row(children: [
                    Icon(Icons.date_range,color: Colors.grey,),
                    Text('${DateFormat.yMMMMd().format(DateTime.now())}',style: Theme.of(context).textTheme.headline2,),
                  ],),
                ),
              ),
            ],),
            const SizedBox(height: 15.0,),
            ///Quantity And Quantity And
            Expanded(child: ListView(
              children: [
                buildCardInfo(
                  icon: Icons.format_list_numbered,
                  text: 45
                ),
                buildCardInfo(
                  icon: Icons.filter_list,
                  text: '${widget.product!.category}'
                ),
                buildCardInfo(
                  icon: Icons.phone_android_sharp,
                  text: '+963 96548 254 621'
                ),
                buildCardInfo(
                  icon: Icons.facebook,
                  text: 'fb./Fatemah Bsh'
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Card buildCardInfo({icon,text}) {
    return Card(
      color: Colors.pink.shade100,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(icon),
                      const SizedBox(width: 15.0,),
                      Text('${text}'),
                    ],
                  ),
                ),
              );
  }
}
