import 'package:artech/view/pages/exam_registration/payment_pages/payment_code_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/constants.dart';
import '../../../../core/resources/style/color_manger.dart';
import '../../../../view_model/blocs/app_cubit/cubit.dart';
import '../../../../view_model/blocs/app_cubit/states.dart';
import '../../../components/core/core_components.dart';
import 'credit_page.dart';

class ExamRegistrationCostPage extends StatelessWidget {
  ExamRegistrationCostPage({Key? key}) : super(key: key);
  var paymentMethodController = PageController();
  List<Widget> paymentMethodsPages=[
    PaymentCodePage(),
    CreditPage(),
  ];


  @override
  Widget build(BuildContext context) {
    AppCubit.get(context).togglePaymentMethods(true);

    return Column(
      children: [
        Text(
          'مصاريف الدفع',
          style: TextStyle(
            color: Colors.black.withOpacity(0.8),
            fontFamily: fontFamily,
            fontSize: 24.sp,
            fontWeight: FontWeight.w400,
          ),
        ),

        Text(
          '400',
          style: TextStyle(
            color: Colors.black,
            fontFamily: fontFamily,
            fontSize: 34.sp,
            fontWeight: FontWeight.bold,
          ),
        ),

        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            'طرق الدفع',
            style: TextStyle(
              color: Colors.black.withOpacity(0.7),
              fontFamily: fontFamily,
              fontSize: 22.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),

        BlocConsumer<AppCubit, AppStates>(
          listener: (context, state){},
          builder: (context, state) {
            AppCubit cubit =AppCubit.get(context);

            return Row(
              children: [
                Expanded(
                  child: customButton(
                    textColor: Colors.black,
                    fontSize: 20,
                    elevation: 0.0,
                    color: cubit.isFawry ? AppColors.primaryColor : Colors.white,
                    text: 'فوري',
                    function: (){
                      paymentMethodController.jumpToPage(0);
                      cubit.togglePaymentMethods(true);
                    },
                  ),
                ),
                SizedBox(width: 10.w,),
                Expanded(
                  child: customButton(
                    textColor: Colors.black,
                    fontSize: 20,
                    elevation: 0.0,
                    color: cubit.isFawry ? Colors.white : AppColors.primaryColor,
                    text: 'البطاقة الائتمانية', function: (){
                    paymentMethodController.jumpToPage(1);
                    cubit.togglePaymentMethods(false);
                  },
                  ),
                ),
              ],
            );
          },
        ),

        Expanded(
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: (index){
              if(index==0) {
                AppCubit.get(context).togglePaymentMethods(true);
              }else {
                AppCubit.get(context).togglePaymentMethods(false);
              }
            },
            controller: paymentMethodController,
            itemCount: 2,
            itemBuilder: (context, index)=>paymentMethodsPages[index],
          ),
        ),

      ],
    );
  }

}
