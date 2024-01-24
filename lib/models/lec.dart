class Lecturer {
  final String name;
  final String department;
  final String email;
  final String mobile;
  final String profileImage;
  final String role;
  final String roomNo;
  final String specialist;
  final List<String> subjects;

  Lecturer({
    required this.name,
    required this.department,
    required this.email,
    required this.mobile,
    required this.profileImage,
    required this.role,
    required this.roomNo,
    required this.specialist,
    required this.subjects,
  });

  // This method will convert the lecturer data to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'department': department,
      'email': email,
      'mobile': mobile,
      'profileImage': profileImage,
      'role': role,
      'roomNo': roomNo,
      'specialist': specialist,
      'subjects': subjects,
    };
  }

  // This method will convert the JSON object to lecturer data
  // Here, a factory constructor is used to return a new instance of the class
  factory Lecturer.fromJson(Map<String, dynamic> json) {
    return Lecturer(
      name: json['name'],
      department: json['department'],
      email: json['email'],
      mobile: json['mobile'],
      profileImage: json['profileImage'],
      role: json['role'],
      roomNo: json['roomNo'],
      specialist: json['specialist'],
      subjects: List<String>.from(json['subjects']),
    );
  }
}
