class OnBoardingModel {
  final String image;
  final String title;
  final String subTitle;
  final String logo;
  final String? skip;
  final String button;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.logo,
    required this.button,
    this.skip,
    this.subTitle =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.",
  });
}