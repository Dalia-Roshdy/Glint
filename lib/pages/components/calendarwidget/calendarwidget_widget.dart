import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'calendarwidget_model.dart';
export 'calendarwidget_model.dart';

/// calendar like view with horisontal axix shocaws dayes for one week and
/// vertical axix shows users list and data cell containing a card with
/// project name and no of hours
///
class CalendarwidgetWidget extends StatefulWidget {
  const CalendarwidgetWidget({super.key});

  @override
  State<CalendarwidgetWidget> createState() => _CalendarwidgetWidgetState();
}

class _CalendarwidgetWidgetState extends State<CalendarwidgetWidget> {
  late CalendarwidgetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarwidgetModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.selectedDate = dateTimeFormat("yyyy-MM-dd", getCurrentTimestamp);
      _model.updatePage(() {});
      _model.startDate = dateTimeFormat(
          "yyyy-MM-dd", functions.weekstartDate(_model.selectedDate));
      _model.dateList = functions
          .generateDateList(functions.weekstartDate(_model.selectedDate))
          .toList()
          .cast<String>();
      _model.updatePage(() {});
      _model.apiResultns4 = await WorkLoadTestCall.call(
        startDate: dateTimeFormat(
            "yyyy-MM-dd", functions.weekstartDate(_model.selectedDate)),
        endDate: dateTimeFormat(
            "yyyy-MM-dd", functions.weekendDate(_model.selectedDate)),
      );

