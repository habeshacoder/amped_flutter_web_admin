part of 'sellerprofile_bloc.dart';

sealed class SellerProfileState {}

final class SellerProfileInitial extends SellerProfileState {}

final class SellerProfileLoading extends SellerProfileState {}

final class SellerProfileFailureState extends SellerProfileState {
  final String error;
  SellerProfileFailureState(this.error);
}

final class SellerProfileDeleteSuccessState extends SellerProfileState {
  final String message;

  SellerProfileDeleteSuccessState({required this.message});
}

final class SellerProfilesDisplaySuccessState extends SellerProfileState {
  final List<SellerProfile> Sellerprofiles;

  SellerProfilesDisplaySuccessState(this.Sellerprofiles);
}

final class SearchSellerProfileSuccessState extends SellerProfileState {
  final List<SellerProfile> Sellerprofiles;

  SearchSellerProfileSuccessState({required this.Sellerprofiles});
}
