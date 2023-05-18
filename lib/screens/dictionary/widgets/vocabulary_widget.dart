import 'package:dictionary/data/services/user_service.dart';
import 'package:dictionary/providers/user_provider.dart';
import 'package:dictionary/res/images.dart';
import 'package:dictionary/screens/dictionary/widgets/pronounce_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/models/vocabulary_model/vocabulary_model.dart';
import '../../../res/themes.dart';

class VocabularyWidget extends StatelessWidget {
  final Vocabulary vocabulary;
  const VocabularyWidget({
    super.key,
    required this.vocabulary,
  });

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context).currentUser;
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: AppContainerStyle.border.copyWith(
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Text(
                      vocabulary.word ?? 'Vocabulary',
                      style: AppTextStyle.bold15,
                    ),
                    Text(
                      vocabulary.type ?? 'type',
                      style: AppTextStyle.regular15,
                    ),
                    Text(
                      vocabulary.phonetics ?? 'phonetics',
                      style: AppTextStyle.phonetics,
                    )
                  ],
                ),
              ),
              vocabulary.pronounce != null
                  ? Expanded(
                      flex: 1,
                      child: PronounceWidget(url: vocabulary.pronounce ?? ''),
                    )
                  : const Icon(
                      CupertinoIcons.speaker_3,
                      size: 40,
                    ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () async {
                    await UserFavoriteCollectionService()
                        .markFavoriteVocabulary(
                      userId: userProvider!.id!,
                      vocabularyId: vocabulary.id!,
                    );
                  },
                  child: const Icon(
                    CupertinoIcons.bookmark_fill,
                    size: 50,
                    color: AppColors.darkBrown,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Divider(
            thickness: 3,
            indent: 20,
            endIndent: 20,
            color: AppColors.black,
          ),
          const SizedBox(height: 30),
          vocabulary.image != null
              ? Image.network(
                  vocabulary.image!,
                  scale: 3,
                )
              : Image.asset(
                  DictionaryScreenImage.blank,
                  scale: 5,
                ),
          const SizedBox(height: 30),
          Text(
            'Meaning',
            style: AppTextStyle.medium25,
          ),
          Text(
            vocabulary.meaning ?? 'Meaning of the vocabulary',
            style: AppTextStyle.regular15,
            overflow: TextOverflow.visible,
          ),
          const SizedBox(height: 30),
          Text(
            'Example',
            style: AppTextStyle.medium25,
          ),
          Text(
            vocabulary.hint ?? 'Example of the vocabulary',
            style: AppTextStyle.regular15,
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    );
  }
}
