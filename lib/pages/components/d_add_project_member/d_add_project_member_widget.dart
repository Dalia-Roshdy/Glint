import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'd_add_project_member_model.dart';
export 'd_add_project_member_model.dart';

class DAddProjectMemberWidget extends StatefulWidget {
  const DAddProjectMemberWidget({
    super.key,
    required this.openProject,
    required this.canAllocate,
  });

  final ProjectsRecord? openProject;
  final bool? canAllocate;

  @override
  State<DAddProjectMemberWidget> createState() =>
      _DAddProjectMemberWidgetState();
}

class _DAddProjectMemberWidgetState extends State<DAddProjectMemberWidget> {
  late DAddProjectMemberModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DAddProjectMemberModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(42.0, 0.0, 0.0, 0.0),
                  child: Image.asset(
                    'assets/images/03.png',
                    width: 379.74,
                    height: 229.8,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ].divide(SizedBox(width: 16.0)),
          ),
          if (widget.canAllocate ?? true)
            FFButtonWidget(
              onPressed: () async {
                context.pushNamed(
                  CAddTeamMembersWidget.routeName,
                  queryParameters: {
                    'project': serializeParam(
                      widget.openProject,
                      ParamType.Document,
                    ),
                  }.withoutNulls,
                  extra: <String, dynamic>{
                    'project': widget.openProject,
                  },
                );
              },
              text: 'Add members',
              options: FFButtonOptions(
                height: 44.0,
                padding: EdgeInsets.all(22.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primary,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      font: GoogleFonts.interTight(
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).titleSmall.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).titleSmall.fontStyle,
                    ),
                elevation: 0.0,
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
          if (widget.canAllocate ?? true)
            Text(
              'No, thanks',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    color: FlutterFlowTheme.of(context).primary,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
            ),
        ].divide(SizedBox(height: 16.0)),
      ),
    );
  }
}
