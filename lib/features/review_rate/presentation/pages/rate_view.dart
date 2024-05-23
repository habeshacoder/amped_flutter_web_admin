import 'package:amped_media_admin/core/common/loader.dart';
import 'package:amped_media_admin/core/utils/showsnakbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/formate_date.dart';
import '../../../user/presentation/bloc/user_bloc.dart';
import '../bloc/rate_bloc.dart';

class RateView extends StatefulWidget {
  const RateView({super.key});

  @override
  State<RateView> createState() => _RateViewState();
}

class _RateViewState extends State<RateView> {
  // late Future<List<dynamic>> materialList;
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  String? token;
  @override
  void didChangeDependencies() {
    context.read<RateBloc>().add(GetAllRatesEvent());
    super.didChangeDependencies();
  }

  void onSearch(String searchText) {
    setState(() {
      isSearching = true;
      context.read<RateBloc>().add(SearchRateEvent(
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
      context.read<RateBloc>().add(GetAllRatesEvent());
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
            Text('Rates'),
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: searchController,
                onSubmitted: onSearch,
                decoration: InputDecoration(
                  hintText: 'Search by Remark',
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
              // Container(
              //   width: MediaQuery.of(context).size.width / 12,
              //   child: Text(
              //     'User Id',
              //     softWrap: true,
              //   ),
              // ),
              Container(
                width: MediaQuery.of(context).size.width / 12,
                child: Text(
                  'Rating',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 12,
                child: Text(
                  'Remark',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 12,
                child: Text(
                  'Material Id',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 12,
                child: Text(
                  'Channel Id',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 12,
                child: Text(
                  'Channel Material Id',
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
          child: BlocConsumer<RateBloc, RateState>(
            listener: (context, state) {
              print('state////////////////$state');
              if (state is RateFailureState) {
                print(state.error);
                showSnackBar(context, state.error);
              }
              if (state is RateDeleteSuccessState) {
                showSnackBar(context, state.message);
                context.read<RateBloc>().add(GetAllRatesEvent());
              }
            },
            builder: (context, state) {
              if (state is RateLoading) {
                return Loader();
              }

              if (state is UserInitial) {
                return Loader();
              }
              if (state is RatesDisplaySuccessState) {
                if (state.Rates.length == 0) {
                  return Center(
                      child: Text(
                    'There is No Available Rate Data',
                    // style: TextStyle(
                    //     , fontFamily: ),
                  ));
                }
              }

              if (state is RateFailureState) {
                return Center(
                    child: Text(
                  'There is No Available Rate Data',
                  // style: TextStyle(
                  //     , fontFamily: ),
                ));
              }

              if (state is SearchRateSuccessState) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.Rates.length,
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
                              '${state.Rates[index].id ?? 'N/A'}',
                              softWrap: true,
                            ),
                          ),
                          // Container(
                          //   width: MediaQuery.of(context).size.width / 10,
                          //   child: Text(
                          //     '${state.Rates[index].userId ?? 'N/A'}',
                          //     softWrap: true,
                          //   ),
                          // ),
                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            child: Text(
                              '${state.Rates[index].rating ?? 'N/A'}',
                              softWrap: true,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            child: Text(
                              '${state.Rates[index].remark ?? 'N/A'}',
                              softWrap: true,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            child: Text(
                              '${state.Rates[index].materialId ?? 'N/A'}',
                              softWrap: true,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            child: Text(
                              '${state.Rates[index].channelId ?? 'N/A'}',
                              // softWrap: true,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            child: Text(
                              '${state.Rates[index].channelMaterialId ?? 'N/A'}',
                              softWrap: true,
                            ),
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width / 12,
                            child: Text(
                              formatDateBydMMMYYYY(
                                  state.Rates[index].createdAt),
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
                                        'Are you sure you want to delete this Rate?',
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
                                            context.read<RateBloc>().add(
                                                (DeleteRatesEvent(
                                                    RateId: state
                                                        .Rates[index].id!)));
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
                itemCount: (state as RatesDisplaySuccessState).Rates.length,
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
                            '${state.Rates[index].id ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        // Container(
                        //   width: MediaQuery.of(context).size.width / 10,
                        //   child: Text(
                        //     '${state.Rates[index].userId ?? 'N/A'}',
                        //     softWrap: true,
                        //   ),
                        // ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: Text(
                            '${state.Rates[index].rating ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: Text(
                            '${state.Rates[index].remark ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: Text(
                            '${state.Rates[index].materialId ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: Text(
                            '${state.Rates[index].channelId ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: Text(
                            '${state.Rates[index].channelMaterialId ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 12,
                          child: Text(
                            formatDateBydMMMYYYY(state.Rates[index].createdAt),
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
                                      'Are you sure you want to delete this Rate?',
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
                                          context.read<RateBloc>().add(
                                              (DeleteRatesEvent(
                                                  RateId:
                                                      state.Rates[index].id!)));
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
