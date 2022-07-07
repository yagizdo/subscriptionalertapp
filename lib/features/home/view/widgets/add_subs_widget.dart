import 'package:date_time_picker/date_time_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:subscriptionalertapp/core/services/theme/theme_service.dart';

import '../../../../core/locators/locators.dart';

class AddSubsWidget extends StatelessWidget {
  const AddSubsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeService = locator<ThemeService>();

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Add Subscription"),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Add",
              style: themeService.textStyle.button,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(8.0),
              onTap: () {},
              splashColor: Colors.grey.withOpacity(0.1),
              child: Ink(
                height: 150.h,
                width: 350.w,
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF3366FF),
                      Color(0xFF00CCFF),
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "NETFLIX",
                              style:
                                  themeService.textStyle.bodyMedium!.copyWith(
                                fontSize: 18,
                              ),
                            ),
                            Text("Description (Optional)"),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("8,99 TL",
                                style:
                                    themeService.textStyle.bodyMedium!.copyWith(
                                  fontSize: 18,
                                )),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text("monthly"),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Upcoming payment: ",
                            style: themeService.textStyle.bodyMedium!.copyWith(
                              fontSize: 17,
                            )),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text("27 April 2022"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Form(
              key: GlobalKey(),
              child: Column(children: [
                //create TextFormFields for color, price, annual, paymentDate
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.title),
                    labelText: "Name",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a name";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 8.sm,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.title),
                    labelText: "Description",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a description";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 8.sm,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 20.r,
                      child: CircleAvatar(
                        radius: 17.r,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 15.r,
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 20.r,
                      child: CircleAvatar(
                        radius: 17.r,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 15.r,
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 20.r,
                      child: CircleAvatar(
                        radius: 17.r,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 15.r,
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 20.r,
                      child: CircleAvatar(
                        radius: 17.r,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 15.r,
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.sm,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.title),
                    labelText: "Price",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a price";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 8.sm,
                ),
                DropdownButton<String>(
                  value: "Monthly", //dropdownValue,
                  elevation: 16,

                  onChanged: (String? newValue) {
                    //dropdownValue = newValue!;
                  },
                  items: <String>["Monthly", "Yearly"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 8.sm,
                ),
                DateTimePicker(
                  type: DateTimePickerType.date,
                  dateMask: 'd MMMM, yyyy',
                  initialValue: DateTime.now().toString(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.title),
                    labelText: "Date",
                    border: OutlineInputBorder(),
                  ),
                  selectableDayPredicate: (date) {
                    return true;
                  },
                  onChanged: (val) => print(val),
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  onSaved: (val) => print(val),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
