import 'package:flutter/material.dart';
import 'package:job_search/domain/models/company.dart';
import 'package:job_search/presentation/single_company_screen/widget/single_company_screen.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({Key? key, required this.company}) : super(key: key);

  final Company company;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) =>
                SingleCompanyScreen(company: company),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        color: const Color(0xF9EAE5AE),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 30),
              child: FlutterLogo(),
            ),
            Column(
              children: [
                Text(
                  company.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(company.industry,
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
