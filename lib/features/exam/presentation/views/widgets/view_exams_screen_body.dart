import 'package:flutter/material.dart';
import 'package:teachers_dashboard/generated/l10n.dart';

class ViewExamsScreenBody extends StatelessWidget {
  const ViewExamsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text(S.of(context).examsViewComingSoon),)],
    );
  }
}
