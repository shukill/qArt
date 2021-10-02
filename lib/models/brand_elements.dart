class BrandElement {
  BrandElement({
    required this.name,
    required this.moq,
  });

  String name;
  int moq;

  factory BrandElement.fromJson(Map<String, dynamic> json) => BrandElement(
        name: json["Name"],
        moq: json["MOQ"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "MOQ": moq,
      };
}
