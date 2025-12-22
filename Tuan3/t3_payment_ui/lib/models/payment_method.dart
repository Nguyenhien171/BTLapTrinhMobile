class PaymentMethod {
  final String name;
  final String icon;      // Icon nhỏ trong danh sách
  final String largeLogo; // Logo lớn hiển thị ở Header
  bool isSelected;

  PaymentMethod({
    required this.name,
    required this.icon,
    required this.largeLogo,
    this.isSelected = false,
  });
}