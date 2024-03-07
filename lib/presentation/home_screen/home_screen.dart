import 'package:bs23_task/core/utils/color_constant.dart';
import 'package:bs23_task/core/utils/size_utils.dart';
import 'package:bs23_task/presentation/details_screen/details_screen.dart';
import 'package:bs23_task/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      // call your api here
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          title: Text(
            'Repository List',
            style: TextStyle(fontSize: 19.fSize, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          height: 54.v,
          actions: [
            PopupMenuButton(
              onSelected: (value) {
                // Handle the selected option
                print('Selected option: $value');
              },
              itemBuilder: (BuildContext context) {
                return ['Filter by Date', 'Filter by star'].map((String option) {
                  return PopupMenuItem(
                    value: option,
                    child: Text(option),
                  );
                }).toList();
              },
            ),
          ],
        ),
        body: ListView.separated(
          controller: scrollController,
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            // your code
            return ListTile(
              tileColor: Colors.grey[100],
              title: Text(
                'Your Title',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.adaptSize,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: const Text('Your Subtitle'),
              leading: Icon(
                Icons.star,
                color: Colors.amber,
                size: 24.adaptSize,
              ),
              trailing: Icon(
                Icons.arrow_forward,
                color: Colors.blue,
                size: 24.adaptSize,
              ),
              // contentPadding: EdgeInsets.only(bottom: 16.0),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const DetailsPage()));
              },
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 4.v);
          },
        ),
      ),
    );
  }
}
