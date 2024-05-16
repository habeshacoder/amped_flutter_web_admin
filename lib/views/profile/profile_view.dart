import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:amped_media_admin/provider/profileprovider.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late Future<List<dynamic>> channelList;
  String? token;
  @override
  void didChangeDependencies() {
    channelList =
        Provider.of<ProfileProvider>(context, listen: false).getProfiles();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Profiles'),
        Container(
          padding: EdgeInsets.only(left: 5),
          margin: EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(5)),
          // margin: EdgeInsets.symmetric(horizontal: 5),
          height: 50,
          // width: MediaQuery.of(context).size.width * 0.5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'first_name',
                softWrap: true,
              ),
              Text(
                'last_name',
                softWrap: true,
              ),
              Text(
                'sex',
                softWrap: true,
              ),
              Text(
                'username',
                softWrap: true,
              ),
              Text(
                'created_at',
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
          child: Consumer<ProfileProvider>(
              builder: (context, channel, child) => FutureBuilder(
                    future: channelList,
                    builder: (context, snapshot) {
                      print(
                          'snapshot data------------------------${snapshot.data}');
                      if (snapshot.hasData) {
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) => Container(
                            padding: EdgeInsets.only(left: 5),
                            margin: EdgeInsets.symmetric(vertical: 2),
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(5)),
                            // margin: EdgeInsets.symmetric(horizontal: 5),
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${snapshot.data![index]["first_name"]}',
                                  softWrap: true,
                                ),
                                Text(
                                  '${snapshot.data![index]["last_name"]}',
                                  softWrap: true,
                                ),
                                Text(
                                  '${snapshot.data![index]["sex"]}',
                                  softWrap: true,
                                ),
                                Text(
                                  '${snapshot.data![index]["User"]["username"]}',
                                  softWrap: true,
                                ),
                                Text(
                                  '${DateFormat('dd-MM-yyyy').format(DateTime.parse(snapshot.data![index]["created_at"]))}',
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
