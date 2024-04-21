import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class TextCustomPainter extends CustomPainter {
  TextPainter textPainter;

  TextCustomPainter(this.textPainter, {super.repaint});

  @override
  void paint(Canvas canvas, Size size) {
    textPainter.paint(canvas, const Offset(0, 0));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double pos = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(clipBehavior: Clip.none, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 8,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      border: OutlineInputBorder(),
                      hintText: "Enter your text here"),
                ),
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          DecoratedBox(
            decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 5,
                      spreadRadius: 0,
                      offset: Offset(0.1, 0.1),
                      color: Color.fromRGBO(0, 0, 0, 0.5))
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LayoutBuilder(builder: (context, constraints) {
                TextPainter textPainter = TextPainter(
                  text: const TextSpan(
                      text: "S -> Aoepdcmkmpomonjo",
                      style: TextStyle(fontFamily: "mono")),
                  textDirection: TextDirection.ltr,
                );
                textPainter.layout(
                    maxWidth: constraints.maxWidth,
                    minWidth: constraints.minWidth);
                Container container = Container(
                  constraints: const BoxConstraints.expand(height: 70),
                );

                return IntrinsicWidth(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            pos = textPainter
                                .getOffsetForCaret(
                                    TextPosition(offset: _counter),
                                    const Rect.fromLTWH(0, 0, 5, 5))
                                .dx;
                            pos += (textPainter
                                            .getOffsetForCaret(
                                                TextPosition(
                                                    offset: _counter + 1),
                                                const Rect.fromLTWH(0, 0, 5, 5))
                                            .dx -
                                        pos) /
                                    2.0 -
                                5;
                          });
                          debugPrint(textPainter
                              .getOffsetForCaret(TextPosition(offset: _counter),
                                  const Rect.fromLTWH(0, 0, 5, 5))
                              .dx
                              .toString());
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomPaint(
                                size:
                                    Size(textPainter.width, textPainter.height),
                                painter: TextCustomPainter(textPainter),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 3,
                        thickness: 1,
                        color: Color.fromRGBO(94, 94, 94, 1),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            pos = textPainter
                                .getOffsetForCaret(
                                    TextPosition(offset: _counter),
                                    const Rect.fromLTWH(0, 0, 5, 5))
                                .dx;
                            pos += (textPainter
                                            .getOffsetForCaret(
                                                TextPosition(
                                                    offset: _counter + 1),
                                                const Rect.fromLTWH(0, 0, 5, 5))
                                            .dx -
                                        pos) /
                                    2.0 -
                                5;
                          });
                          debugPrint(textPainter
                              .getOffsetForCaret(TextPosition(offset: _counter),
                                  const Rect.fromLTWH(0, 0, 5, 5))
                              .dx
                              .toString());
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomPaint(
                                size:
                                    Size(textPainter.width, textPainter.height),
                                painter: TextCustomPainter(textPainter),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.amber,
                        width: container.constraints?.biggest.width,
                        height: container.constraints?.biggest.height,
                      )
                    ],
                  ),
                );
              }),
            ),
          ),
          Positioned(
              top: 0,
              left: pos,
              child: const Icon(
                Icons.arrow_drop_up_rounded,
                size: 25,
              ))
        ]),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
