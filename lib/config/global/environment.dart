//DEFINICIÓN DE VARIABLES DE ENTORNO
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static initEnvironmant() => {dotenv.load(fileName: '.env')};
  static String apiUrl = dotenv.get('API_URL') ?? 'No hay url api';
}
