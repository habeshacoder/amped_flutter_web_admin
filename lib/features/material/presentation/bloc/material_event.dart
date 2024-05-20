part of 'material_bloc.dart';

sealed class MaterialEvent {}

final class MaterialsDeleteEvent extends MaterialEvent {
  final int MaterialId;
  MaterialsDeleteEvent({required this.MaterialId});
}

final class GetAllMaterialsEvent extends MaterialEvent {}

final class DeleteMaterialsEvent extends MaterialEvent {
  final int MaterialId;

  DeleteMaterialsEvent({required this.MaterialId});
}

final class SearchMaterialEvent extends MaterialEvent {
  final String? key;
  final String? time_from;
  final String? time_to;

  SearchMaterialEvent({
    required this.key,
    required this.time_from,
    required this.time_to,
  });
}
