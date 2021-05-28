import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:auto_route/auto_route.dart';

import '../../providers/auth.provider.dart';
import '../../utils/extensions.dart';
import '../../widgets/background.dart';
import '../../widgets/button.dart';
import '../../widgets/field.dart';

class SignInView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController? email = useTextEditingController();
    TextEditingController? password = useTextEditingController();

    return Scaffold(
      body: CustomBackground(
        children: [
          SizedBox(
            height: 0.12.sh,
          ),
          Text(
            "FoodMagic",
            style: context.headline1!.copyWith(fontSize: 40),
          ),
          SizedBox(
            height: 0.05.sh,
          ),
          Text(
            "Welcome,",
            style: context.headline3!.copyWith(fontSize: 25),
          ).padB(10),
          Text(
            "Sign In to continue",
            style: context.headline3!.copyWith(fontSize: 18),
          ),
          Container(),
          SizedBox(height: 0.1.sh),
          CustomTextField(
            controller: email,
            label: "Your Email",
            icon:
                Icon(MaterialCommunityIcons.email, color: context.primaryColor),
          ),
          SizedBox(height: 0.05.sh),
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
                  password.value.text.length > 0) {
                context.read(authProvider.notifier).signIn(
                    email: email.value.text, password: password.value.text);
              }
            },
            text: "SIGN IN",
            paddingH: 0.35.sw,
          ),
          SizedBox(height: 0.04.sh),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: "Don't have an account? ", style: context.bodyText1),
                TextSpan(
                  text: "Sign Up",
                  style: context.bodyText1!.copyWith(color: Colors.amber),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      context.router.pushNamed('/sign-up-view');
                      // context.beamToNamed('/signup', beamBackOnPop: true);
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
