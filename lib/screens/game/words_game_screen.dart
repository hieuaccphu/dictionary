import 'package:dictionary/data/models/vocabulary_model/vocabulary_model.dart';
import 'package:dictionary/data/services/training_service.dart';
import 'package:dictionary/data/services/user_service.dart';
import 'package:dictionary/data/services/vocabulary_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../res/themes.dart';

class WordsGameScreen extends StatelessWidget {
  const WordsGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          print('tapped');
          var user = await UserService().getAllUserData();
          print(
            DateFormat("dd/MM/yyyy").format(
              DateTime.parse(user[3].dateOfBirth!),
            ),
          );
        },
        child: Container(
          width: 65,
          decoration: AppContainerStyle.border.copyWith(
            color: AppColors.yellow,
          ),
          child: const Icon(
            Icons.home_filled,
            color: AppColors.black,
            size: 35,
          ),
        ),
      ),
    );
  }
}
