// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:amped_media_admin/core/usecases/usecase.dart';

import '../../domain/entities/sellerprofile.dart';
import '../../domain/usecases/delete_sellerprofile.dart';
import '../../domain/usecases/get_all_sellerprofile.dart';
import '../../domain/usecases/search_sellerprofile.dart';
part 'sellerprofile_event.dart';
part 'sellerprofile_state.dart';

class SellerProfileBloc extends Bloc<SellerProfileEvent, SellerProfileState> {
  final GetAllSellerProfiles _getAllSellerProfiles;
  final DeleteSellerProfile _deleteSellerProfile;
  final SearchSellerProfile _searchSellerProfile;

  SellerProfileBloc(
      {required GetAllSellerProfiles getAllSellerProfiles,
      required DeleteSellerProfile deleteSellerProfile,
      required SearchSellerProfile searchSellerProfile})
      : _getAllSellerProfiles = getAllSellerProfiles,
        _deleteSellerProfile = deleteSellerProfile,
        _searchSellerProfile = searchSellerProfile,
        super(SellerProfileInitial()) {
    on<SellerProfileEvent>((event, emit) => emit(SellerProfileLoading()));
    on<GetAllSellerProfilesEvent>(_onSellerProfileFetchEvent);
    on<DeleteSellerProfilesEvent>(_onDeleteSellerProfileEvent);
    on<SearchSellerProfileEvent>(_onSearchSellerProfileEvent);
  }

  void _onSellerProfileFetchEvent(
    GetAllSellerProfilesEvent event,
    Emitter<SellerProfileState> emit,
  ) async {
    emit(SellerProfileLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _getAllSellerProfiles.call(NoParams());
    print('res:-----------------------------$res');
    res.fold(
      (failure) => emit(SellerProfileFailureState(failure.message)),
      (success) => emit(SellerProfilesDisplaySuccessState(success)),
    );
  }

  void _onDeleteSellerProfileEvent(
    DeleteSellerProfilesEvent event,
    Emitter<SellerProfileState> emit,
  ) async {
    emit(SellerProfileLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _deleteSellerProfile.call(
        DeleteSellerProfileParams(SellerProfileId: event.SellerProfileId));
    print('res:-----------------------------$res');
    res.fold(
      (failure) => emit(SellerProfileFailureState(failure.message)),
      (success) => emit(SellerProfileDeleteSuccessState(message: success)),
    );
  }

  void _onSearchSellerProfileEvent(
    SearchSellerProfileEvent event,
    Emitter<SellerProfileState> emit,
  ) async {
    emit(SellerProfileLoading());
    await Future.delayed(Duration(milliseconds: 500));
    final res = await _searchSellerProfile.call(SearchSellerProfileParam(
      key: event.key,
      time_from: event.time_from,
      time_to: event.time_to,
    ));
    print('resfrom bloc------------$res');
    res.fold(
      (failure) => emit(SellerProfileFailureState(failure.message)),
      (success) =>
          emit(SearchSellerProfileSuccessState(Sellerprofiles: success)),
    );
  }
}
