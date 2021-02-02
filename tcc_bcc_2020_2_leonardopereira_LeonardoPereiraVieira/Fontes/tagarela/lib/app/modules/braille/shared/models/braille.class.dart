import 'package:tagarela/app/modules/braille/shared/models/palavraBraille.class.dart';
import 'package:tagarela/app/shared/util/constants.dart';

class Braille {
  static const String C_NUMERO = '№';
  static const String C_UPPER = '↑';
  static const String C_END_ELET = '→';
  static const String S_VAZIO = '000000';

  static List<PalavraBraille> PALAVRAS_BRAILLE = [
    PalavraBraille(
        letra: 'a',
        sinal: 'a',
        exemplo: 'abelha',
        imagem: '${PATH_PALAVRAS_BRAILLE}abelha.png'), //1º
    PalavraBraille(
        letra: 'b',
        sinal: 'b',
        exemplo: 'baú',
        imagem: '${PATH_PALAVRAS_BRAILLE}bau.png'),
    PalavraBraille(
        letra: 'c',
        sinal: 'c',
        exemplo: 'cachorro',
        imagem: '${PATH_PALAVRAS_BRAILLE}cachorro.png'),
    PalavraBraille(
        letra: 'd',
        sinal: 'd',
        exemplo: 'dado',
        imagem: '${PATH_PALAVRAS_BRAILLE}dado.png'),
    PalavraBraille(
        letra: 'e',
        sinal: 'e',
        exemplo: 'elefante',
        imagem: '${PATH_PALAVRAS_BRAILLE}elefante.png'),
    PalavraBraille(
        letra: 'f',
        sinal: 'f',
        exemplo: 'folha',
        imagem: '${PATH_PALAVRAS_BRAILLE}folha.png'),
    PalavraBraille(
        letra: 'g',
        sinal: 'g',
        exemplo: 'gato',
        imagem: '${PATH_PALAVRAS_BRAILLE}gato.png'),
    PalavraBraille(
        letra: 'h',
        sinal: 'h',
        exemplo: 'helicóptero',
        imagem: '${PATH_PALAVRAS_BRAILLE}helicoptero.png'),
    PalavraBraille(
        letra: 'i',
        sinal: 'i',
        exemplo: 'ilha',
        imagem: '${PATH_PALAVRAS_BRAILLE}ilha.png'),
    PalavraBraille(
        letra: 'j',
        sinal: 'j',
        exemplo: 'joaninha',
        imagem: '${PATH_PALAVRAS_BRAILLE}joaninha.png'),
    PalavraBraille(
        letra: 'k',
        sinal: 'k',
        exemplo: 'kiwi',
        imagem: '${PATH_PALAVRAS_BRAILLE}kiwi.png'), //2º
    PalavraBraille(
        letra: 'l',
        sinal: 'l',
        exemplo: 'livro',
        imagem: '${PATH_PALAVRAS_BRAILLE}livro.png'),
    PalavraBraille(
        letra: 'm',
        sinal: 'm',
        exemplo: 'morango',
        imagem: '${PATH_PALAVRAS_BRAILLE}morango.png'),
    PalavraBraille(
        letra: 'n',
        sinal: 'n',
        exemplo: 'ninho',
        imagem: '${PATH_PALAVRAS_BRAILLE}ninho.png'),
    PalavraBraille(
        letra: 'o',
        sinal: 'o',
        exemplo: 'olho',
        imagem: '${PATH_PALAVRAS_BRAILLE}olho.png'),
    PalavraBraille(
        letra: 'p',
        sinal: 'p',
        exemplo: 'pato',
        imagem: '${PATH_PALAVRAS_BRAILLE}pato.png'),
    PalavraBraille(
        letra: 'q',
        sinal: 'q',
        exemplo: 'queijo',
        imagem: '${PATH_PALAVRAS_BRAILLE}queijo.png'),
    PalavraBraille(
        letra: 'r',
        sinal: 'r',
        exemplo: 'rato',
        imagem: '${PATH_PALAVRAS_BRAILLE}rato.png'),
    PalavraBraille(
        letra: 's',
        sinal: 's',
        exemplo: 'sapo',
        imagem: '${PATH_PALAVRAS_BRAILLE}sapo.png'),
    PalavraBraille(
        letra: 't',
        sinal: 't',
        exemplo: 'tigre',
        imagem: '${PATH_PALAVRAS_BRAILLE}tigre.png'),
    PalavraBraille(
        letra: 'u',
        sinal: 'u',
        exemplo: 'uva',
        imagem: '${PATH_PALAVRAS_BRAILLE}uva.png'), //3º
    PalavraBraille(
        letra: 'v',
        sinal: 'v',
        exemplo: 'vassoura',
        imagem: '${PATH_PALAVRAS_BRAILLE}vassoura.png'),
    PalavraBraille(
        letra: 'x',
        sinal: 'x',
        exemplo: 'xícara',
        imagem: '${PATH_PALAVRAS_BRAILLE}xicara.png'),
    PalavraBraille(
        letra: 'y',
        sinal: 'y',
        exemplo: 'youtube',
        imagem: '${PATH_PALAVRAS_BRAILLE}youtube.png'),
    PalavraBraille(
        letra: 'z',
        sinal: 'z',
        exemplo: 'zebra',
        imagem: '${PATH_PALAVRAS_BRAILLE}zebra.png'),
    PalavraBraille(
        letra: 'ç',
        sinal: 'ç',
        exemplo: 'maça',
        imagem: '${PATH_PALAVRAS_BRAILLE}maca.png'),
    PalavraBraille(
        letra: 'é',
        sinal: 'é',
        exemplo: 'jacaré',
        //fala: 'e com acento agudo',
        imagem: '${PATH_PALAVRAS_BRAILLE}jacare.png'),
    PalavraBraille(
        letra: 'á',
        sinal: 'á',
        exemplo: 'máscara',
        //fala: 'á com acento agudo',
        imagem: '${PATH_PALAVRAS_BRAILLE}mascara.png'),
    PalavraBraille(
        letra: 'è',
        sinal: 'è',
        //fala: 'e com acento grave',
        texto:
            'Símbolo não utilizado na grafia braille para a língua portuguesa'),
    PalavraBraille(
        letra: 'ú',
        sinal: 'ú',
        exemplo: 'baú',
        //fala: 'u com acento agudo',
        imagem: '${PATH_PALAVRAS_BRAILLE}bau.png'),
    PalavraBraille(
        letra: 'â',
        sinal: 'â',
        exemplo: 'triângulo',
        //fala: 'a com acento circunflexo',
        imagem: '${PATH_PALAVRAS_BRAILLE}triangulo.png'), //4º
    PalavraBraille(
        letra: 'ê',
        sinal: 'ê',
        exemplo: 'gênio',
        //fala: 'e com acento circunflexo',
        imagem: '${PATH_PALAVRAS_BRAILLE}genio.png'),
    PalavraBraille(
        letra: '',
        sinal: 'þ',
        texto:
            'Símbolo não utilizado na grafia braille para a língua portuguesa'), // ///ver que simbolo é esse
    PalavraBraille(
        letra: 'ô',
        sinal: 'ô',
        exemplo: 'ônibus',
        //fala: 'o com acento circunflexo',
        imagem: '${PATH_PALAVRAS_BRAILLE}onibus.png'),
    PalavraBraille(
        letra: '@',
        sinal: '@',
        exemplo: 'furb@furb.com',
        imagem: '${PATH_PALAVRAS_BRAILLE}arroba-braille.png'),
    PalavraBraille(
        letra: 'à',
        sinal: 'à',
        exemplo: 'vamos à praia.',
        //fala: 'a com acento grave',
        imagem: '${PATH_PALAVRAS_BRAILLE}letra.png'),
    PalavraBraille(
        letra: 'ï',
        sinal: 'ï',
        //fala: 'i com acento trema',
        texto:
            'Símbolo não utilizado na grafia braille para a língua portuguesa'),
    PalavraBraille(
        letra: 'ü',
        sinal: 'ü',
        //fala: 'u com acento trema',
        texto:
            'Símbolo não utilizado na grafia braille para a língua portuguesa'),
    PalavraBraille(
        letra: 'õ',
        sinal: 'õ',
        exemplo: 'caminhões',
        //fala: 'õ com acento tio',
        imagem: '${PATH_PALAVRAS_BRAILLE}caminhoes.png'),
    PalavraBraille(
        letra: 'w',
        sinal: 'W',
        exemplo: 'Wallace',
        texto: 'Letra utilizada geralmente em substantivos próprios.'),
    PalavraBraille(
        letra: ',',
        sinal: ',',
        imagem: '${PATH_PALAVRAS_BRAILLE}virgula.png',
        exemplo: 'escola, trabalho e casa'), //5º
    PalavraBraille(
        letra: ';',
        sinal: ';',
        imagem: '${PATH_PALAVRAS_BRAILLE}pontovirgula.png',
        exemplo: 'livros; caderno; canetas; lápis.'),
    PalavraBraille(
        letra: ':',
        sinal: ':',
        exemplo: 'brincar de: amarelinha e pega-pega.',
        imagem: '${PATH_PALAVRAS_BRAILLE}dois-pontos.png'),
    PalavraBraille(
        letra: '÷',
        sinal: '÷',
        exemplo: '2 ÷ 1',
        exemploBraille: '${C_NUMERO}2 ÷ ${C_NUMERO}1',
        imagem: '${PATH_PALAVRAS_BRAILLE}dois-pontos.png'),
    PalavraBraille(
        letra: '?',
        sinal: '?',
        exemplo: 'qual seu nome?',
        imagem: '${PATH_PALAVRAS_BRAILLE}interrogacao.png'),
    PalavraBraille(
        letra: '!',
        sinal: '!',
        exemplo: 'eu amo você!',
        imagem: '${PATH_PALAVRAS_BRAILLE}exclamacao.png'),
    PalavraBraille(
        letra: '+',
        sinal: '+',
        exemplo: '34 + 56',
        exemploBraille: '${C_NUMERO}34 + ${C_NUMERO}56',
        imagem: '${PATH_PALAVRAS_BRAILLE}adicao.png'),
    PalavraBraille(
        letra: '=',
        sinal: '=',
        exemplo: '78 = 78',
        exemploBraille: '${C_NUMERO}78 = ${C_NUMERO}78',
        imagem: '${PATH_PALAVRAS_BRAILLE}igual.png'),
    PalavraBraille(
        letra: '×',
        sinal: '×',
        exemplo: '9 × 10',
        exemploBraille: '${C_NUMERO}9 × ${C_NUMERO}10',
        imagem: '${PATH_PALAVRAS_BRAILLE}multiplicacao.png'),
    PalavraBraille(
        letra: '"',
        sinal: '"',
        exemplo: '"melhor do mundo"',
        imagem: '${PATH_PALAVRAS_BRAILLE}aspas.png'),
    PalavraBraille(
        letra: '*',
        sinal: '*',
        exemplo: '*exemplo',
        imagem: '${PATH_PALAVRAS_BRAILLE}asterisco.png'),
    PalavraBraille(
        letra: '°',
        sinal: '°',
        exemplo: 'a máxima foi de ${C_NUMERO}35° c.',
        imagem: '${PATH_PALAVRAS_BRAILLE}grau.png'),
    PalavraBraille(
        letra: 'í',
        sinal: 'í',
        exemplo: 'íma',
        //fala: 'i com acento agudo',
        imagem: '${PATH_PALAVRAS_BRAILLE}ima.png'),
    PalavraBraille(
        letra: 'ã',
        sinal: 'ã',
        exemplo: 'avião',
        //fala: 'a com acento tio',
        imagem: '${PATH_PALAVRAS_BRAILLE}aviao.png'),
    PalavraBraille(
        letra: 'ó',
        sinal: 'ó',
        exemplo: 'óculos',
        //fala: 'o com acento agudo',
        imagem: '${PATH_PALAVRAS_BRAILLE}oculos.png'),
    PalavraBraille(
        letra: 'nº',
        sinal: C_NUMERO,
        exemplo: '1 2 3 4 5 6 7 8 9 10',
        exemploBraille:
            '${C_NUMERO}1 ${C_NUMERO}2 ${C_NUMERO}3 ${C_NUMERO}4 ${C_NUMERO}5 ${C_NUMERO}6 ${C_NUMERO}7 ${C_NUMERO}8 ${C_NUMERO}9 ${C_NUMERO}10',
        imagem: '${PATH_PALAVRAS_BRAILLE}sinal-numerico.png'),
    PalavraBraille(
        letra: '.',
        sinal: '.',
        exemplo: 'terminei de ler o livro.',
        imagem: '${PATH_PALAVRAS_BRAILLE}ponto-final.png'),
    PalavraBraille(
        letra: '-',
        sinal: '-',
        exemplo: 'minha verdura preferida é couve-flor.',
        imagem: '${PATH_PALAVRAS_BRAILLE}hifen.png'),
    PalavraBraille(
        letra: '',
        sinal: 'π',
        exemploBraille: 'πp',
        texto:
            'Este sinal só possui valor representativo na grafia braille para a língua portuguesa combinado com outro sinal. Ex: Pi'), //7º
    PalavraBraille(
        letra: '',
        sinal: 'α',
        exemploBraille: 'αa',
        texto:
            'Este sinal só possui valor representativo na grafia braille para a língua portuguesa combinado com outro sinal. Ex: Alfa'),
    PalavraBraille(
        letra: '',
        sinal: '|',
        exemplo: '5%',
        exemploBraille: '↑5|°',
        texto:
            'Este sinal só possui valor representativo na grafia braille para a língua portuguesa combinado com outro sinal. Ex: 5%'),
    PalavraBraille(
        letra: '',
        sinal: C_END_ELET,
        exemplo: 'google.com',
        exemploBraille: '→google.com ',
        texto:
            'Este sinal não possui representação em tinta e é utilizado em questões específicas da grafia braille para a língua portuguesa. Deve ser escrito imediatamente antes e após endereços de sites e e-mails, sem espaços.'),
    PalavraBraille(
        letra: '',
        sinal: C_UPPER,
        exemplo: 'Braille',
        exemploBraille: '↑Braille',
        texto: 'letra maiúscula'),
    PalavraBraille(
        letra: '\$',
        sinal: '\$',
        exemplo: 'R\$ 10,00',
        exemploBraille: '${C_UPPER}R\$ ${C_NUMERO}10,00'),
    PalavraBraille(
        letra: '',
        sinal: '∫',
        exemplo: '01/01/2020',
        exemploBraille: '${C_NUMERO}01∫,${C_NUMERO}01∫,${C_NUMERO}2020∫,',
        texto:
            'Este sinal só possui valor representativo na grafia braille para a língua portuguesa combinado com outro sinal. ex.: / (barra)'),
  ];

