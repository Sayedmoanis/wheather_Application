class DateTimeUtils {
  static String getHumidityStatus(double humidity) {
    if (humidity <= 30) {
      return "Low";
    } else if (humidity <= 60) {
      return "Normal";
    } else if (humidity <= 80) {
      return "High";
    } else {
      return "Very High";
    }
  }

  static String getDayName(String date) {
    DateTime parsedDate = DateTime.parse(date);
    List<String> days = [
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
      "Sunday",
    ];
    return days[parsedDate.weekday - 1];
  }

  static String getFormattedDate(String localtime) {
    DateTime dateTime = DateTime.parse(localtime);

    List<String> months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];

    return "${dateTime.day} ${months[dateTime.month - 1]}";
  }
}
