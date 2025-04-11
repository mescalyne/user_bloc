import 'package:userlist_app/features/user/domain/entities/user.dart';

sealed class UserPageState {}

class DateUserPageState extends UserPageState {
  DateUserPageState({required this.data, required this.isLoading});
  final List<User> data;
  final bool isLoading;

  DateUserPageState copyWith({List<User>? data, bool? isLoading}) {
    return DateUserPageState(
      data: data ?? this.data,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  DateUserPageState updateList({required List<User> newData, bool? isLoading}) {
    return DateUserPageState(
      data: [...data, ...newData],
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class LoadingUserPageState extends UserPageState {}

class ErrorUserPageState extends UserPageState {}
