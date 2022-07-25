class ProductModel {
  Data? data;

  ProductModel({this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? currentPage;
  List<ProductData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  Null? nextPageUrl;
  String? path;
  int? perPage;
  Null? prevPageUrl;
  int? to;
  int? total;

  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total
  });

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(ProductData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class ProductData {
  int? id;
  int? color;
  int? talla;
  int? subcategoria;
  String? referenciaprod;
  String? nombreprod;
  String? descripcionprod;
  int? stock;
  int? preciounitario;
  int? preciofinal;
  int? preciodescuento;
  int? porcentajedescuento;
  int? existenciaprod;
  int? total;
  String? imgprod1;
  String? imgprod2;
  String? imgprod3;
  String? imgprod4;
  String? fechacreacion;
  String? fechamodificacion;

  ProductData({
    this.id,
    this.color,
    this.talla,
    this.subcategoria,
    this.referenciaprod,
    this.nombreprod,
    this.descripcionprod,
    this.stock,
    this.preciounitario,
    this.preciofinal,
    this.preciodescuento,
    this.porcentajedescuento,
    this.existenciaprod,
    this.total,
    this.imgprod1,
    this.imgprod2,
    this.imgprod3,
    this.imgprod4,
    this.fechacreacion,
    this.fechamodificacion
  });

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color = json['color'];
    talla = json['talla'];
    subcategoria = json['subcategoria'];
    referenciaprod = json['referenciaprod'];
    nombreprod = json['nombreprod'];
    descripcionprod = json['descripcionprod'];
    stock = json['stock'];
    preciounitario = json['preciounitario'];
    preciofinal = json['preciofinal'];
    preciodescuento = json['preciodescuento'];
    porcentajedescuento = json['porcentajedescuento'];
    existenciaprod = json['existenciaprod'];
    total = json['total'];
    imgprod1 = json['imgprod1'];
    imgprod2 = json['imgprod2'];
    imgprod3 = json['imgprod3'];
    imgprod4 = json['imgprod4'];
    fechacreacion = json['fechacreacion'];
    fechamodificacion = json['fechamodificacion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['color'] = color;
    data['talla'] = talla;
    data['subcategoria'] = subcategoria;
    data['referenciaprod'] = referenciaprod;
    data['nombreprod'] = nombreprod;
    data['descripcionprod'] = descripcionprod;
    data['stock'] = stock;
    data['preciounitario'] = preciounitario;
    data['preciofinal'] = preciofinal;
    data['preciodescuento'] = preciodescuento;
    data['porcentajedescuento'] = porcentajedescuento;
    data['existenciaprod'] = existenciaprod;
    data['total'] = total;
    data['imgprod1'] = imgprod1;
    data['imgprod2'] = imgprod2;
    data['imgprod3'] = imgprod3;
    data['imgprod4'] = imgprod4;
    data['fechacreacion'] = fechacreacion;
    data['fechamodificacion'] = fechamodificacion;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}