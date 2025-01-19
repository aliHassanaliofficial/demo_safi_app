import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget>
    with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    animationsMap.addAll({
      'imageOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 2000.0.ms,
            begin: 0.47,
            end: 1.0,
          ),
        ],
      ),
      'imageOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 170.0.ms,
            begin: const Offset(-1.0, -1.0),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 860.0.ms,
            begin: const Offset(0.0, 36.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
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
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF070707),
        body: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Stack(
                children: [
                  Opacity(
                    opacity: 0.5,
                    child: Align(
                      alignment: const AlignmentDirectional(0.0, -1.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0.0),
                        child: Image.asset(
                          'assets/images/flier.png',
                          width: 436.0,
                          height: 449.0,
                          fit: BoxFit.fitWidth,
                          alignment: const Alignment(0.0, 0.0),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['imageOnPageLoadAnimation1']!),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.85, -0.88),
                    child: FFButtonWidget(
                      onPressed: () async {
                        setAppLanguage(context, 'ar');
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: const Text('Era Engines Labs'),
                              content: const Text(
                                  'An early version of SAFI does not support multiple languages, Try to get a verified version or wait for the next update.'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext),
                                  child: const Text('Done'),
                                ),
                              ],
                            );
                          },
                        );
                        setAppLanguage(context, 'en');
                      },
                      text: FFLocalizations.of(context).getText(
                        '66s2qhrl' /* EN */,
                      ),
                      options: FFButtonOptions(
                        height: 40.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Colors.white,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Stack(
                alignment: const AlignmentDirectional(0.0, 1.0),
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.85),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (Navigator.of(context).canPop()) {
                          context.pop();
                        }
                        context.pushNamed('Au');
                      },
                      text: FFLocalizations.of(context).getText(
                        'bb5bdhuq' /* Get started */,
                      ),
                      options: FFButtonOptions(
                        width: 329.0,
                        height: 55.0,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconAlignment: IconAlignment.end,
                        iconPadding:
                            const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Colors.white,
                        textStyle:
                            FlutterFlowTheme.of(context).titleLarge.override(
                                  fontFamily: 'Inter Tight',
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(24.0),
                        hoverColor: const Color(0xFF02093E),
                        hoverTextColor: Colors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, -0.05),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/logo__white.png',
                        height: 133.0,
                        fit: BoxFit.contain,
                      ),
                    ).animateOnPageLoad(
                        animationsMap['imageOnPageLoadAnimation2']!),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.45),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: GradientText(
                        FFLocalizations.of(context).getText(
                          'ecqib467' /* WELCOME TO THE ARAB REPUBLIC O... */,
                        ),
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).displayMedium.override(
                                  fontFamily: 'Inter Tight',
                                  fontSize: 38.0,
                                  letterSpacing: 1.0,
                                  lineHeight: 1.35,
                                ),
                        colors: const [Color(0xFFE98D25), Color(0xFF8D12BA)],
                        gradientDirection: GradientDirection.ltr,
                        gradientType: GradientType.linear,
                      ).animateOnPageLoad(
                          animationsMap['textOnPageLoadAnimation']!),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
