import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../model/blog_model.dart';

class BlogPostCard extends StatelessWidget {
  final Blog blog;
  const BlogPostCard({
    Key? key,
    required this.blog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.78,
            child: Image.asset(blog.image!),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Design".toUpperCase(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      blog.date!,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    blog.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 22,
                      fontFamily: "Raleway",
                      color: Colors.black,
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  blog.description!,
                  maxLines: 4,
                  style: const TextStyle(height: 1.5),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 20 / 4),
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom:
                                BorderSide(color: Color(0xFFFF3B1D), width: 3),
                          ),
                        ),
                        child: const Text(
                          "Read More",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: SvgPicture.asset(
                          "assets/icons/feather_thumbs-up.svg"),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                          "assets/icons/feather_message-square.svg"),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon:
                          SvgPicture.asset("assets/icons/feather_share-2.svg"),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