  static Map<String, String> mapImages = {
    'abelha': 'assets/images/palavras-braille/abelha.png',
    'divisão': 'assets/images/palavras-braille/divisao.png',
    'joaninha': 'assets/images/palavras-braille/joaninha.png',
    'peixe': 'assets/images/palavras-braille/peixe.png',
    'kiwi': 'assets/images/palavras-braille/kiwi.png',
    'lâmpada': 'assets/images/palavras-braille/lampada.png',
    'árvore': 'assets/images/palavras-braille/arvore.png',
    'lápis': 'assets/images/palavras-braille/lapis.png',
    'elefante': 'assets/images/palavras-braille/elefante.png',
    'leão': 'assets/images/palavras-braille/leao.png',
    'queijo': 'assets/images/palavras-braille/queijo.png',
    'rato': 'assets/images/palavras-braille/rato.png',
    'avião': 'assets/images/palavras-braille/aviao.png',
    'folha': 'assets/images/palavras-braille/folha.png',
    'livro': 'assets/images/palavras-braille/livro.png',
    'sapo': 'assets/images/palavras-braille/sapo.png',
    'baú': 'assets/images/palavras-braille/bau.png',
    'gato': 'assets/images/palavras-braille/gato.png',
    'maça': 'assets/images/palavras-braille/maca.png',
    'bola': 'assets/images/palavras-braille/bola.png',
    'gênio': 'assets/images/palavras-braille/genio.png',
    'macaco': 'assets/images/palavras-braille/macaco.png',
    'tartaruga': 'assets/images/palavras-braille/tartaruga.png',
    'borboleta': 'assets/images/palavras-braille/borboleta.png',
    'girafa': 'assets/images/palavras-braille/girafa.png',
    'máscara': 'assets/images/palavras-braille/mascara.png',
    'tesoura': 'assets/images/palavras-braille/tesoura.png',
    'borracha': 'assets/images/palavras-braille/borracha.png',
    'melancia': 'assets/images/palavras-braille/melancia.png',
    'tigre': 'assets/images/palavras-braille/tigre.png',
    'cachorro': 'assets/images/palavras-braille/cachorro.png',
    'morango': 'assets/images/palavras-braille/morango.png',
    'triângulo': 'assets/images/palavras-braille/triangulo.png',
    'caminhão': 'assets/images/palavras-braille/caminhoes.png',
    'helicóptero': 'assets/images/palavras-braille/helicoptero.png',
    'uva': 'assets/images/palavras-braille/uva.png',
    'chapéu': 'assets/images/palavras-braille/chapeu.png',
    'ninho': 'assets/images/palavras-braille/ninho.png',
    'vassoura': 'assets/images/palavras-braille/vassoura.png',
    'óculos': 'assets/images/palavras-braille/oculos.png',
    'cobra': 'assets/images/palavras-braille/cobra.png',
    'ilha': 'assets/images/palavras-braille/ilha.png',
    'olho': 'assets/images/palavras-braille/olho.png',
    'coelho': 'assets/images/palavras-braille/coelho.png',
    'imã': 'assets/images/palavras-braille/ima.png',
    'ónibus': 'assets/images/palavras-braille/onibus.png',
    'xícara': 'assets/images/palavras-braille/xicara.png',
    'coração': 'assets/images/palavras-braille/coracao.png',
    'panda': 'assets/images/palavras-braille/panda.png',
    'youtube': 'assets/images/palavras-braille/youtube.png',
    'coruja': 'assets/images/palavras-braille/coruja.png',
    'passarinho': 'assets/images/palavras-braille/passarinho.png',
    'zebra': 'assets/images/palavras-braille/zebra.png',
    'dado': 'assets/images/palavras-braille/dado.png',
    'jacaré': 'assets/images/palavras-braille/jacare.png',
    'pato': 'assets/images/palavras-braille/pato.png',
  };

