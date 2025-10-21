/// Contact form model for handling user messages
class ContactForm {
  final String name;
  final String email;
  final String message;
  final DateTime timestamp;

  ContactForm({
    required this.name,
    required this.email,
    required this.message,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  factory ContactForm.fromJson(Map<String, dynamic> json) {
    return ContactForm(
      name: json['name']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      message: json['message']?.toString() ?? '',
      timestamp: json['timestamp'] != null
          ? DateTime.tryParse(json['timestamp'].toString()) ?? DateTime.now()
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  ContactForm copyWith({
    String? name,
    String? email,
    String? message,
    DateTime? timestamp,
  }) {
    return ContactForm(
      name: name ?? this.name,
      email: email ?? this.email,
      message: message ?? this.message,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  String toString() {
    return 'ContactForm(name: $name, email: $email, message: $message, timestamp: $timestamp)';
  }
}
