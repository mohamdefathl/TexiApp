import 'package:intl/intl.dart';

String getElapsedTime(DateTime createdAt) {
  Duration difference = DateTime.now().difference(createdAt);

  if (difference.inDays > 0) {
    return DateFormat('dd MMM yyyy').format(createdAt);
  } else if (difference.inHours > 0) {
    return '${difference.inHours} ساعة';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} دقيقة';
  } else {
    return 'الآن';
  }
}