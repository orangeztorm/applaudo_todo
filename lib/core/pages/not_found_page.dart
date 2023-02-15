import 'package:applaudo_todo/core/core.dart';
import 'package:applaudo_todo/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NotFoundPageState createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: Dimens.dp32,
          horizontal: Dimens.dp16,
        ),
        child: Column(
          children: [
            // Text(
            //   '404',
            //   style: context.theme.textTheme.headline1?.copyWith(
            //     color: context.theme.primaryColor,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            const Divider(),
            // Text(
            //   context.l10n.pageNotFoundMessage,
            //   style: context.theme.textTheme.headline5,
            //   textAlign: TextAlign.center,
            // ),
            const SizedBox(height: Dimens.dp20),
            ElevatedButton(
              key: const Key('back_to_home_button_not_found'),
              onPressed: () {
                context.go('/');
              },
              child: Text(context.l10n.backToHomeLabel),
            ),
            const SizedBox(height: Dimens.dp20),
            Image.asset(MainAssets.notFoundImg),
          ],
        ),
      ),
    );
  }
}
