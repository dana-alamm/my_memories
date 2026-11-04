import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_memories/core/theme/app_colors.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height: 80,
    width: double.infinity,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap:(){},
            child: Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color:AppColors.primaryColor,
                shape: BoxShape.circle,
                border: Border.all(
                    color: AppColors.primaryColor.withOpacity(0.2), 
                    width: 8,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ]
              ),
              child:const Icon(
                Icons.add,
                color:Colors.white,
                size: 32,
              )
            ),
          ),
        ),
        Align(
          alignment: AlignmentGeometry.centerRight,
          child:GestureDetector(
            onTap: (){},
            child:Container(
              width:50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(16), 
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
              ),
              child:const Icon(
                Icons.my_location,
                color:AppColors.primaryColor,
                size:24,
              )
            )
          )
        )
      ],
    ),
    );
  }
}