import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomDialog {
  static void showView(BuildContext context) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          // <-- SEE HERE
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (builder) {
          return SizedBox(
            height: 486,
            child: Column(
              children: [
                const SizedBox(height: 14),
                Container(
                  height: 5,
                  width: 114,
                  decoration: BoxDecoration(
                      color: const Color(0xCCD0D0D0),
                      borderRadius: BorderRadius.circular(4)),
                ),
                const SizedBox(height: 50),
                SvgPicture.asset("assets/icons/success.svg"),
                const SizedBox(height: 46),
                const Text(
                  "Delete Success",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "All the messages have successfully deleted,\n start a new chat now!",
                  textAlign: TextAlign.center,
                  style: TextStyle(),
                ),
                const SizedBox(
                  height: 58,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 64,
                  height: 58,
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: const Center(
                    child: Text(
                      "Done",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  static void showViewText(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        builder: (builder) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            height: 350+
                MediaQuery.of(context).viewInsets.bottom,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                Center(
                  child: Container(
                    height: 5,
                    width: 114,
                    decoration: BoxDecoration(
                        color: const Color(0xCCD0D0D0),
                        borderRadius: BorderRadius.circular(4)),
                  ),
                ),
                const SizedBox(height: 30),
                const Text(
                  "Write a Caption",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Enter your caption here ...",
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: (){
                    showProgress(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 48,
                    height: 58,
                    margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom + 50),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: const Center(
                      child: Text(
                        "Upload",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  static void showProgress(BuildContext context){
    showDialog(
        context: context,
        builder: (builder) {
          return  Center(
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 120),
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
        });
  }
}
