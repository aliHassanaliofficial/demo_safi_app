import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'au_model.dart';
export 'au_model.dart';

class AuWidget extends StatefulWidget {
  const AuWidget({super.key});

  @override
  State<AuWidget> createState() => _AuWidgetState();
}

class _AuWidgetState extends State<AuWidget> {
  late AuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AuModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Align(
                alignment: const AlignmentDirectional(0.0, -1.05),
                child: Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(32.0, 12.0, 32.0, 32.0),
                  child: Container(
                    width: double.infinity,
                    height: 242.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        image: Image.asset(
                          'assets/images/iPad_Pro_12.9in__1.png',
                        ).image,
                      ),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    alignment: const AlignmentDirectional(0.0, 0.0),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.85),
                child: FlutterFlowCalendar(
                  color: FlutterFlowTheme.of(context).primary,
                  iconColor: FlutterFlowTheme.of(context).secondaryText,
                  weekFormat: false,
                  weekStartsMonday: false,
                  rowHeight: 48.0,
                  onChange: (DateTimeRange? newSelectedDate) {
                    safeSetState(
                        () => _model.calendarSelectedDay = newSelectedDate);
                  },
                  titleStyle: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Inter Tight',
                        letterSpacing: 0.0,
                      ),
                  dayOfWeekStyle:
                      FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                  dateStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Inter',
                        letterSpacing: 0.0,
                      ),
                  selectedDateStyle:
                      FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Inter Tight',
                            color: Colors.white,
                            letterSpacing: 0.0,
                          ),
                  inactiveDateStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Inter',
                            letterSpacing: 0.0,
                          ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, -0.17),
                child: Text(
                  'FLUTTER IS NOW INSTALLED  AT SAFI PROJECT',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Roboto Mono',
                    fontSize: 24.0,
                    letterSpacing: 0.0,
                    shadows: [
                      const Shadow(
                        color: Color(0xFF02093E),
                        offset: Offset(0.0, 0.0),
                        blurRadius: 20.0,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
