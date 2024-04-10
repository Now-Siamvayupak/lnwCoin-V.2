import 'package:lnwcoin/model/companies_model.dart';
import 'package:lnwcoin/widgets/companies_widget.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CompaniesComponent extends StatefulWidget {
  static String tag = '/CompaniesComponent';
  final CompaniesModel? companiesData;

  CompaniesComponent({this.companiesData});

  @override
  CompaniesComponentState createState() => CompaniesComponentState();
}

class CompaniesComponentState extends State<CompaniesComponent> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: widget.companiesData!.companies!.length,
      padding: EdgeInsets.only(top: 60, bottom: 16, right: 16, left: 16),
      itemBuilder: (context, index) {
        Company companiesData = widget.companiesData!.companies![index];
        return CompaniesWidget(companiesData: companiesData).paddingBottom(16);
      },
    );
  }
}
