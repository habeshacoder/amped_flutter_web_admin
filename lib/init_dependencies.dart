import 'package:amped_media_admin/config/router.dart';
import 'package:get_it/get_it.dart';

import 'features/channel/data/datasources/channel_remote_datasource.dart';
import 'features/channel/data/repositories/channel_repository_impl.dart';
import 'features/channel/domain/repositories/channel_repositor.dart';
import 'features/channel/domain/usecases/delete_channel.dart';
import 'features/channel/domain/usecases/get_all_channels.dart';
import 'features/channel/domain/usecases/search_channel.dart';
import 'features/channel/presentation/bloc/allchannels_bloc.dart';
import 'features/material/data/datasources/material_remote_data_source.dart';
import 'features/material/data/repositories/material_repository_impl.dart';
import 'features/material/domain/repositories/material_repositories.dart';
import 'features/material/domain/usecases/delete_material.dart';
import 'features/material/domain/usecases/get_all_materials.dart';
import 'features/material/domain/usecases/search_material.dart';
import 'features/material/presentation/bloc/material_bloc.dart';

part 'init_dependencies_injection.dart';