  static Map<String, String> mapConsultaSinal = {
    '001111' + '100000': '1',
    '001111' + '110000': '2',
    '001111' + '100100': '3',
    '001111' + '100110': '4',
    '001111' + '100010': '5',
    '001111' + '110100': '6',
    '001111' + '110110': '7',
    '001111' + '110010': '8',
    '001111' + '010100': '9',
    '001111' + '010110': '0',
    '100000' + '000000': 'a',
    '110000' + '000000': 'b',
    '100100' + '000000': 'c',
    '100110' + '000000': 'd',
    '100010' + '000000': 'e',
    '110100' + '000000': 'f',
    '110110' + '000000': 'g',
    '110010' + '000000': 'h',
    '010100' + '000000': 'i',
    '010110' + '000000': 'j',
    '101000' + '000000': 'k',
    '111000' + '000000': 'l',
    '101100' + '000000': 'm',
    '101110' + '000000': 'n',
    '101010' + '000000': 'o',
    '111100' + '000000': 'p',
    '111110' + '000000': 'q',
    '111010' + '000000': 'r',
    '011100' + '000000': 's',
    '011110' + '000000': 't',
    '101001' + '000000': 'u',
    '111001' + '000000': 'v',
    '010111' + '000000': 'w',
    '101101' + '000000': 'x',
    '101111' + '000000': 'y',
    '101011' + '000000': 'z',
    '111101' + '000000': 'ç',
    '111011' + '000000': 'á',
    '111111' + '000000': 'é',
    '001100' + '000000': 'í',
    '001101' + '000000': 'ó',
    '011111' + '000000': 'ú',
    '110101' + '000000': 'à',
    '011101' + '000000': 'è',
    '100101' + '000000': 'ì',
    '100001' + '000000': 'â',
    '110001' + '000000': 'ê',
    '100111' + '000000': 'ô',
    '100011' + '000000': '@',
    '110111' + '000000': 'ï',
    '110011' + '000000': 'ü',
    '010101' + '000000': 'õ',
    '010000' + '000000': ',',
    '011000' + '000000': ';',
    '010010' + '000000': ':',
    '010011' + '000000': '÷',
    '010001' + '000000': '?',
    '011010' + '000000': '!+',
    '011011' + '000000': '=',
    '011001' + '000000': '"×',
    '001010' + '000000': '*',
    '001011' + '000000': '°',
    '001110' + '000000': 'ã',
    '001111' + '000000': C_NUMERO,
    '001000' + '000000': '.',
    '001001' + '000000': '-',
    '000100' + '111100': 'π', //Pi
    '111000' + '001011': '%',
    '000101' + '000000': C_UPPER, //Maiusculo
    '000011' + '000000': '\$',
    '000001' + '011111': ']',
    '111011' + '001000': '[',
    '110001' + '001000': '(',
    '000001' + '001110': ')',
    '000111' + '000000': '|',
    '000001' + '010111': '/',
    '001001' + '001001': '–',
    '000000' + '000000': ' ',
    '000010' + '000000': C_END_ELET,
  };

