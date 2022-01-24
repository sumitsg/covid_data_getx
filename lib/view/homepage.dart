import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shopx_app_using_getx/controller/product_controller.dart';
import 'package:shopx_app_using_getx/view/country_details.dart';
import 'package:shopx_app_using_getx/view/country_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'COVID DATA',
          style: TextStyle(
            fontFamily: 'avenir',
            fontSize: 32,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
            ),
            onPressed: () {
              Get.to(const CountryDetails());
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: productController.coviddata.length,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                itemBuilder: (context, index) {
                  return CountryTile(cData: productController.coviddata[index]);
                },
                staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
              ),
            ),
          )
        ],
      ),
    );
  }
}
