import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: DateSelection(),
  ));
}

class DateSelection extends StatefulWidget {
  const DateSelection({super.key});

  @override
  State<DateSelection> createState() => _DateSelectionState();
}

class _DateSelectionState extends State<DateSelection> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: TextField(
          controller: TextEditingController(
              text: "${selectedDate.toLocal()}".split(" ")[0]),
          onTap: () => selectDate(context),
          readOnly: true,
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Select Date",
              suffixIcon: Icon(Icons.calendar_month)),
        ),
      ),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }
}


/*
* selectedDate.toLocal(): This converts the selectedDate to the local time zone. toLocal() is used to convert the DateTime object from UTC to the local time zone.

.split(' '): This splits the string into a list of substrings using the space character (' ') as the delimiter.
For example, if the string is '2022-01-11 12:34:56.789', the result would be ['2022-01-11', '12:34:56.789'].
[0]: This retrieves the first element (index 0) from the list obtained after splitting. In the example, it would be '2022-01-11'.

So, the expression effectively extracts the date part from the formatted string of the local date and time.

If you have a specific format in mind for displaying the date, you might want to use the intl package for more advanced formatting.
*
* */