const Map<int, Map<String, dynamic>> telas = {
  1: {
    'hasProx': true,
    'isSendAnswer': false,
    'header': "TERMO DE CONSENTIMENTO LIVRE E ESCLARECIDO",
    'type': 'terms',
    'body': """

Você está sendo convidado(a) a participar da pesquisa intitulada “Sistematização de ferramentas para avaliação psicopatológica utilizando técnicas de Inteligência Artificial”, sob a responsabilidade dos pesquisadores Dr Keiji Yamamata e Ms Résia da Silva Morais (da Faculdade de Engenharia Elétrica da Universidade Federal de Uberlândia).
Nesta pesquisa nós estamos buscando confirmar a possibilidade de usar técnicas de inteligência artificial para uma avaliação das funções psíquicas, essenciais na avaliação psicopatológica com o objetivo de ajudar os profissionais da área da saúde mental. 
O Termo/registro de Consentimento Livre e Esclarecido está sendo obtido pelos pesquisadores Dr Keiji Yamamata e Ms Résia da Silva Morais através da plataforma do GitHub Pages, antecedendo toda e qualquer experimentação que envolva a pesquisa. Conforme o item IV da Resol. CNS 466/12 ou Cap. III da Resol. 510/2016, o participante terá o tempo que julgar necessário para decidir se deseja participar da pesquisa.
Na sua participação, após você ter preenchido as informações que constituem o Termo de Consentimento Livre e Esclarecido e após ter assinado eletronicamente o campo no qual aceita participar da pesquisa, será solicitado que você responda um questionário apresentado na tela do computador, composto por 65 questões. Em algumas questões, será solicitado que você ouça primeiramente alguns sons para respondê-las. Cada tela apresentada pelo questionário permitirá a identificação da relação entre as respostas dadas por você e sinais de possíveis funções psíquicas afetadas como a atenção, consciência, orientação, memória, inteligência e linguagem. As respostas serão analisadas por meio de um sistema de inteligência artificial desenvolvido a partir da biblioteca TensorFlow  na linguagem Python.
Em nenhum momento você será identificado. Os resultados da pesquisa serão publicados e mesmo assim a sua identidade será preservada. Você não terá nenhum gasto nem ganho financeiro por participar na pesquisa. A equipe de pesquisa se compromete em divulgar os resultados em formato acessível a todos os participantes da pesquisa de acordo com a resolução CNS nº 510 de 2016, Artigo 3º, Inciso IV. Havendo algum dano decorrente da pesquisa, você terá direto a solicitar indenização através das vias judiciais (Código Civil, Lei 10.406/2002, Artigos 927 a 954 e Resolução CNS nº 510 de 2016, Artigo 19).
Os riscos consistem em possibilidade de cansaço durante a realização da prova e algum desconforto relacionado a utilização do equipamento. Há ainda um risco mínimo de identificação, embora a plataforma GitHub Pages dificulte ao máximo essa possibilidade. Os benefícios serão a expansão do seu conhecimento sobre a importância do conteúdo da inteligência artificial como um meio para auxiliar o processo de avaliação psicológica, o que pode facilitar o trabalho clínico dos profissionais da saúde mental. Os dados da pesquisa serão mantidos em arquivo, físico ou digital, sob sua guarda e responsabilidade, por um período mínimo de 5 (cinco) anos após o término da pesquisa, conforme capítulo VI da resolução CNS 510, de 07 de abril de 2016.
Você é livre para deixar de participar da pesquisa a qualquer momento sem qualquer prejuízo ou coação. Até o momento da divulgação dos resultados, você também é livre para solicitar a retirada dos seus dados da pesquisa.
Uma via original deste Termo de Consentimento Livre e Esclarecido ficará com você, você poderá salvar em seu dispositivo eletrônico.
Em caso de qualquer dúvida ou reclamação a respeito da pesquisa, você poderá entrar em contato com: Dr. Keiji Yamamata, Faculdade de Engenharia Elétrica Da Universidade Federal de Uberlândia. Av. João Naves de Ávila, 2121
Campus Santa Mônica - Universidade Federal de Uberlândia
CEP 38400-902 - Uberlândia MG - Brasil - Fone (sala coordenação): (34) 3239-4706. Para obter orientações quanto aos direitos dos participantes de pesquisa acesse a cartilha no link:
https://conselho.saude.gov.br/images/comissoes/conep/documentos/Cartilha_Direitos_Eticos_2020.pdf.
Você poderá também entrar em contato com o CEP - Comitê de Ética na Pesquisa com Seres Humanos na Universidade Federal de Uberlândia, localizado na Av. João Naves de Ávila, nº 2121, bloco A, sala 224, campus Santa Mônica – Uberlândia/MG, 38408-100; telefone: 34-3239-4131 ou pelo e-mail cep@propp.ufu.br. O CEP é um colegiado independente criado para defender os interesses dos participantes das pesquisas em sua integridade e dignidade e para contribuir para o desenvolvimento da pesquisa dentro de padrões éticos conforme resoluções do Conselho Nacional de Saúde.

""",
  },
  2: {
    'hasProx': true,
    'isSendAnswer': true,
    'header':
        'Ferramenta de Avaliação Psicopatológica usando Inteligência Artificial',
    'type': 'quest',
  },
  3: {
    'hasProx': true,
    'isSendAnswer': true,
    'header':
        'Você possui algum diagnóstico laudado por um profissional da saúde?',
    'type': 'laudo',
  },
  4: {
    'hasProx': true,
    'isSendAnswer': false,
    'type': 'sobre',
    'header': 'Informações',
    'body':
        "A partir de agora serão apresentadas telas com as instruções das tarefas que você irá responder.\n\nCertifique-se que esteja em um ambiente silencioso, sem estímulos de distração.\n\nEm algumas telas serão apresentados sons, sendo assim, fundamental o uso de fones ou que você ligue os alto-falantes do seu dispositivo.\n\nPoderá haver telas em branco por alguns instantes, mas isso faz parte do teste.",
  },
  5: {
    'hasProx': true,
    'isSendAnswer': false,
    'type': 'sobre',
    'header': 'Atenção!!',
    'body': "Olhe atentamente para a figura apresentada na proxima tela.",
  },
  6: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'consc_aten',
    'mode': 'consc',
    'header1': "",
    'header2': "O que você viu na tela anterior",
    'image': 'assets/arvore_free.png',
    'op': [
      "Jesus Cristo",
      "Coração",
      "Dragão cuspindo fogo",
      "Árvore",
      "Não vi nada",
      "Outra coisa"
    ],
  },
  7: {
    'hasProx': true,
    'isSendAnswer': false,
    'type': 'sobre',
    'header': 'Atenção!!',
    'body': "Olhe atentamente para a figura apresentada na proxima tela.",
  },
  8: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'consc_aten',
    'mode': 'consc',
    'header1': "",
    'header2': "O que você viu na tela anterior",
    'image': 'assets/coracao_free.png',
    'op': [
      "Jesus Cristo",
      "Coração",
      "Dragão cuspindo fogo",
      "Árvore",
      "Não vi nada",
      "Outra coisa"
    ],
  },
  9: {
    'hasProx': true,
    'isSendAnswer': false,
    'type': 'sobre',
    'header': 'Atenção!!',
    'body': "Olhe atentamente para a figura apresentada na proxima tela.",
  },
  10: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'consc_aten',
    'mode': 'consc',
    'header1': "",
    'header2': "O que você viu na tela, anterior",
    'image': '',
    'op': [
      "Jesus Cristo",
      "Coração",
      "Dragão cuspindo fogo",
      "Árvore",
      "Não vi nada",
      "Outra coisa"
    ],
  },
  11: {
    'hasProx': true,
    'isSendAnswer': false,
    'type': 'sobre',
    'header': 'Informações',
    'body':
        "Nas próximas telas, serão apresentadas algumas sequências de números, após visualizá-las você deverá marcar a resposta que corresponde à sequência correta.",
  },
  12: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'consc_aten',
    'mode': 'aten',
    'header1': "Atente-se para a sequência de números apresentada",
    'header2':
        "Qual foi a sequência correta dos números apresentados na tela anterior?",
    'image': "2 - 7",
    'op': ["1 - 5", "4 - 7", "2 - 7", "2 - 8", "9 - 4", "7 - 2"],
  },
  13: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'consc_aten',
    'mode': 'aten',
    'header1': "Atente-se para a sequência de números apresentada",
    'header2':
        "Qual foi a sequência correta dos números apresentados na tela anterior?",
    'image': "5 - 6 - 4",
    'op': [
      "5 - 7 - 1",
      "1 - 3 - 4",
      "5 - 6 - 3",
      "4 - 6 - 5",
      "5 - 4 - 6",
      "5 - 6 - 4"
    ],
  },
  14: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'consc_aten',
    'mode': 'aten',
    'header1': "Atente-se para a sequência de números apresentada",
    'header2':
        "Qual foi a sequência correta dos números apresentados na tela anterior?",
    'image': "6 - 4 - 3 - 9",
    'op': [
      "6 - 4 - 9 - 3",
      "4 - 8 - 9 - 1",
      "6 - 4 - 3 - 9",
      "5 - 4 - 3 - 8",
      "1 - 5 - 2 - 9",
      "6 - 4 - 3 - 7"
    ],
  },
  15: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'consc_aten',
    'mode': 'aten',
    'header1': "Atente-se para a sequência de números apresentada",
    'header2':
        "Qual foi a sequência correta dos números apresentados na tela anterior?",
    'image': "4 - 2 - 7 - 3 - 1",
    'op': [
      "2 - 1 - 4 - 7 - 9",
      "4 - 3 - 9 - 8",
      "4 - 2 - 6 - 3 - 1",
      "7 - 5 - 1 - 4 - 2",
      "4 - 2 - 7 - 3 - 1",
      "6 - 3 - 1 - 5 - 9"
    ],
  },
  16: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'consc_aten',
    'mode': 'aten',
    'header1': "Atente-se para a sequência de números apresentada",
    'header2':
        "Qual foi a sequência correta dos números apresentados na tela anterior?",
    'image': "6 - 1 - 9 - 4 - 7 - 3",
    'op': [
      "6 - 1 - 4 - 7 - 3 - 9",
      "2 - 1 - 8 - 3 - 9 - 5",
      "6 - 1 - 9 - 4 - 7 - 3",
      "6 - 4 - 5 - 8 - 3 - 7",
      "2 - 8 - 6 - 4 - 7 - 3",
      "6 - 1 - 9 - 4 - 5 - 2"
    ],
  },
  17: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'consc_aten',
    'mode': 'aten',
    'header1': "Atente-se para a sequência de números apresentada",
    'header2':
        "Qual foi a sequência correta dos números apresentados na tela anterior?",
    'image': "5 - 9 - 1 - 7 - 4 - 2 - 8",
    'op': [
      "5 - 8 - 1 - 7 - 4 - 3 - 8",
      "5 - 9 - 1 - 7 - 4 - 8",
      "8 - 9 - 0 - 7 - 3 - 1",
      "5 - 9 - 1 - 7 - 4 - 2 - 8",
      "5 - 2 - 3 - 7 - 4 - 9 - 8",
      "5 - 9 - 1 - 7 - 8 - 0 - 9"
    ],
  },
  18: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'intel',
    'header': "Qual das imagens abaixo completa a sequência a seguir?",
    'body': 'assets/intel_1.png',
    'modo_body': 'image',
    'modo_op': 'image', //Imagem nas respostas
    'op': [
      'assets/intel_1a.png',
      'assets/intel_1b.png',
      'assets/intel_1c.png',
      'assets/intel_1d.png',
      'assets/intel_1e.png',
      'assets/intel_1f.png'
    ],
  },
  19: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'intel',
    'header': "Qual das imagens abaixo completa a sequência a seguir?",
    'body': 'assets/intel_2.png',
    'modo_body': 'image',
    'modo_op': 'image', //Imagem nas respostas
    'op': [
      'assets/intel_2a.png',
      'assets/intel_2b.png',
      'assets/intel_2c.png',
      'assets/intel_2d.png',
      'assets/intel_2e.png',
      'assets/intel_2f.png'
    ],
  },
  20: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'yes_no',
    'header': "Responda as questões abaixo:",
    'op': [
      'Tem notado muita preocupação com um ou mais defeitos ou falhas percebidas na aparência física que não são observáveis ou que parecem leves para os outros.',
      'Ultimamente tem arrancado o próprio cabelo de forma recorrente, resultando em perda de cabelo?',
      'Acentuada diminuição do interesse ou prazer em todas ou quase todas as atividades na maior parte do dia; sente-se triste, vazio, sem esperança?',
      'As situações sociais, tais como falar em público, quase sempre provocam medo ou ansiedade? ',
    ],
  },
  21: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'complete',
    'header': "Complete a sequência a seguir:",
    'op': '2, 4, 8, 16, ?',
  },
  22: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'complete',
    'header': "Complete a sequência a seguir:",
    'op': '1, 3, 9, ?',
  },
  23: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'complete',
    'header': "Complete a sequência a seguir:",
    'op': '3, 7, 11, 15, ? ',
  },
  24: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'complete',
    'header': "Complete a sequência a seguir:",
    'op': '32, 16, 8, ? ',
  },
  25: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'intel',
    'header':
        "Os números de vezes que as figuras 2, 3 e 4 aparecem no interior da figura 1 são, respectivamente",
    'height': 350.0,
    'body': 'assets/teste_logica_3.png',
    'modo_body': 'image', //Texto nas respostas
    'modo_op': 'text', //Texto nas respostas
    'itens_row': 2,
    'op': [
      '2, 3 e 3',
      '3, 3 e 4',
      '4, 3 e 3',
      '4, 3 e 4',
      '4, 4 e 3',
      '4, 4 e 4'
    ]
  },
  26: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'intel',
    'header': "Observe as palavras a seguir:",
    'body': """

    1) MUITOS    2) OCEANO    3) PEIXES    4) E

                5) TEM      6) O      7) PLANTAS 

Agora forme uma frase que faça sentido e contenha todas essas palavras. Marque a ordem correta:
""",
    'modo_body': 'text', //Texto nas respostas
    'modo_op': 'text', //Texto nas respostas
    'itens_row': 2,
    'op': [
      '1 - 4 - 6 - 2 - 5 - 3 - 7',
      '6 - 2 - 4 - 7 - 5 - 1 - 3',
      '5 - 1 - 3 - 4 - 6 - 7 - 2',
      '6 - 2 - 5 - 1 - 3 - 4 - 7',
      '7 - 4 - 3 - 5 - 1 - 2 - 6 ',
      '7 - 4 - 3 - 5 - 1 - 2 - 6 '
    ]
  },
  27: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'yes_no',
    'header': "Responda as questões abaixo:",
    'op': [
      'Tem notado sabor ou cheiro diferente nos alimentos?',
      'Sente algo estranho dentro do seu corpo?',
      'Sente como se alguém lhe tocasse, beliscassem, batessem ou beijassem seu corpo?',
      'Sente movimentos no corpo, como se levasse um empurrão?',
    ],
  },
  28: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'intel',
    'header': "Selecione qual dia da semana é hoje:",
    'body': "",
    'modo_body': 'text', //Texto nas respostas
    'modo_op': 'text', //Texto nas respostas
    'itens_row': 2,
    'op': [
      'Segunda-feira',
      'Terça-feira',
      'Quarta-feira',
      'Quinta-feira',
      'Sexta-feira',
      'Sábado',
      'Domingo'
    ]
  },
  29: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'intel',
    'header': "Selecione o ano atual.",
    'body': "",
    'modo_body': 'text', //Texto nas respostas
    'modo_op': 'text', //Texto nas respostas
    'op': [
      '2020',
      '2021',
      '2019',
      '2022',
      '2023',
      '2024',
      '2030',
    ]
  },
  30: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'city_state',
    'header':
        "Preencha o campo a seguir com o nome da cidade e estado onde você está agora.",
    'op': [
      'CIDADE:',
      'ESTADO:',
    ]
  },
  31: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'intel',
    'header': "Selecione qual o período do dia atual.",
    'body': "",
    'modo_body': 'text', //Texto nas respostas
    'modo_op': 'text', //Texto nas respostas
    'itens_row': 1,
    'op': [
      'Manhã: 6:00 às 11:59 horas',
      'Tarde: 12:00 às 17:59 horas',
      'Noite: 18:00 às 23:59 horas',
      'Madrugada: 00:00 às 05:59 horas',
    ]
  },
  32: {
    'hasProx': true,
    'isSendAnswer': false,
    'type': 'five_errors',
    'header':
        'A figura à direita possui 5 alterações e você deverá apontar onde estão essas pequenas diferenças clicando na imagem da figura à esquerda.',
    'image1': 'assets/five_errors1.jpg',
    'image2': 'assets/five_errors2.jpg',
  },
  33: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'yes_no',
    'header': "Responda as questões abaixo:",
    'op': [
      'Sente como o chão oscilasse?',
      'Sente como levantassem seu corpo no ar?',
      'Tem momentos do dia que você se sente muito feliz como se fosse uma felicidade exagerada?',
      'Tem momentos do dia que você se sente muito triste, melancólico ou irritado?',
    ],
  },
  34: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'intel',
    'header':
        "Selecione a imagem que melhor te representa?", // Selecione a imagem que vc mais gosta?
    'body': '',
    'modo_body': 'text', //Texto nas respostas
    'modo_op': 'image', //Texto nas respostas
    'op': [
      'assets/cachorro_free.png',
      'assets/car.png',
      'assets/passaro_free.png',
      'assets/casa_free.png',
      'assets/leao_free.png',
      'assets/rosa_free.png',
    ]
  },
  35: {
    'hasProx': true,
    'isSendAnswer': false,
    'type': 'sobre',
    'header': 'Atenção!!',
    'body': "Atente-se ao som que será reproduzido na proxima tela.",
  },
  36: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'consc_aten',
    'mode': 'audio',
    'header1': "",
    'header2': "Qual das opções corresponde ao som escutado:",
    'image': "assets/audios/aguacorrente-edited_v2.mp3",
    'op': [
      "Pássaros",
      "Barulho de água",
      "Aspirador de pó",
      "Choro de criança",
      "Chuva",
      "Sem som"
    ],
  },
  37: {
    'hasProx': true,
    'isSendAnswer': false,
    'type': 'sobre',
    'header': 'Atenção!!',
    'body': "Atente-se ao som que será reproduzido na proxima tela.",
  },
  38: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'consc_aten',
    'mode': 'audio',
    'header1': "",
    'header2': "Qual das opções corresponde ao som escutado:",
    'image': "",
    'op': [
      "Pássaros",
      "Barulho de água",
      "Aspirador de pó",
      "Choro de criança",
      "Chuva",
      "Sem som"
    ],
  },
  39: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'intel',
    'header':
        "Observe a imagem a seguir e selecione qual alternativa corresponde ao que você vê",
    'body': 'assets/Ebbinghaus.png',
    'modo_body': 'image', //Texto nas respostas
    'modo_op': 'text', //Texto nas respostas
    'itens_row': 2,
    'op': [
      'Pessoa',
      'Bola rabiscada',
      'Cachorro',
      'Prédio',
      'Dinossauro',
      'Borboleta'
    ]
  },
  40: {
    'hasProx': true,
    'isSendAnswer': false,
    'type': 'join_dots',
    'header':
        'Escolha uma das opções abaixo e inicie um desenho desta opção, ligando os pontos apenas clicando neles. Você terá o tempo que precisar, porém não terá como voltar nem apagar nenhuma reta.',
    'image': 'assets/pontos.jpg',
    'op': [
      'Avião',
      'Borboleta',
      'Casa',
      'Estrela',
      'Quadrado',
      'Não tenho interesse em fazer',
    ]
  },
  41: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'yes_no',
    'header': "Responda as questões abaixo:",
    'op': [
      'Você tem escutado Zumbido no ouvido?',
      'Você tem dificuldades em descartar ou acumular objetos?',
      'Você apresenta comportamentos repetitivos (p. ex., lavar as mãos, organizar, verificar) ou atos mentais (p. ex., orar, contar ou repetir palavras em silêncio).',
      'Você tem visto algo estranho como figuras, sombras, fogo, fantasmas, demônios, pessoas estranhas ou algo do tipo, no seu dia a dia?',
    ],
  },
  42: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'yes_no',
    'header': "Responda as questões abaixo:",
    'op': [
      'Nos últimos meses, você tem ouvido vozes de pessoas estranhas?',
      'As vozes são seu próprio pensamento em voz alta?',
      'Alguém tem desejado envenená-lo?',
      'Você tem dificuldade para relaxar?',
    ],
  },
  43: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'intel',
    'header': "Qual das imagens abaixo completa a sequência a seguir?",
    'body': 'assets/intel_4.png',
    'modo_body': 'image',
    'modo_op': 'image', //Imagem nas respostas
    'op': [
      'assets/intel_4a.png',
      'assets/intel_4b.png',
      'assets/intel_4c.png',
      'assets/intel_4d.png',
      'assets/intel_4e.png',
      'assets/intel_4f.png'
    ],
  },
  44: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'yes_no',
    'header': "Responda as questões abaixo:",
    'op': [
      'Você tem-se irritado com mais facilidade que antes?',
      'Nos últimos meses você sente dificuldades de parar de se preocupar?',
      'Você pensa muitas coisas ao mesmo tempo?',
      'Você sente dificuldade em se concentrar?',
    ],
  },
  45: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'yes_no',
    'header': "Responda as questões abaixo:",
    'op': [
      'Há momentos que você se alimenta de forma exagerada?',
      'Tem dificuldade em terminar o que começa?',
      'Quando você conta uma história que aconteceu, na maioria das vezes você exagera e dramatiza alguns detalhes?',
      'Eu não tenho fraquezas. Consigo tudo o que quero.',
    ],
  },
  46: {
    'hasProx': true,
    'isSendAnswer': false,
    'type': 'sobre',
    'header': 'Atenção!!',
    'body': "Na próxima tela será reproduzida algumas palavras. Fique atento.",
  },
  47: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'consc_aten',
    'mode': 'audio',
    'header1': "",
    'header2': "Qual das opções corresponde ao som escutado:",
    'image': "assets/audios/aguacorrente-edited_v2.mp3",
    'op': [
      "Rua - Madeira - Paz - Pastel",
      "Lua - Cadeira - Raiz - Chapéu",
      "Rua - Cadeira - Paz - Chapéu",
      "CLua - Cadeira - Paz - Pastel",
    ],
  },
  48: {
    'hasProx': true,
    'isSendAnswer': false,
    'type': 'sobre',
    'header': 'Atenção!!',
    'body': "Na próxima tela será reproduzida algumas palavras. Fique atento.",
  },
  49: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'audio_complete',
    'header1': "",
    'header2': "Complete com o par correspondente escutado anteriormente",
    'image': "assets/audios/aguacorrente-edited_v2.mp3",
    'mode': 'audio',
    'op': [
      'chuva -',
      'criança -',
      '- verão',
    ],
  },
  50: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'audio_complete',
    'header1': "",
    'header2': "Complete com o par correspondente escutado anteriormente",
    'image': "",
    'mode': 'audio',
    'op': [
      'mostro -',
      '- água',
      'dinheiro -',
    ],
  },
  51: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'audio_complete',
    'header1': "",
    'header2': "Complete com o par correspondente escutado anteriormente",
    'image': "",
    'mode': 'audio',
    'op': [
      '- pequeno',
      'livro -',
      '- móvel',
    ],
  },
  52: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'intel',
    'header': "Selecione a imagem que vc mais gosta?",
    'body': '',
    'modo_body': 'text', //Texto nas respostas
    'modo_op': 'image', //Texto nas respostas
    'op': [
      'assets/cachorro_free.png',
      'assets/car.png',
      'assets/passaro_free.png',
      'assets/casa_free.png',
      'assets/leao_free.png',
      'assets/rosa_free.png',
    ]
  },
  53: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'yes_no',
    'header': "Responda as questões abaixo:",
    'op': [
      'Você acredita que precisa fazer as coisas de forma perfeita, caso contrário não será aceito (a)? ',
      'Você acredita que as pessoas estão julgando suas atitudes e comportamentos, mesmo que não estejam dizendo?',
      'Você tem ideias negativas, como pensar em morrer?',
      'Você se sente inadequada (o) e autocrítica (o)?',
    ],
  },
  54: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'intel',
    'header':
        "Dentre as opções abaixo marque a expressão que melhor corresponde o sentimento descrito.",
    'body': 'Apaixonado',
    'modo_body': 'text', //Texto nas respostas
    'modo_op': 'image', //Texto nas respostas
    'op': [
      'assets/emotion1.png',
      'assets/emotion2.png',
      'assets/emotion3.png',
      'assets/emotion4.png',
      'assets/emotion5.png',
      'assets/emotion6.png'
    ]
  },
  55: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'intel',
    'header':
        "Dentre as opções abaixo marque a expressão que melhor corresponde o sentimento descrito.",
    'body': 'Ansioso',
    'modo_body': 'text', //Texto nas respostas
    'modo_op': 'image', //Texto nas respostas
    'op': [
      'assets/emotion1.png',
      'assets/emotion2.png',
      'assets/emotion3.png',
      'assets/emotion4.png',
      'assets/emotion5.png',
      'assets/emotion6.png'
    ]
  },
  56: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'intel',
    'header':
        "Dentre as opções abaixo marque a expressão que melhor corresponde o sentimento descrito.",
    'body': 'Tristeza',
    'modo_body': 'text', //Texto nas respostas
    'modo_op': 'image', //Texto nas respostas
    'op': [
      'assets/emotion1.png',
      'assets/emotion2.png',
      'assets/emotion3.png',
      'assets/emotion4.png',
      'assets/emotion5.png',
      'assets/emotion6.png'
    ]
  },
  57: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'intel',
    'header':
        "Dentre as opções abaixo marque a expressão que melhor corresponde o sentimento descrito.",
    'body': 'Poderoso',
    'modo_body': 'text', //Texto nas respostas
    'modo_op': 'image', //Texto nas respostas
    'op': [
      'assets/emotion1.png',
      'assets/emotion2.png',
      'assets/emotion3.png',
      'assets/emotion4.png',
      'assets/emotion5.png',
      'assets/emotion6.png'
    ]
  },
  58: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'intel',
    'header':
        "Dentre as opções abaixo marque a expressão que melhor corresponde o sentimento descrito.",
    'body': 'Felicidade',
    'modo_body': 'text', //Texto nas respostas
    'modo_op': 'image', //Texto nas respostas
    'op': [
      'assets/emotion1.png',
      'assets/emotion2.png',
      'assets/emotion3.png',
      'assets/emotion4.png',
      'assets/emotion5.png',
      'assets/emotion6.png'
    ]
  },
  59: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'intel',
    'header':
        "Dentre as opções abaixo marque a expressão que melhor corresponde o sentimento descrito.",
    'body': 'Raivoso',
    'modo_body': 'text', //Texto nas respostas
    'modo_op': 'image', //Texto nas respostas
    'op': [
      'assets/emotion1.png',
      'assets/emotion2.png',
      'assets/emotion3.png',
      'assets/emotion4.png',
      'assets/emotion5.png',
      'assets/emotion6.png'
    ]
  },
  60: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'intel',
    'header':
        "Dentre as opções abaixo marque a expressão que melhor corresponde como você tem se sentido nos últimos dias.",
    'body': '',
    'modo_body': 'text', //Texto nas respostas
    'modo_op': 'image', //Texto nas respostas
    'op': [
      'assets/emotion1.png',
      'assets/emotion2.png',
      'assets/emotion3.png',
      'assets/emotion4.png',
      'assets/emotion5.png',
      'assets/emotion6.png'
    ]
  },
  61: {
    'hasProx': true,
    'isSendAnswer': true,
    'type': 'intel',
    'header':
        "Quanto tempo, aproximadamente, você acha que gastou para fazer este teste?",
    'body': "",
    'modo_body': 'text', //Texto nas respostas
    'modo_op': 'text', //Texto nas respostas
    'itens_row': 2,
    'op': [
      '5 minutos',
      '15 minutos',
      '30 minutos',
      '40 minutos',
      '60 minutos',
      'Mais que 1 hora'
    ]
  },
  62: {
    'hasProx': false,
    'isSendAnswer': false,
    'type': 'sobre',
    'header': 'Parabéns!!!!',
    'body':
        "Você terminou o questionário, agradeçemos muito pela sua disponibilidade.\n\nOBS.:Você ja pode fechar esta página.",
  },
};
