import 'package:consulto/features/auth/domain/entities/entities.dart';

//? this class should use the super keyword to call the needed data
//? the data that we do not need call it define it here and use this keyword in the constructor
//? while the data that you need call it using super keyword

class Models extends Entities {
  final String? extraData; // Example of an additional field

  Models({
    required String id, // Inherited from Entities
    required String name, // Inherited from Entities
    this.extraData, // Defined in Models
  }) : super(
        //id: id, name: name
        );

  // Factory constructor for creating an instance from JSON
  factory Models.fromJson(Map<String, dynamic> json) {
    return Models(
      id: json['id'], // Using API key from JSON
      name: json['name'], // Using API key from JSON
      extraData: json['extraData'], // Extra field in Models
    );
  }

  // Convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      // 'id': id, // Superclass field
      // 'name': name, // Superclass field
      'extraData': extraData, // Extra field in Models
    };
  }
}


//! create the constructor
//! create the factory fromJson and use the ApiKey in the EndPoint and copy paste the keys
//! create the toJson function


//! create the fromJson and toJson also in the subModels