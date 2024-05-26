import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:zarity_task/app/utils/scale_utility.dart';

import '../../../models/article_model.dart';

class ArticleTask extends StatelessWidget {
  final ArticleModel article;
  ArticleTask({required this.article, Key? key}) : super(key: key);

  final scale = Get.find<ScalingUtility>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: scale.getMargin(
        right: 18,
        top: 15,
        left: 12,
        bottom: 25,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(4,4),
            blurRadius: 20,
            spreadRadius: 0,
            color: const Color(0xff6F8CB0).withOpacity(0.41),
          ),
          const BoxShadow(
            offset: Offset(-6,-6),
            blurRadius: 20,
            spreadRadius: 0,
            color: Colors.white,
          ),
          BoxShadow(
            offset: const Offset(2,2),
            blurRadius: 4,
            spreadRadius: 0,
            color: const Color(0xff728EAB).withOpacity(0.1),
          ),
        ],
        color: const Color(0xffE3EDF7),
      ),
      child: Column(
        children: [
          Container(
            height: scale.getScaledHeight(169),
            width: double.maxFinite,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    article.image?? '',
                  ),
                  fit: BoxFit.cover,
                )
            ),
          ),
          SizedBox(
            width: scale.getScaledWidth(308),
            child: Column(
              children: [
                Container(
                  padding: scale.getPadding(
                    vertical: 10,
                  ),
                  margin: scale.getMargin(
                    left: 16,
                    right: 8,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: scale.getMargin(
                              right: 10,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                            padding: scale.getPadding(
                                horizontal: 11,
                                vertical: 3
                            ),
                            child: Text(
                              article.tagCategory?? '',
                              style: GoogleFonts.outfit(
                                  fontSize: scale.getScaledFont(8),
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff898D91)
                              ),
                            ),
                          ),
                          Text(
                            DateFormat('MMMM d, yyyy').format(article.date?? DateTime.now()),
                            style: GoogleFonts.outfit(
                                fontSize: scale.getScaledFont(8),
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff898D91)
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: scale.getPadding(
                            horizontal: 5,
                            vertical: 5
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xffE3EDF7),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(4,4),
                              blurRadius: 20,
                              spreadRadius: 0,
                              color: const Color(0xff6F8CB0).withOpacity(0.41),
                            ),
                            const BoxShadow(
                              offset: Offset(-6,-6),
                              blurRadius: 20,
                              spreadRadius: 0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        child: Center(
                            child: Icon(
                              article.isBookmark?? false
                                  ? Icons.bookmark
                                  : Icons.bookmark_border,
                              size: scale.getScaledFont(12),
                              color: const Color(0xff3377FF),
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: scale.getMargin(
                    bottom: 12,
                    left: 16,
                    right: 9,
                  ),
                  child: Text(
                    article.title?? '',
                    style: GoogleFonts.outfit(
                        fontSize: scale.getScaledFont(14),
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff3D5284)
                    ),
                  ),
                ),
                Padding(
                  padding: scale.getPadding(
                    left: 16,
                    right: 25,
                  ),
                  child: Text(
                    article.description?? '',
                    style: GoogleFonts.outfit(
                        fontSize: scale.getScaledFont(8),
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff666666)
                    ),
                  ),
                ),
                Container(
                  margin: scale.getMargin(
                    left: 16,
                    top: 12,
                    bottom: 8
                  ),
                  height: scale.getScaledHeight(15),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: article.tags?.length?? 0,
                    itemBuilder: (context, index){
                      return Container(
                        padding: scale.getPadding(
                          left: 5,
                          right: 12,
                          top: 2,
                          bottom: 2,
                        ),
                        margin: scale.getMargin(
                          right: 10,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: const Color(0xff4C4D4D).withOpacity(0.6),
                              width: 0.6,
                            )
                        ),
                        child: Text(
                          article.tags?[index]?? '',
                          style: GoogleFonts.outfit(
                            fontSize: scale.getScaledFont(6),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
