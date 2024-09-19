import 'package:ecommerce_app/screens/user_profile.dart';
import 'package:ecommerce_app/screens/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/screens/widgets/users_card.dart';
import 'package:ecommerce_app/screens/widgets/users_solid_card.dart';
import 'package:ecommerce_app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});
  @override
  State<StatefulWidget> createState() => UsersListState();
}

class UsersListState extends State<UsersList> {
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    var fetchedUsers = await EcommerceServices().fetchUsers();
    if (mounted) {
      setState(() {
        users = fetchedUsers;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Users"),
      body: users.isEmpty
          ? Skeletonizer(
              enabled: users.isEmpty,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8),
                  itemBuilder: (context, index) {
                    return const UsersSolidCard();
                  }))
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two columns
                crossAxisSpacing: 8, // Spacing between columns
                mainAxisSpacing: 8, // Spacing between rows
              ),
              itemCount:
                  users.length, // Specify the number of items in the grid
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      if (index < users.length) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    UserProfile(user: users[index])));
                      }
                    },
                    child: UsersCard(user: users[index]));
              }),
    );
  }
}
