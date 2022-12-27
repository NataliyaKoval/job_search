class CompanyRequestBody {
  const CompanyRequestBody({
    required this.title,
    required this.description,
    required this.city,
    required this.companyId,
  });

  final String title;
  final String description;
  final String city;
  final int companyId;
}
