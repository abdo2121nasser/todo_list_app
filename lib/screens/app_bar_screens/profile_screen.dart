import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_app/cubits/profile_cubit/profile_cubit.dart';
import 'package:todo_list_app/recourses/manager_files/color_manager.dart';
import 'package:todo_list_app/recourses/manager_files/font_manager.dart';
import 'package:todo_list_app/recourses/manager_files/style_manager.dart';
import '../../recourses/blocks/general_blocks/general_app_bar_block.dart';
import '../../recourses/blocks/profile_screen_blocks/personal_information_list_block.dart';
import '../../recourses/manager_files/string_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..getUserData(),
      child: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {},
        builder: (context, state) {
          var profCubit = ProfileCubit.get(context);
          return Scaffold(
              appBar: GeneralAppBarBlock(
                title: StringManager.ui.kProfile,
              ),
              body: state is GetUserDataLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: kIndigoColor,
                      ),
                    )
                  : profCubit.profileModel != null
                      ? PersonalInformationListBlock(
                          subTitles: [
                            profCubit.profileModel!.displayName,
                            profCubit.profileModel!.username,
                            profCubit.profileModel!.level,
                            '${profCubit.profileModel!.experienceYears} Years',
                            profCubit.profileModel!.address,
                          ],
                        )
                      : Center(
                          child: Text(
                            'ReTry Again later',
                            style: getMediumStyle(
                                fontSize: FontSize.s14, color: kBlackColor),
                          ),
                        ));
        },
      ),
    );
  }
}
