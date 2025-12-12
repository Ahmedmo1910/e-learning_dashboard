import 'package:flutter/material.dart';
import 'package:teachers_dashboard/core/widgets/custom_app_bar.dart';
import 'package:teachers_dashboard/generated/l10n.dart';
import 'widgets/view_exams_screen_body.dart';

class ViewExamsScreen extends StatelessWidget {
  const ViewExamsScreen({super.key});
  static const String routeName = 'ViewExamsScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title:  S.of(context).allExams),
      body: const ViewExamsScreenBody(),
    );
  }
}
