String formatDate(String dateString) {
  try {
    final parts = dateString.split('-');

    if (parts.length != 3) {
      return dateString;
    }

    final year = parts[0];

    var month = parts[1];
    if (month.length == 1) {
      month = '0$month';
    }

    var day = parts[2];
    if (day.length == 1) {
      day = '0$day';
    }
    return '$day.$month.$year';
  } on Exception catch (_) {
    return dateString;
  }
}
