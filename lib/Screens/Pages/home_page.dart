// import 'package:ecommerce_app/screens/product_details.dart';
import 'package:ecommerce_app/screens/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/screens/widgets/product_card.dart';
import 'package:ecommerce_app/screens/widgets/skeleton_product_card.dart';
// import 'package:ecommerce_app/screens/widgets/product_card.dart';
// import 'package:ecommerce_app/screens/widgets/skeleton_product_card.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePage extends StatefulWidget {
  final List<dynamic> products;
  const HomePage({super.key, required this.products});
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<dynamic> categories = [
    "All",
    "men's clothing",
    "women's clothing",
    "electronics",
    "jewelry"
  ];
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "E-commerce App"),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Skeletonizer(
              enabled: widget.products.isEmpty,
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = categories[index];
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                              color: selectedCategory == categories[index]
                                  ? Colors.deepPurple
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.deepPurple)),
                          child: Text(
                            categories[index],
                            style: TextStyle(
                                color: selectedCategory == categories[index]
                                    ? Colors.white
                                    : Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    }),
              )),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: widget.products.isEmpty
                      ? Skeletonizer(
                          enabled: true,
                          child: ListView.builder(
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return const SkeletonProductCard();
                              }))
                      : ListView.builder(
                          itemCount: widget.products.length,
                          itemBuilder: (context, index) {
                            final product = widget.products[index];
                            // if (selectedCategory == "All" ||
                            //     selectedCategory == product["category"])
                            {
                              return GestureDetector(
                                // onTap: () {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) => ProductDetails(
                                //               product: product)));
                                // },
                                child: ProductCard(
                                  product: product,
                                ),
                              );
                            }
                            // else {
                            //   return Container();
                            // }
                          })))
        ],
      ),
    );
  }
}
