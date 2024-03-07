import 'package:bs23_task/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

import '../../widgets/app_bar/custom_app_bar.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text(
          'Details Page',
          style: TextStyle(
            fontSize: 19.fSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            print('object');
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        leadingWidth: 40.h,
        centerTitle: true,
        height: 54.v,

      ),
      body: Padding(
        padding: EdgeInsets.all(16.adaptSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Photo
            Container(
              width: 120.h,
              height: 120.v,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage('https://images.pexels.com/photos/674010/pexels-photo-674010.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 16.v),

            // Name
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24.fSize,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8.v),

            // Description
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
            ),
             SizedBox(height: 16.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Text.rich(
                TextSpan(
                  text: 'Last Update: ',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w600, // Make "Last Update: " bold
                  ),
                  children: [
                    TextSpan(
                      text: '${DateTime.now().month.toString().padLeft(2, '0')}-'
                          '${DateTime.now().day.toString().padLeft(2, '0')}-'
                          '${DateTime.now().year.toString().padLeft(2, '0')} '
                          '${DateTime.now().hour.toString().padLeft(2, '0')}:'
                          '${DateTime.now().minute.toString().padLeft(2, '0')}',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