      if ((_model.apiResultns4?.succeeded ?? true)) {
        _model.apiResult = ((_model.apiResultns4?.jsonBody ?? '')
                .toList()
                .map<UserProjectListStruct?>(UserProjectListStruct.maybeFromMap)
                .toList() as Iterable<UserProjectListStruct?>)
            .withoutNulls
            .toList()
            .cast<UserProjectListStruct>();
        safeSetState(() {});
      }
    });

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
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
              color: Color(0x33000000),
              offset: Offset(
                0.0,
                1.0,
              ),
              spreadRadius: 0.0,
            )
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 10.0, 20.0, 10.0),
                        child: RichText(
                          textScaler: MediaQuery.of(context).textScaler,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Weekly Schedule  ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                              TextSpan(
                                text: _model.startDate,
                                style: TextStyle(),
                              )
                            ],
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 24.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              final _datePickedDate = await showDatePicker(
                                context: context,
                                initialDate: getCurrentTimestamp,
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2050),
                                builder: (context, child) {
                                  return wrapInMaterialDatePickerTheme(
                                    context,
                                    child!,
                                    headerBackgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                    headerForegroundColor:
                                        FlutterFlowTheme.of(context).info,
                                    headerTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .override(
                                              font: GoogleFonts.interTight(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .fontStyle,
                                              ),
                                              fontSize: 32.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLarge
                                                      .fontStyle,
                                            ),
                                    pickerBackgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    pickerForegroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                    selectedDateTimeBackgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                    selectedDateTimeForegroundColor:
                                        FlutterFlowTheme.of(context).info,
                                    actionButtonForegroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                    iconSize: 24.0,
                                  );
                                },
                              );

                              if (_datePickedDate != null) {
                                safeSetState(() {
                                  _model.datePicked = DateTime(
                                    _datePickedDate.year,
                                    _datePickedDate.month,
                                    _datePickedDate.day,
                                  );
                                });
                              } else if (_model.datePicked != null) {
                                safeSetState(() {
                                  _model.datePicked = getCurrentTimestamp;
                                });
                              }
                              _model.selectedDate = dateTimeFormat(
                                  "yyy-MM-dd", _model.datePicked);
                              safeSetState(() {});
                              _model.startDate = dateTimeFormat("yyyy-MM-dd",
                                  functions.weekstartDate(_model.selectedDate));
                              _model.dateList = functions
                                  .generateDateList(functions
                                      .weekstartDate(_model.selectedDate))
                                  .toList()
                                  .cast<String>();
                              _model.updatePage(() {});
                              _model.startDate = dateTimeFormat("yyyy-MM-dd",
                                  functions.weekstartDate(_model.selectedDate));
                              _model.dateList = functions
                                  .generateDateList(functions
                                      .weekstartDate(_model.selectedDate))
                                  .toList()
                                  .cast<String>();
                              _model.updatePage(() {});
                              _model.apiResultns3 = await WorkLoadTestCall.call(
                                startDate: dateTimeFormat(
                                    "yyyy-MM-dd",
                                    functions
                                        .weekstartDate(_model.selectedDate)),
                                endDate: dateTimeFormat("yyyy-MM-dd",
                                    functions.weekendDate(_model.selectedDate)),
                              );

                              if ((_model.apiResultns3?.succeeded ?? true)) {
                                _model.apiResult =
                                    ((_model.apiResultns3?.jsonBody ?? '')
                                                .toList()
                                                .map<UserProjectListStruct?>(
                                                    UserProjectListStruct
                                                        .maybeFromMap)
                                                .toList()
                                            as Iterable<UserProjectListStruct?>)
                                        .withoutNulls
                                        .toList()
                                        .cast<UserProjectListStruct>();
                                safeSetState(() {});
                              }

                              safeSetState(() {});
                            },
                            child: Container(
                              height: 30.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                  color:
                                      FlutterFlowTheme.of(context).gridDividers,
                                  width: 1.0,
                                ),
                              ),
                              alignment: AlignmentDirectional(0.0, -1.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    _model.selectedDate,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Icon(
                                      Icons.date_range,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 25.0,
                                    ),
                                  ),
                                ]
                                    .divide(SizedBox(width: 4.0))
                                    .addToStart(SizedBox(width: 6.0))
                                    .addToEnd(SizedBox(width: 6.0)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 2.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.138,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.people_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24.0,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Text(
                                      'Team Members',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 1.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.104,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8.0),
                                  bottomRight: Radius.circular(0.0),
                                  topLeft: Radius.circular(8.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Text(
                                        'Sun',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        1.0, 1.0, 1.0, 1.0),
                                    child: Container(
                                      width: 25.0,
                                      height: 25.0,
                                      decoration: BoxDecoration(
                                        color: _model.selectedDate ==
                                                _model.dateList
                                                    .elementAtOrNull(0)
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .alternate,
                                        shape: BoxShape.circle,
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          valueOrDefault<String>(
                                            _model.dateList.length > 0
                                                ? _model.dateList
                                                    .elementAt(0)
                                                    .substring(_model.dateList
                                                            .elementAt(0)
                                                            .length -
                                                        2)
                                                : '',
                                            '00',
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: _model.selectedDate ==
                                                        _model.dateList
                                                            .elementAtOrNull(0)
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .alternate
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 2.0)),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 1.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.104,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Text(
                                        'Mon',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 25.0,
                                    height: 25.0,
                                    decoration: BoxDecoration(
                                      color: _model.selectedDate ==
                                              _model.dateList.elementAtOrNull(1)
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          _model.dateList.length > 1
                                              ? _model.dateList
                                                  .elementAt(1)
                                                  .substring(_model.dateList
                                                          .elementAt(1)
                                                          .length -
                                                      2)
                                              : '',
                                          '00',
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: _model.selectedDate ==
                                                      _model.dateList
                                                          .elementAtOrNull(1)
                                                  ? FlutterFlowTheme.of(context)
                                                      .alternate
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 2.0)),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 1.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.104,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Text(
                                        'Tue',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 25.0,
                                    height: 25.0,
                                    decoration: BoxDecoration(
                                      color: _model.selectedDate ==
                                              _model.dateList.elementAtOrNull(2)
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        valueOrDefault<String>(
                                          _model.dateList.length > 2
                                              ? _model.dateList
                                                  .elementAt(2)
                                                  .substring(_model.dateList
                                                          .elementAt(2)
                                                          .length -
                                                      2)
                                              : '',
                                          '00',
                                        ),
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: _model.selectedDate ==
                                                      _model.dateList
                                                          .elementAtOrNull(2)
                                                  ? FlutterFlowTheme.of(context)
                                                      .alternate
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 2.0)),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 1.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.104,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Text(
                                        'Wed',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 25.0,
                                    height: 25.0,
                                    decoration: BoxDecoration(
                                      color: _model.selectedDate ==
                                              _model.dateList.elementAtOrNull(3)
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        _model.dateList.length > 3
                                            ? _model.dateList
                                                .elementAt(3)
                                                .substring(_model.dateList
                                                        .elementAt(3)
                                                        .length -
                                                    2)
                                            : '',
                                        '00',
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: _model.selectedDate ==
                                                    _model.dateList
                                                        .elementAtOrNull(3)
                                                ? FlutterFlowTheme.of(context)
                                                    .alternate
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 2.0)),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 1.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.104,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Text(
                                        'Thur',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 25.0,
                                    height: 25.0,
                                    decoration: BoxDecoration(
                                      color: _model.selectedDate ==
                                              _model.dateList.elementAtOrNull(4)
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        _model.dateList.length > 4
                                            ? _model.dateList
                                                .elementAt(4)
                                                .substring(_model.dateList
                                                        .elementAt(4)
                                                        .length -
                                                    2)
                                            : '',
                                        '00',
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: _model.selectedDate ==
                                                    _model.dateList
                                                        .elementAtOrNull(4)
                                                ? FlutterFlowTheme.of(context)
                                                    .alternate
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 2.0)),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 1.0, 0.0),
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.104,
                              height: 60.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).alternate,
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Text(
                                        'Fri',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 25.0,
                                    height: 25.0,
                                    decoration: BoxDecoration(
                                      color: _model.selectedDate ==
                                              _model.dateList.elementAtOrNull(5)
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .alternate,
                                      shape: BoxShape.circle,
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        _model.dateList.length > 5
                                            ? _model.dateList
                                                .elementAt(5)
                                                .substring(_model.dateList
                                                        .elementAt(5)
                                                        .length -
                                                    2)
                                            : '',
                                        '00',
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: _model.selectedDate ==
                                                    _model.dateList
                                                        .elementAtOrNull(5)
                                                ? FlutterFlowTheme.of(context)
                                                    .alternate
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 2.0)),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 0.104,
                            height: 60.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).alternate,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0.0),
                                bottomRight: Radius.circular(8.0),
                                topLeft: Radius.circular(0.0),
                                topRight: Radius.circular(8.0),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 8.0, 0.0),
                                    child: Text(
                                      'Sat',
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 25.0,
                                  height: 25.0,
                                  decoration: BoxDecoration(
                                    color: _model.selectedDate ==
                                            _model.dateList.elementAtOrNull(6)
                                        ? FlutterFlowTheme.of(context).primary
                                        : FlutterFlowTheme.of(context)
                                            .alternate,
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      _model.dateList.length > 6
                                          ? _model.dateList
                                              .elementAt(6)
                                              .substring(_model.dateList
                                                      .elementAt(6)
                                                      .length -
                                                  2)
                                          : '',
                                      '00',
                                    ),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.inter(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: _model.selectedDate ==
                                                  _model.dateList
                                                      .elementAtOrNull(6)
                                              ? FlutterFlowTheme.of(context)
                                                  .alternate
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                  ),
                                ),
                              ].divide(SizedBox(height: 2.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 2.0,
                  color: FlutterFlowTheme.of(context).alternate,
                ),
                Builder(
                  builder: (context) {
                    final data = _model.apiResult
                        .where((e) => e.date == _model.startDate)
                        .toList()
                        .unique((e) => e.displayName)
                        .toList();

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: data.length,
                      itemBuilder: (context, dataIndex) {
                        final dataItem = data[dataIndex];
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 2.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    width: MediaQuery.sizeOf(context).width *
                                        0.138,
                                    height: 60.0,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                    ),
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1.0, 0.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                              child: Container(
                                                width: 40.0,
                                                height: 40.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  getCORSProxyUrl(
                                                    dataItem.photoUrl,
                                                  ),
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Image.asset(
                                                    'assets/images/error_image.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  2.0,
                                                                  0.0),
                                                      child: AutoSizeText(
                                                        valueOrDefault<String>(
                                                          dataItem.displayName,
                                                          'name',
                                                        ).maybeHandleOverflow(
                                                          maxChars: 14,
                                                          replacement: '…',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 1.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.104,
                                        constraints: BoxConstraints(
                                          minHeight: 60.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: _model.apiResult
                                                      .where((e) =>
                                                          (e.date ==
                                                              _model.dateList
                                                                  .elementAtOrNull(
                                                                      0)) &&
                                                          (e.userId ==
                                                              dataItem.userId))
                                                      .toList()
                                                      .firstOrNull
                                                      ?.isHoliday ==
                                                  1
                                              ? FlutterFlowTheme.of(context)
                                                  .alternate
                                              : valueOrDefault<Color>(
                                                  _model.apiResult
                                                      .where((e) =>
                                                          (e.date ==
                                                              _model.dateList
                                                                  .elementAtOrNull(
                                                                      0)) &&
                                                          (e.projectName !=
                                                                  '') &&
                                                          (e.userId ==
                                                              dataItem.userId))
                                                      .toList()
                                                      .firstOrNull
                                                      ?.allocationColor,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: valueOrDefault<Color>(
                                              _model.apiResult
                                                  .where((e) =>
                                                      (e.date ==
                                                          _model.dateList
                                                              .elementAtOrNull(
                                                                  0)) &&
                                                      (e.projectName !=
                                                              '') &&
                                                      (e.userId ==
                                                          dataItem.userId))
                                                  .toList()
                                                  .firstOrNull
                                                  ?.allocationColor,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 1.0, 1.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final sunProjects = _model
                                                  .apiResult
                                                  .where((e) =>
                                                      (e.date ==
                                                          _model.dateList
                                                              .elementAtOrNull(
                                                                  0)) &&
                                                      (e.projectName !=
                                                              '') &&
                                                      (e.userId ==
                                                          dataItem.userId))
                                                  .toList()
                                                  .take(3)
                                                  .toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: sunProjects.length,
                                                itemBuilder: (context,
                                                    sunProjectsIndex) {
                                                  final sunProjectsItem =
                                                      sunProjects[
                                                          sunProjectsIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(6.0, 6.0,
                                                                6.0, 4.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      1.0),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 1.5,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Container(
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    colorFromCssString(
                                                                  sunProjectsItem
                                                                      .main,
                                                                  defaultColor:
                                                                      Color(
                                                                          0xFFABDCF4),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                              child: LinearPercentIndicator(
                                                                                percent: (double var1, double var2) {
                                                                                  return (var2 == 0.0) ? 0.0 : (var1 / var2).toDouble().clamp(0.0, 1.0);
                                                                                }(sunProjectsItem.allocatedHours.toDouble(), sunProjectsItem.workingHours.toDouble()),
                                                                                width: MediaQuery.sizeOf(context).width * 0.09,
                                                                                lineHeight: 6.0,
                                                                                animation: true,
                                                                                animateFromLastPercent: true,
                                                                                progressColor: colorFromCssString(
                                                                                  sunProjectsItem.complementary,
                                                                                  defaultColor: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                                backgroundColor: colorFromCssString(
                                                                                  sunProjectsItem.main,
                                                                                  defaultColor: Colors.black,
                                                                                ),
                                                                                barRadius: Radius.circular(2.0),
                                                                                padding: EdgeInsets.zero,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          AutoSizeText(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          sunProjectsItem
                                                                              .projectName,
                                                                          'Project Name',
                                                                        ).maybeHandleOverflow(
                                                                          maxChars:
                                                                              16,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 1.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.104,
                                      constraints: BoxConstraints(
                                        minHeight: 60.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: _model.apiResult
                                                    .where((e) =>
                                                        (e.date ==
                                                            _model.dateList
                                                                .elementAtOrNull(
                                                                    1)) &&
                                                        (e.userId ==
                                                            dataItem.userId))
                                                    .toList()
                                                    .firstOrNull
                                                    ?.isHoliday ==
                                                1
                                            ? FlutterFlowTheme.of(context)
                                                .alternate
                                            : valueOrDefault<Color>(
                                                _model.apiResult
                                                    .where((e) =>
                                                        (e.date ==
                                                            _model.dateList
                                                                .elementAtOrNull(
                                                                    1)) &&
                                                        (e.projectName !=
                                                                '') &&
                                                        (e.userId ==
                                                            dataItem.userId))
                                                    .toList()
                                                    .firstOrNull
                                                    ?.allocationColor,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: valueOrDefault<Color>(
                                            _model.apiResult
                                                .where((e) =>
                                                    (e.date ==
                                                        _model.dateList
                                                            .elementAtOrNull(
                                                                1)) &&
                                                    (e.projectName != '') &&
                                                    (e.userId ==
                                                        dataItem.userId))
                                                .toList()
                                                .firstOrNull
                                                ?.allocationColor,
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 1.0, 1.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final monProjects = _model
                                                  .apiResult
                                                  .where((e) =>
                                                      (e.date ==
                                                          _model.dateList
                                                              .elementAtOrNull(
                                                                  1)) &&
                                                      (e.projectName !=
                                                              '') &&
                                                      (e.userId ==
                                                          dataItem.userId))
                                                  .toList()
                                                  .take(3)
                                                  .toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: monProjects.length,
                                                itemBuilder: (context,
                                                    monProjectsIndex) {
                                                  final monProjectsItem =
                                                      monProjects[
                                                          monProjectsIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(6.0, 6.0,
                                                                6.0, 4.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      1.0),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 1.5,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Container(
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    colorFromCssString(
                                                                  monProjectsItem
                                                                      .main,
                                                                  defaultColor:
                                                                      Color(
                                                                          0xFFEDC9F4),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                              child: LinearPercentIndicator(
                                                                                percent: (double var1, double var2) {
                                                                                  return (var2 == 0.0) ? 0.0 : (var1 / var2).toDouble().clamp(0.0, 1.0);
                                                                                }(monProjectsItem.allocatedHours.toDouble(), monProjectsItem.workingHours.toDouble()),
                                                                                width: MediaQuery.sizeOf(context).width * 0.09,
                                                                                lineHeight: 6.0,
                                                                                animation: true,
                                                                                animateFromLastPercent: true,
                                                                                progressColor: colorFromCssString(
                                                                                  monProjectsItem.complementary,
                                                                                  defaultColor: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                                backgroundColor: colorFromCssString(
                                                                                  monProjectsItem.main,
                                                                                  defaultColor: Colors.black,
                                                                                ),
                                                                                barRadius: Radius.circular(2.0),
                                                                                padding: EdgeInsets.zero,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          monProjectsItem
                                                                              .projectName,
                                                                          'Project Name',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 1.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.104,
                                        constraints: BoxConstraints(
                                          minHeight: 60.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: _model.apiResult
                                                      .where((e) =>
                                                          (e.date ==
                                                              _model.dateList
                                                                  .elementAtOrNull(
                                                                      2)) &&
                                                          (e.userId ==
                                                              dataItem.userId))
                                                      .toList()
                                                      .firstOrNull
                                                      ?.isHoliday ==
                                                  1
                                              ? FlutterFlowTheme.of(context)
                                                  .alternate
                                              : valueOrDefault<Color>(
                                                  _model.apiResult
                                                      .where((e) =>
                                                          (e.date ==
                                                              _model.dateList
                                                                  .elementAtOrNull(
                                                                      2)) &&
                                                          (e.projectName !=
                                                                  '') &&
                                                          (e.userId ==
                                                              dataItem.userId))
                                                      .toList()
                                                      .firstOrNull
                                                      ?.allocationColor,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: valueOrDefault<Color>(
                                              _model.apiResult
                                                  .where((e) =>
                                                      (e.date ==
                                                          _model.dateList
                                                              .elementAtOrNull(
                                                                  2)) &&
                                                      (e.projectName !=
                                                              '') &&
                                                      (e.userId ==
                                                          dataItem.userId))
                                                  .toList()
                                                  .firstOrNull
                                                  ?.allocationColor,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 1.0, 1.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final tueProjects = _model
                                                  .apiResult
                                                  .where((e) =>
                                                      (e.date ==
                                                          _model.dateList
                                                              .elementAtOrNull(
                                                                  2)) &&
                                                      (e.projectName !=
                                                              '') &&
                                                      (e.userId ==
                                                          dataItem.userId))
                                                  .toList()
                                                  .take(3)
                                                  .toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: tueProjects.length,
                                                itemBuilder: (context,
                                                    tueProjectsIndex) {
                                                  final tueProjectsItem =
                                                      tueProjects[
                                                          tueProjectsIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(6.0, 6.0,
                                                                6.0, 4.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      1.0),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 1.5,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Container(
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    colorFromCssString(
                                                                  tueProjectsItem
                                                                      .main,
                                                                  defaultColor:
                                                                      Color(
                                                                          0xFFDCD9FF),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                              child: LinearPercentIndicator(
                                                                                percent: (double var1, double var2) {
                                                                                  return (var2 == 0.0) ? 0.0 : (var1 / var2).toDouble().clamp(0.0, 1.0);
                                                                                }(tueProjectsItem.allocatedHours.toDouble(), tueProjectsItem.workingHours.toDouble()),
                                                                                width: MediaQuery.sizeOf(context).width * 0.09,
                                                                                lineHeight: 6.0,
                                                                                animation: true,
                                                                                animateFromLastPercent: true,
                                                                                progressColor: colorFromCssString(
                                                                                  tueProjectsItem.complementary,
                                                                                  defaultColor: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                                backgroundColor: colorFromCssString(
                                                                                  tueProjectsItem.main,
                                                                                  defaultColor: Colors.black,
                                                                                ),
                                                                                barRadius: Radius.circular(2.0),
                                                                                padding: EdgeInsets.zero,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          tueProjectsItem
                                                                              .projectName,
                                                                          'Project Name',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 1.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.104,
                                        constraints: BoxConstraints(
                                          minHeight: 60.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: _model.apiResult
                                                      .where((e) =>
                                                          (e.date ==
                                                              _model.dateList
                                                                  .elementAtOrNull(
                                                                      3)) &&
                                                          (e.userId ==
                                                              dataItem.userId))
                                                      .toList()
                                                      .firstOrNull
                                                      ?.isHoliday ==
                                                  1
                                              ? FlutterFlowTheme.of(context)
                                                  .alternate
                                              : valueOrDefault<Color>(
                                                  _model.apiResult
                                                      .where((e) =>
                                                          (e.date ==
                                                              _model.dateList
                                                                  .elementAtOrNull(
                                                                      3)) &&
                                                          (e.projectName !=
                                                                  '') &&
                                                          (e.userId ==
                                                              dataItem.userId))
                                                      .toList()
                                                      .firstOrNull
                                                      ?.allocationColor,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: valueOrDefault<Color>(
                                              _model.apiResult
                                                  .where((e) =>
                                                      (e.date ==
                                                          _model.dateList
                                                              .elementAtOrNull(
                                                                  3)) &&
                                                      (e.projectName !=
                                                              '') &&
                                                      (e.userId ==
                                                          dataItem.userId))
                                                  .toList()
                                                  .firstOrNull
                                                  ?.allocationColor,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 1.0, 1.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final wedProjects = _model
                                                  .apiResult
                                                  .where((e) =>
                                                      (e.date ==
                                                          _model.dateList
                                                              .elementAtOrNull(
                                                                  3)) &&
                                                      (e.projectName !=
                                                              '') &&
                                                      (e.userId ==
                                                          dataItem.userId))
                                                  .toList()
                                                  .take(3)
                                                  .toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: wedProjects.length,
                                                itemBuilder: (context,
                                                    wedProjectsIndex) {
                                                  final wedProjectsItem =
                                                      wedProjects[
                                                          wedProjectsIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(6.0, 6.0,
                                                                6.0, 4.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      1.0),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 1.5,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Container(
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    colorFromCssString(
                                                                  wedProjectsItem
                                                                      .main,
                                                                  defaultColor:
                                                                      Color(
                                                                          0xFFD5E2F3),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                              child: LinearPercentIndicator(
                                                                                percent: (double var1, double var2) {
                                                                                  return (var2 == 0.0) ? 0.0 : (var1 / var2).toDouble().clamp(0.0, 1.0);
                                                                                }(wedProjectsItem.allocatedHours.toDouble(), wedProjectsItem.workingHours.toDouble()),
                                                                                width: MediaQuery.sizeOf(context).width * 0.09,
                                                                                lineHeight: 6.0,
                                                                                animation: true,
                                                                                animateFromLastPercent: true,
                                                                                progressColor: colorFromCssString(
                                                                                  wedProjectsItem.complementary,
                                                                                  defaultColor: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                                backgroundColor: colorFromCssString(
                                                                                  wedProjectsItem.main,
                                                                                  defaultColor: Colors.black,
                                                                                ),
                                                                                barRadius: Radius.circular(2.0),
                                                                                padding: EdgeInsets.zero,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          wedProjectsItem
                                                                              .projectName,
                                                                          'Project Name',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 1.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.104,
                                        constraints: BoxConstraints(
                                          minHeight: 60.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: _model.apiResult
                                                      .where((e) =>
                                                          (e.date ==
                                                              _model.dateList
                                                                  .elementAtOrNull(
                                                                      4)) &&
                                                          (e.userId ==
                                                              dataItem.userId))
                                                      .toList()
                                                      .firstOrNull
                                                      ?.isHoliday ==
                                                  1
                                              ? FlutterFlowTheme.of(context)
                                                  .alternate
                                              : valueOrDefault<Color>(
                                                  _model.apiResult
                                                      .where((e) =>
                                                          (e.date ==
                                                              _model.dateList
                                                                  .elementAtOrNull(
                                                                      4)) &&
                                                          (e.projectName !=
                                                                  '') &&
                                                          (e.userId ==
                                                              dataItem.userId))
                                                      .toList()
                                                      .firstOrNull
                                                      ?.allocationColor,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: valueOrDefault<Color>(
                                              _model.apiResult
                                                  .where((e) =>
                                                      (e.date ==
                                                          _model.dateList
                                                              .elementAtOrNull(
                                                                  4)) &&
                                                      (e.projectName !=
                                                              '') &&
                                                      (e.userId ==
                                                          dataItem.userId))
                                                  .toList()
                                                  .firstOrNull
                                                  ?.allocationColor,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 1.0, 1.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final thuProjects = _model
                                                  .apiResult
                                                  .where((e) =>
                                                      (e.date ==
                                                          _model.dateList
                                                              .elementAtOrNull(
                                                                  4)) &&
                                                      (e.projectName !=
                                                              '') &&
                                                      (e.userId ==
                                                          dataItem.userId))
                                                  .toList()
                                                  .take(3)
                                                  .toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: thuProjects.length,
                                                itemBuilder: (context,
                                                    thuProjectsIndex) {
                                                  final thuProjectsItem =
                                                      thuProjects[
                                                          thuProjectsIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(6.0, 6.0,
                                                                6.0, 4.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      1.0),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 1.5,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Container(
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    colorFromCssString(
                                                                  thuProjectsItem
                                                                      .main,
                                                                  defaultColor:
                                                                      Color(
                                                                          0xFFDDDDC3),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                              child: LinearPercentIndicator(
                                                                                percent: (double var1, double var2) {
                                                                                  return (var2 == 0.0) ? 0.0 : (var1 / var2).toDouble().clamp(0.0, 1.0);
                                                                                }(thuProjectsItem.allocatedHours.toDouble(), thuProjectsItem.workingHours.toDouble()),
                                                                                width: MediaQuery.sizeOf(context).width * 0.09,
                                                                                lineHeight: 6.0,
                                                                                animation: true,
                                                                                animateFromLastPercent: true,
                                                                                progressColor: colorFromCssString(
                                                                                  thuProjectsItem.complementary,
                                                                                  defaultColor: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                                backgroundColor: colorFromCssString(
                                                                                  thuProjectsItem.main,
                                                                                  defaultColor: Colors.black,
                                                                                ),
                                                                                barRadius: Radius.circular(2.0),
                                                                                padding: EdgeInsets.zero,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          thuProjectsItem
                                                                              .projectName,
                                                                          'Project Name',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 1.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.104,
                                        constraints: BoxConstraints(
                                          minHeight: 60.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: _model.apiResult
                                                      .where((e) =>
                                                          (e.date ==
                                                              _model.dateList
                                                                  .elementAtOrNull(
                                                                      5)) &&
                                                          (e.userId ==
                                                              dataItem.userId))
                                                      .toList()
                                                      .firstOrNull
                                                      ?.isHoliday ==
                                                  1
                                              ? FlutterFlowTheme.of(context)
                                                  .alternate
                                              : valueOrDefault<Color>(
                                                  _model.apiResult
                                                      .where((e) =>
                                                          (e.date ==
                                                              _model.dateList
                                                                  .elementAtOrNull(
                                                                      5)) &&
                                                          (e.projectName !=
                                                                  '') &&
                                                          (e.userId ==
                                                              dataItem.userId))
                                                      .toList()
                                                      .firstOrNull
                                                      ?.allocationColor,
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                                ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: valueOrDefault<Color>(
                                              _model.apiResult
                                                  .where((e) =>
                                                      (e.date ==
                                                          _model.dateList
                                                              .elementAtOrNull(
                                                                  5)) &&
                                                      (e.projectName !=
                                                              '') &&
                                                      (e.userId ==
                                                          dataItem.userId))
                                                  .toList()
                                                  .firstOrNull
                                                  ?.allocationColor,
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                            ),
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 1.0, 1.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final friProjects = _model
                                                  .apiResult
                                                  .where((e) =>
                                                      (e.date ==
                                                          _model.dateList
                                                              .elementAtOrNull(
                                                                  5)) &&
                                                      (e.projectName !=
                                                              '') &&
                                                      (e.userId ==
                                                          dataItem.userId))
                                                  .toList()
                                                  .take(3)
                                                  .toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: friProjects.length,
                                                itemBuilder: (context,
                                                    friProjectsIndex) {
                                                  final friProjectsItem =
                                                      friProjects[
                                                          friProjectsIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(6.0, 6.0,
                                                                6.0, 4.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      1.0),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 1.5,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Container(
                                                              height: 40.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color:
                                                                    colorFromCssString(
                                                                  friProjectsItem
                                                                      .main,
                                                                  defaultColor:
                                                                      Color(
                                                                          0xFFC6EEEA),
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                shape: BoxShape
                                                                    .rectangle,
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                              child: LinearPercentIndicator(
                                                                                percent: (double var1, double var2) {
                                                                                  return (var2 == 0.0) ? 0.0 : (var1 / var2).toDouble().clamp(0.0, 1.0);
                                                                                }(friProjectsItem.allocatedHours.toDouble(), friProjectsItem.workingHours.toDouble()),
                                                                                width: MediaQuery.sizeOf(context).width * 0.09,
                                                                                lineHeight: 6.0,
                                                                                animation: true,
                                                                                animateFromLastPercent: true,
                                                                                progressColor: colorFromCssString(
                                                                                  friProjectsItem.complementary,
                                                                                  defaultColor: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                                backgroundColor: colorFromCssString(
                                                                                  friProjectsItem.main,
                                                                                  defaultColor: Colors.black,
                                                                                ),
                                                                                barRadius: Radius.circular(2.0),
                                                                                padding: EdgeInsets.zero,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          6.0,
                                                                          0.0,
                                                                          2.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          friProjectsItem
                                                                              .projectName,
                                                                          'Project Name',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.104,
                                      constraints: BoxConstraints(
                                        minHeight: 60.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: _model.apiResult
                                                    .where((e) =>
                                                        (e.date ==
                                                            _model.dateList
                                                                .elementAtOrNull(
                                                                    6)) &&
                                                        (e.userId ==
                                                            dataItem.userId))
                                                    .toList()
                                                    .firstOrNull
                                                    ?.isHoliday ==
                                                1
                                            ? FlutterFlowTheme.of(context)
                                                .alternate
                                            : valueOrDefault<Color>(
                                                _model.apiResult
                                                    .where((e) =>
                                                        (e.date ==
                                                            _model.dateList
                                                                .elementAtOrNull(
                                                                    6)) &&
                                                        (e.projectName !=
                                                                '') &&
                                                        (e.userId ==
                                                            dataItem.userId))
                                                    .toList()
                                                    .firstOrNull
                                                    ?.allocationColor,
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                              ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        border: Border.all(
                                          color: valueOrDefault<Color>(
                                            _model.apiResult
                                                .where((e) =>
                                                    (e.date ==
                                                        _model.dateList
                                                            .elementAtOrNull(
                                                                6)) &&
                                                    (e.projectName != '') &&
                                                    (e.userId ==
                                                        dataItem.userId))
                                                .toList()
                                                .firstOrNull
                                                ?.allocationColor,
                                            FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          width: 2.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 1.0, 1.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final satProjects = _model.apiResult
                                                .where((e) =>
                                                    (e.date ==
                                                        _model.dateList
                                                            .elementAtOrNull(
                                                                6)) &&
                                                    (e.projectName != '') &&
                                                    (e.userId ==
                                                        dataItem.userId))
                                                .toList()
                                                .take(3)
                                                .toList();

                                            return ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.vertical,
                                              itemCount: satProjects.length,
                                              itemBuilder:
                                                  (context, satProjectsIndex) {
                                                final satProjectsItem =
                                                    satProjects[
                                                        satProjectsIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 6.0, 6.0, 4.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    1.0),
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 1.5,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  colorFromCssString(
                                                                satProjectsItem
                                                                    .main,
                                                                defaultColor: Color(
                                                                    0xFFF0D2C5),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              shape: BoxShape
                                                                  .rectangle,
                                                            ),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0,
                                                                      -1.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              -1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                3.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                LinearPercentIndicator(
                                                                              percent: (double var1, double var2) {
                                                                                return (var2 == 0.0) ? 0.0 : (var1 / var2).toDouble().clamp(0.0, 1.0);
                                                                              }(satProjectsItem.allocatedHours.toDouble(), satProjectsItem.workingHours.toDouble()),
                                                                              width: MediaQuery.sizeOf(context).width * 0.09,
                                                                              lineHeight: 6.0,
                                                                              animation: true,
                                                                              animateFromLastPercent: true,
                                                                              progressColor: colorFromCssString(
                                                                                satProjectsItem.complementary,
                                                                                defaultColor: FlutterFlowTheme.of(context).alternate,
                                                                              ),
                                                                              backgroundColor: colorFromCssString(
                                                                                satProjectsItem.main,
                                                                                defaultColor: Colors.black,
                                                                              ),
                                                                              barRadius: Radius.circular(2.0),
                                                                              padding: EdgeInsets.zero,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            6.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        satProjectsItem
                                                                            .projectName,
                                                                        'Project Name',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              thickness: 2.0,
                              color: FlutterFlowTheme.of(context).alternate,
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ].divide(SizedBox(height: 2.0)),
            ),
          ),
        ),
      ),
    );
  }
}
