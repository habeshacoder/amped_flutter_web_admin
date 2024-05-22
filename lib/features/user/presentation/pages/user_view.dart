import 'package:amped_media_admin/core/common/loader.dart';
import 'package:amped_media_admin/core/constants/urls.dart';
import 'package:amped_media_admin/core/utils/showsnakbar.dart';
import 'package:amped_media_admin/features/material/presentation/bloc/material_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/formate_date.dart';
import '../bloc/user_bloc.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  // late Future<List<dynamic>> materialList;
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  String? token;
  @override
  void didChangeDependencies() {
    context.read<UserBloc>().add(GetAllUsersEvent());
    super.didChangeDependencies();
  }

  void onSearch(String searchText) {
    setState(() {
      isSearching = true;
      context.read<UserBloc>().add(SearchUserEvent(
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
      context.read<UserBloc>().add(GetAllUsersEvent());
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
            Text('Users'),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: searchController,
                onSubmitted: onSearch,
                decoration: InputDecoration(
                  hintText: 'Search by username',
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
            // crossAxisAlignment: CrossAxisAlignment.center,
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
                  'Username',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 12,
                child: Text(
                  'Email',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 12,
                child: Text(
                  'phone',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 12,
                child: Text(
                  'seller_profile Id',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 12,
                child: Text(
                  'Profile Id',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 12,
                child: Text(
                  'Registered At',
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
        // SizedBox(
        //   height: 10,
        // ),
        Expanded(
          child: BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              print('state////////////////$state');
              if (state is UserFailureState) {
                print(state.error);
                showSnackBar(context, state.error);
              }
              if (state is UserDeleteSuccessState) {
                showSnackBar(context, state.message);
                context.read<UserBloc>().add(GetAllUsersEvent());
              }
            },
            builder: (context, state) {
              if (state is UserLoading) {
                return Loader();
              }

              if (state is UserInitial) {
                return Loader();
              }
              if (state is UsersDisplaySuccessState) {
                if (state.Users.length == 0) {
                  return Center(
                      child: Text(
                    'There is No Available Channel Data',
                    // style: TextStyle(
                    //     , fontFamily: ),
                  ));
                }
              }

              if (state is UserFailureState) {
                return Center(
                    child: Text(
                  'There is No Available Channel Data',
                  // style: TextStyle(
                  //     , fontFamily: ),
                ));
              }

              if (state is SearchUserSuccessState) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.Users.length,
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
                                  '${state.Users[index].id ?? 'N/A'}',
                                  softWrap: true,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 12,
                                child: Text(
                                  '${state.Users[index].username ?? 'N/A'}',
                                  softWrap: true,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 12,
                                child: Text(
                                  '${state.Users[index].email ?? 'N/A'}',
                                  softWrap: true,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 12,
                                child: Text(
                                  '${state.Users[index].phone ?? 'N/A'}',
                                  softWrap: true,
                                ),
                              ),
                              if (state.Users[index].sellerProfiles != null &&
                                  state.Users[index].sellerProfiles!.length > 0)
                                Container(
                                  width: MediaQuery.of(context).size.width / 12,
                                  child: Text(
                                    '${state.Users[index].sellerProfiles![0].id ?? 'N/A'}',
                                    softWrap: true,
                                  ),
                                )
                              else
                                Container(
                                  width: MediaQuery.of(context).size.width / 12,
                                  child: Text(
                                    'N/A',
                                    softWrap: true,
                                  ),
                                ),
                              if (state.Users[index].profiles != null &&
                                  state.Users[index].sellerProfiles!.length > 0)
                                Container(
                                  width: MediaQuery.of(context).size.width / 12,
                                  child: Text(
                                    '${state.Users[index].profiles!.id ?? 'N/A'}',
                                    softWrap: true,
                                  ),
                                )
                              else
                                Container(
                                  width: MediaQuery.of(context).size.width / 12,
                                  child: Text(
                                    'N/A',
                                    softWrap: true,
                                  ),
                                ),
                              Container(
                                width: MediaQuery.of(context).size.width / 12,
                                child: Text(
                                  formatDateBydMMMYYYY(
                                      state.Users[index].createdAt),
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
                                            'Are you sure you want to delete this user?',
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
                                                context.read<UserBloc>().add(
                                                    (DeleteUsersEvent(
                                                        UserId: state
                                                            .Users[index]
                                                            .email!)));
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ]));
                  },
                );
              }

              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: (state as UsersDisplaySuccessState).Users.length,
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
                            '${state.Users[index].id ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: Text(
                            '${state.Users[index].username ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: Text(
                            '${state.Users[index].email ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: Text(
                            '${state.Users[index].phone ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        if (state.Users[index].sellerProfiles != null &&
                            state.Users[index].sellerProfiles!.length > 0)
                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            child: Text(
                              '${state.Users[index].sellerProfiles![0].id ?? 'N/A'}',
                              softWrap: true,
                            ),
                          )
                        else
                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            child: Text(
                              'N/A',
                              softWrap: true,
                            ),
                          ),
                        if (state.Users[index].profiles != null &&
                            state.Users[index].sellerProfiles!.length > 0)
                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            child: Text(
                              '${state.Users[index].profiles!.id ?? 'N/A'}',
                              softWrap: true,
                            ),
                          )
                        else
                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            child: Text(
                              'N/A',
                              softWrap: true,
                            ),
                          ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: Text(
                            formatDateBydMMMYYYY(state.Users[index].createdAt),
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
                                      'Are you sure you want to delete this user?',
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
                                          context.read<UserBloc>().add(
                                              (DeleteUsersEvent(
                                                  UserId: state
                                                      .Users[index].email!)));
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
