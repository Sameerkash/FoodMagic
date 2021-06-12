import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:foodmagic/widgets/background.dart';
import 'package:image_picker/image_picker.dart';

import '../../providers/providers.dart';
import '../../utils/extensions.dart';

class ProfileView extends StatefulHookWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final GlobalKey<FormState> _fbKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final profile = useProvider(profileProvider);
    final profileNotifier = useProvider(profileProvider.notifier);

    Map<String, dynamic> form = {};

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
            icon: Icon(Icons.logout).padR(15.0),
            onPressed: () {
              context.read(authProvider.notifier).logout();
            },
          )
        ],
      ),
      body: SafeArea(
        child: CustomBackground(
          child: profile.map(
              loading: (_) => Center(child: LinearProgressIndicator()),
              data: (data) {
                form = data.user.toJson();
                return Form(
                  key: _fbKey,
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
                            InkWell(
                              onTap: () async {
                                final picker = ImagePicker();
                                final pickedFile = await picker.getImage(
                                    source: ImageSource.gallery);
                                if (pickedFile != null)
                                  profileNotifier.updateImage(pickedFile.path);
                              },
                              child: data.user.imageUrl != null && data.user.imageUrl!.isNotEmpty
                                  ? CachedNetworkImage(
                                      imageUrl: data.user.imageUrl!,
                                      progressIndicatorBuilder: (_, ___, __) =>
                                          CircularProgressIndicator(),
                                      imageBuilder: (_, img) => CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          radius: 0.17.sw,
                                          backgroundImage: img),
                                    )
                                  : CircleAvatar(
                                      backgroundColor: Colors.amber,
                                      radius: 0.17.sw,
                                      child: Icon(Icons.image,
                                          color: Colors.black),
                                    ),
                            ),
                            SizedBox(height: 0.02.sh),
                            VerifiedChip(),
                            TextFormField(
                              initialValue: data.user.name,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
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
                        "Personal Information",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ).padSym(0.02.sh, 0.01.sh),
                      CustomTextFeild2(
                        initialValue: data.user.email,
                        label: "Email",
                        readOnly: true,
                        onSaved: (e) {},
                        maxLines: 2,
                      ),
                      CustomTextFeild2(
                        initialValue: data.user.phone ?? "",
                        label: "Phone",
                        onSaved: (phone) {
                          form['phone'] = phone;
                        },
                        maxLines: 1,
                      ),
                      CustomTextFeild2(
                        initialValue: data.user.bio ?? "",
                        label: "Bio",
                        onSaved: (b) {
                          form['bio'] = b;
                        },
                        maxLines: 2,
                      ),
                      CustomTextFeild2(
                        initialValue: data.user.address ?? "",
                        label: "Address",
                        onSaved: (add) {
                          form['address'] = add;
                        },
                        maxLines: 2,
                      ),
                    ],
                  ).padAll(15),
                );
              },
              error: (_) => Text("Error")),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          _fbKey.currentState!.save();
          profileNotifier.updateProfile(form);
        },
        child: Icon(Icons.check),
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
  final void Function(String?) onSaved;
  final bool readOnly;
  const CustomTextFeild2({
    Key? key,
    required this.label,
    required this.initialValue,
    this.maxLines = 1,
    this.readOnly = false,
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
          style: GoogleFonts.openSans(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
          initialValue: initialValue,
          maxLines: maxLines,
          readOnly: readOnly,
          onSaved: onSaved,
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
