//
//  Passage.swift
//  NanoChallenge1
//
//  Created by Rafa (Ruffles) on 26/07/23.
//

import Foundation

struct Passage: Identifiable, Hashable {
    static func == (lhs: Passage, rhs: Passage) -> Bool {
        return lhs.id == rhs.id
    }
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
    
    let id = UUID()
    let text : String
    let backgroundImageName : String
    let foregroundImageName : String
    let options : [Option]
    let hasImages : Bool
    
    init (text: String, options: [Option], backgroundImageName: String = "", foregroundImageName: String = "transparency", hasImages: Bool = true) {
        self.text = text
        self.backgroundImageName = backgroundImageName
        self.options = options
        self.foregroundImageName = foregroundImageName
        self.hasImages = hasImages
    }
    
    static func getPassages() -> [Passage] {
        let router = Router.shared
        let playerData = PlayerData.shared
        return [
            Passage( // 0
                text: "Você acorda de uma soneca na cantina, ainda se sentindo como se as informações das suas primeiras quatro horas de trabalho como membro Júnior da Equipe de Pesquisa tivessem te pulverizado.\n\nEra hora do almoço quando você caiu no sono, e você encontrou um canto da cantina onde ninguém te incomodaria, e onde você poderia comer comida, beber café extremamente forte e digerir as aulas introdutórias que você teve de manhã.",
                options: [
                    Option(text: "Olhar ao redor", action: {router.addToPassageIdStack(passageId: 1)}),
                ],
                backgroundImageName: "cafeteria"
            ),
            Passage( // 1
                text: "Existem alguns papéis abertos na sua mesa, que você recebeu nas suas primeiras horas de experiência. Seu celular de trabalho vibra no seu bolso, provavelmente com mensagens dos seus novos colegas de trabalho.",
                options: [
                    Option(text: "Ver os papéis na mesa", action: {router.addToPassageIdStack(passageId: 2)}),
                    Option(text: "Verificar o seu celular", action: {router.addToPassageIdStack(passageId: 3)}),
                    Option(text: "Olhar o resto da cantina", action: {router.addToPassageIdStack(passageId: 9)})
                ],
                backgroundImageName: "cafeteria"
            ),
            Passage( // 2
                text: "Você, "+playerData.name+", entrou hoje na equipe de pesquisa do Local-"+String(playerData.siteNumber)+" da Fundação SCP. Além de vários materiais que você precisará estudar para realizar seu trabalho daqui pra frente, você também recebeu vários materiais introdutórios, como a Definição da Missão da Fundação.\n\n\"A Humanidade, em seu estado atual, existe a cerca de um quarto de milhão de anos, mas somente os últimos 4,000 tiveram qualquer significância.\n\nEntão, o que fizemos durante quase 250,000 anos? Nos amontoamos em cavernas, em torno de pequenas fogueiras, com medo das coisas que não entendíamos. Era mais do que explicar por quê o Sol nascia, era o mistério de pássaros enormes, com cabeças de homem e pedras que ganhavam vida. Então nós os chamamos de ‘deuses’ e ‘demônios’, implorando que eles nos poupassem e rezando por salvação.\n\nApós um tempo, seus números baixaram e os nossos cresceram. O mundo começou a fazer mais sentido quando tinham menos coisas a temer, no entanto, o inexplicável nunca irá realmente desaparecer, como se o universo exigisse o absurdo e impossível.A Humanidade não deve voltar a se esconder com medo. Ninguém vai nos proteger, devemos lutar por nós mesmo.\n\nEnquanto o resto da humanidade vive sob a luz, devemos viver na escuridão para combatê-la, mantê-la e protegê-la de olhos públicos, para que os outros possam viver em um mundo normal, seguro e são.\n\nNós asseguramos. Nós contemos. Nós protegemos.\n\n– O Administrador\"",
                options: [
                    Option(text: "Voltar", action: {router.goBack()})
                ],
                hasImages: false
            ),
            Passage( //3
                text: "Como esperado, as mensagens que você vê são apenas dos seus colegas de trabalho, no grupo de WhatsApp recentemente criado. Parece que todos já se apresentaram e agora estão trocando figurinhas.\n\nAo acessar a intranet da Fundação, você encontra alguns arquivos de SCP. Você pode acessar pouquíssimos deles, por conta do seu nível de acesso. A maioria deles parecem piadas. Só podem ser. Piadas péssimas, escuras e assustadoras.",
                options: [
                    Option(text: "Ler SCP-049", action: {router.addToPassageIdStack(passageId: 4)}),
                    Option(text: "Ler SCP-055", action: {router.addToPassageIdStack(passageId: 5)}),
                    Option(text: "Ler SCP-096", action: {router.addToPassageIdStack(passageId: 6)}),
                    Option(text: "Ler SCP-682", action: {router.addToPassageIdStack(passageId: 7)}),
                    Option(text: "Ler SCP-087", action: {router.addToPassageIdStack(passageId: 8)}),
                    Option(text: "Voltar", action: {router.goBack()})
                ],
                hasImages: false
            ),
            Passage(//4
                text: "Item nº: SCP-049\n\nClasse do Objeto: Euclídeo\n\nProcedimentos Especiais de Contenção: SCP-049 é contido em uma Cela de Contenção de Segurança Padrão no Setor de Pesquisa-02 do Sítio-19. SCP-049 deve ser sedado antes de qualquer tentativa de transporte. Durante o transporte, SCP-049 deve ser equipado com um Traje de Restrição de Classe III (incluindo um colar de travamento e restrições de extensão) e monitorado por não menos que dois guardas armados.\n\nEnquanto SCP-049 é geralmente cooperativo com a maioria dos funcionários da Fundação, surtos ou mudanças súbitas de comportamento devem ser enfrentados com força elevada. Sob nenhuma circunstância qualquer funcionário deve entrar em contato direto com SCP-049 durante esses período. No caso de SCP-049 se tornar agressivo, a aplicação de lavanda (L. multifida) que mostrou produzir um efeito calmante sobre a entidade. Quando acalmado, SCP-049 geralmente se tornará complacente e retornará à contenção sem nenhuma resistência.\n\nA fim de facilitar a contenção contínua de SCP-049, a entidade deve receber o cadáver de um animal que recentemente foi morto (tipicamente um animal bovino ou qualquer outro animal grande) uma vez a cada duas semanas para estudo. Cadáveres que se tornam instâncias de SCP-049-2 devem ser removidos da cela de contenção de SCP-049 e incinerados. SCP-049 não tem mais permissão para se interagir com seres humanos, e solicitações de se interagir com seres humanos devem ser negadas.\n\nAtualização Temporária nos Procedimentos de Contenção: (Veja Adendo 049.3) Desde a Ordem do Comitê de Contenção 049.S19.17.1, SCP-049 não tem mais permissão para interagir diretamente com nenhum membro da equipe da Fundação, nem deve receber quaisquer cadáveres adicionais para serem usados em suas cirurgias. Esta ordem deve persistir indefinidamente, até que um consenso sobre a contenção contínua de SCP-049 possa ser alcançado.\n\nDescrição: SCP-049 é uma entidade humanoide, com cerca de 1,9 metros de altura, que tem a aparência de um médico da peste medieval. Embora SCP-049 pareça estar usando as roupas e a máscara de cerâmica indicativa dessa profissão, as roupas parecem ter crescido do corpo de SCP-049 ao longo do tempo1, e agora são quase indistinguíveis de qualquer forma que esteja abaixo delas. Exames de Raio X indicam que, apesar disso, SCP-049 possui uma estrutura esquelética humanoide sob sua camada externa.\n\n049xray.jpg\nRadiografia da estrutura facial de SCP-049.\n\nSCP-049 é capaz de falar em várias línguas, embora prefira inglês ou o francês medieval2. Embora SCP-049 seja geralmente cordial e cooperativo com a equipe da Fundação, o objeto pode ficar especialmente irritado ou às vezes agressivo se sentir que está na presença do que chama de \"Pestilência\". Embora a natureza exata desta Pestilência seja atualmente desconhecida pelos pesquisadores da Fundação, parece ser uma questão de grande preocupação para SCP-049.\n\nSCP-049 se tornará hostil com os indivíduos que ele vê como afetados pela Pestilência, muitas vezes tendo que ser contidos caso o encontrem. Se não for verificado, SCP-049 geralmente tentará matar qualquer indivíduo; SCP-049 é capaz de cessar todas as funções biológicas de um organismo através do contato direto com a pele. Como isso ocorre é atualmente desconhecido, e as autópsias das vítimas de SCP-049 têm sido invariavelmente inconclusivas. SCP-049 expressou frustração ou remorso após essas mortes, indicando que eles fizeram pouco para matar \"A Pestilência\", embora normalmente procurem realizar uma cirurgia no cadáver usando os implementos contidos dentro de uma bolsa médica que ele carrega, em sua pessoa em todos os momentos3. Embora essas cirurgias nem sempre sejam \"bem-sucedidas\", isso geralmente resulta na criação das instâncias de SCP-049-2.\n\nAs instâncias de SCP-049-2 são corpos reanimados que foram operados por SCP-049. Essas instâncias parecem não reter nenhuma de suas memórias anteriores ou funções mentais, tendo apenas habilidades motoras básicas e mecanismos de resposta. Embora essas instâncias sejam geralmente inativas, se movimentando muito pouco e de uma maneira geralmente ambulatorial, eles podem se tornar extremamente agressivos se provocados, ou se direcionados por SCP-049. As instâncias de SCP-049-2 expressam funções biológicas ativas, embora estas sejam muito diferentes da fisiologia humana atualmente entendida. Apesar dessas alterações, SCP-049 frequentemente observa os sujeitos como \"curados\".",
                options: [
                    Option(text: "Voltar", action: {router.goBack()})
                ],
                backgroundImageName: "scp-049"
            ),
            Passage( //5
                text: "Item nº: SCP-055\n\nClasse do Objeto: Keter\n\nProcedimentos Especiais de Contenção: O objeto é mantido em uma câmara quadrada de cinco (5) por cinco (5) por dois metros e meio (2,5), construída de cimento (cinquenta (50) centímetros de grossura) com uma gaiola de Faraday circunjacente às paredes. O acesso é feito através de uma porta de contenção pesada, medindo dois (2) por dois metros e meio (2,5) construída sobre rolamentos para garantir seu fechamento e trancamento automáticos. Guardas de segurança NÃO devem ser colocados no exterior da sala de SCP-055. É aconselhável que todos os funcionários trabalhando ou estudando outros objetos SCP nas proximidades tentem manter uma distância de pelo menos cinquenta (50) metros do centro geométrico da sala, contanto que isso seja praticável caso a caso.\n\nDescrição: SCP-055 é um \"segredo auto-mantido\" ou um \"anti-meme\". Informações sobre a aparência física de SCP-055, bem como sua natureza, comportamento e origens são auto-confidenciais. Para esclarecer:\n\nÉ desconhecido como o Sítio 19 adquiriu SCP-055.\nÉ desconhecida a data de obtenção de SCP-055, bem como o responsável pela obtenção.\nÉ desconhecida a aparência física de SCP-055, não sendo esta simplesmente indescritível ou invisível: indivíduos são perfeitamente capazes de entrar na contenção de SCP-055 e observá-lo, tomando notas mentais ou escritas, desenhando esboços, tirando fotografias e até mesmo mantendo gravações de áudio/vídeo. Há, arquivado, um amplo registro contendo estas observações. Entretanto, informações sobre a aparência de SCP-055 \"vazam\" da mente humana logo após as observações. Indivíduos encarregados da descrição de SCP-055 sentem suas mentes vagando após a observação, perdendo interesse no assunto; indivíduos encarregados de esboçar uma cópia de fotografias de SCP-055 não conseguem se lembrar da imagem da foto, estes mesmos efeitos afetam os pesquisadores supervisionando estas tarefas. Funcionários de segurança que observaram SCP-055 através de câmeras de circuito interno terminam suas rondas exaustos e efetivamente amnésicos em relação aos eventos transcorridos nas últimas horas.\nSão desconhecidos quem autorizou a construção da contenção de SCP-055, o motivo de suas características e o propósito dos Procedimentos de Contenção descritos.\nEmbora a contenção de SCP-055 seja facilmente acessível, todos os funcionários do Sítio 19 alegam não saber da existência de SCP-055 quando questionados.\nTodos estes fatos são periodicamente redescobertos, normalmente por leitores aleatórios deste arquivo, causando um alarme considerável. Esta preocupação dura somente alguns minutos no máximo, antes que o assunto seja simplesmente esquecido.\n\nUma grande quantidade de informações sobre SCP-055 foi registrada, mas não pode ser estudada.\n\nPelo menos uma tentativa de destruir SCP-055 foi feita, ou de movê-lo de sua contenção no Sítio 19 para outro local, fracassando por causas desconhecidas.\n\nSCP-055 representa potencialmente um enorme risco físico e pode ter matado centenas de funcionários, sem que possamos nos lembrar. Certamente o objeto representa um risco memético/mental colossal, motivando sua classificação como Keter.\n\nDocumento #055-1: Uma Análise de SCP-055\n\nO autor defende a hipótese de que SCP-055 nunca foi formalmente adquirido por ████████████ ████████, sendo na verdade um agente autônomo ou controlado remotamente inserido no Sítio 19 por um individuo/s desconhecido com um ou mais dos seguintes propósitos:\n\nsilenciosamente observar, ou interferir com, as atividades do Sítio 19\nsilenciosamente observar, ou interferir com, as atividades de outras localizações SCP\nsilenciosamente observar, ou interferir com, as atividades da humanidade\nsilenciosamente observar, ou interferir com, outros objetos SCP\nsilenciosamente observar, ou interferir com, ████████████\nNão é sugerida nenhuma ação para se opor a estes riscos potenciais, sendo isso teoricamente impossível.",
                options: [
                    Option(text: "Voltar", action: {router.goBack()})
                ],
                hasImages: false
                   ),
            Passage( //6
                text: "Item nº: SCP-096\n\nClasse do Objeto: Euclídeo\n\nProcedimentos Especiais de Contenção: SCP-096 deve ser mantido em sua cela, em um cubo de aço hermeticamente fechado de 5m x 5m x 5m, em todos os momentos. Verificações semanais para quaisquer rachaduras ou buracos são obrigatórios. Não é permitido nenhuma vigilância por vídeo ou ferramentas ópticas de qualquer tipo dentro da célula de SCP-096. Funcionários de segurança devem usar sensores de pressão pré-instalados e detectores a laser para garantir a presença de SCP-096 no interior da célula.\n\nTodas as fotos, vídeo ou gravações que sejam ou se assemelhem a SCP-096 são estritamente proibidas sem a aprovação do Dr.███ e O5-█.\n\nDescrição: SCP-096 é uma criatura humanoide, medindo aproximadamente 2,38 metros de altura. Sujeito mostra ter pouca massa muscular, com a análise preliminar de massa corporal sugerindo uma leve desnutrição. Braços estão grosseiramente fora de proporção com o resto do corpo do sujeito, com extensão aproximada de 1,5 metros cada. A pele é principalmente desprovida de pigmentação, sem nenhum sinal de qualquer cabelo no corpo.\n\nA mandíbula de SCP-096 pode abrir até 4 (quatro) vezes em comparação com a de um ser humano normal. Outras características faciais permanecem semelhantes para um ser humano, com exceção dos olhos, que são também desprovidos de pigmentação. Ainda não se sabe se o SCP-096 é cego ou não. Ele não mostra sinais de quaisquer funções cerebrais superiores, e não é considerado ser sapiente.\n\nSCP-096 é normalmente extremamente dócil, com sensores de pressão dentro de sua cela indicando que gasta a maior parte do dia a olhar para a parede oriental. No entanto, quando alguém vê o rosto de SCP-096, seja diretamente, por meio de gravação de vídeo, ou até mesmo por uma fotografia, SCP-096 irá entrar numa fase de sofrimento emocional considerável. SCP-096 vai cobrir seu rosto com as mãos e começar a gritar, chorar e balbuciar incoerentemente. Cerca de 1 (um) até 2 (dois) minutos após a primeira visualização, SCP-096 começará a correr para a pessoa que viu seu rosto (que vai a partir deste ponto será referido como SCP-096-1).\n\nVelocidades documentadas têm variado de trinta e cinco (35)km/h até ███ km/h, este fato parece depender da distância de SCP-096-1. Neste ponto, nenhum material ou métodos conhecidos podem impedir o progresso de SCP-096. A posição real de SCP-096-1 não parece afetar a resposta de SCP-096, que parece ter um senso inato de localização de SCP-096-1. Nota: Esta reação não ocorre quando vê representações artísticas (ver Documento 096-1).\n\nAo chegar ao local de SCP-096-1, SCP-096 vai matar e [DADOS EXPURGADOS] SCP-096-1. 100% dos casos não deixaram vestígios de SCP-096-1. SCP-096, em seguida, vai sentar-se por alguns minutos antes de recuperar a compostura e se tornar dócil, mais uma vez. Então ele vai tentar fazer o seu caminho de volta ao seu habitat natural, [DADOS REDIGIDOS]\n\nDevido à possibilidade de uma reação de cadeia em massa, incluindo violação de sigilo da Fundação e grande perda de vidas civis, a recuperação do sujeito deve ser considerado prioridade Alpha.\n\nDr.███ também pediu a terminação imediata de SCP-096 (ver entrevista 096-1). O pedido está aguardando aprovação. A ordem tem sido aprovada, e deve ser realizada pelo Dr.███ em [DADOS REDIGIDOS]. Veja o Incidente-096-1-A.",
                options: [
                    Option(text: "Voltar", action: {router.goBack()})
                ]
                   ),
            Passage( //7
                text: "Item nº: SCP-682\n\nClasse do Objeto: Keter\n\nProcedimentos Especiais de Contenção: SCP-682 deve ser destruído assim que possível. No momento, nenhum meio disponível às equipes SCP foram capazes de destruir SCP-682, sendo apenas capazes de causar danos físicos massivos. SCP-682 deve ser contido em uma câmara 5 m x 5 m x 5 m com 25 cm de placa de aço reforçada, resistente a ácidos, revestindo todas as superfícies internas. A câmara de contenção deve ser preenchida com ácido clorídrico até SCP-682 ser submerso e incapacitado. Qualquer tentativa de SCP-682 de se mover, falar ou violar a contenção deve ser reagida sobre rapidamente e com força total, como solicitada pelas circunstâncias.\n\nFuncionários estão proibidos de falar com SCP-682, por medo de provocar um estado de raiva. Todos os funcionários não-autorizados tentando se comunicar com SCP-682 serão restringidos e removidos à força\n\nDevido aos frequentes atentados de violar a contenção, dificuldade de contenção e incapacitação, e alta ameaça de Exposição à Fundação, SCP-682 deverá ser contido no sítio [CONFIDENCIAL]. A Fundação usará o melhor de seus recursos para manter toda terra dentro de cinquenta (50) quilômetros sem desenvolvimento humano.\n\nDescrição: SCP-682 é uma grande criatura vagamente semelhante a um réptil de origem desconhecida. Ele aparenta ser extremamente inteligente, e já foi observado se envolvendo em uma comunicação complexa com SCP-079 durante seus pequenos tempos de exposição. SCP-682 aparenta ter ódio contra toda vida, que vem sendo expressado em várias entrevistas durante sua contenção. (Veja o Adendo 682-B).\n\nSCP-682 sempre foi observado tendo força, velocidade e reflexos extremamente altos, embora os níveis exatos variem com a sua forma. O corpo físico de SCP-682 cresce e muda rapidamente, crescendo ou diminuindo de tamanho quando consome ou derrama materiais. SCP-682 ganha energia de tudo o que ele ingere, orgânico ou inorgânico. A digestão parece ser ajudada por um conjunto de brânquias de filtragem dentro das narinas do SCP-682, que são capazes de remover matéria usável de qualquer solução liquida, permitindo que ele se regenere constantemente do ácido em que esta contido. As habilidades de regeneração e resiliência são surpreendentes e SCP-682 já foi visto movendo-se e falando com seu corpo 87% destruído ou apodrecido.\n\nEm caso de uma brecha da contenção, SCP-682 é para ser rastreado e re-capturado por todas as Forças-Tarefa Móveis disponíveis, e nenhuma equipe com menos de sete (7) membros tem permissão para ataca-lo. Até a presente data (██-██-████), As tentativas de brechas foram numeradas em dezessete (17), enquanto brechas bem sucedidas foram numeradas em seis (6) . (Veja Adendo 682-D).",
                options: [
                    Option(text: "Voltar", action: {router.goBack()})
                ],
                backgroundImageName: "scp-682"
            ),
            Passage( //8
                text: "Item nº: SCP-087\n\nClasse do Objeto: Euclídeo\n\nProcedimentos Especiais de Contenção: SCP-087 está localizado no campus de [EXPURGADO]. A porta que conduz a SCP-087 é construída de aço reforçado com um mecanismo de bloqueio de liberação eletrônica. A porta de SCP-087 tem sido disfarçada para se assemelhar a um armário de limpeza em conformidade com a concepção do edifício. O mecanismo de bloqueio na maçaneta da porta não vai se liberar a menos que ██ volts forem aplicados em conjunto com a rotação anti-horária da chave. O interior da porta é revestida com 6 centímetros de espuma industrial.\n\nDevido aos resultados da exploração final (ver Documento 087-IV), não é permitido o acesso de nenhum funcionário a SCP-087.\n\nDescrição: SCP-087 é uma escadaria de plataforma apagada. Escadas descem em um ângulo de 38 graus a cada 13 passos antes de chegar a uma plataforma semicircular de aproximadamente 3 metros de diâmetro. A direção gira em 180 graus em cada plataforma. O projeto de SCP-087 limita o sujeito a um alcance visual de aproximadamente 1,5 passos. Uma fonte de luz é necessária para todos os sujeitos que exploram SCP-087, já que não existem luminárias ou janelas presentes. Fontes de iluminação mais brilhantes do que 75 watts têm se mostrado ineficaz, SCP-087 parece absorver o excesso de luz.\n\nRelatos e gravações de áudio dos sujeitos confirmam vocalizações de aflito do que supostamente é uma criança entre █ a ██ anos de idade. A fonte das chamadas de aflito estima-se estar localizada a cerca de 200 metros abaixo da plataforma inicial. No entanto, todas as tentativas para descer a escada não conseguiram trazer qualquer sujeito mais perto da fonte dos gritos. A profundidade de descida calculada a partir de Exploração IV, a exploração mais longa, é mostrada como sendo muito além do tamanho da estrutura, tanto do edifício quanto dos arredores geológicos. Neste momento, não se sabe se SCP-087 tem um ponto final ou de saída.",
                options: [
                    Option(text: "Voltar", action: {router.goBack()})
                ],
                backgroundImageName: "scp-087"
            ),
            Passage( //8
                text: "Ao observar o resto da cantina, você vê seus colegas espalhados por várias das mesas, conversando uns com os outros. Você os 10 outros Pesquisadores Júnior que entraram junto contigo, além de um ou outro instrutor.\n\nAlém deles a cantina está vazia, o que é estranho. O Local-"+String(playerData.siteNumber)+" é composto por três prédios enormes, e sua cantina poderia abrigar mais de 100 funcionários.",
                options: [
                    Option(text: "Voltar", action: {router.goBack()})
                ],
                backgroundImageName: "cafeteria"
            ),
        ]
    }
    
//    let category: Category
//    let challenge: String
//    var progress: Progress
//    let specificSearch: String
//
//    init (category: Category, challenge: String, progress: Progress = Progress.none, specificSearch: String = "") {
//        self.category = category
//        self.challenge = challenge
//        self.progress = progress
//        self.specificSearch = specificSearch
//    }
}
