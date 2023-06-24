import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Map<int, Map<String, dynamic>> telas = {
  1: const {
    'hasProx': true,
    'isSendAnswer': false,
    'header':
        "Sistematização de ferramentas para Avaliação Psicopatológica utilizando técnicas de Inteligência Artificial",
    'style': 'terms',
    'body1': """

  TERMO DE CONSENTIMENTO LIVRE E ESCLARECIDO

  
Você está sendo convidado (a) a participar da pesquisa intitulada “Sistematização de ferramentas para Avaliação Psicopatológica utilizando técnica de Inteligência Artificial”, sob a responsabilidade dos pesquisadores Prof. Dr. Keiji Yamanaka, Ms. Résia da Silva Morais (da Faculdade de Engenharia Elétrica da Universidade Federal de Uberlândia). Nesta pesquisa nós estamos buscando confirmar a possibilidade de usar técnicas de Inteligência artificial para avaliar as estruturas de saúde mental chamadas de Funções Mentais Psíquicas (atenção, consciência, orientação, experiências de tempo e de espaço, sensopercepção, memória, afetividade, vontade e psicomotricidade, pensamento, juízos de realidade, linguagem, Inteligência e cognição social), essenciais para uma excelente avaliação psicopatológica com o objetivo de ajudar os profissionais da área da saúde mental. 
O Termo/Registro de Consentimento Livre e Esclarecido está sendo obtido pelos pesquisadores Dr. Keiji Yamanaka e Ms. Résia da Silva Morais, antecedendo toda e qualquer experimentação que envolva a pesquisa. Conforme o item IV da Resol. CNS 466/12 ou Cap. III da Resol. 510/2016, o participante terá o tempo que julgar necessário para decidir se deseja participar da pesquisa. Se você tiver qualquer dúvida em relação à pesquisa, você pode entrar em contato com o(a) pesquisador(a) pelo e-mail duvidaspsicopatologiacomia@gmail.com para discutir as informações do estudo
Na sua participação, após você ter compreendido as informações que constituem o Termo de Consentimento Livre e Esclarecido e após ter assinado eletronicamente o campo no qual “Concorda” participar da pesquisa, serão apresentadas telas com as instruções das tarefas que você irá responder. Certifique-se que esteja em um ambiente silencioso, sem estímulos de distração. Em algumas telas serão apresentados sons, sendo assim, fundamental o uso de fones ou que você ligue os alto-falantes do seu dispositivo. A avaliação das Funções Psíquicas será através de 45 testes apresentados através de 66 telas e você gastará em torno de 25 minutos. Em algumas questões, será solicitado que você ouça primeiramente alguns sons para respondê-las, e cada tela apresentada pelo questionário interativo permitirá a identificação da relação entre as respostas dadas por você e sinais de possíveis funções mentais afetadas.
As respostas serão coletadas e registradas por meio da plataforma do Google Forms e do sistema TensorFlow que agrupará os dados possibilitando a análise das ferramentas de avaliação psicopatológica. O pesquisador responsável atenderá as orientações das Resoluções nº 466/2012, Capítulo XI, Item Xl.2: f e nº 510/2016, Capítulo VI, Art. 28: IV; e manterá os dados da pesquisa em arquivo, físico ou digital, sob sua guarda e responsabilidade, por um período mínimo de 5 (cinco) anos após o término da pesquisa. Uma vez concluída a coleta de dados, o pesquisador responsável irá fazer o download dos dados coletados para um dispositivo eletrônico local, apagando todo e qualquer registro de qualquer plataforma virtual, ambiente compartilhado ou "nuvem". Em nenhum momento você será identificado. Os resultados da pesquisa serão publicados e ainda assim a sua identidade será preservada.
Você não terá nenhum gasto e nem ganho financeiro por participar na pesquisa. Você não receberá pagamentos por ser participante.  Todas as informações obtidas por meio de sua participação serão de uso exclusivo para esta pesquisa e ficarão sob a guarda do/da pesquisador/a responsável. Havendo algum dano decorrente da pesquisa, você terá direito a solicitar indenização através das vias judiciais (Código Civil, Lei 10.406/2002, Artigos 927 a 954 e Resolução CNS nº 510 de 2016, Artigo 19).
Os riscos consistem em possibilidade de cansaço durante a realização da prova e algum desconforto relacionado a utilização dos testes. Para minimizar os riscos o instrumento de coleta de dados será respondido de forma virtual e anônima. Os pesquisadores se comprometem a tomar medidas de proteção e confidencialidade dos dados para que o sigilo da sua identidade seja preservado. Na possibilidade de ocorrer algum desconforto emocional durante a realização da prova, fique à vontade para entrar em contato pelo e-mail duvidaspsicopatologiacomia@gmail.com, e será acolhido pelo pesquisador assistente (Psicólogo Clínico). Caso o pesquisador identificar necessidade de continuidade da assistência, de forma virtual, você receberá orientações psicoterapêuticas breve e será encaminhado (a) para atendimento psicológico na rede pública mais próxima da sua residência. Os benefícios serão a expansão do seu conhecimento sobre a importância da Inteligência artificial como um meio auxiliar no processo de avaliação psicológica, o que pode facilitar o trabalho clínico interventivo dos profissionais da saúde mental. Os dados da pesquisa serão mantidos em arquivo, físico e digital, sob sua guarda e responsabilidade, por um período mínimo de 5 (cinco) anos após o término da pesquisa, conforme capítulo VI da resolução CNS 510, de 07 de abril de 2016. 
Você é livre para deixar de participar da pesquisa a qualquer momento sem qualquer prejuízo ou coação. Até o momento da divulgação dos resultados, você também é livre para solicitar a retirada dos seus dados da pesquisa. Uma via original deste Termo de Consentimento Livre e Esclarecido ficará com você, você poderá salvar em seu dispositivo eletrônico. Em caso de qualquer dúvida ou reclamação a respeito da pesquisa, você poderá entrar em contato com: Dr. Keiji Yamanaka, Faculdade de Engenharia Elétrica da Universidade Federal de Uberlândia. Av. João Naves de Ávila, 2121 Campus Santa Mônica - Universidade Federal de Uberlândia CEP 38400-902 - Uberlândia MG - Brasil - Fone (sala coordenação): (34) 3239-4706, ou com a Pesquisadora Psicóloga Ms. Résia Silva de Morais, Faculdade de Engenharia Elétrica da Universidade Federal de Uberlândia. Av. João Naves de Ávila, 2121Campus Santa Mônica - Universidade Federal de Uberlândia, CEP 38400-902 - Uberlândia MG - Brasil – e-mail: duvidaspsicopatologiacomia@gmail.com. Para obter orientações quanto aos direitos dos participantes de pesquisa acesse a cartilha no link:https://conselho.saude.gov.br/images/comissoes/conep/documentos/Cartilha_Direitos_Eticos_2020.pdf.
Você poderá também entrar em contato com o CEP - Comitê de Ética na Pesquisa com Seres Humanos na Universidade Federal de Uberlândia, localizado na Av. João Naves de Ávila, nº 2121, bloco A, sala 224, campus Santa Mônica – Uberlândia/MG, 38408-100; telefone: 34-3239-4131 ou pelo e-mail: cep@propp.ufu.br. O CEP é um colegiado independente criado para defender os interesses dos participantes das pesquisas em sua integridade e dignidade e para contribuir para o desenvolvimento da pesquisa dentro de padrões éticos conforme resoluções do Conselho Nacional de Saúde.
Ao assinalar a opção “Concordo”, a seguir, você declara que aceita participar do projeto citado acima, voluntariamente, após ter sido devidamente esclarecido, pelos pesquisadores; que entendeu como é a pesquisa, que pode solicitar esclarecimentos em relação as dúvidas com o/a pesquisador/a via e-mail (duvidaspsicopatologiacomia@gmail.com); e que pode desistir em qualquer momento, durante e depois de participar; você autoriza a divulgação dos dados obtidos neste estudo mantendo em sigilo sua identidade. 
""",
    'body2': """
Solicitamos que você salve este documento em seus arquivos. Se desejar receber uma cópia deste registro de consentimento por e-mail, por favor, preencha-o abaixo e clique no botão de enviar:
""",
    'body3': """

  DECLARAÇÃO DOS PESQUISADORES

Declaramos que obtivemos de forma apropriada e voluntária, o Consentimento Livre e Esclarecido deste participante para a participação neste estudo. Declaramos ainda que nos comprometemos a cumprir todos os termos aqui descritos;
""",
    'image': ['assets/assinatura_keiji.png', 'assets/assinatura_resia.png'],
  },
  2: {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header': 'Questionário Sociodemográfico',
    'itens': [
      {
        'options_style': 'textForm', // checkBox,radioList,selectIcon,textForm
        'options': ['Que horas são neste instante?', 'Data de hoje?'],
        'icons': [Icons.lock_clock, Icons.date_range],
        'keyboardType': [TextInputType.datetime, TextInputType.datetime],
        'inputFormatters': [
          [FilteringTextInputFormatter.digitsOnly, HoraInputFormatter()],
          [FilteringTextInputFormatter.digitsOnly, DataInputFormatter()],
        ],
        'validator': [
          (value) {
            if (value == null) {
              return 'Horário Inválido!!';
            } else if ((value.isEmpty) || (value.length != 5)) {
              return 'Horário Inválido!!';
            }
            return null;
          },
          (value) {
            if (value == null) {
              return 'Data atual Incorreta!!';
            } else if ((value.isEmpty) || (value.length != 10)) {
              return 'Data atual Incorreta!!';
            }
            return null;
          },
        ],
        'has_divider': true,
      },
      {
        'options_style': 'textForm', // checkBox,radioList,selectIcon,textForm
        'options': ['Qua a sua Idade?'],
        'icons': [Icons.cake],
        'keyboardType': [TextInputType.number],
        'inputFormatters': [
          [FilteringTextInputFormatter.digitsOnly]
        ],
        'validator': [
          (value) {
            if (value == null) {
              return 'Idade invalida!! Corrija por favor';
            } else if ((value.isEmpty) ||
                (int.parse(value) <= 0) ||
                (int.parse(value) >= 130)) {
              return 'Idade invalida!! Corrija por favor';
            }
            return null;
          }
        ],
        'has_divider': true,
      },
      {
        'title': 'Gênero *',
        'icon': Icons.transgender,
        'hasPrefiroNaoDizer': true,
        'options_style': 'radioList', //selectIcon,textForm,checkBox
        'options': ["Feminino", "Masculino"],
        'otherItem': {
          'options_style': 'textForm', //selectIcon,textForm,checkBox
          'options': ["Qual o seu gênero?"],
          'keyboardType': [TextInputType.number],
          'inputFormatters': [
            [FilteringTextInputFormatter.singleLineFormatter]
          ],
          'validator': [
            (value) {
              if (value == null) {
                return 'Descrição invalida!! Corrija por favor';
              } else if ((value.isEmpty) || (value.length < 3)) {
                return 'Descrição invalida!! Corrija por favor';
              }
              return null;
            },
          ]
        },
        'has_divider': true,
      },
      {
        'title': 'Qual foi o sexo atribuído no seu nascimento?',
        'icon': Icons.wc,
        'hasPrefiroNaoDizer': false,
        'options': const ["Feminino", "Masculino"],
        'has_divider': true,
      },
      {
        'title': "Assinale a alternativa que identifica a sua Cor ou Raça:",
        'icon': Icons.person,
        'hasPrefiroNaoDizer': true,
        'options': const ["Preta", "Branca", "Parda", "Amarela", "IndÍgena"],
        'otherItem': {
          'options_style': 'textForm', //selectIcon,textForm,checkBox
          'options': ["Qual a sua Cor ou Raça ?"],
          'inputFormatters': [
            [FilteringTextInputFormatter.singleLineFormatter]
          ],
          'validator': [
            (value) {
              if (value == null) {
                return 'Descrição invalida!! Corrija por favor';
              } else if ((value.isEmpty) || (value.length < 3)) {
                return 'Descrição invalida!! Corrija por favor';
              }
              return null;
            },
          ]
        },
        'has_divider': true,
      },
      {
        'title': "Dentro de sua família, você é o(a) único(a) filho(a)?",
        'icon': Icons.diversity_3,
        'hasPrefiroNaoDizer': false,
        'options': const ["Sim"],
        'otherLabel': "Não",
        'otherItem': {
          'options_style': 'textForm', //selectIcon,textForm,checkBox
          'options': ["Quantos irmãos voçê tem?"],
          'inputFormatters': [
            [FilteringTextInputFormatter.digitsOnly]
          ],
          'validator': [
            (value) {
              if (value == null) {
                return 'Quantidade invalida!! Corrija por favor';
              } else if ((value.isEmpty)) {
                return 'Quantidade invalida!! Corrija por favor';
              }
              return null;
            },
          ]
        },
        'has_divider': true,
      },
      {
        'title': "Qual o seu estado civil?",
        'icon': Icons.diversity_2,
        'hasPrefiroNaoDizer': false,
        'options': const [
          "Solteiro (a):",
          "Casado (a)",
          "Viúvo (a)",
          "Separação legal (judicial ou divórcio)",
          "Amaziado",
        ],
        'otherItem': {
          'options_style': 'textForm', //selectIcon,textForm,checkBox
          'options': ["Qual estado civil ?"],
          'inputFormatters': [
            [FilteringTextInputFormatter.singleLineFormatter]
          ],
          'validator': [
            (value) {
              if (value == null) {
                return 'Descrição invalida!! Corrija por favor';
              } else if ((value.isEmpty) || (value.length < 3)) {
                return 'Descrição invalida!! Corrija por favor';
              }
              return null;
            },
          ],
        },
        'has_divider': true,
      },
      {
        'title': "Possui filhos(as)?",
        'icon': Icons.group_add,
        'hasPrefiroNaoDizer': false,
        'options': const ["Não"],
        'otherLabel': "Sim",
        'otherItem': {
          'options_style': 'textForm', //selectIcon,textForm,checkBox
          'options': ["Quantos filhos voçê tem?"],
          'inputFormatters': [
            [FilteringTextInputFormatter.singleLineFormatter]
          ],
          'validator': [
            (value) {
              if (value == null) {
                return 'Quantidade invalida!! Corrija por favor';
              } else if ((value.isEmpty)) {
                return 'Quantidade invalida!! Corrija por favor';
              }
              return null;
            },
          ],
        },
        'has_divider': true,
      },
      {
        'title': "Possui filhos(as) menores de 6 anos?",
        'icon': Icons.child_friendly,
        'hasPrefiroNaoDizer': false,
        'options': const ["Não", "Sim"],
        'has_divider': true,
      },
      {
        'title': "Religião *",
        'icon': Icons.church,
        'hasPrefiroNaoDizer': false,
        'options': const ["Sem religião"],
        'otherLabel': "Tenho religião (Qual?)",
        'otherItem': {
          'options_style': 'textForm', //selectIcon,textForm,checkBox
          'options': ["Qual estado civil ?"],
          'inputFormatters': [
            [FilteringTextInputFormatter.singleLineFormatter]
          ],
          'validator': [
            (value) {
              if (value == null) {
                return 'Religião invalida!! Corrija por favor';
              } else if ((value.isEmpty)) {
                return 'Religião invalida!! Corrija por favor';
              }
              return null;
            }
          ],
        },
        'has_divider': true,
      },
      {
        'title': "Escolaridade *",
        'icon': Icons.school,
        'hasPrefiroNaoDizer': false,
        'options': const [
          "Sem Escolaridade",
          "Ensino Fundamental (1º grau) incompleto",
          "Ensino Fundamental (1º grau) completo",
          "Ensino Médio (2º grau) incompleto",
          "Ensino Médio (2º grau) completo",
          "Superior Incompleto",
          "Superior Completo",
          "Mestrado",
          "Doutorado",
        ],
        'has_divider': true,
      },
      {
        'title': "Renda familiar mensal de sua casa (somatória)",
        'icon': Icons.attach_money,
        'hasPrefiroNaoDizer': false,
        'options': const [
          "Até 1 salário mínimo",
          "Mais de 1 a 2 salários mínimos",
          "Mais de 2 a 3 salários mínimos",
          "Mais de 3 a 5 salários mínimos",
          "Mais de 5 a 8 salários mínimos",
          "Mais de 8 a 12 salários mínimos",
          "Mais de 12 a 20 salários mínimos",
          "Mais de 20 salários mínimos",
        ],
      }
    ], // options_type: text
  },
  3: {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header':
        'Você possui algum diagnóstico em relação ao seu estado de saúde mental, laudado por um profissional da saúde?',
    'itens': [
      {
        'options': const ["Não"],
        'otherLabel': "Sim",
        'otherItem': {
          'title':
              "Caso afirmativo, selecione o diagnóstico\n correspondente. *",
          'icon': Icons.admin_panel_settings,
          'hasPrefiroNaoDizer': false,
          'options': const [
            "Transtornos de Ansiedade",
            "Transtornos Alimentares",
            "Transtorno Bipolar",
            "Transtornos Depressivos",
            "Transtorno Obsessivo-compulsivo",
            "Transtorno da personalidade borderline",
            "Transtorno da personalidade histriônica",
            "Transtorno da personalidade narcisista",
            "Transtorno da personalidade paranoide",
          ],
          'otherLabel': "Outro tipo de transtorno",
          'otherItem': {
            'options_style': 'textForm', //selectIcon,textForm,checkBox
            'options': ['Digite a denominação desse outro tipo de transtorno'],
            'inputFormatters': [
              [FilteringTextInputFormatter.singleLineFormatter]
            ],
            'validator': [
              (value) {
                if (value == null) {
                  return 'Digite a denominação desse outro tipo de transtorno';
                } else if (value.length < 4) {
                  return 'Digite a denominação desse outro tipo de transtorno';
                }
                return null;
              }
            ],
          },
        },
      },
    ],
  },
  4: const {
    'hasProx': true,
    'isSendAnswer': false,
    'style': 'form',
    'header': 'Informações',
    'delay': 3,
    'itens':
        'A partir de agora serão apresentadas telas com as instruções das tarefas que você irá responder.\n\nCertifique-se que esteja em um ambiente silencioso, sem estímulos de distração.\n\nEm algumas telas serão apresentados sons, sendo assim, fundamental o uso de fones ou que você ligue os alto-falantes do seu dispositivo.',
  },
  5: const {
    'hasProx': true,
    'isSendAnswer': false,
    'style': 'form',
    'header': 'Atenção!!',
    'delay': 3,
    'itens': 'Olhe atentamente para a figura apresentada na proxima tela.',
  },
  6: const {
    'hasProx': false,
    'isSendAnswer': false,
    'style': 'form',
    'delay': 3,
    'itens': [
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/arvore_free.png', // body_type: image
      },
    ], // options_type: text
  },
  7: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header': 'O que você viu na tela anterior',
    'itens': [
      {
        'options_style': 'radioList', //selectIcon,textForm,checkBox
        'options': [
          "Jesus Cristo",
          "Coração",
          "Dragão cuspindo fogo",
          "Árvore",
          "Não vi nada",
          "Outra coisa"
        ],
      },
    ], // options_type: text
  },
  8: const {
    'hasProx': true,
    'isSendAnswer': false,
    'style': 'form',
    'header': 'Atenção!!',
    'delay': 3,
    'itens': 'Olhe atentamente para a figura apresentada na proxima tela.',
  },
  9: const {
    'hasProx': false,
    'isSendAnswer': false,
    'style': 'form',
    'delay': 3,
    'itens': [
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': '', // body_type: image
      },
    ], // options_type: text
  },
  10: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header': 'O que você viu na tela anterior',
    'itens': [
      {
        'options_style': 'radioList', //selectIcon,textForm,checkBox
        'options': [
          "Jesus Cristo",
          "Coração",
          "Dragão cuspindo fogo",
          "Árvore",
          "Não vi nada",
          "Outra coisa"
        ],
      },
    ],
  },
  11: const {
    'hasProx': true,
    'isSendAnswer': false,
    'style': 'form',
    'header': 'Informações',
    'delay': 3,
    'itens':
        "Nas próximas telas, serão apresentadas algumas sequências de números, após visualizá-las você deverá marcar a resposta que corresponde à sequência correta.",
  },
  12: const {
    'hasProx': false,
    'isSendAnswer': false,
    'style': 'form',
    'header': 'Atente-se para a sequência de números apresentada',
    'delay': 3,
    'itens': [
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': '2 - 7',
      },
    ], // options_type: text
  },
  13: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header':
        'Qual foi a sequência correta dos números apresentados na tela anterior?',
    'itens': [
      {
        'options_style': 'radioList', //selectIcon,textForm,checkBox
        'options_columns_size': 3,
        'options': ["1 - 5", "4 - 7", "2 - 7", "2 - 8", "9 - 4", "7 - 2"],
      },
    ],
  },
  14: const {
    'hasProx': false,
    'isSendAnswer': false,
    'style': 'form',
    'header': 'Atente-se para a sequência de números apresentada',
    'delay': 3,
    'itens': [
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': '5 - 6 - 4',
      },
    ], // options_type: text
  },
  15: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header':
        'Qual foi a sequência correta dos números apresentados na tela anterior?', //Titulo do card
    'itens': [
      {
        'options_style': 'radioList', //selectIcon,textForm,checkBox
        'options_columns_size': 2,
        'options': [
          "5 - 7 - 1",
          "1 - 3 - 4",
          "5 - 6 - 3",
          "4 - 6 - 5",
          "5 - 4 - 6",
          "5 - 6 - 4"
        ],
      },
    ], // options_type: text || image
  },
  16: const {
    'hasProx': false,
    'isSendAnswer': false,
    'style': 'form',
    'header': 'Atente-se para a sequência de números apresentada',
    'delay': 3,
    'itens': [
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': '6 - 4 - 3 - 9',
      },
    ], // options_type: text
  },
  17: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header':
        'Qual foi a sequência correta dos números apresentados na tela anterior?',
    'itens': [
      {
        'options_style': 'radioList', //selectIcon,textForm,checkBox
        'options_columns_size': 2,
        'options': [
          "6 - 4 - 9 - 3",
          "4 - 8 - 9 - 1",
          "6 - 4 - 3 - 9",
          "5 - 4 - 3 - 8",
          "1 - 5 - 2 - 9",
          "6 - 4 - 3 - 7"
        ], // options_type: text || image
      },
    ],
  },
  18: const {
    'hasProx': false,
    'isSendAnswer': false,
    'style': 'form',
    'header': 'Atente-se para a sequência de números apresentada',
    'delay': 3,
    'itens': [
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': '4 - 2 - 7 - 3 - 1',
      },
    ], // options_type: text
  },
  19: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header':
        'Qual foi a sequência correta dos números apresentados na tela anterior?',
    'itens': [
      {
        'options_columns_size': 2,
        'options': [
          "2 - 1 - 4 - 7 - 9",
          "4 - 3 - 9 - 8",
          "4 - 2 - 6 - 3 - 1",
          "7 - 5 - 1 - 4 - 2 ",
          "4 - 2 - 7 - 3 - 1",
          "6 - 3 - 1 - 5 - 9"
        ], // options_type: text || image
      },
    ],
  },
  20: const {
    'hasProx': false,
    'isSendAnswer': false,
    'style': 'form',
    'header': 'Atente-se para a sequência de números apresentada',
    'delay': 3,
    'itens': [
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': '6 - 1 - 9 - 4 - 7 - 3',
      },
    ], // options_type: text
  },
  21: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header':
        'Qual foi a sequência correta dos números apresentados na tela anterior?',
    'itens': [
      {
        'options': [
          "6 - 1 - 4 - 7 - 3 - 9",
          "2 - 1 - 8 - 3 - 9 - 5",
          "6 - 1 - 9 - 4 - 7 - 3",
          "6 - 4 - 5 - 8 - 3 - 7",
          "2 - 8 - 6 - 4 - 7 - 3",
          "6 - 1 - 9 - 4 - 5 - 2"
        ], // options_type: text || image
      },
    ],
  },
  22: const {
    'hasProx': false,
    'isSendAnswer': false,
    'style': 'form',
    'header': 'Atente-se para a sequência de números apresentada',
    'delay': 3,
    'itens': [
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': '5 - 9 - 1 - 7 - 4 - 2 - 8',
      },
    ],
  },
  23: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header':
        'Qual foi a sequência correta dos números apresentados na tela anterior?',
    'itens': [
      {
        'options': [
          "5 - 8 - 1 - 7 - 4 - 3 - 8",
          "5 - 9 - 1 - 7 - 4 - 8",
          "8 - 9 - 0 - 7 - 3 - 1",
          "5 - 9 - 1 - 7 - 4 - 2 - 8",
          "5 - 2 - 3 - 7 - 4 - 9 - 8",
          "5 - 9 - 1 - 7 - 8 - 0 - 9"
        ],
      },
    ],
  },
  24: const {
    'hasProx': true,
    'isSendAnswer': false,
    'style': 'form',
    'header': 'Informações',
    'delay': 3,
    'itens':
        "Identifique algumas expressões e intenções, considerando apenas a região dos olhos. Para cada imagem, escolha a palavra que melhor descreve o que a pessoa em questão está sentindo, pensando ou aparentando ser.",
  },
  25: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header':
        'Qual das imagens abaixo completa a sequência a seguir?', //Titulo do card
    'itens': [
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/olho1.png',
        'options_columns_size': 2,
        'options': ['Inquieta', 'Pensativa', 'Irritada', 'Desconfiada']
      },
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/olho2.png',
        'options_columns_size': 2,
        'options': ['Inquieta', 'Pensativa', 'Irritada', 'Desconfiada']
      },
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/olho3.png',
        'options_columns_size': 2,
        'options': ['Inquieta', 'Pensativa', 'Irritada', 'Desconfiada']
      },
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/olho4.png',
        'options_columns_size': 2,
        'options': ['Inquieta', 'Pensativa', 'Irritada', 'Desconfiada']
      },
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/olho5.png',
        'options_columns_size': 2,
        'options': ['Inquieta', 'Pensativa', 'Irritada', 'Desconfiada']
      },
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/olho6.png',
        'options_columns_size': 2,
        'options': ['Inquieta', 'Pensativa', 'Irritada', 'Desconfiada']
      },
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/olho7.png',
        'options_columns_size': 2,
        'options': ['Inquieta', 'Pensativa', 'Irritada', 'Desconfiada']
      },
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/olho8.png',
        'options_columns_size': 2,
        'options': ['Inquieta', 'Pensativa', 'Irritada', 'Desconfiada']
      },
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/olho9.png',
        'options_columns_size': 2,
        'options': ['Inquieta', 'Pensativa', 'Irritada', 'Desconfiada']
      },
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/olho10.png',
        'options_columns_size': 2,
        'options': ['Inquieta', 'Pensativa', 'Irritada', 'Desconfiada']
      },
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/olho11.png',
        'options_columns_size': 2,
        'options': ['Inquieta', 'Pensativa', 'Irritada', 'Desconfiada']
      },
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/olho12.png',
        'options_columns_size': 2,
        'options': ['Inquieta', 'Pensativa', 'Irritada', 'Desconfiada']
      },
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/olho13.png',
        'options_columns_size': 2,
        'options': ['Inquieta', 'Pensativa', 'Irritada', 'Desconfiada']
      },
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/olho14.png',
        'options_columns_size': 2,
        'options': ['Inquieta', 'Pensativa', 'Irritada', 'Desconfiada']
      },
    ]
  },
  26: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'yes_no',
    'header': 'Responda as questões abaixo:',
    'options': [
      'Para impedir o ganho de peso, há uso de laxantes, diuréticos ou outros medicamentos; jejum, vômitos autoinduzidos, ou exercício físico em excesso?',
      'Sente medo intenso de ganhar peso ou de engordar, ao ponto de não comer?',
      'Há ingestão persistente de substâncias não nutritivas tais como doces e/ou chocolates, durante um período mínimo de um mês?',
      'Há muitos momentos que você se alimenta de forma exagerada?',
    ],
  },
  27: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header':
        'Qual das imagens abaixo completa a sequência a seguir?', //Titulo do card
    'itens': [
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/intel_1.png',
        'mim_size_awnser': 1,
        'max_size_awnser': 1,
        'options_style': 'selectIcon', //radioList,selectIcon,textForm,checkBox
        'options_columns_size': 3,
        'options': [
          'assets/intel_1a.png',
          'assets/intel_1b.png',
          'assets/intel_1c.png',
          'assets/intel_1d.png',
          'assets/intel_1e.png',
          'assets/intel_1f.png'
        ],
      },
    ],
  },
  28: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'yes_no',
    'header': 'Responda as questões abaixo:',
    'options': [
      'Ultimamente tem arrancado o próprio cabelo de forma recorrente, resultando em perda de cabelo?',
      'Observou grande perda de interesse ou prazer em todas ou quase todas as atividades na maior parte do dia; sente-se triste, vazio, sem esperança?',
      'As situações sociais, tais como falar em público, quase sempre provocam medo ou ansiedade?',
      'Percebo que sou uma pessoa especial e único/a? Espero que um dia as pessoas possam reconhecer meu valor.'
    ],
  },
  29: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header': 'Complete as sequências a seguir:',
    'itens': [
      {
        'options_style': 'textForm', // checkBox,radioList,selectIcon,textForm
        'title': ['2, 4, 8, 16, ?'],
        'options': ["Seguência *"],
        'icons': [Icons.confirmation_num],
      },
      {
        'options_style': 'textForm', // checkBox,radioList,selectIcon,textForm
        'title': ['1, 3, 9, ?'],
        'options': ["Seguência *"],
        'icons': [Icons.confirmation_num],
      },
      {
        'options_style': 'textForm', // checkBox,radioList,selectIcon,textForm
        'title': ['3, 7, 11, 15, ? '],
        'options': ["Seguência *"],
        'icons': [Icons.confirmation_num],
      },
      {
        'options_style': 'textForm', // checkBox,radioList,selectIcon,textForm
        'title': ['32, 16, 8, ? '],
        'options': ["Seguência *"],
        'icons': [Icons.confirmation_num],
      },
    ],
  },
  30: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header': 'Observe as palavras a seguir:',
    'itens': [
      {
        'body_hasFrame': false, //Imprime um quadro em volta do body
        'body': """

    1) MUITOS    2) OCEANO    3) PEIXES    4) E

                5) TEM      6) O      7) PLANTAS 

Agora forme uma frase que faça sentido e contenha todas essas palavras. Marque a ordem correta:
""",
        'options_columns_size': 1,
        'options': [
          '1 - 4 - 6 - 2 - 5 - 3 - 7',
          '6 - 2 - 4 - 7 - 5 - 1 - 3',
          '5 - 1 - 3 - 4 - 6 - 7 - 2',
          '6 - 2 - 5 - 1 - 3 - 4 - 7',
          '7 - 4 - 3 - 5 - 1 - 2 - 6 '
        ],
      },
    ],
  },
  31: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'yes_no',
    'header': 'Responda as questões abaixo:',
    'options': [
      'Sente algo estranho dentro do seu corpo?',
      'Sente como se alguém lhe tocasse, beliscassem, batessem ou beijassem seu corpo?',
      'Sente movimentos no corpo, como se levasse um empurrão?',
      'Possui a sensação de falta de controle durante a alimentação; não consegue parar de comer ou controlar a quantidade que está ingerindo?',
    ],
  },
  32: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header':
        'Preencha o campo a seguir com o nome da cidade e estado onde você está agora.',
    'itens': [
      {
        'icons': [Icons.location_city, Icons.location_history],
        'options_columns_size': 1,
        'options_style': 'textForm', // checkBox,radioList,selectIcon,textForm
        'options': ['CIDADE:', 'ESTADO:'],
      },
    ]
  },
  33: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header': "Selecione qual o período do dia atual.",
    'itens': [
      {
        'body_hasFrame': false, //Imprime um quadro em volta do body
        'options_columns_size': 1,
        'options': [
          'Manhã: 6:00 às 11:59 horas',
          'Tarde: 12:00 às 17:59 horas',
          'Noite: 18:00 às 23:59 horas',
          'Madrugada: 00:00 às 05:59 horas',
        ]
      },
    ],
  },
  34: const {
    'hasProx': true,
    'isSendAnswer': false,
    'style': 'form',
    'header': 'Informações',
    'delay': 3,
    'itens':
        "Seis (6) imagens serão apresentadas. Fique atendo! Em um certo momento do teste, elas serão escondidas em uma figura e você deverá encontrá-las.",
  },
  35: const {
    'hasProx': false,
    'isSendAnswer': false,
    'style': 'form',
    'delay': 3,
    'itens': [
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/CORREDOR.png', // body_type: image
      },
    ], // options_type: text
  },
  36: const {
    'hasProx': false,
    'isSendAnswer': false,
    'style': 'form',
    'delay': 3,
    'itens': [
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/PAPAI NOEL.png', // body_type: image
      },
    ], // options_type: text
  },
  37: const {
    'hasProx': false,
    'isSendAnswer': false,
    'style': 'form',
    'delay': 3,
    'itens': [
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/circo.png', // body_type: image
      },
    ], // options_type: text
  },
  38: const {
    'hasProx': false,
    'isSendAnswer': false,
    'style': 'form',
    'delay': 3,
    'itens': [
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/mascara.png', // body_type: image
      },
    ], // options_type: text
  },
  39: const {
    'hasProx': false,
    'isSendAnswer': false,
    'style': 'form',
    'delay': 3,
    'itens': [
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/NUMERO8.png', // body_type: image
      },
    ], // options_type: text
  },
  40: const {
    'hasProx': false,
    'isSendAnswer': false,
    'style': 'form',
    'delay': 3,
    'itens': [
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/reciclagem.png', // body_type: image
      },
    ], // options_type: text
  },
  41: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'yes_no',
    'header': 'Responda as questões abaixo:',
    'options': [
      'Diariamente, há momentos em que você sente como o se chão oscilasse?',
      'Durante o dia há vários momentos em que você se sente irritadao e impaciente?',
      'Diariamente, há momentos em que você se sente muito feliz, irradiante?',
      'Durante o dia há vários momentos em que você se sente triste e/ou melancólico?',
      'Tem notado muita preocupação com um ou mais defeitos ou falhas percebidas na aparência física que não são observáveis ou que parecem leves para os outros.',
    ],
  },
  42: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header':
        'Seis (6) imagens foram apresentadas em algum momento do teste. Vamos encontrá-los? Clique nas figuras que você lembrou. Não é obrigado(a) a encontrar todas as imagens. Faça o seu melhor!',
    'itens': [
      {
        'body_hasFrame': false, //Imprime um quadro em volta do body
        'body': 'assets/seisimagens.png',
      },
    ],
  },
  43: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header': 'Avalie e responda !!',
    'itens': [
      {
        'body': "assets/questao32.png",
        'body_hasFrame': true, //Imprime um quadro em volta do body
      },
      {
        'body':
            "Se você puder, por alguns minutos, visualizar e ficar sabendo de alguém ou de alguma coisa através de uma fenda no tempo e espaço, qual dessas ações você escolheria? Marque apenas duas alternativas que mais lhe atenderia.",
        'body_hasFrame': false, //Imprime um quadro em volta do body
        'options_columns_size': 1,
        'options_style': 'checkBox', // radioList,selectIcon,textForm
        'options': [
          'Ver alguém que já morreu',
          'Ver uma pessoa nua',
          'Voltar na minha infância e recomeçar tudo',
          'Voltar na minha adolescência e recomeçar tudo',
          'Saber se meu namorado (a) ou esposo (a) está me traindo',
          'Saber como poderia ser o futuro da minha família e ajudá-los',
          'Desaparecer no tempo e espaço, ao entrar pela fenda',
          'Saber quem é minha alma gêmea',
          'Ver meu futuro profissional',
          'Saber como faço para não pensar coisas bizarras',
          'Saber se ficarei rico(a)',
          'Saber quem está me perseguindo na rua',
          'Não gostaria de ver ou saber de nada',
        ]
      },
    ],
  },
  44: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'yes_no',
    'header': "Responda as questões abaixo:",
    'options': [
      'Percebe-se impulsivo e de forma abusiva; p. ex., gastos exagerados, sexo com desconhecidos, abuso de substâncias, dirigir de forma perigosa/irresponsável e/ou atos repetitivos de autolesão?',
      'Tem dificuldade em terminar o que começa?',
      'Quando você conta uma história que aconteceu, na maioria das vezes você exagera e dramatiza alguns detalhes?',
      'Já testemunhou e/ou ainda é exposto (a) de forma repetida ou extrema a detalhes aversivos do evento traumático?',
    ],
  },
  45: const {
    'hasProx': true,
    'isSendAnswer': false,
    'style': 'form',
    'header': 'Atenção !!',
    'delay': 3,
    'itens': 'Atente-se ao som que será reproduzido na próxima tela.',
  },
  46: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header': '',
    'itens': [
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': "assets/audios/aguacorrente-edited_v2.mp3", // body_type: audio
      },
    ],
  },
  47: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header': 'Qual das opções corresponde ao som escutado?',
    'itens': [
      {
        'options_columns_size': 2,
        'options': [
          "Pássaros",
          "Barulho de água",
          "Aspirador de pó",
          "Choro de criança",
          "Chuva",
          "Sem som"
        ],
      },
    ],
  },
  48: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header':
        'Observe a imagem e selecione qual alternativa corresponde ao que você vê.',
    'itens': [
      {
        'body_hasFrame': false, //Imprime um quadro em volta do body
        'body': "assets/Ebbinghaus.png", // body_type: image
        'options_columns_size': 1,
        'options': [
          'A Reta A é maior que a Reta B',
          'A Reta A é menor que a Reta B',
          'Retas A e B, são do mesmo tamanho',
        ],
      },
    ],
  },
  49: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'dots_line',
    'header':
        'Observe a imagem e selecione qual alternativa corresponde ao que você vê.',
    'itens': [
      {
        'body_hasFrame': false, //Imprime um quadro em volta do body
        'body': "assets/Ebbinghaus.png", // body_type: image
        'options_columns_size': 1,
        'options': [
          'A Reta A é maior que a Reta B',
          'A Reta A é menor que a Reta B',
          'Retas A e B, são do mesmo tamanho',
        ],
      },
    ],
  },
  238: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'yes_no',
    'header': "Responda as questões abaixo:",
    'options': [
      'Você tem escutado Zumbido no ouvido?',
      'Você tem dificuldades em jogar fora objetos usados ou sem valor, mesmo quando não têm valor sentimental. Ultimamente guarda muitas coisas, papeis, recibos, com a ideia de que poderá precisar algum dia?',
      'Você apresenta comportamentos repetitivos (p. ex., lavar as mãos, organizar, verificar) ou atos mentais (p. ex., orar, contar ou repetir palavras em silêncio).',
      'Você tem visto algo estranho como figuras, sombras, fogo, fantasmas, demônios, pessoas estranhas ou algo do tipo, no seu dia a dia?',
    ],
  },
  239: const {
    'hasProx': true,
    'isSendAnswer': false,
    'style': 'five_errors',
    'header':
        'A figura à direita possui 5 alterações e você deverá apontar onde estão essas pequenas diferenças clicando na imagem da figura à esquerda.',
    'image1': 'assets/five_errors1.jpg',
    'image2': 'assets/five_errors2.jpg',
  },
  240: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'yes_no',
    'header': "Responda as questões abaixo:",
    'options': [
      'Nos últimos meses, você tem ouvido vozes de pessoas estranhas?',
      'As vozes são seu próprio pensamento em voz alta?',
      'Alguém tem desejado envenená-lo?',
      'Você tem dificuldade para relaxar? Está sempre ocupado?',
      'Eu não possuo fraquezas. Consigo tudo o que quero?',
    ],
  },
  241: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header': "Qual das imagens abaixo completa a sequência a seguir?",
    'itens': [
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/intel_2.png',
        'mim_size_awnser': 1,
        'max_size_awnser': 1,
        'options_style': 'selectIcon', //radioList,selectIcon,textForm,checkBox
        'options_columns_size': 3,
        'options': [
          'assets/intel_2a.png',
          'assets/intel_2b.png',
          'assets/intel_2c.png',
          'assets/intel_2d.png',
          'assets/intel_2e.png',
          'assets/intel_2f.png'
        ],
      },
    ],
  },
  242: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'yes_no',
    'header': "Responda as questões abaixo:",
    'options': [
      'Você tem-se irritado com mais facilidade que antes?',
      'Nos últimos meses você sente dificuldades de parar de se preocupar?',
      'Você pensa muitas coisas ao mesmo tempo?',
      'Você sente dificuldade em se concentrar?',
      'Evita realizar atividades profissionais ou estudantis que impliquem contato interpessoal, pois tem muito medo de críticas, desaprovação ou rejeição?',
    ],
  },
  243: const {
    'hasProx': true,
    'isSendAnswer': false,
    'style': 'sobre',
    'header': 'Atenção!!',
    'body': "Na próxima tela será reproduzida algumas palavras. Fique atento.",
  },
  244: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'itens': [
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/audios/quatro_palavras.mp3',
        'options_columns_size': 1,
      },
    ],
  },
  245: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header':
        'Selecione 1 ou 2 imagens que poderia representar você ou seu jeito de ser.',
    'itens': [
      {
        'body_hasFrame': false, //Imprime um quadro em volta do body
        'body': '', // body_type: audio
        'mim_size_awnser': 1,
        'max_size_awnser': 2,
        'options_style': 'selectIcon', //radioList,selectIcon,textForm,checkBox
        'options_columns_size': 3,
        'options': [
          'assets/questao45leao.png',
          'assets/questao45coquetel.png',
          'assets/questao45humburgue.png',
          'assets/questao45gato.png',
          'assets/questao45carro.png',
          'assets/questao45cachorro.png',
          'assets/questao45passaro.png',
          'assets/questao45cerveja.png',
          'assets/questao45cocacola.png',
          'assets/questao45cafe.png',
          'assets/questao45bombons.png',
          'assets/questao45casa.png',
        ]
      },
    ],
  },
  246: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'yes_no',
    'header': "Responda as questões abaixo:",
    'options': [
      'Você acredita que precisa fazer as coisas de forma perfeita, caso contrário não será aceito (a)? ',
      'Você acredita que as pessoas estão julgando suas atitudes e comportamentos, mesmo que não estejam dizendo?',
      'Você tem ideias negativas, como pensar em morrer?',
      'Você se sente inadequado (a) inquieto (a) e conversa de forma excessiva?',
      'Adio ou evito fazer as coisas até o último segundo?',
    ],
  },
  247: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header': 'Responda de acordo com o som escutado anteriormente!!',
    'itens': [
      {
        'body_hasFrame': false, //Imprime um quadro em volta do body
        'body': 'Qual das opções corresponde ao som escutado?',
        'options_columns_size': 1,
        'options': [
          "Rua - Madeira - Paz - Pastel",
          "Lua - Cadeira - Raiz - Chapéu",
          "Rua - Cadeira - Paz - Chapéu",
          "Lua - Cadeira - Paz - Pastel",
        ],
      },
    ],
  },
  248: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'form',
    'header':
        'Dentre as opções abaixo marque a expressão que melhor corresponde a emoção básica descrita.',
    'itens': [
      {
        'body_hasFrame': true, //Imprime um quadro em volta do body
        'body': 'assets/questao48.png',
        'title': 'a) Nojo:',
        'options_columns_size': 6,
        'options': [
          "1",
          "2",
          "3",
          "4",
          "5",
          "6",
        ],
      },
      {
        'title': 'b)	Tristeza:',
        'options_columns_size': 6,
        'options': [
          "1",
          "2",
          "3",
          "4",
          "5",
          "6",
        ],
      },
      {
        'title': 'c)	Medo:',
        'options_columns_size': 6,
        'options': [
          "1",
          "2",
          "3",
          "4",
          "5",
          "6",
        ],
      },
      {
        'title': 'd)	Raiva:',
        'options_columns_size': 6,
        'options': [
          "1",
          "2",
          "3",
          "4",
          "5",
          "6",
        ],
      },
      {
        'title': 'e)	Alegria:',
        'options_columns_size': 6,
        'options': [
          "1",
          "2",
          "3",
          "4",
          "5",
          "6",
        ],
      },
      {
        'title': 'f)	Surpresa:',
        'options_columns_size': 6,
        'options': [
          "1",
          "2",
          "3",
          "4",
          "5",
          "6",
        ],
      },
    ],
  },
  249: const {
    'hasProx': true,
    'isSendAnswer': false,
    'style': 'sobre',
    'header': 'Atenção!!',
    'body': "Atente-se ao som que será reproduzido na proxima tela.",
  },
  251: const {
    'hasProx': true,
    'isSendAnswer': true,
    'content': '',
    'title': 'Qual das opções corresponde ao som escutado?',
    'options': [
      "Pássaros",
      "Barulho de água",
      "Aspirador de pó",
      "Choro de criança",
      "Chuva",
      "Sem som"
    ],
  },
  255: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'one_screem',
    'header': "Qual das imagens abaixo completa a sequência a seguir?",
    'body': 'assets/one_screem_4.png',
    'modo_body': 'image',
    'modo_op': 'image', //Imagem nas respostas
    'options': [
      'assets/one_screem_4a.png',
      'assets/one_screem_4b.png',
      'assets/one_screem_4c.png',
      'assets/one_screem_4d.png',
      'assets/one_screem_4e.png',
      'assets/one_screem_4f.png'
    ],
  },
  201: const {
    //não foi mostrado no questionário
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'one_screem',
    'header': "Qual das imagens abaixo completa a sequência a seguir?",
    'body': 'assets/one_screem_4.png',
    'modo_body': 'image',
    'modo_op': 'image', //Imagem nas respostas
    'options': [
      'assets/one_screem_4a.png',
      'assets/one_screem_4b.png',
      'assets/one_screem_4c.png',
      'assets/one_screem_4d.png',
      'assets/one_screem_4e.png',
      'assets/one_screem_4f.png'
    ],
  },
  250: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'one_screem',
    'header': "Qual das imagens abaixo completa a sequência a seguir?",
    'body': 'assets/one_screem_2.png',
    'modo_body': 'image',
    'modo_op': 'image', //Imagem nas respostas
    'options': [
      'assets/one_screem_2a.png',
      'assets/one_screem_2b.png',
      'assets/one_screem_2c.png',
      'assets/one_screem_2d.png',
      'assets/one_screem_2e.png',
      'assets/one_screem_2f.png'
    ],
  },
  252: const {
    'hasProx': true,
    'isSendAnswer': false,
    'style': 'sobre',
    'header': 'Atenção!!',
    'body': "Na próxima tela será reproduzida algumas palavras. Fique atento.",
  },

  254: const {
    'hasProx': true,
    'isSendAnswer': false,
    'style': 'sobre',
    'header': '',
    'body': "",
  }, //não foi criado ainda (colocado como tela 62)
  256: const {
    'hasProx': true,
    'isSendAnswer': false,
    'style': 'sobre',
    'header': '',
    'body': "",
  },
  257: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'one_screem',
    'header':
        "Dentre as opções abaixo marque a expressão que melhor corresponde o sentimento descrito.",
    'body': 'Tristeza',
    'modo_body': 'text', //Texto nas respostas
    'modo_op': 'image', //Texto nas respostas
    'options': [
      'assets/emotion1.png',
      'assets/emotion2.png',
      'assets/emotion3.png',
      'assets/emotion4.png',
      'assets/emotion5.png',
      'assets/emotion6.png'
    ]
  },
  258: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'one_screem',
    'header':
        "Dentre as opções abaixo marque a expressão que melhor corresponde o sentimento descrito.",
    'body': 'Poderoso',
    'modo_body': 'text', //Texto nas respostas
    'modo_op': 'image', //Texto nas respostas
    'options': [
      'assets/emotion1.png',
      'assets/emotion2.png',
      'assets/emotion3.png',
      'assets/emotion4.png',
      'assets/emotion5.png',
      'assets/emotion6.png'
    ]
  },
  259: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'one_screem',
    'header':
        "Dentre as opções abaixo marque a expressão que melhor corresponde o sentimento descrito.",
    'body': 'Felicidade',
    'modo_body': 'text', //Texto nas respostas
    'modo_op': 'image', //Texto nas respostas
    'options': [
      'assets/emotion1.png',
      'assets/emotion2.png',
      'assets/emotion3.png',
      'assets/emotion4.png',
      'assets/emotion5.png',
      'assets/emotion6.png'
    ]
  },
  260: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'one_screem',
    'header':
        "Dentre as opções abaixo marque a expressão que melhor corresponde o sentimento descrito.",
    'body': 'Raivoso',
    'modo_body': 'text', //Texto nas respostas
    'modo_op': 'image', //Texto nas respostas
    'options': [
      'assets/emotion1.png',
      'assets/emotion2.png',
      'assets/emotion3.png',
      'assets/emotion4.png',
      'assets/emotion5.png',
      'assets/emotion6.png'
    ]
  },
  261: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'one_screem',
    'header':
        "Dentre as opções abaixo marque a expressão que melhor corresponde como você tem se sentido nos últimos dias.",
    'body': '',
    'modo_body': 'text', //Texto nas respostas
    'modo_op': 'image', //Texto nas respostas
    'options': [
      'assets/emotion1.png',
      'assets/emotion2.png',
      'assets/emotion3.png',
      'assets/emotion4.png',
      'assets/emotion5.png',
      'assets/emotion6.png'
    ]
  },
  262: const {
    'hasProx': true,
    'isSendAnswer': true,
    'style': 'one_screem',
    'header':
        "Dentre as opções abaixo marque a expressão que melhor corresponde o sentimento descrito.",
    'body': 'Apaixonado',
    'modo_body': 'text', //Texto nas respostas
    'modo_op': 'image', //Texto nas respostas
    'options': [
      'assets/emotion1.png',
      'assets/emotion2.png',
      'assets/emotion3.png',
      'assets/emotion4.png',
      'assets/emotion5.png',
      'assets/emotion6.png'
    ]
  },
  263: const {
    'hasProx': false,
    'isSendAnswer': false,
    'style': 'sobre',
    'header': 'Parabéns!!!!',
    'body':
        "Você terminou o questionário, agradeçemos muito pela sua disponibilidade.\n\nOBS.:Você ja pode fechar esta página.",
  },
};
