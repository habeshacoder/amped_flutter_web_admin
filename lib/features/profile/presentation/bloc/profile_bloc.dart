// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amped_media_admin/core/usecases/usecase.dart';
import '../../domain/entities/profile.dart';
import '../../domain/usecases/delete_profile.dart';
import '../../domain/usecases/get_all_profile.dart';
import '../../domain/usecases/search_profile.dart';
part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetAllProfiles _getAllProfiles;
  final DeleteProfile _deleteProfile;
  final SearchProfile _searchProfile;

  ProfileBloc(
      {required GetAllProfiles getAllProfiles,
      required DeleteProfile deleteProfile,
      required SearchProfile searchProfile})
      : _getAllProfiles = getAllProfiles,
        _deleteProfile = deleteProfile,
        _searchProfile = searchProfile,
        super(ProfileInitial()) {
    on<ProfileEvent>((event, emit) => emit(ProfileLoading()));
    on<GetAllProfilesEvent>(_onProfileFetchEvent);
    on<DeleteProfilesEvent>(_onDeleteProfileEvent);
    on<SearchProfileEvent>(_onSearchProfileEvent);
  }

  void _onProfileFetchEvent(
    GetAllProfilesEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _getAllProfiles.call(NoParams());
    print('res:-----------------------------$res');
    res.fold(
      (failure) => emit(ProfileFailureState(failure.message)),
      (success) => emit(ProfilesDisplaySuccessState(success)),
    );
  }

  void _onDeleteProfileEvent(
    DeleteProfilesEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _deleteProfile
        .call(DeleteProfileParams(ProfileId: event.ProfileId));
    print('res:-----------------------------$res');
    res.fold(
      (failure) => emit(ProfileFailureState(failure.message)),
      (success) => emit(ProfileDeleteSuccessState(message: success)),
    );
  }

  void _onSearchProfileEvent(
    SearchProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _searchProfile.call(SearchProfileParam(
      key: event.key,
      time_from: event.time_from,
      time_to: event.time_to,
    ));
    print('resfrom bloc------------$res');
    res.fold(
      (failure) => emit(ProfileFailureState(failure.message)),
      (success) => emit(SearchProfileSuccessState(profiles: success)),
    );
  }
}
