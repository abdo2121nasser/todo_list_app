part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class GetUserDataLoadingState extends ProfileState {}
class GetUserDataSuccessState extends ProfileState {}
class GetUserDataErrorState extends ProfileState {}
