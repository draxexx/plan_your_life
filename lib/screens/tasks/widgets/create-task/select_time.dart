import '../../../../index.dart';

class SelectTime extends StatelessWidget {
  const SelectTime({
    super.key,
    required this.title,
    required this.time,
    required this.onTap,
  });

  final String title, time;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: MyColors.grayLight20,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: CustomAppIcon(
                icon: Icons.watch_later_outlined,
                color: MyColors.grayLight,
                size: 32,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textBuilder(
                title,
                textType: TextType.subText3,
                color: MyColors.grayLight,
              ),
              const SizedBox(height: 4),
              textBuilder(
                time,
                textType: TextType.subText2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
