
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../utils/extensions.dart';
import '../../widgets/background.dart';
import '../../widgets/button.dart';
import '../../widgets/field.dart';

class SignUpView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController? name = useTextEditingController();
    TextEditingController? password = useTextEditingController();
    TextEditingController? email = useTextEditingController();


    return Scaffold(
      body: CustomBackground(
        children: [
          SizedBox(
            height: 0.12.sh,
          ),
          Text(
            "Hi!",
            style: context.headline1!.copyWith(fontSize: 40),
          ),
          SizedBox(
            height: 0.05.sh,
          ),
          Text(
            "We'll need some basic details,",
            style: context.headline3!.copyWith(fontSize: 19),
          ).padB(10),
          Text(
            "please fill them up below",
            style: context.headline3!.copyWith(fontSize: 18),
          ),
          Container(),
          SizedBox(height: 0.1.sh),
          CustomTextField(
              controller: email,
              label: "Your Email",
              icon: Icon(MaterialCommunityIcons.email,
                  color: context.primaryColor)),
          SizedBox(height: 0.04.sh),
          CustomTextField(
              controller: name,
              label: "Your Name",
              icon: Icon(MaterialCommunityIcons.face_profile,
                  color: context.primaryColor)),
          SizedBox(height: 0.04.sh),
          CustomTextField(
            controller: password,
            obscureText: true,
            label: "Your Password",
            icon: Icon(MaterialCommunityIcons.eye, color: context.primaryColor),
          ),
          SizedBox(height: 0.08.sh),
          CustomTextButton(
            onPressed: () {
              if (email.value.text.length > 0 &&
                  name.value.text.length > 0 &&
                  password.value.text.length > 0) {
                // auth.signUp(
                //     email: email.value.text,
                //     name: name.value.text,
                //     password: password.value.text);
              }
            },
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
                  style: context.bodyText1!.copyWith(color: Colors.amber),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {

                    },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
