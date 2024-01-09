import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harvesthub_agro/controller/home_controller.dart';
import 'package:harvesthub_agro/src/presentation/view/component/m_appbar.dart';
import 'package:harvesthub_agro/src/presentation/view/pages/home/widget/item_view.dart';
import 'package:harvesthub_agro/src/utils/constants/m_colors.dart';
import 'package:harvesthub_agro/src/utils/constants/m_dimensions.dart';
import 'package:harvesthub_agro/src/utils/constants/m_styles.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class FullItemScreen extends StatefulWidget {
  const FullItemScreen({Key? key}) : super(key: key);

  @override
  State<FullItemScreen> createState() => _FullItemScreenState();
}

class _FullItemScreenState extends State<FullItemScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (home) => Scaffold(
        backgroundColor: MyColor.getBackgroundColor(),
        appBar:  CustomAppBar(title: 'popular_advice'.tr,),
        body: ListView(
          children: [
            /// for category Item

            const SizedBox(height: MySizes.paddingSizeExtraOverLarge),
            StaggeredGridView.countBuilder(
                crossAxisCount: 3,
                mainAxisSpacing: 50,
                crossAxisSpacing: 5,
                padding: const EdgeInsets.symmetric(horizontal: MySizes.paddingSizeSmall),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: home.itemList.length,
                itemBuilder: (context, index) => ItemView(itemModel: home.itemList[index], index: index,),
                staggeredTileBuilder: (index) => const StaggeredTile.fit(1)),

            const SizedBox(height: MySizes.paddingSizeSmall),

          ],
        ),
      ),
    );
  }

  Widget _rowTile(String title, {VoidCallback? onTap}){
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(MySizes.paddingSizeDefault),
        child: Text(title, style: robotoRegular.copyWith(color: MyColor.colorPrimary, fontSize: MySizes.fontSizeLarge),),
      ),
    );
  }
}