  static String _consultaSinal(String sinal1, {String sinal2 = '000000'}) {
    String retorno = '';

    ///Foi usado sempre simbolo composto pra que se digitar apenas na segunda celula, mesmo assim mostrar que caractere representa
    if (sinal1 == '000101' && sinal2 != S_VAZIO) {
      retorno = mapConsultaSinal[sinal2 + S_VAZIO];
      if (retorno != null) return retorno.toUpperCase();
    }
    if (sinal1 != S_VAZIO)
      retorno = mapConsultaSinal[sinal1 + sinal2];
    else
      retorno = mapConsultaSinal[sinal2 + sinal1];

    return retorno != null ? retorno : '';
  }

  static String consultaSinalToString(String sinal1,
      {String sinal2 = '000000'}) {
    String retorno = _consultaSinal(sinal1, sinal2: sinal2);
    if (retorno == C_UPPER)
      retorno = 'Maiúsculo';
    else if (retorno == C_NUMERO)
      retorno = 'Nº';
    else if (retorno.length == 2) retorno = retorno[0] + ' ou ' + retorno[1];

    return retorno != null ? retorno : '';
  }

  static String escritaSinalToString(String sinal1,
      {String sinal2 = '000000'}) {
    String retorno = _consultaSinal(sinal1, sinal2: sinal2);

    return retorno != null ? retorno : '';
  }

  static String getPonto(String caracter) {
    String r = '';
    String pontos = '';
    mapConsultaSinal.forEach((key, value) {
      if (caracter == value) pontos = key;
    });
    if (pontos != '')
      for (int i = 0; i < pontos.length; i++) {
        if (pontos[i] != '0') {
          r = r + ', ' + (i + 1).toString();
        }
      }

    return r;
  }

  static String getPontoSinal(String sinal) {
    String r = '';
    if (sinal != '')
      for (int i = 0; i < sinal.length; i++) {
        if (sinal[i] != '0') {
          r = r + ', ' + (i + 1).toString();
        }
      }

    return r;
  }
}
