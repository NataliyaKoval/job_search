class CompanyRequestBody {
  const CompanyRequestBody({
    required this.name,
    required this.description,
    required this.industry,
  });

  final String name;
  final String description;
  final String industry;
}
