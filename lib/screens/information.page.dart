import 'dart:core';
import 'package:covid_scanner/services/generator.service.dart';
import 'package:covid_scanner/services/translation.service.dart';
import 'package:flutter/cupertino.dart';

import 'package:covid_scanner/models/route_arguments.dart';
import 'package:covid_scanner/screens/init.page.dart';
import 'package:covid_scanner/widgets/page_scaffold.dart';
import 'package:flutter/material.dart';

class InformationPage extends StatefulWidget {
  static final pageName = 'information';
  final String title;

  InformationPage({Key? key, required this.title}) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState(title: this.title);
}

class _InformationPageState extends State<InformationPage> {
  final String title;

  final TextEditingController _holderController = TextEditingController();
  final TextEditingController _vaccineController = TextEditingController(text: 'Johnson&Johnson');

  _InformationPageState({ required this.title });

  _createInput(TextEditingController controller) {
    return CupertinoTextField(controller: controller,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: CupertinoColors.white,
          border: Border.all(color: CupertinoColors.lightBackgroundGray, width: 1)
      ),
      style: TextStyle(color: CupertinoColors.black),
    );
  }

  _handleGenerate(String code) async {
    if (_holderController.value.text.isEmpty || _vaccineController.value.text.isEmpty) {
      return;
    }

    await GeneratorService.generateUri(
        code: code,
        holder: _holderController.value.text,
        vaccineType: _vaccineController.value.text,
        onGenerateSuccess: () => Navigator.pushNamedAndRemoveUntil(context, InitPage.pageName, (_) => false),
        onGenerateFailed: (e) => print(e)
    );
  }

  @override
  Widget build(BuildContext context) {
    RouteSettings settings = ModalRoute.of(context)!.settings;
    RouteArguments arguments = settings.arguments as RouteArguments;

    if (settings.arguments == null) {
      Navigator.pushNamedAndRemoveUntil(context, InitPage.pageName, (_) => false);
    }

    return PageScaffold(
        title: title,
        padding: EdgeInsets.zero,
        backgroundColor: CupertinoColors.white,
        child: Container(
            alignment: Alignment.centerLeft,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(padding: EdgeInsets.only(bottom: 10),
                    child: Text(TranslationService.getTranslation('holder_name_label'), textAlign: TextAlign.left)),
                this._createInput(_holderController),
                SizedBox(height: 20),
                Container(padding: EdgeInsets.only(bottom: 10),
                    child: Text(TranslationService.getTranslation('vaccine_type_label'), textAlign: TextAlign.left)),
                this._createInput(_vaccineController),
              ])),
              CupertinoButton(
                child: Text(TranslationService.getTranslation('generate_certificate_button')),
                onPressed: () => _handleGenerate(arguments.code),
              )
            ])
        ));
  }
}
