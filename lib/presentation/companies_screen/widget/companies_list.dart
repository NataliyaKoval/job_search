import 'package:flutter/material.dart';
import 'package:job_search/domain/models/company.dart';
import 'package:job_search/presentation/companies_screen/widget/company_card.dart';

class CompaniesList extends StatelessWidget {
  const CompaniesList({Key? key, required this.companies}) : super(key: key);

  final List<Company> companies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: companies.length,
        itemBuilder: (context, index) =>
            CompanyCard(company: companies[index],),
      ),
    );
  }
}
