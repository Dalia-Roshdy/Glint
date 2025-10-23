import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'message_add_model.dart';
export 'message_add_model.dart';

class MessageAddWidget extends StatefulWidget {
  const MessageAddWidget({super.key});

  @override
  State<MessageAddWidget> createState() => _MessageAddWidgetState();
}

class _MessageAddWidgetState extends State<MessageAddWidget> {
  late MessageAddModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageAddModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(42.0, 0.0, 0.0, 0.0),
                child: Image.asset(
                  'assets/images/05.png',
                  width: 411.1,
                  height: 207.62,
                  fit: BoxFit.fitHeight,
                  alignment: Alignment(0.0, -1.0),
                ),
              ),
            ),
          ],
        ),
        if (currentUserDocument?.role != Role.resource)
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
              child: AuthUserStreamWidget(
                builder: (context) => FFButtonWidget(
                  onPressed: () async {
                    context.pushNamed(BCreateProjectWidget.routeName);
                  },
                  text: 'Create New project',
                  options: FFButtonOptions(
                    height: 44.0,
                    padding: EdgeInsets.all(20.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.interTight(
                            fontWeight: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          fontSize: 14.0,
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .titleSmall
                              .fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          ),
      ].divide(SizedBox(height: 16.0)),
    );
  }
}
