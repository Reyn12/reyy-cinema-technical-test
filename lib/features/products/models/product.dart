class Product {
  const Product({
    required this.id,
    required this.name,
    required this.price,
    this.stock = 0,
    this.description,
  });

  final int id;
  final String name;
  final int price;
  final int stock;
  final String? description;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: (json['id'] as num).toInt(),
      name: (json['nama_produk'] ?? json['name']) as String,
      price: ((json['harga'] ?? json['price']) as num).toInt(),
      stock: json['stok'] == null ? 0 : (json['stok'] as num).toInt(),
      description: json['deskripsi']?.toString(),
    );
  }
}

