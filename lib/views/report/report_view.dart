import 'package:amped_media_admin/provider/reportprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:amped_media_admin/backendurl.dart';
import 'package:amped_media_admin/provider/auth.dart';
import 'package:amped_media_admin/provider/channelprovider.dart';
import 'package:amped_media_admin/provider/materialprovider.dart';
import 'package:amped_media_admin/viewmodels/channelmodel.dart';
import 'package:amped_media_admin/viewmodels/materialmodel.dart';

class ReportView extends StatefulWidget {
  const ReportView({super.key});

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  late Future<List<dynamic>> channelList;
  String? token;
  @override
  void didChangeDependencies() {
    channelList =
        Provider.of<ReportProvider>(context, listen: false).getReports();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Reports'),
        SizedBox(
          height: 10,
        ),
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
                'report_type',
                softWrap: true,
              ),
              Text(
                'report description',
                softWrap: true,
              ),
              Text(
                'Seller name',
                softWrap: true,
              ),
              Text(
                'title',
                softWrap: true,
              ),
              Text(
                'reporter username',
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
                                  '${snapshot.data![index]["report_type"]}',
                                  softWrap: true,
                                ),
                                Text(
                                  '${snapshot.data![index]["report_desc"]}',
                                  softWrap: true,
                                ),
                                if (snapshot.data![index]["Material"] != null)
                                  Text(
                                    '${snapshot.data![index]["Material"]["SellerProfile"]["name"]}',
                                    softWrap: true,
                                  ),

                                if (snapshot.data![index]["Material"] != null)
                                  Text(
                                    '${snapshot.data![index]["Material"]["title"]}',
                                    softWrap: true,
                                  ),
                                Text(
                                  '${snapshot.data![index]["user"]["username"]}',
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
