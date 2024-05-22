import 'dart:convert';

import 'package:amped_media_admin/core/common/loader.dart';
import 'package:amped_media_admin/core/constants/urls.dart';
import 'package:amped_media_admin/core/utils/showsnakbar.dart';
import 'package:amped_media_admin/features/channel/presentation/bloc/allchannels_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class ChannelView extends StatefulWidget {
  const ChannelView({super.key});

  @override
  State<ChannelView> createState() => _ChannelViewState();
}

class _ChannelViewState extends State<ChannelView> {
  // late Future<List<dynamic>> materialList;
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  String? token;
  bool isFirst = true;
  @override
  void didChangeDependencies() {
    if (isFirst) {
      context.read<ChannelBloc>().add(GetAllChannelsEvent());
      isFirst = true;
    }
    super.didChangeDependencies();
  }

  void onSearch(String searchText) {
    setState(() {
      isSearching = true;
      context.read<ChannelBloc>().add(SearchChannelEvent(
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
      context.read<ChannelBloc>().add(GetAllChannelsEvent());
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
            Text('Channels'),
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
                  'Channel Id',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 9,
                child: Text(
                  'Channel Image',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 9,
                child: Text(
                  'Name',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 9,
                child: Text(
                  'Seller Name',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 9,
                child: Text(
                  'Seller Id',
                  softWrap: true,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 9,
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
          child: BlocConsumer<ChannelBloc, ChannelState>(
            listener: (context, state) {
              print('state////////////////$state');
              if (state is ChannelFailureState) {
                print(state.error);
                showSnackBar(context, state.error);
              }
              if (state is ChannelDeleteSuccessState) {
                showSnackBar(context, state.message);
                context.read<ChannelBloc>().add(GetAllChannelsEvent());
              }
            },
            builder: (context, state) {
              if (state is ChannelLoading) {
                return Loader();
              }

              if (state is ChannelInitial) {
                return Loader();
              }
              if (state is ChannelsDisplaySuccessState) {
                if (state.channels.length == 0) {
                  return Center(
                      child: Text(
                    'There is No Available Channel Data',
                    // style: TextStyle(
                    //     , fontFamily: ),
                  ));
                }
              }

              if (state is ChannelFailureState) {
                return Center(
                    child: Text(
                  'There is No Available Channel Data',
                  // style: TextStyle(
                  //     , fontFamily: ),
                ));
              }

              if (state is SearchChannelSuccessState) {
                return ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: state.channels.length,
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
                              '${state.channels[index].id ?? 'N/A'}',
                              softWrap: true,
                            ),
                          ),
                          if (state.channels![index].id != null)
                            Container(
                              width: MediaQuery.of(context).size.width / 9,
                              height: 40,
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  headers: {},
                                  '${Urls.BackEndUrl}/channel/channel_profile/${state.channels![index].id}',
                                ),
                              ),
                            ),
                          Container(
                            width: MediaQuery.of(context).size.width / 9,
                            child: Text(
                              '${state.channels[index].name ?? 'N/A'}',
                              softWrap: true,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 9,
                            child: Text(
                              '${state.channels[index].sellerProfile!.name ?? 'N/A'}',
                              softWrap: true,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 9,
                            child: Text(
                              '${state.channels[index].sellerProfile!.id ?? 'N/A'}',
                              softWrap: true,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 9,
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
                                        'Are you sure you want to delete this channel?',
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
                                            context.read<ChannelBloc>().add(
                                                (DeleteChannelsEvent(
                                                    channelId: state
                                                        .channels[index].id!)));
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
                    (state as ChannelsDisplaySuccessState).channels.length,
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
                            '${state.channels[index].id ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        if (state.channels![index].id != null)
                          Container(
                            width: MediaQuery.of(context).size.width / 9,
                            height: 40,
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                headers: {},
                                '${Urls.BackEndUrl}/channel/channel_profile/${state.channels![index].id}',
                              ),
                            ),
                          ),
                        Container(
                          width: MediaQuery.of(context).size.width / 9,
                          child: Text(
                            '${state.channels[index].name ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 9,
                          child: Text(
                            '${state.channels[index].sellerProfile!.name ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 9,
                          child: Text(
                            '${state.channels[index].sellerProfile!.id ?? 'N/A'}',
                            softWrap: true,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 9,
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
                                      'Are you sure you want to delete this channel?',
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
                                          context.read<ChannelBloc>().add(
                                              (DeleteChannelsEvent(
                                                  channelId: state
                                                      .channels[index].id!)));
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
