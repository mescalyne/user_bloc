import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:userlist_app/features/user/data/repositories/interfaces/user_repository.dart';
import 'package:userlist_app/features/user/presentation/logic/user_event.dart';
import 'package:userlist_app/features/user/presentation/logic/user_state.dart';

@Injectable()
class UserPageBloc extends Bloc<UserBlocEvent, UserPageState> {
  UserPageBloc(this.userRepository) : super(LoadingUserPageState()) {
    on<InitUserBlocEvent>(_onInit);
    on<FetchUsersEvent>(_onFetchUsers);

    add(FetchUsersEvent());
  }

  final UserRepository userRepository;
  static const userPageLimit = 20;

  Future<void> _onInit(
    InitUserBlocEvent event,
    Emitter<UserPageState> emit,
  ) async {
    await fetchUsers(emit);
  }

  Future<void> _onFetchUsers(
    FetchUsersEvent event,
    Emitter<UserPageState> emit,
  ) async {
    await fetchUsers(emit);
  }

  Future<void> fetchUsers(Emitter<UserPageState> emit) async {
    var page = 1;
    if (state is DateUserPageState) {
      final currState = state as DateUserPageState;
      emit(currState.copyWith(isLoading: true));
      page = (currState.data.length ~/ userPageLimit) + 1;
    }

    final userList = await userRepository.getUserList(
      page: page,
      limit: userPageLimit,
    );

    if (userList == null) {
      if (state is DateUserPageState) {
        emit(ErrorUserPageState());
      } else {
        emit((state as DateUserPageState).copyWith(isLoading: false));
      }
    } else {
      if (state is DateUserPageState) {
        emit(
          (state as DateUserPageState).updateList(
            newData: userList,
            isLoading: false,
          ),
        );
      } else {
        emit(DateUserPageState(data: userList, isLoading: false));
      }
    }
  }
}
