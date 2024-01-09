import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:harvesthub_agro/src/presentation/view/component/custom_text_field.dart';
import 'package:harvesthub_agro/src/presentation/view/component/m_button.dart';
import 'package:harvesthub_agro/src/presentation/view/pages/language/select_language.dart';
import 'package:harvesthub_agro/src/utils/constants/m_colors.dart';
import 'package:harvesthub_agro/src/utils/constants/m_dimensions.dart';
import 'package:harvesthub_agro/src/utils/constants/m_styles.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

  final TextEditingController _mobileController = TextEditingController();
  final FocusNode _mobileFocus = FocusNode();

  final TextEditingController _otpController = TextEditingController();
  final FocusNode _otpFocus = FocusNode();

  int nameMaxLength = 11;
  String text = "";

  bool _isOtp = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.getBackgroundColor(),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: GestureDetector(
        onTap: ()=> FocusScope.of(context).unfocus(),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(MySizes.paddingSizeDefault),
            child: SingleChildScrollView(
              child: Column( crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    child: Container(
                        height: 220,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(MySizes.paddingSizeSmall),
                        margin: const EdgeInsets.fromLTRB(0,0,8,0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: MyColor.getSurfaceColor(),
                          boxShadow: [BoxShadow(
                              color: MyColor.getGreyColor().withOpacity(0.2),
                              blurRadius: 0.1,
                              spreadRadius: 0.2,
                              offset: const Offset(0,1)
                          )],
                        ),
                        child: Column( crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('HarvestHub Agro', style: robotoBold.copyWith(fontSize: 36,color:  MyColor.getPrimaryColor())),
                            const SizedBox(height: MySizes.paddingSizeExtraSmall),
                            Row( crossAxisAlignment: CrossAxisAlignment.center, mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Enriching', style: robotoLight.copyWith(color: MyColor.getPrimaryColor(), fontSize: MySizes.fontSizeLarge),),
                                const SizedBox(width: 8,),
                                Text('Agriculture', style: robotoLight.copyWith(color: MyColor.colorGreen, fontSize: MySizes.fontSizeLarge),),
                              ],
                            ),
                            ],
                        )
                    ),
                  ),

                  const SizedBox(height: MySizes.paddingSizeMiniSmall),

                  CustomTextField(
                    controller: _mobileController,
                    focusNode: _mobileFocus,
                    nextFocus: _otpFocus,
                    hintText: 'Mobile',
                    fillColor: MyColor.colorWhite,
                    backgroundColor: MyColor.colorWhite,
                    inputAction: TextInputAction.next,
                    inputType: TextInputType.number,
                    borderRadius: BorderRadius.circular(50),
                    onChanged: (newVal){
                      setState(() {
                        if(newVal.length <= nameMaxLength){
                          text = newVal;
                        }else{
                          _mobileController.value = TextEditingValue(
                              text: text,
                              selection: TextSelection(
                                  baseOffset: nameMaxLength,
                                  extentOffset: nameMaxLength,
                                  affinity: TextAffinity.downstream,
                                  isDirectional: false
                              ),
                              composing: TextRange(
                                  start: 0, end: nameMaxLength
                              )
                          );
                          _mobileController.text = text;
                        }
                      });
                    },
                  ),

                  const SizedBox(height: MySizes.paddingSizeMiniSmall),

                  CustomTextField(
                    controller: _otpController,
                    focusNode: _otpFocus,
                    hintText: _isOtp ? 'Auto OTP verification' : 'OTP',
                    fillColor: MyColor.colorWhite,
                    inputAction: TextInputAction.done,
                    inputType: TextInputType.number,
                    backgroundColor: MyColor.colorWhite,
                    borderRadius: BorderRadius.circular(50),
                  ),

                  const SizedBox(height: MySizes.paddingSizeMiniSmall),
                  CustomButton(text: _isOtp ? "verify OTP" : 'Send Otp', onTap: (){
                    if(_isOtp){
                      Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (_)=>  LanguageScreen()), (route) => false);
                    }else{
                      setState(() {
                        _isOtp = true;
                      });
                    }
                  },
                    color: _isOtp ? MyColor.getSurfaceColor() : MyColor.getPrimaryColor(),
                    textStyle: robotoRegular.copyWith(color: _isOtp ? MyColor.getPrimaryColor() : MyColor.getSurfaceColor()),

                  ),
                  Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom))

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
