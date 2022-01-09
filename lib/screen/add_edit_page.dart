import 'dart:io';
import 'dart:math';


import 'package:date_time_picker/date_time_picker.dart';
import 'package:fatema_1/helper/helper_app_function.dart';
import 'package:fatema_1/models/products.dart';
import 'package:fatema_1/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class AddAndEditProductScreen extends StatefulWidget {
  final bool? isEdit;
  final Product? product;
  const AddAndEditProductScreen({Key? key, this.isEdit = false, this.product}) : super(key: key);
  @override
  _AddAndEditProductScreenState createState() => _AddAndEditProductScreenState();
}

class _AddAndEditProductScreenState extends State<AddAndEditProductScreen> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? img;
  String? name;
  String? category;
  String? price;
  String? date;
  String? quantity;
  String? contact;
  PickedFile? imageFile = null;
  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageFile = pickedFile!;
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFile = pickedFile!;
    });
    Navigator.pop(context);
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: Colors.pink),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.pink,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.pink,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.pink,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            widget.isEdit!
                ?'Edit Product'
                :'Add Product'
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _key,
        child: ListView(
          padding: EdgeInsets.all(12.0),
          children: [
            GestureDetector(
              onTap: (){
                _showChoiceDialog(context);
              },
              child: (imageFile == null)
                  ? Image.asset(
                widget.isEdit!
                    ?widget.product!.img!:
                'images/product.png',
                width: size.width *0.3,
                height: size.width *0.3,
              )
                  : Image.file(
                File(imageFile!.path),
                fit: BoxFit.contain,
              ),
            ),
            Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    (imageFile == null)
                        ? Text("Choose Image")
                        : SizedBox()
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormFiledWidget(
              initialValue:
              widget.isEdit!
                  ?widget.product!.name!
                  :'',
              icon: FontAwesomeIcons.file,
              hintText: 'Name',
              textInputType: TextInputType.text,
              onChange: (text) {
                name = text;
              },
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Cann\'t Be Empty';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 20.0,
            ), //
            DropdownButtonFormField<String>(

              decoration: InputDecoration(border: OutlineInputBorder(),prefixIcon: Icon(Icons.category)),
              hint: Text(   widget.isEdit!
                  ?widget.product!.category!
                  :'Category',),
              isExpanded: true,
              onChanged: (text) {
                category = text;
              },
              items: tabsBar
                  .map(
                    (e) => DropdownMenuItem<String>(
                  child: Text('${e}'),
                  value: e,
                ),
              )
                  .toList(),
            ),
            const SizedBox(
              height: 20.0,
            ), //

            TextFormFiledWidget(
              // textEditingController: quantity,
              initialValue: widget.isEdit!
                  ?'${widget.product!.price!}'
                  :'',
              icon: Icons.monetization_on,
              hintText: 'Price',
              textInputType: TextInputType.number,
              onChange: (text) {
                price = text;
              },
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Cann\'t Be Empty';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 20.0,
            ), ///
            DateTimePicker(
              readOnly: widget.isEdit!?true:false,
              decoration: InputDecoration(border: OutlineInputBorder(),prefixIcon: Icon(Icons.date_range_sharp)),
              initialValue: DateTime.now().toString(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2030),
              onChanged: (text){
                date = text;
              },
              validator: (val) {
                return null;
              },
            ),
            const SizedBox(
              height: 20.0,
            ), //
            TextFormFiledWidget(
              initialValue: widget.isEdit!
                  ?'${widget.product!.quantity!}'
                  :'',
              // textEditingController: quantity,
              icon: Icons.view_list,
              hintText: 'Quantity',
              textInputType: TextInputType.number,
              onChange: (text) {
                quantity = text;
              },
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Cann\'t Be Empty';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 20.0,
            ), //
            TextFormFiledWidget(
              initialValue: widget.isEdit!
                  ?'${widget.product!.quantity!}'
                  :'',
              // textEditingController: quantity,
              icon: Icons.quick_contacts_mail_outlined,
              hintText: 'Contact',
              textInputType: TextInputType.text,
              onChange: (text) {
                contact = text;
              },
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Cann\'t Be Empty';
                } else {
                  return null;
                }
              },
            ), //

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            widget.isEdit!
                ?Icons.edit
                :Icons.add
        ),
        onPressed: (){
          if(_key.currentState!.validate()){
            if(!widget.isEdit!){
              testMap[category]!.add(
                { "category": category ,"id": 1, "name": name, "image": images[Random().nextInt(images.length)]},
              );
              // print('jj${testMap[category]}');
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx)=>HomeScreen()));
              setState(() {

              });
            }
          }else{
            print(testMap[category]);

          }
          //ToDo: Check is Edit Or Add Prouduct
          // Navigator.pop(context);
        },
      ),
    );
  }
}



class TextFormFiledWidget extends StatelessWidget {
  final IconData? icon;
  final String? hintText;
  final String? initialValue;
  final Function(String)? onChange;
  String? Function(String? val)? validator;
  final TextInputType? textInputType;
  final bool? isObserver;
  final TextEditingController? textEditingController;

  TextFormFiledWidget(
      {Key? key,
        required this.icon,
        required this.hintText,
        required this.onChange,
        required this.validator,
        required this.textInputType,
        this.textEditingController,
        this.initialValue,
        this.isObserver = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: textEditingController,
      textInputAction: TextInputAction.next,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: hintText,
        prefixIcon: Icon(icon),
      ),
      onChanged: onChange,
      validator: validator,
    );
  }
}
List<String> images = [
  'images/apple.png',
  'images/backpack.png',
  'images/face.png',
  'images/emptyCart.png',
  'images/Doritos.png',
  'images/ChickenMeat2.png',
  'images/ChickenMeat.png',
  'images/banana.png',
  'images/Bottato.png',
  'images/Carot.png',
  'images/category.png',
  'images/category2.png',
  'images/FishMeat.png',
  'images/FishMeat2.png',
  'images/gmail.png',
  'images/google.png',
  'images/hat.png',
  'images/jacket.png',
  'images/jeans.png',
  'images/Lemmon.png',
  'images/nodata.png',
  'images/Login.gif',
  'images/Nutella.png',
  'images/Pepsi.png',
  'images/Strawberry.png',
  'images/snow1.jpg',
  'images/snow.gif',
  'images/Signup.gif',
  'images/shoes3.png',
  'images/shoes2.png',
  'images/shoes1.png',
  'images/searchNotFound.png',
  'images/RedMeat2.png',
  'images/RedMeat.png',
  'images/product.png',
];