// import 'package:flutter/material.dart';

// import '../v_color.dart';
// import 'v_widgets.dart';

// class CustomAppBarItem {
//   CustomAppBarItem({this.imgPath, this.text, this.textIndicator, this.isShowIndicator = false});
//   String? text, imgPath, textIndicator;
//   bool? isShowIndicator;
// }

// class CustomAppBar extends StatefulWidget {
//   const CustomAppBar({
//     super.key,
//     this.items,
//     this.height = 60.0,
//     this.iconSize = 24.0,
//     this.backgroundColor,
//     this.color,
//     this.selectedColor,
//     this.notchedShape,
//     this.onTabSelected,
//   });
//   final List<CustomAppBarItem>? items;
//   final double? height;
//   final double? iconSize;
//   final Color? backgroundColor;
//   final Color? color;
//   final Color? selectedColor;
//   final NotchedShape? notchedShape;
//   final ValueChanged<int>? onTabSelected;

//   @override
//   State<StatefulWidget> createState() => CustomAppBarState();
// }

// class CustomAppBarState extends State<CustomAppBar> {
//   int _selectedIndex = 0;

//   _updateIndex(int index) {
//     widget.onTabSelected!(index);
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> items = List.generate(widget.items!.length, (int index) {
//       return _buildTabItem(
//         item: widget.items![index],
//         index: index,
//         onPressed: _updateIndex,
//       );
//     });

//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: items,
//     );
//   }

//   Widget _buildTabItem({
//     CustomAppBarItem? item,
//     int? index,
//     ValueChanged<int>? onPressed,
//   }) {
//     Color? color = _selectedIndex == index ? widget.selectedColor : widget.color;
//     return Expanded(
//         child: Center(
//       child: SizedBox(
//         // height: widget.height,
//         child: InkWell(
//           onTap: () => onPressed!(index!),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               item!.isShowIndicator!
//                   ? Badge(
//                       position: BadgePosition.topEnd(top: -10, end: -10),
//                       shape: BadgeShape.square,
//                       badgeColor: widget.selectedColor!,
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 8,
//                         vertical: 5,
//                       ),
//                       borderRadius: BorderRadius.circular(getProportionateScreenWidth(radiusSmall)),
//                       animationDuration: const Duration(milliseconds: 300),
//                       animationType: BadgeAnimationType.scale,
//                       badgeContent: VText(
//                         item.textIndicator,
//                         color: VColor.white,
//                         isBold: true,
//                         fontSize: getProportionateScreenWidth(textSizeSuperSmall),
//                       ),
//                       child: Container(
//                         padding: const EdgeInsets.only(
//                           top: 10,
//                           right: 10,
//                           left: 10,
//                         ),
//                         child: VSvgPicture(imagePath + item.imgPath!, height: 25, width: 25, color: color),
//                       ),
//                     )
//                   : Container(
//                       padding: const EdgeInsets.only(
//                         top: 10,
//                         right: 10,
//                         left: 10,
//                       ),
//                       child: VSvgPicture(imagePath + item.imgPath!, height: 25, width: 25, color: color),
//                     ),
//               // Visibility(
//               //   visible: item.isShowIndicator!,
//               //   child: Container(
//               //     padding: EdgeInsets.all(getProportionateScreenWidth(2)),
//               //     decoration: BoxDecoration(
//               //         color: widget.selectedColor,
//               //         borderRadius: BorderRadius.circular(radiusSmall)),
//               //     child: VText(
//               //       item.textIndicator,
//               //       color: VColor.white,
//               //       fontSize: getProportionateScreenWidth(textSizeSmall),
//               //       isBold: true,
//               //       align: TextAlign.center,
//               //       maxLines: 1,
//               //     ),
//               //   ),
//               // ),
//               Flexible(
//                 child: VText(
//                   item.text!,
//                   color: color,
//                   fontSize: getProportionateScreenWidth(textSizeSmall),
//                   isBold: false,
//                   align: TextAlign.center,
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ));
//   }
// }
