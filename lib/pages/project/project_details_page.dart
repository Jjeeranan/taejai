import 'package:flutter/material.dart';
import 'package:taejai/models/project.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProjectDetailsPage extends StatelessWidget {
  final Project project;

  const ProjectDetailsPage({Key? key, required this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var formatter = NumberFormat('#,###,000');
    var target = formatter.format(project.targetAmount);
    var percentText = ((project.receiveAmount / project.targetAmount) * 100).toStringAsFixed(0);
    var percent = int.tryParse(percentText);
    var recieve = formatter.format(project.receiveAmount);
    var cart = '🛒 หยิบใส่ตะกร้า';
    var donate = '💓 ร่วมบริจาค';

    return Scaffold(
      appBar: AppBar(
          title: Text(
            project.title,
            overflow: TextOverflow.ellipsis,
          ),
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xfff0f8ff),
            ),
            child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      project.title,
                      style: TextStyle(fontSize: 25.0),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      project.imageUrl,
                      width: 500.0,
                      height: 250.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children:[
                        Expanded(
                          child: Text(
                            project.description,
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            project.time,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            project.place,
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),


          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    spreadRadius: 1,
                    blurRadius: 15,
                    offset: const Offset(0, 15),
                  )
                ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 4.0),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('ยอดบริจาคขณะนี้', style: TextStyle(fontSize: 18.0, color: Colors.black),
                                ),
                                Text('$recieve บาท', style: TextStyle(fontSize: 20.0, color: Colors.indigoAccent),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('เป้าหมาย', style: TextStyle(fontSize: 12.0, color: Colors.black38),),
                                Text('$target บาท', style: TextStyle(fontSize: 16.0, color: Colors.black),),
                              ],
                            ),
                            Text('$percentText%', style: TextStyle(fontSize: 12.0, color: Colors.black38),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: percent!,
                              child: Container(
                                height: 10.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 0.0),
                                color: Colors.indigoAccent,
                              ),
                            ),
                            Expanded(
                              flex: 100 - percent,
                              child: Container(
                                height: 10.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 0.0),
                                color: const Color(0xFFE8E8E8), //Colors.grey[200],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('${project.duration} วัน',style: TextStyle(fontSize: 12.0, color: Colors.black38),),
                            Row(
                              children: [
                                const Icon(Icons.person, size: 14.0),
                                Text('${project.donateCount}', style: TextStyle(fontSize: 12.0, color: Colors.black38),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: ElevatedButton(
                                    onPressed: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('$donate', style: TextStyle(color: Colors.white),),
                                      ],
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: ElevatedButton(
                                    onPressed: (){},
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('$cart',style: TextStyle(color: Colors.white),),
                                      ],
                                    )
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 15,
                    offset: const Offset(0, 15),
                  )
                ]
            ),
            child: Column(
              children: [
                Text('แชร์ให้เพื่อน'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Line(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Facebook(),
                    ),
                    Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Twitter(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget Line(){
  return IconButton(
    // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
      icon: FaIcon(FontAwesomeIcons.line),
      color: Colors.blueGrey,
      onPressed: () {  }
  );
}

Widget Facebook(){
  return IconButton(
    // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
      icon: FaIcon(FontAwesomeIcons.facebook),
      color: Colors.blueGrey,
      onPressed: () {  }
  );
}

Widget Twitter() {
  return IconButton(
    // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
      icon: FaIcon(FontAwesomeIcons.twitter),
      color: Colors.blueGrey,
      onPressed: () {}
  );
}

