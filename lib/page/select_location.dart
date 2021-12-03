import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter_app2/firebase/authentication.dart';
import 'package:test_flutter_app2/custom/button.dart';
import 'package:test_flutter_app2/router/router.dart';

class SelectLocation extends StatefulWidget {
  SelectLocation({Key? key}) : super(key: key);

  final checkIndex = Get.arguments as String;
  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  final items=['Việt Nam','Lào','Campuchia','Thái Lan','Trung Quốc'];

  String value='Việt Nam';
  TextEditingController _controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
            color: Colors.black
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(''),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/map.png'),
              const Padding(padding: EdgeInsets.only(top: 30)),
              const Text('Select Your Location',style: TextStyle(
                  fontSize: 26,color: Colors.black,fontFamily: 'Gilroy-Light',fontWeight: FontWeight.w500
              ),),
              const Padding(padding: EdgeInsets.only(top: 10)),
              const Text('Swithch on your location to stay in tune with\nwhat’s happening in your area',textAlign: TextAlign.center,style: TextStyle(
                fontSize: 16,color: Color.fromARGB(255, 124, 124, 124),fontFamily: 'Gilroy-Light',
              ),),
              Container(
                padding: EdgeInsets.only(right: 15,left: 15,top: 100),
                child: Column(
                  children: [
                    const Align(
                      child: Text('Your Zone',style: TextStyle(
                          fontSize: 16,color: Color.fromARGB(255, 124, 124, 124),fontFamily: 'Gilroy-Light',fontWeight: FontWeight.w500
                      ),),
                      alignment: Alignment.topLeft,
                    ),
                    DropdownButton<String>(
                      menuMaxHeight: 200,
                      value: value,
                      isExpanded: true,
                      items: items.map(buildMenuItem).toList(),
                      onChanged: (value)=>setState(() {
                        this.value=value!;
                      }),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 30)),
                    const Align(
                      child: Text('Your Area',style: TextStyle(
                          fontSize: 16,color: Color.fromARGB(255, 124, 124, 124),fontFamily: 'Gilroy-Light',fontWeight: FontWeight.w500
                      ),),
                      alignment: Alignment.topLeft,
                    ),
                    TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                          hintText: 'Types of your area'
                      ),
                      maxLines: 1,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 20)),
                    Button(name: "Submit", ontap: (){
                      if(_controller.text.isEmpty || this.value.isEmpty){
                        Get.snackbar("Thông báo", "Bạn chưa điền địa chỉ");
                      }else{
                        Map<String,dynamic> adress={"area":_controller.text,"zone":this.value};
                        AuthenticationHelper().putFirestore(adress);

                        if(widget.checkIndex=='signUp'){
                          Get.offAllNamed(Routes.BOTTOMNAV);
                        }else{
                          Get.back();
                        }

                      }
                    }, context: context,check: false,total: 10)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
      DropdownMenuItem(value: item,child: Text(
        item,style: TextStyle(fontSize: 20),
      ),);
}
