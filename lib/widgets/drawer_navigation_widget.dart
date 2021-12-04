import 'package:flutter/material.dart';

import '../config/custom_app_route.dart';
import '../widgets/about_us_widget.dart';
import '../widgets/alert_select_month_widget.dart';

// TODO: Add toggle theme: dark & light

class DrawerNavigationWidget extends StatelessWidget {
  const DrawerNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("images/background.jpg"),
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade400,
                  borderRadius: BorderRadius.circular(2.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                child: const Text(
                  "Spending App",
                  style: TextStyle(
                    fontSize: 25.0,
                    letterSpacing: 1.2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.event_note,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Kategori Pengeluaran",
                )
              ],
            ),
            onTap: () => Navigator.pushNamed(
                context, CustomAppRoute.expenseCategoryScreen),
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.analytics,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Ringkasan Pengeluaran",
                )
              ],
            ),
            onTap: () {
              Navigator.pushNamed(context, CustomAppRoute.summaryScreen);
            },
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.calendar_view_month,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Pilih Bulan Pengeluaran",
                )
              ],
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      title: Text(
                        "Pilih Bulan",
                        textAlign: TextAlign.center,
                      ),
                      content: AlertSelectMonthWidget(),
                    );
                  });
            },
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.wysiwyg,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Tutorial Aplikasi",
                )
              ],
            ),
            onTap: () =>
                Navigator.pushNamed(context, CustomAppRoute.tutorialScreen),
          ),
          ListTile(
            title: Row(
              children: const [
                Icon(
                  Icons.info,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  "Tentang Kami",
                )
              ],
            ),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const AlertDialog(
                      title: Text(
                        "Tentang Kami",
                        textAlign: TextAlign.center,
                      ),
                      content: AboutUsWidget(),
                    );
                  });
            },
          )
        ],
      ),
    );
  }
}
