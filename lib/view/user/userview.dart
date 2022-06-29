import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:freshbucket/bloc/user/user_bloc.dart';
import 'package:freshbucket/model/user/user.dart';
import 'package:freshbucket/view/utils/common/cardwidget.dart';
import 'package:freshbucket/view/utils/common/scaffoldwidget.dart';
import 'package:freshbucket/view/utils/common/textwidget.dart';
import 'package:freshbucket/view/utils/common/topbarwidget.dart';
import 'package:freshbucket/view/utils/constant.dart';

class UserView extends StatelessWidget {
  User? user;

  @override
  Widget build(BuildContext context) {
    heightSize = MediaQuery.of(context).size.height;
    widthSize = MediaQuery.of(context).size.width;

    shortestSide = MediaQuery.of(context).size.shortestSide;
    isMobile = shortestSide < 600.0;
    orientation = MediaQuery.of(context).orientation;

    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserLoading) {
          SmartDialog.showLoading();
        } else {
          SmartDialog.dismiss();
        }
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is GetUserSuccess) {
            user = state.user;
            return ScaffoldWidget(
              topBarWidget: TopBarWidget(
                theme: primaryColor,
                title: 'Profile',
              ),
              body: body(context, orientation, user!),
              currentIndex: 2,
            );
          }

          return Scaffold();
        },
      ),
    );
  }

  body(context, Orientation orientation, User user) {
    ///Responsive layout
    responsiveLayout(orientation);

    var data = user.results![0];

    return Container(
      height: profilHeight,
      width: profilWidth,
      child: Column(
        children: [
          Container(
            height: imgHeight,
            width: imgWidth,
            margin: EdgeInsets.only(top: imgHeight * 0.40),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.network('${data.picture!.large}').image,
                fit: BoxFit.contain,
              ),
              shape: BoxShape.circle,
            ),
          ),
          Container(
            height: nameHeight,
            width: nameWidth,
            child: TextWidget(
              txtHeight: txtHeight,
              scale: 0.60,
              mainAxis: MainAxisAlignment.center,
              fontWeight: FontWeight.normal,
              label: '${data.name!.first} ${data.name!.last}',
            ),
          ),
          Container(
            child: Column(
              children: [
                CardWidget(
                  mainAxisSize: MainAxisSize.min,
                  icons: Icons.chrome_reader_mode_rounded,
                  iconSize: 30,
                  title: '${data.id!.name}',
                ),
                CardWidget(
                  mainAxisSize: MainAxisSize.min,
                  icons: Icons.email,
                  iconSize: 30,
                  title: '${data.email}',
                ),
                CardWidget(
                  mainAxisSize: MainAxisSize.min,
                  icons: Icons.call,
                  iconSize: 30,
                  title: '${data.phone}',
                ),
                CardWidget(
                  mainAxisSize: MainAxisSize.min,
                  icons: Icons.pin_drop,
                  iconSize: 30,
                  title: '${data.location!.street!.name}',
                  subtitle: Text(
                      '${data.location!.city} -  ${data.location!.country}'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
