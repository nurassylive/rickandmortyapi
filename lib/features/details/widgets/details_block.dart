import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rickandmortyapi/features/details/widgets/custom_divider.dart';
import 'package:rickandmortyapi/shared/constants/global.dart';
import 'package:rickandmortyapi/shared/models/character.dart';

class DetailsBlock extends StatelessWidget {
  final Character character;

  const DetailsBlock({
    Key? key,
    required this.character,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(character.image),
                maxRadius: 50.w,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    character.name,
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Text('Gender: '),
              const SizedBox(width: 20),
              Icon(genderIcon(character.gender)),
              const SizedBox(width: 6),
              Text(character.gender),
            ],
          ),
          const CustomDivider(),
          Row(
            children: [
              const Text('Status: '),
              const SizedBox(width: 20),
              Text(
                character.status,
                style: TextStyle(
                  color: character.status == 'Alive'
                      ? Colors.green
                      : character.status == 'Died'
                          ? Colors.red
                          : Colors.grey,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Episodes',
            style: TextStyle(
              fontSize: 20.sp,
              decoration: TextDecoration.underline,
            ),
          ),
          const SizedBox(height: 20),
          if (character.episode != null && character.episode!.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: character.episode!.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        (index + 1).toString(),
                        style: TextStyle(
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      flex: 12,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          character.episode![index],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          if (character.episode == null || character.episode!.isEmpty)
            const Text('No episodes'),
        ],
      ),
    );
  }
}
