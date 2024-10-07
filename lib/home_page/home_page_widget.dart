import '/backend/gemini/gemini.dart';
import '/components/answer_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      final selectedMedia = await selectMedia(
        maxWidth: 600.00,
        imageQuality: 100,
        multiImage: false,
      );
      if (selectedMedia != null &&
          selectedMedia
              .every((m) => validateFileFormat(m.storagePath, context))) {
        safeSetState(() => _model.isDataUploading = true);
        var selectedUploadedFiles = <FFUploadedFile>[];

        try {
          selectedUploadedFiles = selectedMedia
              .map((m) => FFUploadedFile(
                    name: m.storagePath.split('/').last,
                    bytes: m.bytes,
                    height: m.dimensions?.height,
                    width: m.dimensions?.width,
                    blurHash: m.blurHash,
                  ))
              .toList();
        } finally {
          _model.isDataUploading = false;
        }
        if (selectedUploadedFiles.length == selectedMedia.length) {
          safeSetState(() {
            _model.uploadedLocalFile = selectedUploadedFiles.first;
          });
        } else {
          safeSetState(() {});
          return;
        }
      }

      if (_model.uploadedLocalFile != null &&
          (_model.uploadedLocalFile.bytes?.isNotEmpty ?? false)) {
        await geminiTextFromImage(
          context,
          'ช่วยบอกหน่อยว่ารูปภาพนี้คืออะไรและอธบายรายเอียดเล็กน้อยด้วย',
          uploadImageBytes: _model.uploadedLocalFile,
        ).then((generatedText) {
          safeSetState(() => _model.aiResult = generatedText);
        });

        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          useSafeArea: true,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: AnswerViewWidget(
                  answerParameter: _model.aiResult!,
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
      safeSetState(() {
        _model.isDataUploading = false;
        _model.uploadedLocalFile =
            FFUploadedFile(bytes: Uint8List.fromList([]));
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ),
      ),
    );
  }
}
