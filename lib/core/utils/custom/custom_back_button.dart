// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomBackButton extends StatelessWidget {
//   final VoidCallback? onPressed;
//   final Color iconColor;
//   final double iconSize;
//   final EdgeInsets padding;
//   final IconData icon;

//   const CustomBackButton({
//     Key? key,
//     this.onPressed,
//     this.iconColor = Colors.white,
//     this.iconSize = 20,
//     this.icon = Icons.arrow_back_ios,
//     this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//       child: Row(
//         children: [
//           // Back Button
//           IconButton(
//             icon: const Icon(
//               Icons.arrow_back_ios,
//               color: Colors.white,
//               size: 20,
//             ),
//             onPressed: controller.onBackPressed,
//           ),
//         ],
//       ),
//     );
//   }
// }
