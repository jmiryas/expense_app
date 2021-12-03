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
          // TODO: Change category design
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
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        "Kategori Pengeluaran",
                        textAlign: TextAlign.center,
                      ),
                      content: SingleChildScrollView(
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                radius: 10.0,
                                backgroundColor: Colors.blue.shade400,
                              ),
                              title: const Text("Primer"),
                              subtitle: const Text(
                                "Kebutuhan primer yaitu kebutuhan pokok yang mutlak dipenuhi oleh semua manusia yaitu pakaian, makanan, dan tempat tinggal. Kebutuhan primer ini merupakan hal yang paling penting untuk dipenuhi guna melanjutkan keberlangsungan hidup.",
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                radius: 10.0,
                                backgroundColor: Colors.orange.shade400,
                              ),
                              title: const Text("Sekunder"),
                              subtitle: const Text(
                                "Kebutuhan sekunder merupakan pelengkap agar dapat menjalankan kehidupan yang lebih baik. Gaya hidup manusia merupakan salah satu hal kebutuhan sekunder.",
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            ListTile(
                              leading: CircleAvatar(
                                radius: 10.0,
                                backgroundColor: Colors.red.shade400,
                              ),
                              title: const Text("Tersier"),
                              subtitle: const Text(
                                "Kebutuhan tersier merupakan kebutuhan yang sering sebagian orang disebut kebutuhan akan sesuatu yang bersifat mewah. Tujuan dari pemenuhan kebutuhan tersier ialah untuk kesenangan pribadi.",
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, "OK"),
                          child: const Text("OK"),
                        ),
                      ],
                    );
                  });
            },
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
          // TODO: Add tutorial page.
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
