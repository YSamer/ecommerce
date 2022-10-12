import 'package:ecommerce_1/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.hintText,
    required this.onPressedSearch,
    required this.onPressedIcon,
  }) : super(key: key);

  final String hintText;
  final void Function()? onPressedSearch, onPressedIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: SizedBox(
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: AppColors.seconderyColor,
                    ),
                    onPressed: onPressedSearch,
                    splashColor: const Color(0x00FFFFFF),
                    highlightColor: const Color(0x00FFFFFF),
                  ),
                  hintText: hintText,
                  hintStyle: const TextStyle(fontSize: 18),
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: AppColors.thirdColor.withOpacity(0.05),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              decoration: BoxDecoration(
                color: AppColors.thirdColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 7),
              width: 50,
              child: IconButton(
                onPressed: onPressedIcon,
                icon: const Icon(
                  Icons.notifications_active_outlined,
                  size: 25,
                  color: AppColors.thirdColor,
                ),
                splashColor: const Color(0x00FFFFFF),
                highlightColor: const Color(0x00FFFFFF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
