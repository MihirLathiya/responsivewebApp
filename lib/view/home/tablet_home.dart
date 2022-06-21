import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../common/text.dart';
import '../../controller/tab_controller.dart';
import '../../model/blog_model.dart';
import 'componet/blog_post.dart';
import 'componet/categories.dart';
import 'componet/recent_post.dart';
import 'componet/side_container.dart';
import 'desktop_home.dart';

// ignore: must_be_immutable
class TabletHome extends StatelessWidget {
  TabletHome({Key? key}) : super(key: key);
  final drawerKey = GlobalKey<ScaffoldState>();
  TabsController tabsController = Get.put(TabsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      drawer: Container(
        height: Get.height,
        width: Get.width / 2.399,
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
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(children: [
                      const SizedBox(
                        height: 50,
                      ),
                      ...List.generate(
                        blogPosts.length,
                        (index) => BlogPostCard(blog: blogPosts[index]),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        SidebarContainer(
                          title: "Search",
                          child: TextField(
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              hintText: "Type Here ...",
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(20 / 2),
                                child: SvgPicture.asset(
                                    "assets/icons/feather_search.svg"),
                              ),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20 / 2),
                                ),
                                borderSide:
                                    BorderSide(color: Color(0xFFCCCCCC)),
                              ),
                            ),
                          ),
                        ),
                        const Categories(),
                        const RecentPost(),
                      ],
                    ),
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
