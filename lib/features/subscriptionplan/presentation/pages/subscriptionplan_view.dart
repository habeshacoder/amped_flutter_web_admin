import 'package:amped_media_admin/core/common/loader.dart';
import 'package:amped_media_admin/core/utils/showsnakbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/formate_date.dart';
import '../bloc/subscriptionplan_bloc.dart';

class SubscriptionPlanView extends StatefulWidget {
  const SubscriptionPlanView({super.key});

  @override
  State<SubscriptionPlanView> createState() => _SubscriptionPlanViewState();
}

class _SubscriptionPlanViewState extends State<SubscriptionPlanView> {
  // late Future<List<dynamic>> materialList;
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  String? token;
  @override
  void didChangeDependencies() {
    context.read<SubscriptionPlanBloc>().add(GetAllSubscriptionPlansEvent());
    super.didChangeDependencies();
  }

  void onSearch(String searchText) {
    setState(() {
      isSearching = true;
      context.read<SubscriptionPlanBloc>().add(SearchSubscriptionPlanEvent(
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
      context.read<SubscriptionPlanBloc>().add(GetAllSubscriptionPlansEvent());
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
            Text('subscription plans'),
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
                  'Name',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 12,
                child: Text(
                  'Price',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 12,
                child: Text(
                  'Channel ID',
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
          child: BlocConsumer<SubscriptionPlanBloc, SubscriptionPlanState>(
            listener: (context, state) {
              print('state////////////////$state');
              if (state is SubscriptionPlanFailureState) {
                print(state.error);
                showSnackBar(context, state.error);
              }
              if (state is SubscriptionPlanDeleteSuccessState) {
                showSnackBar(context, state.message);
                context
                    .read<SubscriptionPlanBloc>()
                    .add(GetAllSubscriptionPlansEvent());
              }
            },
            builder: (context, state) {
              if (state is SubscriptionPlanLoading) {
                return Loader();
              }

              if (state is SubscriptionPlanInitial) {
                return Loader();
              }
              if (state is SubscriptionPlansDisplaySuccessState) {
                if (state.SubscriptionPlans.length == 0) {
                  return Center(
                      child: Text(
                    'There is No Available subscription plan Data',
                    // style: TextStyle(
                    //     , fontFamily: ),
                  ));
                }
              }

              if (state is SubscriptionPlanFailureState) {
                return Center(
                    child: Text(
                  'There is No Available subscription plan Data',
                  // style: TextStyle(
                  //     , fontFamily: ),
                ));
              }

              if (state is SearchSubscriptionPlanSuccessState) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.SubscriptionPlans.length,
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
                              '${state.SubscriptionPlans[index].id ?? 'N/A'}',
                              softWrap: true,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            child: Text(
                              '${state.SubscriptionPlans[index].name ?? 'N/A'}',
                              softWrap: true,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            child: Text(
                              '${state.SubscriptionPlans[index].price ?? 'N/A'}',
                              softWrap: true,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            child: Text(
                              '${state.SubscriptionPlans[index].channelId ?? 'N/A'}',
                              softWrap: true,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            child: Text(
                              formatDateBydMMMYYYY(
                                  state.SubscriptionPlans[index].createdAt),
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
                                        'Are you sure you want to delete this subscription plan?',
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
                                            context
                                                .read<SubscriptionPlanBloc>()
                                                .add((DeleteSubscriptionPlansEvent(
                                                    SubscriptionPlanId: state
                                                        .SubscriptionPlans[
                                                            index]
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
                itemCount: (state as SubscriptionPlansDisplaySuccessState)
                    .SubscriptionPlans
                    .length,
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
                            '${state.SubscriptionPlans[index].id ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: Text(
                            '${state.SubscriptionPlans[index].name ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: Text(
                            '${state.SubscriptionPlans[index].price ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: Text(
                            '${state.SubscriptionPlans[index].channelId ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: Text(
                            formatDateBydMMMYYYY(
                                state.SubscriptionPlans[index].createdAt),
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
                                      'Are you sure you want to delete this subscription plan?',
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
                                          context
                                              .read<SubscriptionPlanBloc>()
                                              .add(
                                                  (DeleteSubscriptionPlansEvent(
                                                      SubscriptionPlanId: state
                                                          .SubscriptionPlans[
                                                              index]
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
            },
          ),
          // listener: ,
          // builder: (context, channel, child) => ,),)
        )
      ],
    );
  }
}
