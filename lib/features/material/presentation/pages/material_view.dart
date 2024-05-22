import 'package:amped_media_admin/core/common/loader.dart';
import 'package:amped_media_admin/core/constants/urls.dart';
import 'package:amped_media_admin/core/utils/showsnakbar.dart';
import 'package:amped_media_admin/features/material/presentation/bloc/material_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialView extends StatefulWidget {
  const MaterialView({super.key});

  @override
  State<MaterialView> createState() => _MaterialViewState();
}

class _MaterialViewState extends State<MaterialView> {
  // late Future<List<dynamic>> materialList;
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  String? token;
  @override
  void didChangeDependencies() {
    context.read<MaterialBloc>().add(GetAllMaterialsEvent());
    super.didChangeDependencies();
  }

  void onSearch(String searchText) {
    setState(() {
      isSearching = true;
      context.read<MaterialBloc>().add(SearchMaterialEvent(
            key: searchText,
            time_from: null,
            time_to: null,
          ));
    });
  }

  void clearSearch() {
    setState(() {
      isSearching = false;
      searchController.clear();
      context.read<MaterialBloc>().add(GetAllMaterialsEvent());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Materials'),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: searchController,
                onSubmitted: onSearch,
                decoration: InputDecoration(
                  hintText: 'Search by title',
                  suffixIcon: isSearching
                      ? IconButton(
                          onPressed: clearSearch,
                          icon: Icon(Icons.clear),
                        )
                      : Icon(Icons.search),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(5)),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 50,
                child: Text(
                  '',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 10,
                child: Text(
                  'Id',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 12,
                child: Text(
                  'Title',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 12,
                child: Text(
                  'image',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 12,
                child: Text(
                  'Author',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 12,
                child: Text(
                  'Language',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 12,
                child: Text(
                  'price',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 12,
                child: Text(
                  'Seller Name',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 12,
                child: Text(
                  'Delete',
                  softWrap: true,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocConsumer<MaterialBloc, MaterialsState>(
            listener: (context, state) {
              print('state////////////////$state');
              if (state is MaterialFailureState) {
                print(state.error);
                showSnackBar(context, state.error);
              }
              if (state is MaterialDeleteSuccessState) {
                showSnackBar(context, state.message);
                context.read<MaterialBloc>().add(GetAllMaterialsEvent());
              }
            },
            builder: (context, state) {
              if (state is MaterialLoading) {
                return Loader();
              }

              if (state is MaterialInitial) {
                return Loader();
              }
              if (state is MaterialsDisplaySuccessState) {
                if (state.Materials.length == 0) {
                  return Center(
                      child: Text(
                    'There is No Available Channel Data',
                  ));
                }
              }

              if (state is MaterialFailureState) {
                return Center(
                    child: Text(
                  'There is No Available Channel Data',
                ));
              }

              if (state is SearchMaterialSuccessState) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.Materials.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5)),
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 10,
                            child: Text(
                              '${state.Materials[index].id ?? 'N/A'}',
                              softWrap: true,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 10,
                            child: Text(
                              '${state.Materials[index].title ?? 'N/A'}',
                              softWrap: true,
                            ),
                          ),
                          if (state.Materials![index].id != null)
                            Container(
                              width: MediaQuery.of(context).size.width / 12,
                              height: 40,
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  headers: {},
                                  '${Urls.BackEndUrl}/material/material_profile/${state.Materials![index].id}',
                                ),
                              ),
                            ),
                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            child: Text(
                              '${state.Materials[index].author ?? 'N/A'}',
                              softWrap: true,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            child: Text(
                              '${state.Materials[index].language! ?? 'N/A'}',
                              softWrap: true,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            child: Text(
                              '${state.Materials[index].price ?? 'N/A'}',
                              softWrap: true,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            child: Text(
                              '${state.Materials[index].sellerProfile!.id ?? 'N/A'}',
                              softWrap: true,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            child: InkWell(
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        'Confirm Deletion',
                                      ),
                                      content: Text(
                                        'Are you sure you want to delete this material?',
                                        style: TextStyle(),
                                      ),
                                      actions: [
                                        TextButton(
                                          child: Text(
                                            'Cancel',
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text(
                                            'Delete',
                                            style: TextStyle(
                                              color: Colors.red,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            context.read<MaterialBloc>().add(
                                                (DeleteMaterialsEvent(
                                                    MaterialId: state
                                                        .Materials[index]
                                                        .id!)));
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }

              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount:
                    (state as MaterialsDisplaySuccessState).Materials.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 2),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(5)),
                    // margin: EdgeInsets.symmetric(horizontal: 5),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 50,
                          child: Text(
                            '',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 10,
                          child: Text(
                            '${state.Materials[index].id ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: Text(
                            '${state.Materials[index].title ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        if (state.Materials![index].id != null)
                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            height: 40,
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                headers: {},
                                '${Urls.BackEndUrl}/material/material_profile/${state.Materials![index].id}',
                              ),
                            ),
                          ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: Text(
                            '${state.Materials[index].author ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: Text(
                            '${state.Materials[index].language ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: Text(
                            '${state.Materials[index].price ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: Text(
                            '${state.Materials[index].sellerProfile!.name ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: InkWell(
                            child: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(
                                      'Confirm Deletion',
                                    ),
                                    content: Text(
                                      'Are you sure you want to delete this material?',
                                      style: TextStyle(),
                                    ),
                                    actions: [
                                      TextButton(
                                        child: Text(
                                          'Cancel',
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                            color: Colors.red,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          context.read<MaterialBloc>().add(
                                              (DeleteMaterialsEvent(
                                                  MaterialId: state
                                                      .Materials[index].id!)));
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          // listener: ,
          // builder: (context, channel, child) => ,),)
        )
      ],
    );
  }
}
