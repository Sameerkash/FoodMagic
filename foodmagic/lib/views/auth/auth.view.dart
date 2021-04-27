import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodmagic/widgets/background.dart';
import 'package:foodmagic/widgets/button.dart';
import '../../utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 0.1.sh,
                ),
                Text(
                  "FoodMagic",
                  style: context.headline1.copyWith(fontSize: 40),
                ),
                SizedBox(
                  height: 0.05.sh,
                ),
                Text(
                  "Welcome,",
                  style: context.headline3.copyWith(fontSize: 25),
                ).padB(10),
                Text(
                  "Sign In to continue",
                  style: context.headline3.copyWith(fontSize: 18),
                ),
                Container(),
                SizedBox(height: 0.1.sh),
                // const Spacer(flex: 1),
                TextField(
                    decoration: InputDecoration(
                  suffixIcon: (Icon(Icons.email, color: Colors.grey)),
                  labelText: "Your Email",
                  labelStyle: context.headline1,
                )),

                SizedBox(height: 0.05.sh),
                TextField(
                  decoration: InputDecoration(
                      focusColor: Colors.black,
                      suffixIcon: (Icon(Icons.password)),
                      labelText: "Your Password",
                      labelStyle: context.headline1),
                ),
                SizedBox(height: 0.08.sh),
                CustomTextButton(
                  onPressed: () {},
                  text: "SIGN IN",
                  paddingH: 0.35.sw,
                ),
                SizedBox(height: 0.04.sh),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Don't have an account? ",
                          style: context.bodyText1),
                      TextSpan(
                        text: "Sign Up",
                        style: context.bodyText1.copyWith(color: Colors.amber),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                )
              ],
            ).padSym(5, 20),
          ),
        ),
      ),
    );
  }
}
