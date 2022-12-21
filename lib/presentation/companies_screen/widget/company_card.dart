import 'package:flutter/material.dart';
import 'package:job_search/domain/models/company.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({Key? key, required this.company}) : super(key: key);

  final Company company;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
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
