// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class AppInfo extends StatefulWidget {
  @override
  _AppInfoState createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'App Info',
              style: TextStyle(color: Colors.black),
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Container(
                  child: Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Opacity(
                            opacity: 0.82,
                            child: Image(
                              width: 75,
                              height: 75,
                              image: AssetImage(
                                'assets/images/playstore.png',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'PLANTURE',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'ORNAMENTAL PLANT IDENTIFIER',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    image: DecorationImage(
                        // colorFilter: ColorFiltered(colorFilter: C),
                        scale: 0.1,
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/gumamela.jpg')),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Material(
                  elevation: 5.0,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: RichText(
                      textAlign: TextAlign.left,
                      // ignore: prefer_const_literals_to_create_immutables
                      text: TextSpan(children: [
                        TextSpan(
                          text:
                              'planture is an Android-based Plant Recognition System '
                              'for Erly’s Garden that will help the owner and the customer '
                              'to easily recognize the name of plants and the disease of the plants.',
                          style: TextStyle(color: Colors.black54, fontSize: 18),
                        ),
                      ]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Material(
                  elevation: 5.0,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  child: Container(
                    height: 50,
                    child: Center(
                      child: Text(
                        'Developed by Semilla & Friends',
                        style: (TextStyle(fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Material(
                  elevation: 5.0,
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  child: Container(
                    height: 1770,
                    child: Text(
                      '\n'
                      '\t\tTERMS AND CONDITION\n\n'
                      'By downloading or using the app, these terms will automatically apply to you '
                      'you should make sure therefore that you read them carefully before using the app. '
                      'You are not allowed to copy or modify the app, any part of the app, or our  '
                      'trademarks in any way. You’re not allowed to attempt to extract the source code of. '
                      'the app, and you also shouldn’t try to translate the app into other languages or '
                      'make derivative versions. The app itself, and all the trademarks, copyright, '
                      'database rights, and other intellectual property rights related to it, still belong to '
                      'Semilla & Friends.'
                      'Semilla & Friends is committed to ensuring that the app is as useful and efficient '
                      'as possible. For that reason, we reserve the right to make changes to the app or to '
                      'charge for its services, at any time and for any reason. We will never charge you for '
                      'the app or its services without making it very clear to you exactly what you’re paying for. '
                      'The planture_app app stores and processes personal data that you have provided to us, to provide my Service. '
                      'It’s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone’s security features and it could mean that the planture_app app won’t work properly or at all. '
                      'The app does use third-party services that declare their Terms and Conditions. '
                      'Link to Terms and Conditions of third-party service providers used by the app '
                      ' \n\n*Google Analytics for Firebase'
                      'You should be aware that there are certain things that Semilla & Friends will not take responsibility for. '
                      'Certain functions of the app will require the app to have an active internet connection. '
                      'The connection can be Wi-Fi or provided by your mobile network provider, '
                      'but Semilla & Friends cannot take responsibility for the app not working at full functionality if you don’t have access to Wi-Fi, and you don’t have any of your data allowance left. '
                      'If you’re using the app outside of an area with Wi-Fi, you should remember that the terms of the agreement with your mobile network provider will still apply. '
                      'As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, '
                      'or other third-party charges. In using the app, you’re accepting responsibility for any such charges, '
                      'including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. '
                      'If you are not the bill payer for the device on which you’re using the app, '
                      'please be aware that we assume that you have received permission from the bill payer for using the app.'
                      'Along the same lines, Semilla & Friends cannot always take responsibility for the way you use the app i.e. '
                      'You need to make sure that your device stays charged – if it runs out of battery and you can’t turn it on to avail the Service, Semilla & Friends cannot accept responsibility. '
                      'With respect to Semilla & Friends’s responsibility for your use of the app, when you’re using the app, it’s important to bear in mind that although we endeavor to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. Semilla & Friends accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app. '
                      'At some point, we may wish to update the app. The app is currently available on Android – the requirements for the system(and for any additional systems we decide to extend the availability of the app to) may change, and you’ll need to download the updates if you want to keep using the app. '
                      'Semilla & Friends does not promise that it will always update the app so that it is relevant to you and/or works with the Android version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device. '
                      '\n\n*Changes to This Terms and Conditions'
                      'We may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Terms and Conditions on this page. These terms and conditions are effective as of 2021-11-26'
                      '\n\n *Contact Us '
                      'If you have any questions or suggestions about my Terms and Conditions, do not hesitate to contact us at plantureapp@gmail.com.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
