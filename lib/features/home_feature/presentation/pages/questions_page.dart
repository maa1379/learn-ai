import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn/features/home_feature/presentation/controllers/home_controller.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../../../core/widgets/Costance.dart';

class QuestionsPage extends StatefulWidget {
  QuestionsPage({Key? key}) : super(key: key);

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  final controller = Get.find<HomeController>();

  late stt.SpeechToText _speech;

  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            SizedBox(
              height: Get.height * .05,
            ),
            buildAppBar(),
            const Spacer(),
            // _buildList(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: input(
                label: "Ask any question",
                controller: controller.questionController,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildList() {
    return Expanded(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (_, index) {
            return (false) ? inBubble() : outBubble();
          }),
    );
  }

  inBubble() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        constraints: BoxConstraints(maxWidth: Get.width * .8),
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            // topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Wrap(
          alignment: WrapAlignment.end,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "dsfdsfdsfdsf",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2.0),
              child: Text(
                "dsfdsfdsfdsfdsf",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  outBubble() {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        constraints: BoxConstraints(maxWidth: Get.width * .8),
        margin: const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            // topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
        child: Wrap(
          alignment: WrapAlignment.end,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: const <Widget>[
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "item.body.toString()",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2.0),
              child: Text(
                "asdfasd",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget input(
      {String? label,
      required TextEditingController controller,
      FormFieldValidator<String>? validator,
      ValueChanged<String>? onChanged}) {
    return GetBuilder<HomeController>(builder: (logic) {
      return Material(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
          child: TextFormField(
            validator: validator,
            onChanged: onChanged,
            controller: controller,
            textAlign: TextAlign.start,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () async {
                          listen();
                        },
                        child: Icon(logic.isListening.isTrue
                            ? Icons.mic
                            : Icons.mic_none)),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () async {},
                      child: const Icon(Icons.send),
                    ),
                  ],
                ),
              ),
              fillColor: ColorsHelper.darkGray.withOpacity(0.2),
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: UiHelper.borderRadius16,
                  borderSide: BorderSide.none),
              labelText: label,
              labelStyle: TextStyle(
                color: ColorsHelper.darkGray.withOpacity(0.4),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: UiHelper.borderRadius16,
                borderSide:
                    const BorderSide(color: ColorsHelper.blue, width: 2),
              ),
              border: OutlineInputBorder(
                borderRadius: UiHelper.borderRadius16,
                borderSide:
                    const BorderSide(color: ColorsHelper.darkGray, width: 2),
              ),
            ),
          ),
        ),
      );
    });
  }

  buildAppBar() {
    return SizedBox(
      height: Get.height * .1,
      width: Get.width,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: UiHelper.backIconBtn(),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: Get.height * .03),
              child: const Text(
                "Question",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  listen() async {
    if (!controller.isListening.value) {
      bool available = await _speech.initialize(
        onStatus: (val) {
          print('onStatus: $val');
          if (val == "done") {
            controller.isListening.value = false;
            controller.update();
          }
        },
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => controller.isListening.value = true);
        _speech.listen(
          onResult: (val) => setState(() {
            controller.questionController =
                TextEditingController(text: val.recognizedWords);
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
        controller.update();
      }
    } else {
      setState(() => controller.isListening.value = false);
      _speech.stop();
      controller.update();
    }
  }
}

// class SpeechScreen extends StatefulWidget {
//   const SpeechScreen({super.key});
//
//   @override
//   _SpeechScreenState createState() => _SpeechScreenState();
// }
//
// class _SpeechScreenState extends State<SpeechScreen> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: Get.height,
//         width: Get.width,
//         padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
//         child: Text(
//           _text,
//           style: const TextStyle(
//             fontSize: 32.0,
//             color: Colors.black,
//             fontWeight: FontWeight.w400,
//           ),
//         ),
//       );
//   }
//
//
// }

//
