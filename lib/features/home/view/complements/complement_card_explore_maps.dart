import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uap_app/core/colors/app_colors.dart';
import 'package:uap_app/core/widgets/custom_elevated_button_widget.dart';
import 'package:uap_app/features/home/controller/home_controller.dart';

class ComplementCardExploreMaps extends StatefulWidget {
  final int backgroundColor;
  final HomeController controller;
  const ComplementCardExploreMaps({
    super.key,
    required this.backgroundColor,
    required this.controller,
  });

  @override
  State<ComplementCardExploreMaps> createState() =>
      _ComplementCardExploreMapsState();
}

class _ComplementCardExploreMapsState extends State<ComplementCardExploreMaps>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Inicializa o AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 1), // Duração da animação
      vsync: this,
    );

    // Cria uma Tween para animar a opacidade de 0.0 a 1.0
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    // Inicia a animação
    _controller.forward();
  }

  @override
  void dispose() {
    // Certifique-se de descartar o controlador para liberar recursos
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: AppColors.color4.color,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3,
                spreadRadius: 1,
              )
            ]),
        child: Row(
          children: [
            SizedBox(
                height: 250,
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SvgPicture.asset('undraw_mind_map.svg'),
                )),
            Container(
              width: 400,
              height: 250,
              decoration: BoxDecoration(
                  color: AppColors.color4.color,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Explore Mapas Numerológicos',
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: AppColors.color3.color),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Descubra como os números influenciam na vida com o nosso sistema numerológico cabalístico.'
                      ' De forma simples e rápida, oferecemos insights sobre a personalidade e o caminho de vida, '
                      'guiando o paciênte por uma jornada de autoconhecimento.',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.color3.color),
                    ),
                    const SizedBox(height: 20),
                    CustomElevatedButton(
                        color: AppColors.color3.color,
                        onPressed: () {
                          widget.controller.handleNavigateFeature();
                        },
                        child: const Text('Explore mapas'))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
