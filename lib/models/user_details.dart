
class UserDetails {
  final String name;
  final String mobileNumber;
  final String nicOrkey;
  final String email;
  final String userType;

  UserDetails({
    required this.name,
    required this.mobileNumber,
    required this.nicOrkey,
    required this.email,
    required this.userType,
  });

  Map<String, dynamic> toFirestore() {
    final data = {
      'name':name,
      'mobileNumber':mobileNumber,
      'nicOrkey':nicOrkey,
      'email':email,
      'userType': userType,
    };
    print("Data to be saved to Firestore: $data");
    return data;
  }

  factory UserDetails.fromFirestore(Map<String, dynamic> data) {
    return UserDetails(
      name: data['name'] ?? '',
      mobileNumber: data['mobileNumber'] ?? '',
      nicOrkey: data['nicOrkey'] ?? '',
      email: data['email'] ?? '',
      userType: data['userType'] ?? '',
    );
  }

  
}