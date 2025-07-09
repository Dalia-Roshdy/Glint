import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'calendar_settings_form_screen05_widget.dart'
    show CalendarSettingsFormScreen05Widget;
import 'package:flutter/material.dart';

class CalendarSettingsFormScreen05Model
    extends FlutterFlowModel<CalendarSettingsFormScreen05Widget> {
  ///  Local state fields for this page.

  List<WorkingDayHourStruct> workingDays = [];
  void addToWorkingDays(WorkingDayHourStruct item) => workingDays.add(item);
  void removeFromWorkingDays(WorkingDayHourStruct item) =>
      workingDays.remove(item);
  void removeAtIndexFromWorkingDays(int index) => workingDays.removeAt(index);
  void insertAtIndexInWorkingDays(int index, WorkingDayHourStruct item) =>
      workingDays.insert(index, item);
  void updateWorkingDaysAtIndex(
          int index, Function(WorkingDayHourStruct) updateFn) =>
      workingDays[index] = updateFn(workingDays[index]);

  List<DateTime> holidays = [];
  void addToHolidays(DateTime item) => holidays.add(item);
  void removeFromHolidays(DateTime item) => holidays.remove(item);
  void removeAtIndexFromHolidays(int index) => holidays.removeAt(index);
  void insertAtIndexInHolidays(int index, DateTime item) =>
      holidays.insert(index, item);
  void updateHolidaysAtIndex(int index, Function(DateTime) updateFn) =>
      holidays[index] = updateFn(holidays[index]);

  String? errorMS;

  String? img;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isDataUploading_uploadDataImg = false;
  FFUploadedFile uploadedLocalFile_uploadDataImg =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataImg = '';

  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  String? _nameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter your full name is required';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneTextController;
  String? Function(BuildContext, String?)? phoneTextControllerValidator;
  String? _phoneTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter your phone number is required';
    }

    if (val.length < 11) {
      return 'Requires at least 11 characters.';
    }

    return null;
  }

  // State field(s) for role widget.
  Role? roleValue;
  FormFieldController<Role>? roleValueController;
  // State field(s) for calendarType widget.
  CalendarType? calendarTypeValue;
  FormFieldController<CalendarType>? calendarTypeValueController;
  DateTime? datePicked;
  // Stores action output result for [Validate Form] action in Button widget.
  bool? form;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CalendarSettingsRecord? calendar;

  @override
  void initState(BuildContext context) {
    nameTextControllerValidator = _nameTextControllerValidator;
    phoneTextControllerValidator = _phoneTextControllerValidator;
  }

  @override
  void dispose() {
    nameFocusNode?.dispose();
    nameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    phoneFocusNode?.dispose();
    phoneTextController?.dispose();
  }
}
