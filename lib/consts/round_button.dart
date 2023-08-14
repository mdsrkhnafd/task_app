import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;

  const RoundButton({Key? key ,
    required this.title ,
    this.loading = false ,
    required this.onPress ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 7.h,
        width: 100.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.blue
        ),
        child: Center(
            child: loading ? const CircularProgressIndicator(strokeWidth: 3 , color: Colors.white,) : Center(child: Text(title , style: const TextStyle(color: Colors.white),),),),
      ),
    );
  }
}
