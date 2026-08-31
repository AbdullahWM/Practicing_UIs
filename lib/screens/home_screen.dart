import 'package:flutter/material.dart';
import 'package:flutter_day_7/contstant/colors.dart';
import 'package:flutter_day_7/data/data.dart';
import 'package:flutter_day_7/model/task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TaskModel> tasksList = [];
  void getData() {
    for (var item in tasks) {
      TaskModel cityModel = TaskModel.fromJson(item);
      tasksList.add(cityModel);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.list_outlined),
        title: const Text(
          "Taskly",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [const Icon(Icons.notifications_outlined)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Good Morning, Abdu 👋",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Let's be productive today!",
                      style: TextStyle(color: Color.fromARGB(255, 74, 74, 74)),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,10,0),
                  child: CircleAvatar(
                    
                    radius: 32,
                    backgroundImage: AssetImage('assets/icons/Banner.png'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                categoryBox(
                  color: Colors.lightBlue,
                  width: width,
                  icon: (Icons.assignment),
                  mainTitle: "Work",
                  subTitle: "12 Tasks",
                ),
                categoryBox(
                  color: Colors.lightGreen,
                  width: width,
                  icon: (Icons.school),
                  mainTitle: "Study",
                  subTitle: "8 Tasks",
                ),
                categoryBox(
                  color: Colors.orange,
                  width: width,
                  icon: (Icons.favorite),
                  mainTitle: "Personal",
                  subTitle: "5 Tasks",
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's Tasks",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "See all",
                  style: TextStyle(color:AppColors.mainColor,),
                ),
              ],
            ),
            SizedBox(height: 24),

            SizedBox(
              height: 300,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: tasksList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.book_rounded),
                    title: Text(
                      tasksList[index].title!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(tasksList[index].time!),
                    trailing: const Icon(Icons.square_outlined),
                  );
                },
              ),
            ),
            SizedBox(height: 24),
            Container(
              width: width,
              height: height * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.mainColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  
                  Image.asset("assets/icons/tree.png",width: 150,height: 150,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('"Small Progress Everyday',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      Text('Leads To Big Results."',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF7D6EE1),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stats'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

Widget categoryBox({
  required Color color,
  required double width,
  required IconData icon,
  required String mainTitle,
  required String subTitle,
}) {
  return Container(
    width: width * 0.285,
    height: width * 0.285,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: color.withValues(alpha: 0.1),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: color,
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        Column(
          children: [
            Text(mainTitle, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              subTitle,
              style: TextStyle(color: const Color.fromARGB(255, 94, 94, 94)),
            ),
          ],
        ),
      ],
    ),
  );
}
