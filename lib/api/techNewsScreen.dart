import 'package:cached_network_image/cached_network_image.dart';
import 'package:ebook/api/Inf.dart';
import 'package:ebook/api/fetchApi.dart';
import 'package:ebook/consttants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class techNewsScreen extends StatefulWidget {
  @override
  State<techNewsScreen> createState() => _techNewsScreenState();
}

class _techNewsScreenState extends State<techNewsScreen> {
  @override
  void initState() {
    getInfByApi();
    Future.delayed(Duration.zero, (() => getInfByApi()));
    super.initState();
  }

  bool isClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kProgressIndicator,
        title: Text('Tech news'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 10),
        child: FutureBuilder(
            future: getInfByApi(),
            builder: (context, snapshot) {
              return RefreshIndicator(
                onRefresh: () async {
                  setState(() {
                    getInfByApi();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 15,
                    itemBuilder: (BuildContext context, int index) {
                      return AnimatedContainer(
                        margin: EdgeInsets.only(bottom: 20),
                        duration: Duration(milliseconds: 300),
                        padding: EdgeInsets.all(20),
                        height: !isClick ? 160 : 210,
                        width: 200,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: !getInf.isEmpty
                            ? SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        getInf[index].urlToImage == ''
                                            ? Image.asset(
                                                'assets/images/signup.png',
                                                height: 100,
                                                width: 100,
                                              )
                                            : CachedNetworkImage(
                                                height: 100,
                                                width: 100,
                                                fit: BoxFit.cover,
                                                imageUrl:
                                                    getInf[index].urlToImage,
                                                placeholder: (context, url) =>
                                                    Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    AnimatedOpacity(
                                                        duration: Duration.zero,
                                                        opacity: .5,
                                                        child: Image.asset(
                                                            'assets/images/signup.png')),
                                                    CircularProgressIndicator(
                                                      color: Colors.blue,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              getInf[index].author != ''
                                                  ? '${getInf[index].author}'
                                                  : 'Company',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                              width: 210,
                                              child: Divider(
                                                color: Colors.black,
                                                thickness: 1.2,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 200),
                                              // color: Colors.red,
                                              width: 200,
                                              height: !isClick ? 50 : 70,

                                              // height: 200,
                                              child: Text(
                                                !isClick
                                                    ? getInf[index]
                                                            .title
                                                            .substring(0, 40) +
                                                        ' .... '
                                                    : getInf[index].title,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            Transform.translate(
                                              offset: Offset(0, 0),
                                              child: GestureDetector(
                                                  onTap: (() {
                                                    setState(() {
                                                      isClick = !isClick;
                                                    });
                                                  }),
                                                  child: Text(!isClick
                                                      ? '+more'
                                                      : '-less ')),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    isClick
                                        ? Column(
                                            children: [
                                              SizedBox(
                                                height: 5,
                                                width: 280,
                                                child: Divider(
                                                  color: Colors.black,
                                                  thickness: 1.3,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text('for more information '),
                                                  GestureDetector(
                                                    onTap: (() async {
                                                      var uri = getInf.isEmpty
                                                          ? 'https://www.google.com'
                                                          : getInf[index].url;
                                                      // if (await canLaunc(url))
                                                      //   launch(url);
                                                      if (await canLaunchUrl(
                                                          Uri.parse(uri))) {
                                                        await launchUrl(
                                                            Uri.parse(uri));
                                                      }
                                                    }),
                                                    child: Text(
                                                      'Cilck here',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.red,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        decorationThickness: 2,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        : Container()
                                  ],
                                ),
                              )
                            : Stack(
                                alignment: Alignment.center,
                                children: [
                                  Center(
                                    child: AnimatedOpacity(
                                      opacity: 0.2,
                                      duration: Duration(seconds: 1),
                                      child: Image.asset(
                                        'assets/images/signup.png',
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                  ),
                                  CircularProgressIndicator(),
                                ],
                              ),
                      );
                    },
                  ),
                ),
              );
            }),
      ),
    );
  }
}
