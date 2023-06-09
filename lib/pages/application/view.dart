import 'package:firebase_chat/common/values/colors.dart';
import 'package:firebase_chat/common/values/shadows.dart';
import 'package:firebase_chat/common/widgets/button.dart';
import 'package:firebase_chat/pages/application/controller.dart';
import 'package:firebase_chat/pages/contact/view.dart';
import 'package:firebase_chat/pages/profile/index.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';

import '../message/view.dart';

class ApplicationPage extends GetView<ApplicationController> {
  const ApplicationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildPageView() {
      return PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: controller.handPageChanged,
        children: const [
          MessagePage(),
          ContactPage(),
          ProfilePage(),
        ],
      );
    }
    Widget _buildBottomNavigationBar() {
      return Obx(
              () => BottomNavigationBar(
                items: controller.bottomTabs,
                currentIndex: controller.state.page,
                type: BottomNavigationBarType.fixed,
                onTap: controller.handleNavBarTap,
                showUnselectedLabels: true,
                showSelectedLabels: true,
                unselectedItemColor: AppColors.tabBarElement,
                selectedItemColor: AppColors.thirdElementText,
              )
      );
    }

    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
