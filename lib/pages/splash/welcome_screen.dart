import 'package:blood_donation_mobile/component/widget_text.dart';
import 'package:blood_donation_mobile/route/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _controller = PageController();

  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        isLastPage = _controller.page == 2;
      });
    });
    _checkFirstRun();
  }

  Future<void> _checkFirstRun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstRun = prefs.getBool('isFirstRun') ?? true;

    if (!isFirstRun) {
      Get.offAllNamed(AppRoute.authPage); // Navigate to home if not first run
    } else {
      prefs.setBool('isFirstRun', false); // Set isFirstRun to false
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            // Page View
            PageView(
              controller: _controller,
              children: [
                _buildPage(
                  title: "Empower Generosity",
                  description:
                      "Effortlessly organize your tasks and projects with our intuitive app, designed to boost productivity.",
                  image: "asset/image/superhero.png",
                ),
                _buildPage(
                  title: "Connect & Give",
                  description:
                      "Effortlessly organize your tasks and projects with our intuitive app, designed to boost productivity.",
                  image: "asset/image/Blood.png",
                ),
                _buildPage(
                  title: "Impact Today",
                  description:
                      "Effortlessly organize your tasks and projects with our intuitive app, designed to boost productivity.",
                  image: "asset/image/Blood.png",
                  background: "asset/image/blood_fade.png",
                ),
              ],
            ),
            // Top Navigation
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      effect: WormEffect(
                        dotColor: Theme.of(context).dividerColor,
                        activeDotColor: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        if (isLastPage) {
                          Get.offAllNamed(AppRoute.lan); // Navigate to home
                        } else {}
                      },
                      child: BigText(
                        text: isLastPage ? "Get Started" : "Skip",
                        color: Theme.of(context).textTheme.titleLarge?.color,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage({
    required String title,
    required String description,
    required String image,
    String? background,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 60, 0, 24),
      child: Stack(children: [
        if (background != null)
          // Background image with fade effect
          Positioned(
            bottom: 55,
            right: 0,
            child: Opacity(
              opacity: 0.3, // Adjust the opacity for fade effect
              child: SizedBox(
                height: 620,
                width: 300,
                child: Image.asset(
                  background,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 60),
            // Image centered
            Center(
              child: Image.asset(
                image,
              ),
            ),
            const SizedBox(height: 60),
            // Title
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(
                  text: title,
                  size: 28,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.titleLarge?.color,
                ),
                const SizedBox(height: 20),
                // Description
                SmallText(
                  text: description,
                  size: 18,
                ),
              ],
            )
          ],
        ),
      ]),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// import 'package:blood_donation_mobile/component/widget_text.dart';
// import 'package:blood_donation_mobile/route/route.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class WelcomeScreen extends StatefulWidget {
//   const WelcomeScreen({super.key});

//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<WelcomeScreen> {
//   final PageController _controller = PageController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // Page View
//             PageView(
//               controller: _controller,
//               children: [
//                 _buildPage(
//                   title: "Empower Generosity",
//                   description:
//                       "Effortlessly organize your tasks and projects with our intuitive app, designed to boost productivity.",
//                   image: "asset/image/superhero.png",
//                 ),
//                 _buildPage(
//                   title: "Connect & Give",
//                   description:
//                       "Effortlessly organize your tasks and projects with our intuitive app, designed to boost productivity.",
//                   image: "asset/image/connect.png",
//                 ),
//                 _buildPage(
//                   title: "Save Lives",
//                   description:
//                       "Effortlessly organize your tasks and projects with our intuitive app, designed to boost productivity.",
//                   image: "asset/image/save_lives.png",
//                 ),
//               ],
//             ),
//             // Page Indicator
//             Positioned(
//               bottom: 20,
//               left: 0,
//               right: 0,
//               child: Column(
//                 children: [
//                   SmoothPageIndicator(
//                     controller: _controller,
//                     count: 3,
//                     effect: WormEffect(
//                       dotColor: Theme.of(context).dividerColor,
//                       activeDotColor: Theme.of(context).colorScheme.primary,
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       Get.offNamed(AppRoute.authPage);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       foregroundColor: Theme.of(context).colorScheme.onPrimary,
//                       backgroundColor: Theme.of(context).colorScheme.primary,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 40, vertical: 14),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(14),
//                       ),
//                     ),
//                     child: BigText(
//                       text: "Get Started",
//                       color: Theme.of(context).colorScheme.onPrimary,
//                       size: 20,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPage({
//     required String title,
//     required String description,
//     required String image,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(image, height: 300),
//           const SizedBox(height: 40),
//           BigText(
//             text: title,
//             size: 24,
//             color: Theme.of(context).textTheme.titleLarge?.color,
//             fontWeight: FontWeight.bold,
//           ),
//           const SizedBox(height: 20),
//           SmallText(
//             text: description,
//             size: 16,
//             color: Theme.of(context).textTheme.titleLarge?.color,
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }
// }
