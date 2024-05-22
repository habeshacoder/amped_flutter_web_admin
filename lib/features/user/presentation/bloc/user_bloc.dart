// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amped_media_admin/features/user/domain/usecases/delete_user.dart';
import 'package:amped_media_admin/features/user/domain/usecases/get_all_user.dart';
import 'package:amped_media_admin/features/user/domain/usecases/search_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amped_media_admin/core/usecases/usecase.dart';
import '../../domain/entities/user.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetAllUsers _getAllUsers;
  final DeleteUser _deleteUser;
  final SearchUser _searchUser;

  UserBloc(
      {required GetAllUsers getAllUsers,
      required DeleteUser deleteUser,
      required SearchUser searchUser})
      : _getAllUsers = getAllUsers,
        _deleteUser = deleteUser,
        _searchUser = searchUser,
        super(UserInitial()) {
    on<UserEvent>((event, emit) => emit(UserLoading()));
    on<GetAllUsersEvent>(_onUserFetchEvent);
    on<DeleteUsersEvent>(_onDeleteUserEvent);
    on<SearchUserEvent>(_onSearchUserEvent);
  }

  void _onUserFetchEvent(
    GetAllUsersEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _getAllUsers.call(NoParams());
    print('res:-----------------------------$res');
    res.fold(
      (failure) => emit(UserFailureState(failure.message)),
      (success) => emit(UsersDisplaySuccessState(success)),
    );
  }

  void _onDeleteUserEvent(
    DeleteUsersEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _deleteUser.call(DeleteUserParams(UserId: event.UserId));
    print('res:-----------------------------$res');
    res.fold(
      (failure) => emit(UserFailureState(failure.message)),
      (success) => emit(UserDeleteSuccessState(message: success)),
    );
  }

  void _onSearchUserEvent(
    SearchUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _searchUser.call(SearchUserParam(
      key: event.key,
      time_from: event.time_from,
      time_to: event.time_to,
    ));
    print('resfrom bloc------------$res');
    res.fold(
      (failure) => emit(UserFailureState(failure.message)),
      (success) => emit(SearchUserSuccessState(Users: success)),
    );
  }
}
