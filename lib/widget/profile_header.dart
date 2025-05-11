import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
typedef editFunction =void Function();
class ProfileHeader extends StatelessWidget {
  editFunction onClick;
  String name;
  String email;
  ProfileHeader({super.key,required this.name,required this.email,required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/login_background.png'),
          ),
          SizedBox(width: 7.w),
          Column(
            children: [
              Text(
                name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              Text(
                email,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(width: 8.w),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.grey),
            onPressed: onClick,
          )
        ],
      ),
    );
  }
}
