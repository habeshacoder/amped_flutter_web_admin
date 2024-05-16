import 'package:amped_media_admin/backendurl.dart';
import 'package:amped_media_admin/provider/channelprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChannelView extends StatefulWidget {
  const ChannelView({super.key});

  @override
  State<ChannelView> createState() => _ChannelViewState();
}

class _ChannelViewState extends State<ChannelView> {
  late Future<List<dynamic>> channelList;
  String? token;
  @override
  void didChangeDependencies() {
    print('get top books info display didchangedepcey ...........');
    channelList = Provider.of<ChannelCreationProvider>(context, listen: false)
        .seeAllChannel();
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
          // margin: EdgeInsets.symmetric(horizontal: 5),
          height: 50,
          // width: MediaQuery.of(context).size.width * 0.5,
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
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
          child: Consumer<ChannelCreationProvider>(
              builder: (context, channel, child) => FutureBuilder(
                    future: channelList,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.length,
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
                                Container(
                                  height: 40,
                                  child: Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          headers: {},
                                          '${BackEndUrl.url}/channel/channel_profile/${snapshot.data![index]["id"]}')),
                                ),
                                Text(
                                  '${snapshot.data![index]["name"]}',
                                  softWrap: true,
                                ),
                                Text(
                                  '${snapshot.data![index]["SellerProfile"]["name"]}',
                                  softWrap: true,
                                ),
                                // IconButton(
                                //   icon: Icon(
                                //     Icons.delete,
                                //   ),
                                //   color: Colors.red,
                                //   onPressed: () {
                                //     // Add your delete logic here
                                //     print('Delete button pressed');
                                //   },
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
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // return CircularProgressIndicator();
                        return Center(
                            widthFactor: 10,
                            heightFactor: 10,
                            child: CircularProgressIndicator());
                      }
                      return Center(child: Text('Please try later'));
                    },
                  )),
        ),
      ],
    );
  }
}
