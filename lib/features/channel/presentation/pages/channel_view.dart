import 'package:amped_media_admin/core/common/loader.dart';
import 'package:amped_media_admin/core/constants/urls.dart';
import 'package:amped_media_admin/core/utils/showsnakbar.dart';
import 'package:amped_media_admin/features/channel/presentation/bloc/allchannels_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/display_error.dart';

class ChannelView extends StatefulWidget {
  const ChannelView({super.key});

  @override
  State<ChannelView> createState() => _ChannelViewState();
}

class _ChannelViewState extends State<ChannelView> {
  // late Future<List<Channel>> channelList;
  String? token;
  @override
  void didChangeDependencies() {
    context.read<ChannelBloc>().add(GetAllChannelsEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Channels'),
        Container(
          margin: EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(5)),
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'channel image',
                softWrap: true,
              ),
              Text(
                'name',
                softWrap: true,
              ),
              Text(
                'Seller name',
                softWrap: true,
              ),
              Text(
                '',
                softWrap: true,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: BlocConsumer<ChannelBloc, ChannelState>(
              listener: (context, state) {
            print('state////////////////$state');
            if (state is ChannelFailureState) {
              print(state.error);
              showSnackBar(context, state.error);
            }
          }, builder: (context, state) {
            if (state is ChannelLoading) {
              return Loader();
            }

            if (state is ChannelsDisplaySuccessState) {
              print(
                  'statein builder////////////////////////${state.channels[0].sellerProfile}');
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: state.channels.length,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(vertical: 2),
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(5)),
                  // margin: EdgeInsets.symmetric(horizontal: 5),
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (state.channels![index].id != null)
                        Container(
                          height: 40,
                          child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  headers: {},
                                  '${Urls.BackEndUrl}/channel/channel_profile/${state.channels![index].id}')),
                        ),
                      Text(
                        '${state.channels[index].name ?? 'N/A'}',
                        softWrap: true,
                      ),
                      // Text(
                      //   '${state.channels[index].sellerProfile!.name ?? 'N/A'}',
                      //   softWrap: true,
                      // ),
                      Text(
                        '',
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
              );
            }

            return DisplayError(
              error: 'please try later',
            );
          }),
          // listener: ,
          // builder: (context, channel, child) => ,),)
        )
      ],
    );
  }
}
