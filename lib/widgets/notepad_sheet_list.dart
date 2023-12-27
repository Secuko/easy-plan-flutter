import 'package:easy_plan/utils/colors.dart';
import 'package:easy_plan/utils/fonts.dart';
import 'package:easy_plan/widgets/separator.dart';
import 'package:flutter/material.dart';

final List<NotepadInfo> notepadList = [
  NotepadInfo(
    'Планируй',
    ['Создавай задачи', 'Устанавливай сроки', 'Определяй приоритет'],
    AppColors.notepadYellow,
  ),
  NotepadInfo(
    'Отслеживай',
    ['Следи за временем', 'Прогресс-бары задач'],
    AppColors.notepadBlue,
  ),
  NotepadInfo(
    'Завершай',
    ['Статистика', 'История задачи', 'Возвращайся к задаче'],
    AppColors.notepadFiol,
  ),
];

class NotepadInfo {
  NotepadInfo(this.header, this.list, this.color);
  String header;
  List<String> list;
  Color color;
}

class NotepadSheetList extends StatelessWidget {
  const NotepadSheetList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        alignment: Alignment.topCenter,
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          runSpacing: 40,
          spacing: 40,
          children: [
            NotepadSheet(notepadInfo: notepadList[0]),
            NotepadSheet(notepadInfo: notepadList[1]),
            NotepadSheet(notepadInfo: notepadList[2]),
          ],
        ),
      ),
    );
  }
}

class NotepadSheet extends StatelessWidget {
  const NotepadSheet({super.key, required this.notepadInfo});

  final NotepadInfo notepadInfo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 645,
      width: 395,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        border: Border.all(color: AppColors.black, width: 1),
        color: notepadInfo.color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const PinIcon(),
          NotepadHeader(
            text: notepadInfo.header,
          ),
          const SeparatorVertical(height: 70),
          NotepadList(
            list: notepadInfo.list,
          ),
        ],
      ),
    );
  }
}

class NotepadHeader extends StatelessWidget {
  const NotepadHeader({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.black39BB,
    );
  }
}

class NotepadList extends StatelessWidget {
  const NotepadList({super.key, required this.list});

  final List<String> list;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) {
            return const SeparatorVertical(height: 25);
          },
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return NotepadListItem(
              text: list[index],
            );
          }),
    );
  }
}

class NotepadListItem extends StatelessWidget {
  const NotepadListItem({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 700,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.check,
            size: 40,
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
            child: Text(
              text,
              style: AppTypography.black32BR,
              softWrap: true,
            ),
          )
        ],
      ),
    );
  }
}

class PinIcon extends StatelessWidget {
  const PinIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 40,
      width: 40,
      child: Image(
        image: AssetImage('image/pin.png'),
        fit: BoxFit.fill,
      ),
    );
  }
}
