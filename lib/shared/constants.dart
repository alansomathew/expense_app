import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import './theme.dart';
import '../data/globals.dart' as globals;

const kAppName = "Wallet View - Track,Split and Budget";
const kAppLogo = 'assets/images/app_logo.png';
const kWalletLogo = 'assets/images/wallet_logo.png';
const kDevLogo = 'assets/images/infotechlogo.png';
const kDev = "CHRIST InfoTech";
const kDevEmail = "infotech.lavasa@christuniversity.in";

void launchMailClient() async {
  const mailUrl = 'mailto:$kDevEmail';
  try {
    await launchUrl(Uri.parse(kDevEmail));
  } catch (e) {
    copyMailClient(globals.scaffoldKey);
  }
}

void copyMailClient(GlobalKey<ScaffoldMessengerState> key) async {
  await Clipboard.setData(new ClipboardData(text: kDevEmail));
  key.currentState!.showSnackBar(new SnackBar(
      backgroundColor: kDarkSecondary,
      content: new Text("Copied to Clipboard")));
}
