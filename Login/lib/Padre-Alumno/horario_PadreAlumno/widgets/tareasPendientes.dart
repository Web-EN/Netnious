import 'package:Login/profesores/asignar_Fecha_Proyecto/sources.dart';
import 'package:flutter/material.dart';

class TareasPendientesHorario extends StatefulWidget {
  const TareasPendientesHorario({super.key});

  @override
  State<TareasPendientesHorario> createState() =>
      _TareasPendientesHorarioState();
}

class _TareasPendientesHorarioState extends State<TareasPendientesHorario> {
  @override
  Widget build(BuildContext context) {
    return NewContainer(child: ContainerTareasPendientesHorario());
  }
}

class ContainerTareasPendientesHorario extends StatefulWidget {
  const ContainerTareasPendientesHorario({super.key});

  @override
  State<ContainerTareasPendientesHorario> createState() =>
      _ContainerTareasPendientesHorarioState();
}

class _ContainerTareasPendientesHorarioState
    extends State<ContainerTareasPendientesHorario> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      width: screenSize.width,
      height: 200,
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.5),
          borderRadius: BorderRadius.circular(15)),
      child: Text(
        "Usted no cuenta con tareas en este momento...",
        style: TextStyle(fontSize: 18, color: Color.fromRGBO(0, 0, 0, 0.5)),
      ),
    );
  }
}
