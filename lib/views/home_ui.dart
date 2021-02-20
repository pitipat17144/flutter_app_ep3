import 'package:flutter/material.dart';
import 'package:flutter_app_ep3/models/myaccount.dart';
import 'package:flutter_app_ep3/utils/service_api.dart';
import 'package:cached_network_image/cached_network_image.dart';


class HomeUI extends StatefulWidget {
  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  Future<List<Myaccount>> futureMyAccount;

  getAllMtAccount() async{
    futureMyAccount = serviceGetAllMyAccount();
  }
  String changDateFormat(String dt){
    String year = dt.substring(0 , 4);
    String month = dt.substring(5 , 7);
    String day = dt.substring(8);

    year = (int.parse(year) + 543).toString();
    switch( int.parse(month) ){
      case 1: month = "มกราคม";break;
      case 2: month = "กุมภาพันธ์";break;
      case 3: month = "มีนาคม";break;
      case 4: month = "เมษายน";break;
      case 5: month = "พฤษภาคม";break;
      case 6: month = "มิถุนายน";break;
      case 7: month = "กรกฏาคม";break;
      case 8: month = "สิงหาคม";break;
      case 9: month = "กันยายนยว";break;
      case 10: month = "ตุลาคม";break;
      case 11: month = "พฤศจิกายน";break;
      default: month = "ธันวาคม";
    }
    return day + ' '  + month + ' พ.ศ. ' + year;
  }

  @override
  void initState(){
    super.initState();
    getAllMtAccount();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Account Diary 2021',
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        backgroundColor: Colors.yellow,
        icon: Icon(
          Icons.add,
        ),
        label: Text(
          'เพิ่มข้อมมูล',
        ),
      ),
      body: futureMyAccount == null
      ?
          Center(
            child: Container(
              color: Colors.red,
              child: Text('กรุณาลองใหม่อีกครั้ง'),

            ),
          )

      :
          FutureBuilder<List<Myaccount>>(
            future: futureMyAccount,
            builder: (context, snapshot){
              switch(snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                default :
                  {
                    if (snapshot.hasData) {

                      if (snapshot.data[0].message == '1') {
                        return ListView.separated(
                          separatorBuilder: (context, index){
                            return Container(
                              height: 1.0,
                              width: double.infinity,
                              color: Colors.yellow,
                            );
                          },
                          itemCount: snapshot.data.length,
                          itemBuilder: (context,index){
                            return ListTile(
                              leading: CachedNetworkImage(
                                imageUrl: '${urlService}/accountdialy${snapshot.data[index].mImage}',
                                width: 50.0,
                                height: 50.0,
                                imageBuilder: (context, imageProvider){
                                  return Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8.0)
                                      ),
                                    ),
                                  );
                                },

                              ),
                              title: Text(
                                  '${snapshot.data[index].mName}',
                              ),
                              subtitle: Text(
                                changDateFormat(snapshot.data[index].mDate)
                                  //'${snapshot.data[index].mDate}',
                              ),
                              trailing: Icon(
                                  Icons.arrow_forward,
                              ),
                            );
                          },


                        );

                      } else if (snapshot.data[0].message == '2') {
                        return Center(
                          child: Container(
                            color: Colors.red,
                            child: Text('ไม่มีข้อมูล'),
                          ),
                        );
                      } else {
                        return Center(
                          child: Container(
                            color: Colors.red,
                            child: Text('กรุณาลองใหม่อีกครั้ง...(A)'),

                          ),
                        );
                      }
                    }else {
                      return Center(
                        child: Container(
                          color: Colors.red,
                          child: Text('กรุณาลองใหม่อีกครั้ง...(B)'),

                        ),
                      );
                    }
                  }
              }
            },
          ),
    );

  }
}
