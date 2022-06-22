import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:webapp/common/button.dart';
import 'package:webapp/common/text.dart';
import 'package:webapp/controller/tab_controller.dart';
import 'package:webapp/view/home/componet/blog_post.dart';
import 'package:webapp/view/home/componet/categories.dart';
import 'package:webapp/view/home/componet/recent_post.dart';

import '../../model/blog_model.dart';
import 'componet/side_container.dart';

class DesktopHome extends StatefulWidget {
  DesktopHome({Key? key}) : super(key: key);

  @override
  State<DesktopHome> createState() => _DesktopHomeState();
}

class _DesktopHomeState extends State<DesktopHome> {
  bool press = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          SvgPicture.asset(
                            'assets/icons/logo.svg',
                            height: Get.height / 27,
                          ),
                          const Spacer(),
                          TabMenu(),
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              constraints: BoxConstraints(maxWidth: 1232),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
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

class Social extends StatelessWidget {
  const Social({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/icons/behance-alt.svg'),
        SizedBox(
          width: Get.width / 74.45,
        ),
        SvgPicture.asset('assets/icons/feather_dribbble.svg'),
        SizedBox(
          width: Get.width / 74.45,
        ),
        SvgPicture.asset('assets/icons/feather_twitter.svg'),
        SizedBox(
          width: Get.width / 74.45,
        ),
        Button(
          buttonName: 'Lets\'s Talk',
          onTap: () {},
          buttonColor: const Color(0xFFFF3B1D),
        )
      ],
    );
  }
}

class TabMenu extends StatelessWidget {
  TabMenu({Key? key}) : super(key: key);
  TabsController tabsController = Get.put(TabsController());
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          tabsController.menuItems.length,
          (index) => InkWell(
            onTap: () {
              tabsController.setMenuIndex(index);
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 74.45),
              child: Obx(
                () => Ts(
                  text: tabsController.menuItems[index],
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
