import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:zarity_task/app/screens/home_screen/widgets/article_task.dart';
import 'package:zarity_task/app/utils/colors.dart';
import 'package:zarity_task/app/utils/scale_utility.dart';

import 'controller/home_screen_controller.dart';
import 'widgets/button_design.dart';

class HomeScreen extends GetView<HomeScreenController> {
  HomeScreen({Key? key}) : super(key: key);

  final scale = Get.find<ScalingUtility>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsUtil.backgroundColor,
      body: Container(
        color: ColorsUtil.backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: scale.getPadding(
                  left: 16,
                  top: 43,
                  bottom: 33,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: scale.getScaledFont(22),
                    backgroundColor: Colors.transparent,
                    backgroundImage: const AssetImage(
                      'assets/profile.png',
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good afternoon',
                        style: GoogleFonts.outfit(
                          fontSize: scale.getScaledFont(12),
                          fontWeight: FontWeight.w600,
                          color: ColorsUtil.blueFontColor,
                        ),
                      ),
                      Text(
                        'Bhavik Kothari',
                        style: GoogleFonts.outfit(
                          fontSize: scale.getScaledFont(16),
                          fontWeight: FontWeight.w600,
                          color: ColorsUtil.darkTextColor,
                        ),
                      )
                    ],
                  ),
                  trailing: SizedBox(
                    width: scale.getScaledWidth(80),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: scale.getScaledFont(16),
                          backgroundColor: ColorsUtil.backgroundShadowColor,
                          child: Center(
                            child: Image.asset(
                              'assets/message.png',
                              height: scale.getScaledHeight(13),
                              width: scale.getScaledWidth(13),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: scale.getScaledWidth(10),
                        ),
                        CircleAvatar(
                          radius: scale.getScaledFont(16),
                          backgroundColor: ColorsUtil.backgroundShadowColor,
                          child: Center(
                            child: Image.asset(
                              'assets/notification_bell.png',
                              height: scale.getScaledHeight(13),
                              width: scale.getScaledWidth(13),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  showModalBottomSheet(
                    showDragHandle: true,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    constraints: BoxConstraints(
                      maxHeight: scale.fh*0.8,
                      minHeight: scale.getScaledHeight(200),
                    ),
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: scale.getPadding(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                          color: ColorsUtil.backgroundShadowColor,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Task List',
                                  style: GoogleFonts.outfit(
                                      fontSize: scale.getScaledFont(18),
                                      fontWeight: FontWeight.w500,
                                      color: ColorsUtil.darkTextColor,
                                  ),
                                ),
                                SizedBox(
                                  width: scale.getScaledWidth(200),
                                  child: DropdownButtonFormField2<String>(
                                    isExpanded: true,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.blue,
                                            width: 2
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.blue,
                                            width: 2
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    hint: const Text(
                                      'Select Your Task',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    items: ['Immediate', 'This Month', 'This Week'].map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    )).toList(),
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please select category';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      controller.setFilter(value?? 'Select Your Task');
                                    },
                                    onSaved: (value) {

                                    },
                                    buttonStyleData: const ButtonStyleData(
                                      padding: EdgeInsets.only(right: 8),
                                    ),
                                    iconStyleData: const IconStyleData(
                                      icon: Icon(
                                        Icons.arrow_drop_down,
                                        color: Colors.black45,
                                      ),
                                      iconSize: 24,
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      padding: EdgeInsets.symmetric(horizontal: 16),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: scale.getScaledHeight(10),
                            ),
                            Expanded(
                              child: Obx(
                                () => controller.temp.isEmpty ? Text(
                                  'No Immediate task',
                                  style: GoogleFonts.outfit(
                                    fontSize: scale.getScaledFont(18),
                                    fontWeight: FontWeight.w500,
                                    color: ColorsUtil.darkTextColor,
                                  ),
                                ) : ListView.builder(
                                  itemCount: controller.temp.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index){
                                    return ArticleTask(
                                      article: controller.temp[index],
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    enableDrag: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                    ),
                  ).then((value) {
                   controller.temp.clear();
                   controller.temp.addAll(controller.articles);
                  });
                },
                child: Container(
                  margin: scale.getMargin(horizontal: 10),
                  decoration: BoxDecoration(
                    color: ColorsUtil.backgroundShadowColor,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(4,4),
                        blurRadius: 20,
                        spreadRadius: 0,
                        color: ColorsUtil.shadowColor1.withOpacity(0.41),
                      ),
                      const BoxShadow(
                        offset: Offset(-6,-6),
                        blurRadius: 20,
                        spreadRadius: 0,
                        color: Colors.white,
                      ),
                    ]
                  ),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          IconButton(
                            onPressed: () {},
                            iconSize: scale.getScaledFont(65),
                            highlightColor: Colors.transparent,
                            icon: Icon(
                              Icons.circle_outlined,
                              color: ColorsUtil.backgroundShadowColor,
                              shadows: [
                                const Shadow(
                                  color: Color(0xffC1D5EE),
                                  offset: Offset(4, 4),
                                  blurRadius: 14,
                                ),
                                Shadow(
                                  color: Colors.white.withOpacity(0.88),
                                  offset: const Offset(-2, -2),
                                  blurRadius: 9,
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            left: 16.5,
                            top: 16.5,
                            child: CircularPercentIndicator(
                              radius: 20,
                              progressColor: Colors.blue,
                              lineWidth: 10,
                              circularStrokeCap: CircularStrokeCap.round,
                              backgroundColor: Colors.transparent,
                              center: Container(
                                height: scale.getScaledHeight(24),
                                width: scale.getScaledWidth(24),
                                padding: scale.getPadding(
                                  horizontal: 2,
                                  vertical: 2,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorsUtil.backgroundShadowColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(4,4),
                                      blurRadius: 20,
                                      color: ColorsUtil.shadowColor1.withOpacity(0.41),
                                    ),
                                    const BoxShadow(
                                      offset: Offset(-6,-6),
                                      blurRadius: 20,
                                      color: Colors.white,
                                    ),
                                    BoxShadow(
                                      offset: const Offset(2,2),
                                      blurRadius: 4,
                                      color: ColorsUtil.shadowColor2.withOpacity(0.10),
                                    )
                                  ]
                                ),
                                child: Container(
                                  height: scale.getScaledHeight(17),
                                  width: scale.getScaledWidth(17),
                                  padding: scale.getPadding(
                                    horizontal: 2,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                      color: ColorsUtil.backgroundShadowColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(4,4),
                                          blurRadius: 20,
                                          color: ColorsUtil.shadowColor1.withOpacity(0.41),
                                        ),
                                        const BoxShadow(
                                          offset: Offset(-6,-6),
                                          blurRadius: 20,
                                          color: Colors.white,
                                        ),
                                        BoxShadow(
                                          offset: const Offset(2,2),
                                          blurRadius: 4,
                                          color: ColorsUtil.shadowColor2.withOpacity(0.10),
                                        )
                                      ]
                                  ),
                                  child: Center(
                                    child: Text(
                                      '1%',
                                      style: GoogleFonts.outfit(
                                        fontSize: scale.getScaledFont(8),
                                        fontWeight: FontWeight.w800,
                                        color: ColorsUtil.blueColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              percent: 0.1,
                            ),
                          )
                        ],
                      ),
                      Container(
                        padding: scale.getPadding(
                          left: 5
                        ),
                        width: scale.getScaledWidth(210),
                        child: Text(
                          "This is a task list that Opens a dialogue box showing tasks, read more...",
                          maxLines: 2,
                          style: GoogleFonts.outfit(
                            fontSize: scale.getScaledFont(12),
                            fontWeight: FontWeight.w500,
                            color: ColorsUtil.blueFontColor,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black,
                          size: 12,
                        ),
                        onPressed: () {  },
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: scale.getMargin(
                  top: 30,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ordinary Title 1',
                      style: GoogleFonts.outfit(
                        fontSize: scale.getScaledFont(16),
                        fontWeight: FontWeight.w600,
                        color: ColorsUtil.darkTextColor,
                      ),
                    ),
                    Padding(
                      padding: scale.getPadding(
                        top: 12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ButtonDesign(
                            text: 'Button 1 Name',
                          ),
                          ButtonDesign(
                            text: 'Button 1 Name',
                          ),
                          ButtonDesign(
                            text: 'Button 1 Name',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: scale.getMargin(
                  top: 30,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ordinary Title 2',
                      style: GoogleFonts.outfit(
                        fontSize: scale.getScaledFont(16),
                        fontWeight: FontWeight.w600,
                        color: ColorsUtil.darkTextColor,
                      ),
                    ),
                    Container(
                      padding: scale.getPadding(
                        horizontal: 30,
                        vertical: 20
                      ),
                      margin: scale.getMargin(
                        top: 12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: ColorsUtil.lightTextColor2,
                      ),
                      child: Text(
                        'This is a state box with a message, showing that the section is empty right now',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.outfit(
                          fontSize: scale.getScaledFont(12),
                          fontWeight: FontWeight.w500,
                          color: ColorsUtil.lightColorText.withOpacity(0.5),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: scale.getMargin(
                  top: 30,
                  left: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ordinary Title 3',
                      style: GoogleFonts.outfit(
                        fontSize: scale.getScaledFont(16),
                        fontWeight: FontWeight.w600,
                        color: ColorsUtil.darkTextColor,
                      ),
                    ),
                    Obx(
                      () => controller.loadingData.value.isLoading ? Container(
                        alignment: Alignment.center,
                        margin: scale.getMargin(
                          all: 20
                        ),
                        child: const CircularProgressIndicator(),
                      ): Container(
                        height: scale.getScaledHeight(470),
                        padding: scale.getPadding(
                          bottom: 20,
                        ),
                        margin: scale.getMargin(
                          top: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                          color: const Color(0xffDCE8F7),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(18,18),
                              blurRadius: 30,
                              spreadRadius: 0,
                              color: const Color(0xffD1D9E6).withOpacity(0.9),
                            ),
                            BoxShadow(
                              offset: const Offset(-18,-18),
                              blurRadius: 30,
                              spreadRadius: 0,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: PageView.builder(
                                itemCount: controller.articles.length?? 0,
                                scrollDirection: Axis.horizontal,
                                controller: PageController(viewportFraction: 0.99),
                                itemBuilder: (context, index){
                                  return ArticleTask(article: controller.articles[index]);
                                },
                              ),
                            ),
                            Container(
                              width: scale.getScaledWidth(174),
                              height: scale.getScaledHeight(32),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.white.withOpacity(0.53),
                                    Colors.white,
                                  ],
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(4,4),
                                    blurRadius: 20,
                                    spreadRadius: 0,
                                    color: ColorsUtil.shadowColor1.withOpacity(0.41),
                                  ),
                                  BoxShadow(
                                    offset: const Offset(-6,-6),
                                    blurRadius: 20,
                                    spreadRadius: 0,
                                    color: Colors.white.withOpacity(0.41),
                                  ),
                                  BoxShadow(
                                    offset: const Offset(2,2),
                                    blurRadius: 4,
                                    spreadRadius: 0,
                                    color: ColorsUtil.shadowColor2.withOpacity(0.1),
                                  ),
                                ]
                              ),
                              child: Center(
                                child: Text(
                                  'Open List',
                                  style: GoogleFonts.outfit(
                                    fontSize: scale.getScaledFont(12),
                                    fontWeight: FontWeight.w500,
                                    color: ColorsUtil.blueFontColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: scale.getMargin(
                        top: 40,
                        left: 10,
                        right: 10,
                        bottom: 8,
                      ),
                      child: Center(
                        child: Text(
                          'this is a random photo note with nothing specific, but could contain details that end this page',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.outfit(
                            fontSize: scale.getScaledFont(12),
                            fontWeight: FontWeight.w500,
                            color: ColorsUtil.lightColorText.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: scale.getMargin(
                        bottom: 18.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Privacy',
                            style: GoogleFonts.outfit(
                              color: const Color(0xff0666EB),
                              fontSize: scale.getScaledFont(14),
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          Text(
                            'Terms',
                            style: GoogleFonts.outfit(
                              color: const Color(0xff0666EB),
                              fontSize: scale.getScaledFont(14),
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
