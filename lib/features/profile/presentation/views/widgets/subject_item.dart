import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teachers_dashboard/core/utils/app_colors.dart';
import 'package:teachers_dashboard/core/utils/app_text_styles.dart';
import 'package:teachers_dashboard/generated/l10n.dart';

class SubjectItem extends StatelessWidget {
  final String name;
  final String? id;
  final String sort;
  final VoidCallback? onLongPress;
  final VoidCallback? onDoubleTap;
  final String? description;

  const SubjectItem({
    super.key,
    required this.name,
    this.id,
    this.sort = '',
    this.onLongPress,
    this.onDoubleTap,
    this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onDoubleTap: onDoubleTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.menu_book_outlined,
                  size: 24,
                  color: AppColors.primaryColor,
                ),
                const SizedBox(height: 8),
                Text(sort, style: AppTextStyles.semiBold16),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: AppTextStyles.bold16),
                  const SizedBox(height: 6),
                  if (id != null) ...[
                    Text(
                      id!,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.regular14.copyWith(
                        color: AppColors.greyColor,
                      ),
                    ),
                  ],
                  if (description != null) ...[
                    const SizedBox(height: 6),
                    Text(description!, style: AppTextStyles.regular14),
                  ],
                ],
              ),
            ),
            Visibility(
              visible: id != null,
              child: IconButton(
                icon: const Icon(Icons.copy),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: id ?? ''));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(S.of(context).copied),
                      duration: Duration(milliseconds: 800),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
