import 'package:flutter/material.dart';
import 'package:tab_bar3/fragment/about.dart';
import 'package:tab_bar3/fragment/contacts.dart';
import 'package:tab_bar3/fragment/profile.dart';

 class draweritem{
   String name;
   IconData icon;

   draweritem(this.name,this.icon);
 }

class Homepage extends StatefulWidget {
  final objfordraweritem=[
    draweritem("Profile", Icons.person),
    draweritem("About", Icons.account_box_outlined),
    draweritem("Contact", Icons.call)
  ];
 // const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedindex=0;

  swichfordrawer(int pos) {
    switch (pos) {
      case 0:
        return ProfileFragment();
      case 1:
        return AboutFragment();
      case 2:
        return ContactFragment();

      default:
        return Text("Error");
    }
  }

  ontabbed(int index){
    setState(() {
      selectedindex=index;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> draweroption=[];
    for(var i=0;i<widget.objfordraweritem.length;i++){
      var d=widget.objfordraweritem[i];
      draweroption.add(ListTile(
        leading: Icon(d.icon),
        title: Text(d.name),
        selected: i==selectedindex,
        onTap: ()=>ontabbed(i),

      ));


    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: Text(
          widget.objfordraweritem[selectedindex].name,
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(

        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.blue
              ),

              accountName: Text("John Doe"),
              accountEmail: Text("jhondue@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Icon(
                    Icons.person_rounded,
                    size: 60,
                  ),
                ),
              ),
            ),
            Column(children: draweroption)
          ],
        ),
      ),
      body: swichfordrawer(selectedindex),
    );
  }
}
