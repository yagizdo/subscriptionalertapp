part of home_view;

class AddSubsFormWidget extends StatelessWidget {
  const AddSubsFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeViewModel = locator<HomeViewModel>();
    return Form(
      key: homeViewModel.formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: "Platform Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  RadiusConstant.MIN,
                ),
              ),
            ),
            onChanged: (value) {
              homeViewModel.name = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "This field is required";
              }
              return null;
            },
          ),
          SizedBox(
            height: 8.h,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: "Description (Optional)",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  RadiusConstant.MIN,
                ),
              ),
            ),
            onChanged: (value) {
              homeViewModel.description = value;
            },
            
          ),
          SizedBox(
            height: 8.h,
          ),
          SizedBox(
            height: 50.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                final color = homeViewModel.colorList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 50.sm,
                    height: 50.sm,
                    decoration: BoxDecoration(
                      color: Color(color),
                      borderRadius: BorderRadius.circular(
                        RadiusConstant.MIN,
                      ),
                    ),
                    child: Observer(builder: (_) {
                      return Radio(
                        value: index,
                        groupValue: homeViewModel.selectedColorIndex,
                        onChanged: (value) {
                          homeViewModel.selectedColorIndex = value as int;
                        },
                      );
                    }),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        RadiusConstant.MIN,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    homeViewModel.price = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "This field is required";
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                width: 18.w,
              ),
              Observer(builder: (_) {
                return DropdownButton<String>(
                  value: homeViewModel.type,
                  elevation: 16,
                  onChanged: (String? newValue) {
                    homeViewModel.type = newValue!;
                  },
                  items: <String>["Monthly", "Yearly"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                );
              }),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          DateTimePicker(
            type: DateTimePickerType.date,
            dateMask: 'd MMMM, yyyy',
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            decoration: InputDecoration(
              labelText: "Payment Date",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  RadiusConstant.MIN,
                ),
              ),
            ),
            selectableDayPredicate: (date) {
              return true;
            },
            onChanged: (value) {
              homeViewModel.dateTime = value;
            },
            validator: (value) {
              if (value!.isEmpty) {
                return "This field is required";
              }
              return null;
            },
          )
        ],
      ),
    );
  }
}
