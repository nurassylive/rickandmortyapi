import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rickandmortyapi/shared/constants/global.dart';
import 'package:rickandmortyapi/shared/models/character.dart';

class MainViewContainer extends StatelessWidget {
  final Character character;
  final void Function(Character)? onTap;

  const MainViewContainer({
    Key? key,
    required this.character,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(character.image),
      ),
      title: Text(character.name),
      trailing: Icon(genderIcon(character.gender)),
      dense: true,
      contentPadding: EdgeInsets.symmetric(
        vertical: 2.w,
        horizontal: 5.w,
      ),
      onTap: () => onTap!(character),
    );
  }
}
