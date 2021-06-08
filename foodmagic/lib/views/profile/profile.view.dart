import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:foodmagic/widgets/background.dart';

import '../../providers/providers.dart';
import '../../utils/extensions.dart';

class ProfileView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final style1 = context.headline1!.copyWith(fontWeight: FontWeight.w500);
    final style2 = context.bodyText1!
        .copyWith(fontWeight: FontWeight.w400, color: Colors.grey);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 16, 36, 51),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "PROFILE",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit).padR(15.0),
            onPressed: () {
              context.read(authProvider.notifier).logout();
            },
          )
        ],
      ),
      body: SafeArea(
        child: CustomBackground(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 0.36.sh,
                  width: 1.sw,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(radius: .18.sw),
                      SizedBox(height: 0.02.sh),
                      VerifiedChip(),
                      TextFormField(
                        initialValue: "Charles James",
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Personal Info",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ).padSym(0.02.sh, 0.01.sh),
                CustomTextFeild2(
                  initialValue: "",
                  label: "Email",
                  onSaved: () {},
                  maxLines: 2,
                ),
                CustomTextFeild2(
                  initialValue: "",
                  label: "Phone",
                  onSaved: () {},
                  maxLines: 2,
                ),
                CustomTextFeild2(
                  initialValue: "",
                  label: "Bio",
                  onSaved: () {},
                  maxLines: 2,
                ),
                CustomTextFeild2(
                  initialValue: "",
                  label: "Adress",
                  onSaved: () {},
                  maxLines: 2,
                ),
              ],
            ).padAll(15),
          ),
        ),
      ),
    );
  }
}

class VerifiedChip extends StatelessWidget {
  const VerifiedChip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [Text('Account Verified').padR(5), Icon(Icons.check)],
      ),
      backgroundColor: Colors.green,
      padding: EdgeInsets.symmetric(horizontal: 10),
    );
  }
}

class NotVerifiedChip extends StatelessWidget {
  const NotVerifiedChip({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Account Not Verified').padR(5),
          Icon(MaterialCommunityIcons.cancel)
        ],
      ),
      backgroundColor: Colors.red,
      padding: EdgeInsets.symmetric(horizontal: 10),
    );
  }
}

class CustomTextFeild2 extends StatelessWidget {
  final String label;
  final String initialValue;
  final int maxLines;
  final void Function() onSaved;
  const CustomTextFeild2({
    Key? key,
    required this.label,
    required this.initialValue,
    this.maxLines = 1,
    required this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        TextFormField(
          initialValue: initialValue,
          maxLines: maxLines,
          decoration: InputDecoration(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      ],
    )).padSym(0.02.sh, 0);
  }
}
