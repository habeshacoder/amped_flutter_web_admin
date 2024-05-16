import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amped_media_admin/provider/userprovider.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  late Future<List<dynamic>> channelList;
  String? token;
  @override
  void didChangeDependencies() {
    channelList = Provider.of<UserProvider>(context, listen: false).getUsers();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Users'),
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
                'username',
                softWrap: true,
              ),
              Text(
                'email',
                softWrap: true,
              ),
              Text(
                'phone',
                softWrap: true,
              ),
              Text(
                'seller_profile no',
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
          child: Consumer<UserProvider>(
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
                                  '${snapshot.data![index]["username"]}',
                                  softWrap: true,
                                ),
                                Text(
                                  '${snapshot.data![index]["email"]}',
                                  softWrap: true,
                                ),
                                Text(
                                  '${snapshot.data![index]["phone"]}',
                                  softWrap: true,
                                ),
                                Text(
                                  '${snapshot.data![index]["seller_profile"].length}',
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
