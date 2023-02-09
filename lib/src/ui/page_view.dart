import 'package:flutter/material.dart';
import 'package:zetgram/src/dialog/bottom_dialog.dart';
import '../model/view_page_model.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  final controller = PageController(initialPage: 0);
  int selectedIndex = 0;

  List<ViewPageModel> data = [
    ViewPageModel(
      image: "assets/images/pageView1.png",
      name: "We Connect People",
      text:
          "Connecting people trough one platform to\n share the memories together.",
    ),
    ViewPageModel(
      image: "assets/images/pageView2.png",
      name: "Sharing Happiness",
      text: "Sharing happiness by sharing your memories\n in Zel platform.",
    ),
    ViewPageModel(
      image: "assets/images/pageView3.png",
      name: "Last Long Memories",
      text: "You can store memories of your photos in\n Zel app without limit.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            controller: controller,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    data[index].image,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fitWidth,
                  ),
                  const SizedBox(height: 28),
                  Center(
                    child: Text(
                      data[index].name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        height: 1.67,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: Text(
                      data[index].text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        height: 1.67,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 36,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 12,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return AnimatedContainer(
                          height: 12,
                          margin: const EdgeInsets.only(right: 16),
                          width: selectedIndex == index ? 28 : 12,
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? Colors.blue
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          duration: const Duration(milliseconds: 1000),
                        );
                      },
                      itemCount: data.length,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedIndex == data.length - 1) {
                      BottomDialog.showViewText(context);
                      setState(() {});
                    }
                    if (selectedIndex != data.length - 1) {
                      selectedIndex = selectedIndex + 1;
                      controller.nextPage(
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                      );
                    }
                    setState(() {});
                  },
                  child: Container(
                    height: 56,
                    width: 148,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(26),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Center(
                      child: Text(
                        selectedIndex == data.length - 1
                            ? "Get Started"
                            : "Next",
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
