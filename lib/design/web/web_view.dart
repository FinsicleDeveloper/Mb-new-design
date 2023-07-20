

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

import 'functions/loading_state.dart';



class WebView extends StatefulWidget {
  const WebView({
    super.key,
    required this.url,
    this.showFAB = false,
  });
  final String url;
  final bool showFAB;
  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor:    Colors.grey[900],
          body: Consumer<LoadingState>(
            builder: (context, provider, child) => Stack(
              children: [
                WebViewPlus(
                  initialUrl: widget.url,
                  zoomEnabled: false,backgroundColor:    Colors.grey[900], 
              
                  onWebViewCreated: (controller) {
                    controller.loadUrl(widget.url);   
                  },
                  onPageStarted: (_) {
                    provider.setIsLoading(true);
                  },
                  onPageFinished: (url) {
                    provider.setIsLoading(false);
                  },
                  javascriptMode: JavascriptMode.unrestricted,
                ),
                provider.isLoading
                    ? Center(
                        child: Lottie.asset('assets/lottie/loadingLotte.json'),
                      )
                    : Container()
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniStartFloat,
          floatingActionButton: widget.showFAB
              ? FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backgroundColor:    Colors.grey[900],
                  child: const Icon(Icons.arrow_back_ios_new),
                )
              : null),
    );
  }
}
