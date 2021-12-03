import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_flutter_app2/firebase/authentication.dart';
import 'package:test_flutter_app2/page/account/widget/menu.dart';

class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              child: Row(
                children: [
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('user')
                          .doc(AuthenticationHelper().userId)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const CircleAvatar(
                            radius: 27,
                          );
                        }
                        if (!snapshot.hasData) {
                          return const CircleAvatar(
                            radius: 27,
                          );
                        }
                        try {
                          var userDocument = snapshot.data as dynamic;
                          return CircleAvatar(
                            backgroundImage:
                                NetworkImage('${userDocument!["img"]}'),
                            radius: 27,
                          );
                        } on StateError catch (e) {
                          return const CircleAvatar(
                            radius: 27,
                          );
                        }
                      }),
                  const Padding(padding: EdgeInsets.only(right: 10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('user')
                              .doc(AuthenticationHelper().userId)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text("Loading");
                            }
                            if (!snapshot.hasData) {
                              return Text("Loading");
                            }
                            try {
                              var userDocument = snapshot.data as dynamic;
                              return Row(
                                children: [
                                  Text('${userDocument!["user_name"]}',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontFamily: 'Gilroy-ExtraBold',
                                          fontWeight: FontWeight.bold)),
                                  Padding(padding: EdgeInsets.only(right: 5)),
                                  SvgPicture.asset('assets/images/pen.svg')
                                ],
                              );
                            } on StateError catch (e) {
                              return const Text('Lỗi tên',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontFamily: 'Gilroy-Light',
                                      fontWeight: FontWeight.bold));
                            }
                          }),
                      StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('user')
                              .doc(AuthenticationHelper().userId)
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text("Loading");
                            }
                            if (!snapshot.hasData) {
                              return Text("Loading");
                            }
                            try {
                              var userDocument = snapshot.data as dynamic;
                              return Text('${userDocument!["email"]}',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff7C7C7C),
                                      fontFamily: 'Gilroy-ExtraBold',
                                      fontWeight: FontWeight.bold));
                            } on StateError catch (e) {
                              return const Text('Loading',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xff7C7C7C),
                                      fontFamily: 'Gilroy-Light',
                                      fontWeight: FontWeight.bold));
                            }
                          }),
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Color(0xffE2E2E2))),
            ),
            Menu(img: 'assets/images/Ordersicon.svg', title: 'Orders'),
            Menu(img: 'assets/images/MyDetailsicon.svg', title: 'My Details'),
            Menu(
                img: 'assets/images/Deliceryaddress.svg',
                title: 'Delivery Address'),
            Menu(img: 'assets/images/Vectoricon.svg', title: 'Payment Methods'),
            Menu(img: 'assets/images/Group.svg', title: 'Promo Cord'),
            Menu(img: 'assets/images/Bell icon.svg', title: 'Notifecations'),
            Menu(img: 'assets/images/help icon.svg', title: 'Help'),
            Menu(img: 'assets/images/about icon.svg', title: 'About'),
            const Padding(padding: EdgeInsets.only(top: 20)),
            Stack(
              children: [
                ElevatedButton(
                  onPressed: () {
                    AuthenticationHelper().signOut();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.85, 67),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    primary: const Color(0xffF2F3F2),
                  ),
                  child: const Text(
                    'Log Out',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff53B175),
                        fontFamily: 'Gilroy-Light',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  top: 22,
                  left: 20,
                  child: SvgPicture.asset('assets/images/Group 6892.svg'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
