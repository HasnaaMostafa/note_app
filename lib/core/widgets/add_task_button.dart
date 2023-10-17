import 'package:flutter/material.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton(
      {super.key,
      required this.buttonName,
      required this.backgroundColor,
      required this.onTap,
      this.isLoading = false});

  final String buttonName;
  final Color backgroundColor;
  final VoidCallback onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 100,
              height: 50,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                  child: isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          buttonName,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                        )),
            ),
          )
        ],
      ),
    );
  }
}
