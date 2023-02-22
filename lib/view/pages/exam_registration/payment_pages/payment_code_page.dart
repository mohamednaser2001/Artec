import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/methods/get_width_and _height.dart';
import '../../../../core/resources/constants.dart';
import '../../../components/core/core_components.dart';

class PaymentCodePage extends StatelessWidget {
  const PaymentCodePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: getHeight(212, context),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'كود الدفع',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontFamily: fontFamily,
                fontSize: 22.sp,
                fontWeight: FontWeight.w400,
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SingleCodeNumber(number: '1'),
                SingleCodeNumber(number: '8'),
                SingleCodeNumber(number: '8'),
                SingleCodeNumber(number: '1'),
              ],
            ),

          ],
        ),
      ),
    );
  }
}


class SingleCodeNumber extends StatelessWidget {
  SingleCodeNumber({Key? key, required this.number}) : super(key: key);
  String number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.w),
      child: Column(
        children: [
          Text(
            number,
            style: TextStyle(
              color: Colors.black,
              fontFamily: fontFamily,
              fontSize: 22.sp,
              height: 2,
              fontWeight: FontWeight.bold,
            ),
          ),

          line(width: 20.w, color: Colors.black.withOpacity(0.6)),
        ],
      ),
    );
  }
}