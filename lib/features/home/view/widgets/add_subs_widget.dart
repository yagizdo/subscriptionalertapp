part of home_view;

class AddSubsWidget extends StatelessWidget {
  const AddSubsWidget({Key? key, required this.onSubmitted}) : super(key: key);

  final VoidCallback onSubmitted;

  @override
  Widget build(BuildContext context) {
    final themeService = locator<ThemeService>();
    final homeViewModel = locator<HomeViewModel>();

    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text("Add Subscription"),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () async {
              bool isVal = homeViewModel.validateForm();
              if (isVal) {
                bool isAdded = await homeViewModel.addSubscription();
                if (isAdded) {
                  onSubmitted();
                }
              }
            },
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
            Observer(builder: (_) {
              return SubsCardWidget(
                subsModel: SubsModel(
                  name: homeViewModel.name,
                  description: homeViewModel.description,
                  color_1:
                      homeViewModel.colorList[homeViewModel.selectedColorIndex],
                  color_2: (() {
                    if (homeViewModel.selectedColorIndex == 0) {
                      return ColorConstant.CITRUSPEEL_2;
                    }
                    if (homeViewModel.selectedColorIndex == 1) {
                      return ColorConstant.EVENINGNIGHT_2;
                    }
                    if (homeViewModel.selectedColorIndex == 2) {
                      return ColorConstant.SINCITYRED_2;
                    }
                    if (homeViewModel.selectedColorIndex == 3) {
                      return ColorConstant.SLIGHTOCEANVIEW_2;
                    }
                    if (homeViewModel.selectedColorIndex == 4) {
                      return ColorConstant.ULTRAVIOLET_2;
                    }
                  }()),
                  price: homeViewModel.price,
                  type: homeViewModel.type,
                  paymentDate: homeViewModel.dateTime,
                ),
              );
            }),
            SizedBox(
              height: 10.h,
            ),
            const AddSubsFormWidget(),
          ],
        ),
      ),
    );
  }
}
