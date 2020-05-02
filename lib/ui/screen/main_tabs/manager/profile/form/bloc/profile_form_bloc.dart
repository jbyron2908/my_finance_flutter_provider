import 'package:flutter/material.dart';
import 'package:my_finance_flutter/core/model/profile/profile_model.dart';
import 'package:my_finance_flutter/core/provider/repository/profile/profile_repository.dart';
import 'package:my_finance_flutter/ui/common/base/bloc/base_bloc.dart';
import 'package:my_finance_flutter/ui/screen/main/widget/router/main_tab_router.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider/src/provider.dart';

class ProfileFormBloc extends BaseBloc {
  static ProfileFormBloc of(BuildContext context) =>
      Provider.of<ProfileFormBloc>(context, listen: false);

  ProfileFormBloc(BuildContext context, {ProfileRepository profileRepository}) {
    _context = context;
    _profileRepository = profileRepository;
  }

  BuildContext _context;
  ProfileRepository _profileRepository;

  @override
  List<SingleChildWidget> get dependencies => [];

  Future<void> saveProfile(ProfileModel profile) async {
    await _profileRepository.save(profile);
    MainTabRouter.of(_context).pop();
  }
}
