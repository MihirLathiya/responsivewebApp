import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../common/text.dart';
import '../../controller/tab_controller.dart';
import '../../model/blog_model.dart';
import 'componet/blog_post.dart';
import 'desktop_home.dart';

// ignore: must_be_immutable
class MobileHome extends StatelessWidget {
  MobileHome({Key? key}) : super(key: key);
  final drawerKey = GlobalKey<ScaffoldState>();
  TabsController tabsController = Get.put(TabsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      drawer: Container(
        height: Get.height,
        width: 400,
        color: Colors.black,
        child: Column(
          children: [
            DrawerHeader(child: SvgPicture.asset('assets/icons/logo.svg')),
            Expanded(
              child: ListView.builder(
                itemCount: tabsController.menuItems.length,
                itemBuilder: (context, index) {
                  return Obx(
                    () => ListTile(
                      onTap: () {},
                      title: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: Ts(
                          text: tabsController.menuItems[index],
                          color: Colors.white,
                          height: 2,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xFFE7E7E7),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Get.height / 2.90,
              width: double.infinity,
              color: const Color(0xFF191919),
              child: SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 28.0, left: 40, right: 30),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              drawerKey.currentState?.openDrawer();
                            },
                            icon: const Icon(Icons.menu),
                            color: Colors.white,
                          ),
                          SvgPicture.asset(
                            'assets/icons/logo.svg',
                            height: Get.height / 27,
                          ),
                          const Spacer(),
                          // TabMenu(),
                          const Spacer(),
                          const Social()
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 34.72,
                    ),
                    Ts(
                      text: "Welcome to Our Blog",
                      size: 32,
                      color: Colors.white,
                      weight: FontWeight.bold,
                      family: 'Raleway',
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "Stay updated with the newest design and development stories, case studies, \nand insights shared by DesignDK Team.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Raleway',
                          height: 1.5,
                        ),
                      ),
                    ),
                    FittedBox(
                      child: TextButton(
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Text(
                              "Learn More",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(width: 20 / 2),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  ...List.generate(
                    blogPosts.length,
                    (index) => BlogPostCard(blog: blogPosts[index]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
