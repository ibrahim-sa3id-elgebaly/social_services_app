import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


typedef editFunction = void Function();

class ProfileHeader extends StatelessWidget {
  editFunction onClick;
  String name;
  String email;

  ProfileHeader({
    super.key,
    required this.name,
    required this.email,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
          SizedBox(width: 7.w),
          Column(
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                email,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
          SizedBox(width: 5.w),
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.grey),
            onPressed: onClick,
          )
        ],
      ),
    );
  }
}
