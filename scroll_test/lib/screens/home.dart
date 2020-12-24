import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_test/controller.dart';

class HomeScreen extends StatelessWidget {
  BaseController baseController = Get.put(BaseController());
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Obx(() => Positioned(
                  top: baseController.offset.value * 0.01,
                  child: Container(
                    height: Get.height,
                    width: Get.width,
                    child: Image.network(
                      'https://images.unsplash.com/photo-1534796636912-3b95b3ab5986?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80',
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
            PageView(
              physics: ClampingScrollPhysics(),
              controller: baseController.pageController,
              children: [SPage(), HPage()],
            ),
          ],
        ),
      ),
    );
  }

  Widget SPage() {
    return Container(
        child: Stack(
      alignment: Alignment.center,
      children: [
        Obx(() => Transform(
              transform: Matrix4.translationValues(
                  baseController.offset.value * 1.6,
                  -baseController.offset.value,
                  0),
              child: Transform.rotate(
                angle: baseController.offset.value * 0.01,
                child: Container(
                  height: Get.height * 0.3,
                  width: Get.height * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/earth.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 22, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      "Name : Earth",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Area : 450 sq ft.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Details : Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget HPage() {
    return Container(
        child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Obx(() => Transform(
              transform: Matrix4.translationValues(
                  0, -baseController.offset.value * 0.6, 0),
              child: Transform.rotate(
                angle: baseController.offset.value * 0.01,
                child: Container(
                  height: Get.height * 0.3,
                  width: Get.height * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/moon.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 22, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Obx(() => Opacity(
                          opacity: baseController.offset.value * 0.002,
                          child: Text(
                            "Name : Moon",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Obx(() => Opacity(
                      opacity: baseController.offset.value * 0.002,
                      child: Text(
                        "Area : 480 sq ft.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    )),
                SizedBox(
                  height: 5,
                ),
                Obx(() => Opacity(
                      opacity: baseController.offset.value * 0.002,
                      child: Text(
                        "Details : Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
