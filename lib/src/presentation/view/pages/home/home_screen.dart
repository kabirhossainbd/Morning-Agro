import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harvesthub_agro/controller/home_controller.dart';
import 'package:harvesthub_agro/src/utils/constants/m_colors.dart';
import 'package:harvesthub_agro/src/utils/constants/m_dimensions.dart';
import 'package:harvesthub_agro/src/utils/constants/m_images.dart';
import 'package:harvesthub_agro/src/utils/constants/m_styles.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final CarouselController _carouselController = CarouselController();

  var imageList = [MyImage.agriculture, MyImage.agriculture];
  int indicatorIndex = 2;

  final List<String> _homeIconList = [
    MyImage.agriculture,
    MyImage.agriculture,
    MyImage.agriculture,
    MyImage.agriculture,
    MyImage.agriculture,
    MyImage.agriculture,
    MyImage.agriculture,
    MyImage.agriculture,
    MyImage.agriculture,
    MyImage.agriculture,
    MyImage.agriculture,
    MyImage.agriculture,
  ];

  final List<String> _titleList = [
    'My Crops',
    'Profile',
    "Crop Doctor",
    'Sellers',
    'Khata Book',
    'Transaction',
    'Video',
    'Quiz',
    'Bazar Rates',
    'News',
    'Radio',
    'Contact Us',
  ];

  final List<Color> _colorList = [
    const Color(0xFF008080),
    const Color(0xFFFFEA20),
    const Color(0xFF98D33C),
    const Color(0xFFEC6628),
    const Color(0xFF008080),
    const Color(0xFF98D33C),
    const Color(0xFF191237),
    const Color(0xFF37384B),
    const Color(0xFF008080),
    const Color(0xFF800080),
    const Color(0xFF00008B),
    const Color(0xFFDCF8C6),
  ];
  @override
  void initState() {
    Get.find<HomeController>().getItemList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: MyColor.getBackgroundColor(),
      body: GetBuilder<HomeController>(
        builder: (home) => NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overScroll) {
            overScroll.disallowIndicator();
            return true;
          },
          child: RefreshIndicator(
            backgroundColor: Colors.white,
            color: const Color(0xFF434345),
            onRefresh: () async {},
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Container(
                    padding: const EdgeInsets.all(MySizes.paddingSizeDefault),
                    decoration:  BoxDecoration(
                        color: MyColor.getPrimaryColor()
                    ),
                  child: Column(
                    children: [
                      Row( crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.menu, color: MyColor.colorWhite, size: 30,),
                          Text('app_name'.tr, style: robotoExtraBold.copyWith(color: MyColor.colorWhite, fontSize: MySizes.fontSizeOverLarge)),
                          const SizedBox()
                        ],
                      ),
                      const SizedBox(height: MySizes.paddingSizeExtraSmall),
                      Row( crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Enriching', style: robotoLight.copyWith(color: MyColor.getSurfaceColor(), fontSize: MySizes.fontSizeLarge),),
                          const SizedBox(width: 8,),
                          Text('Agriculture', style: robotoLight.copyWith(color: MyColor.colorGreen, fontSize: MySizes.fontSizeLarge),),
                        ],
                      ),
                      const SizedBox(height: MySizes.paddingSizeExtraSmall),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: CarouselSlider.builder(
                          carouselController: _carouselController,
                          itemCount: imageList.length,
                          itemBuilder: (context, index, realIndex){
                            return SlideItem(image: imageList[index]);
                          },
                          options: CarouselOptions(
                              padEnds: true,
                              autoPlay: true,
                              height: 200,
                              enableInfiniteScroll: false,
                              reverse: false,
                              initialPage: indicatorIndex,
                              pageViewKey: const PageStorageKey<String>('key'),
                              enlargeCenterPage: false,
                              viewportFraction: 1,
                              enlargeStrategy: CenterPageEnlargeStrategy.height,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  indicatorIndex = index;
                                });
                              }),
                        ),
                      ),
                    ]
                  ),
                ),


                const SizedBox(height: MySizes.paddingSizeExtraSmall),
                Padding(
                  padding: const EdgeInsets.all(MySizes.paddingSizeDefault),
                  child: Text('Your Dashboard', style: robotoRegular.copyWith(color: MyColor.getTextColor(), fontSize: MySizes.fontSizeExtraLarge)),
                ),

                /// for category Item
                StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    padding: const EdgeInsets.symmetric(horizontal: MySizes.paddingSizeSmall),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _homeIconList.length,
                    itemBuilder: (context, index) => _buildHomeItem(_homeIconList[index], _titleList[index],_colorList[index], index, 170, 150, 20),
                    staggeredTileBuilder: (index) => const StaggeredTile.fit(1)),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHomeItem(String icon,String title,Color color,int index,double? height, double? width, double? iconSize){
    return InkWell(
      onTap: (){

      },
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: color,
          boxShadow: const [BoxShadow(color: MyColor.colorBorder, spreadRadius: 2, blurRadius: 2, offset: Offset(-1,2))]
        ),
        child: Column( mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(icon, height: 100, width: 100),
            const SizedBox(height: 10),
            Text(title, style:  robotoBold.copyWith(color: MyColor.colorWhite, fontSize: iconSize), textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }

}



class SlideItem extends StatefulWidget {
  final String image;
  const SlideItem({Key? key, required this.image}) : super(key: key);

  @override
  State<SlideItem> createState() => _SlideItemState();
}

class _SlideItemState extends State<SlideItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: MyColor.colorWhite,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: MyColor.colorWhite, width: 0.5)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: CachedNetworkImage(
            imageUrl: '',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            fadeInDuration: const Duration(seconds: 1),
            errorWidget: (context, exception, stacktrace) =>  Image.asset(widget.image, fit: BoxFit.cover,),
            placeholder: (_, name)=> Image.asset(widget.image, fit: BoxFit.cover,)
        ),
      ),
    );
  }
}

