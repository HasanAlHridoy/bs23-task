import 'package:bs23_task/core/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../widgets/app_bar/custom_app_bar.dart';

class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> ownerData;

  const DetailsPage({super.key, required this.ownerData});

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
                  image: NetworkImage(ownerData['owner']['avatar_url']),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 16.v),

            // Name
            Text(
              ownerData['name'],
              style: TextStyle(
                fontSize: 24.fSize,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 8.v),

            // Description
            Text(
              ownerData['description'],
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
                      text: (ownerData['updated_at'] != null)
                          ? DateFormat('MM-dd-yy HH:mm').format(DateTime.parse(ownerData['updated_at'])).toString()
                          : 'N/A',
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
