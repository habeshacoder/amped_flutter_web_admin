import 'package:amped_media_admin/core/common/loader.dart';
import 'package:amped_media_admin/core/utils/showsnakbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/urls.dart';
import '../../../../core/utils/formate_date.dart';
import '../../../user/presentation/bloc/user_bloc.dart';
import '../bloc/profile_bloc.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  // late Future<List<dynamic>> materialList;
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  String? token;
  @override
  void didChangeDependencies() {
    context.read<ProfileBloc>().add(GetAllProfilesEvent());
    super.didChangeDependencies();
  }

  void onSearch(String searchText) {
    setState(() {
      isSearching = true;
      context.read<ProfileBloc>().add(SearchProfileEvent(
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
      context.read<ProfileBloc>().add(GetAllProfilesEvent());
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
            Text('Profiles'),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: searchController,
                onSubmitted: onSearch,
                decoration: InputDecoration(
                  hintText: 'Search by First Name',
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
                  'Profile Image',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 12,
                child: Text(
                  'First Name',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 12,
                child: Text(
                  'Last Name',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 12,
                child: Text(
                  'Sex',
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
          child: BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, state) {
              print('state////////////////$state');
              if (state is ProfileFailureState) {
                print(state.error);
                showSnackBar(context, state.error);
              }
              if (state is ProfileDeleteSuccessState) {
                showSnackBar(context, state.message);
                context.read<ProfileBloc>().add(GetAllProfilesEvent());
              }
            },
            builder: (context, state) {
              if (state is ProfileLoading) {
                return Loader();
              }

              if (state is ProfileInitial) {
                return Loader();
              }
              if (state is ProfilesDisplaySuccessState) {
                if (state.profiles.length == 0) {
                  return Center(
                      child: Text(
                    'There is No Available profile Data',
                    // style: TextStyle(
                    //     , fontFamily: ),
                  ));
                }
              }

              if (state is ProfileFailureState) {
                return Center(
                    child: Text(
                  'There is No Available profile Data',
                  // style: TextStyle(
                  //     , fontFamily: ),
                ));
              }

              if (state is SearchProfileSuccessState) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.profiles.length,
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
                              '${state.profiles[index].id ?? 'N/A'}',
                              softWrap: true,
                            ),
                          ),
                          if (state.profiles![index].id != null)
                            Container(
                              width: MediaQuery.of(context).size.width / 9,
                              height: 40,
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  headers: {},
                                  '${Urls.BackEndUrl}/profiles/profile-image/${state.profiles![index].profileImage}',
                                ),
                              ),
                            ),
                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            child: Text(
                              '${state.profiles[index].firstName ?? 'N/A'}',
                              softWrap: true,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            child: Text(
                              '${state.profiles[index].lastName ?? 'N/A'}',
                              softWrap: true,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            child: Text(
                              '${state.profiles[index].sex ?? 'N/A'}',
                              softWrap: true,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            child: Text(
                              formatDateBydMMMYYYY(
                                  state.profiles[index].createdAt),
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
                                        'Are you sure you want to delete this profile?',
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
                                            context.read<ProfileBloc>().add(
                                                (DeleteProfilesEvent(
                                                    ProfileId: state
                                                        .profiles[index].id!)));
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
                    (state as ProfilesDisplaySuccessState).profiles.length,
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
                            '${state.profiles[index].id ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        if (state.profiles![index].id != null)
                          Container(
                            width: MediaQuery.of(context).size.width / 9,
                            height: 40,
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                headers: {},
                                '${Urls.BackEndUrl}/profiles/profile-image/${state.profiles![index].profileImage}',
                              ),
                            ),
                          ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: Text(
                            '${state.profiles[index].firstName ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: Text(
                            '${state.profiles[index].lastName ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: Text(
                            '${state.profiles[index].sex ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: Text(
                            formatDateBydMMMYYYY(
                                state.profiles[index].createdAt),
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
                                      'Are you sure you want to delete this profile?',
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
                                          context.read<ProfileBloc>().add(
                                              (DeleteProfilesEvent(
                                                  ProfileId: state
                                                      .profiles[index].id!)));
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
