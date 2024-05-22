part of 'sellerprofile_bloc.dart';

sealed class SellerProfileEvent {}

final class SellerProfilesDeleteEvent extends SellerProfileEvent {
  final String SellerProfileId;
  SellerProfilesDeleteEvent({required this.SellerProfileId});
}

final class GetAllSellerProfilesEvent extends SellerProfileEvent {}

final class DeleteSellerProfilesEvent extends SellerProfileEvent {
  final int SellerProfileId;

  DeleteSellerProfilesEvent({required this.SellerProfileId});
}

final class SearchSellerProfileEvent extends SellerProfileEvent {
  final String? key;
  final String? time_from;
  final String? time_to;

  SearchSellerProfileEvent({
    required this.key,
    required this.time_from,
    required this.time_to,
  });
}
