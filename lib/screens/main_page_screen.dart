import 'package:easy_plan/utils/colors.dart';
import 'package:easy_plan/utils/fonts.dart';
import 'package:easy_plan/widgets/break_line.dart';
import 'package:easy_plan/widgets/notepad_sheet_list.dart';
import 'package:easy_plan/widgets/separator.dart';
import 'package:flutter/material.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({super.key});

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.commonBackground,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Header(),
              BreakLine(),
              FirstElement(),
              BreakLine(),
              SecondElement(),
              BreakLine(),
              ThirdElement(),
              BreakLine(),
              FourthComponent(),
              BreakLine(),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstElement extends StatelessWidget {
  const FirstElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 45, bottom: 34, left: 40, right: 40),
      height: 828,
      // constraints: const BoxConstraints.expand(height: 4000),
      child: const Column(
        // runSpacing: 50,
        // crossAxisAlignment: WrapCrossAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NotepadSheetList(),
          // Container(
          //   width: double.infinity,
          //   alignment: Alignment.center,
          //   child: const Text('Работаешь один?', style: AppTypography.black52BR,),
          // ),
          Flexible(
            child: Text(
              'Работаешь один?',
              style: AppTypography.black52BR,
            ),
          ),
        ],
      ),
    );
  }
}

class SecondElement extends StatelessWidget {
  const SecondElement({super.key});

  final String text =
      'Easy Plan - единое пространство управления командными и индивидуальными проектами';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 828,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Image(
            image: AssetImage('image/main_screen_second_component.png'),
            fit: BoxFit.fill,
          ),
          const SeparatorHorizontal(
            width: 80,
          ),
          Flexible(
            child: Text(
              text,
              style: AppTypography.black39BB,
            ),
          ),
        ],
      ),
    );
  }
}

class ThirdElement extends StatelessWidget {
  const ThirdElement({super.key});

  final String bottomText = 'Нужна доска для командной работы?';
  static List<String> listItems = [
    'Управляй задачами',
    'Работай в команде',
    'Создавай колонки и темы',
    'Составляй цепочки'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 828,
      // width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Image(
                image: AssetImage('image/board.png'),
                fit: BoxFit.fill,
              ),
              Column(
                children: listItems.map((data) {
                  return NotepadListItem(text: data);
                }).toList(),
              ),
            ],
          ),
          const SeparatorVertical(height: 30),
          SizedBox(
            child: Flexible(
              child: Text(
                bottomText,
                style: AppTypography.black52BR,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FourthComponent extends StatelessWidget {
  const FourthComponent({super.key});

  final String text = 'Попробуй Easy Plan прямо сейчас';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
      child: Row(
        children: [
          const Image(
            image: AssetImage('image/main_screen_fourth_component.png'),
            fit: BoxFit.fill,
          ),
          Expanded(
            child: Container(
              // height: 100,
              color: AppColors.startPageGreen,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    text,
                    style: AppTypography.black39BB,
                  ),
                  GestureDetector(
                    child: Container(
                      height: 110,
                      width: 540,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.registrationButton,
                          border: Border.all(width: 1, color: AppColors.black),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(35))),
                      child: const Text(
                        'Зарегистрироваться',
                        style: AppTypography.white47R,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('image/logo.png'),
          ),
          SeparatorHorizontal(width: 37),
          MenuItem(
            text: 'Продукты',
          ),
          MenuItem(
            text: 'Тарифы',
          ),
          MenuItem(
            text: 'Компания',
          ),
          Expanded(
            child: SizedBox(),
          ),
          ProfileIcon(),
        ],
      ),
    );
  }
}

class MenuItem extends StatefulWidget {
  const MenuItem({super.key, required this.text});

  final String text;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

enum SampleItem { itemOne, itemTwo, itemThree }

const itemsLists = [[],[],[]];

class _MenuItemState extends State<MenuItem> {
  bool isActive = false;
  SampleItem? selectedMenu;

  changeState() {
    setState(() {
      isActive = !isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return TextButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: 190,
            height: 63,
            alignment: Alignment.center,
            child: Text(
              widget.text,
              style: AppTypography.black35B,
            ),
          ),
        );
      },
      menuChildren: List<MenuItemButton>.generate(
        3,
        (int index) => MenuItemButton(
          style: ButtonStyle(

          ),
          onPressed: () =>
              setState(() => selectedMenu = SampleItem.values[index]),
          child: Container(
              color: AppColors.commonBackground,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: 190,
              height: 63,
              alignment: Alignment.center,
              child: Text(
                'Item ${index + 1}',
                style: AppTypography.black35B,
              )),
        ),
      ),
    );
  }
}

// class MenuItem extends StatefulWidget {
//   const MenuItem({super.key, required this.text});

//   final String text;

//   @override
//   State<MenuItem> createState() => _MenuItemState();
// }

// enum SampleItem { itemOne, itemTwo, itemThree }

// class _MenuItemState extends State<MenuItem> {
//   bool isActive = false;
//   SampleItem? selectedMenu;

//   changeState() {
//     setState(() {
//       isActive = !isActive;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => changeState(),
//       child: Stack(clipBehavior: Clip.none, children: [
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           width: 190,
//           height: 43,
//           alignment: Alignment.center,
//           child: MenuAnchor(
//             builder: (BuildContext context, MenuController controller,
//                 Widget? child) {
//               return TextButton(
//                 onPressed: () {
//                   if (controller.isOpen) {
//                     controller.close();
//                   } else {
//                     controller.open();
//                   }
//                 },

//                 child: Text(
//                   widget.text,
//                   style: AppTypography.black35B,
//                 ),
//               );
//             },
//             menuChildren: List<MenuItemButton>.generate(
//               3,
//               (int index) => MenuItemButton(
//                 onPressed: () =>
//                     setState(() => selectedMenu = SampleItem.values[index]),
//                 child: Text('Item ${index + 1}'),
//               ),
//             ),
//           ),
//         ),
//         (isActive)
//             ? Container(
//                 height: 300,
//                 width: 200,
//                 color: AppColors.black,
//                 child: Text(
//                   'hello',
//                   style: AppTypography.white47R,
//                 ),
//               )
//             : const SizedBox(),
//       ]),
//     );
//   }
// }

//Text(widget.text, style: AppTypography.black35B),

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushReplacementNamed('/login_screen'),
      child: Container(
        height: 68,
        width: 68,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(34),
            ),
            color: AppColors.black),
        child: const Icon(
          Icons.person_rounded,
          size: 54,
          color: AppColors.white,
        ),
      ),
    );
  }
}
