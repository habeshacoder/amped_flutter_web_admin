import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:amped_media_admin/backendurl.dart';
import 'package:amped_media_admin/provider/auth.dart';
import 'package:amped_media_admin/provider/channelprovider.dart';
import 'package:amped_media_admin/provider/materialprovider.dart';
import 'package:amped_media_admin/viewmodels/channelmodel.dart';
import 'package:amped_media_admin/viewmodels/materialmodel.dart';

class MaterialView extends StatefulWidget {
  const MaterialView({super.key});

  @override
  State<MaterialView> createState() => _MaterialViewState();
}

class _MaterialViewState extends State<MaterialView> {
  late Future<List<dynamic>> channelList;
  String? token;
  @override
  void didChangeDependencies() {
    channelList = Provider.of<materialCreationProvider>(context, listen: false)
        .getMaterials();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   // height: 287,
    //   // color: Colors.red,
    //   width: double.infinity,
    //   child: SingleChildScrollView(
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       children: [
    //         Text(
    //           'All Channels',
    //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
    //         ),
    //         Container(
    //           height: 500,
    //           child:
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return Column(
      // children: [
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Materials'),
        Container(
          padding: EdgeInsets.only(left: 5),
          margin: EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(5)),
          // margin: EdgeInsets.symmetric(horizontal: 5),
          height: 50,
          // width: MediaQuery.of(context).size.width * 0.5,
          child: Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Container(
              //   height: 40,
              //   child: Image(
              //       fit: BoxFit.cover,
              //       image: NetworkImage(
              //           headers: {},
              //           '${BackEndUrl.url}/channel/channel_profile/${snapshot.data![index]['id']}')),
              // ),
              Text(
                'Title',
                softWrap: true,
              ),
              Text(
                'Type',
                softWrap: true,
              ),
              Text(
                'Author',
                softWrap: true,
              ),
              Text(
                'Language',
                softWrap: true,
              ),
              Text(
                'price',
                softWrap: true,
              ),
              Text(
                'Seller Name',
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
          child: Consumer<materialCreationProvider>(
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
                                // Container(
                                //   height: 40,
                                //   child: Image(
                                //       fit: BoxFit.cover,
                                //       image: NetworkImage(
                                //           headers: {},
                                //           '${BackEndUrl.url}/channel/channel_profile/${snapshot.data![index]['id']}')),
                                // ),
                                Text(
                                  '${snapshot.data![index]["title"]}',
                                  softWrap: true,
                                ),
                                Text(
                                  '${snapshot.data![index]["type"]}',
                                  softWrap: true,
                                ),
                                Text(
                                  '${snapshot.data![index]["author"]}',
                                  softWrap: true,
                                ),
                                Text(
                                  '${snapshot.data![index]["language"]}',
                                  softWrap: true,
                                ),
                                Text(
                                  '${snapshot.data![index]["price"]}',
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
