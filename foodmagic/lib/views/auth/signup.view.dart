import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../widgets/background.dart';
import '../../widgets/button.dart';
import '../../widgets/field.dart';
import '../../utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        children: [
          SizedBox(
            height: 0.12.sh,
          ),
          Text(
            "Hi!",
            style: context.headline1.copyWith(fontSize: 40),
          ),
          SizedBox(
            height: 0.05.sh,
          ),
          Text(
            "We'll need some basic details,",
            style: context.headline3.copyWith(fontSize: 19),
          ).padB(10),
          Text(
            "please fill them up below",
            style: context.headline3.copyWith(fontSize: 18),
          ),
          Container(),
          SizedBox(height: 0.1.sh),
          CustomTextField(
              label: "Your Email",
              icon: Icon(MaterialCommunityIcons.email,
                  color: context.primaryColor)),
          SizedBox(height: 0.04.sh),
          CustomTextField(
              label: "Your Name",
              icon: Icon(MaterialCommunityIcons.face_profile,
                  color: context.primaryColor)),
          SizedBox(height: 0.04.sh),
          CustomTextField(
            obscureText: true,
            label: "Your Password",
            icon: Icon(MaterialCommunityIcons.eye, color: context.primaryColor),
          ),
          SizedBox(height: 0.08.sh),
          CustomTextButton(
            onPressed: () {},
            text: "SIGN UP",
            paddingH: 0.35.sw,
          ),
          SizedBox(height: 0.04.sh),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: "Already have an account? ",
                    style: context.bodyText1),
                TextSpan(
                  text: "Sign In",
                  style: context.bodyText1.copyWith(color: Colors.amber),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
