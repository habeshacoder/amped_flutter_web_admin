part of 'channelmaterial_bloc.dart';

sealed class ChannelMaterialsState {}

final class ChannelMaterialInitial extends ChannelMaterialsState {}

final class ChannelMaterialLoading extends ChannelMaterialsState {}

final class ChannelMaterialFailureState extends ChannelMaterialsState {
  final String error;
  ChannelMaterialFailureState(this.error);
}

final class ChannelMaterialDeleteSuccessState extends ChannelMaterialsState {
  final String message;

  ChannelMaterialDeleteSuccessState({required this.message});
}

final class ChannelMaterialsDisplaySuccessState extends ChannelMaterialsState {
  final List<ChannelMaterial> ChannelMaterials;

  ChannelMaterialsDisplaySuccessState(this.ChannelMaterials);
}

final class SearchChannelMaterialSuccessState extends ChannelMaterialsState {
  final List<ChannelMaterial> ChannelMaterials;

  SearchChannelMaterialSuccessState({required this.ChannelMaterials});
}
