
import 'package:ecommerce_app/screens/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});
  @override
  State<StatefulWidget> createState() => UsersListState();
}

class UsersListState extends State<UsersList> {
  // List<dynamic> users = [];

  // @override
  // void initState() {
  //   super.initState();
  //   _fetchUsers();
  // }

  // Future<void> _fetchUsers() async {
  //   users = await EcommerceServices().fetchUsers();
  //   setState(() {
  //     users;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Users"),
      // body: users.isEmpty
      //     ? Skeletonizer(
      //         enabled: users.isEmpty,
      //         child: GridView.builder(
      //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //                 crossAxisCount: 2,
      //                 crossAxisSpacing: 8,
      //                 mainAxisSpacing: 8),
      //             itemBuilder: (context, index) {
      //               return const UsersSolidCard();
      //             }))
      //     : GridView.builder(
      //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //             crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
      //         itemBuilder: (context, index) {
      //           return GestureDetector(
      //               onTap: () {
      //                 Navigator.push(
      //                     context,
      //                     MaterialPageRoute(
      //                         builder: (context) =>
      //                             UserProfile(user: users[index])));
      //               },
      //               child: UsersCard(user: users[index]));
      //         }),
    );
  }
}
