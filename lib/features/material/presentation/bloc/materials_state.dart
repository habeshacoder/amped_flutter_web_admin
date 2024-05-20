part of 'material_bloc.dart';

sealed class MaterialsState {}

final class MaterialInitial extends MaterialsState {}

final class MaterialLoading extends MaterialsState {}

final class MaterialFailureState extends MaterialsState {
  final String error;
  MaterialFailureState(this.error);
}

final class MaterialDeleteSuccessState extends MaterialsState {
  final String message;

  MaterialDeleteSuccessState({required this.message});
}

final class MaterialsDisplaySuccessState extends MaterialsState {
  final List<Material> Materials;

  MaterialsDisplaySuccessState(this.Materials);
}

final class SearchMaterialSuccessState extends MaterialsState {
  final List<Material> Materials;

  SearchMaterialSuccessState({required this.Materials});
}
