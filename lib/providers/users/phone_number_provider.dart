import 'package:flutter_riverpod/flutter_riverpod.dart';

// Global state for the user's phone number
final phoneNumberProvider = StateProvider<String>((ref) => '');
