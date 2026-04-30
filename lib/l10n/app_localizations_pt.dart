// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get appTitle => 'HydroBuddy';

  @override
  String get calculator => 'Calculadora';

  @override
  String get substances => 'Substâncias';

  @override
  String get formulations => 'Formulações';

  @override
  String get tank => 'Tanque';

  @override
  String get settings => 'Configurações';

  @override
  String get about => 'Sobre';

  @override
  String get instrumentPrecision => 'Precisão dos Instrumentos';

  @override
  String get degreeOfFreedom => 'Grau de Liberdade (DOF)';

  @override
  String get waterQuality => 'Qualidade da Água';

  @override
  String get tissueAnalysis => 'Análise de Tecido';

  @override
  String get aboutHydroBuddy => 'Sobre o HydroBuddy';

  @override
  String get language => 'Idioma';

  @override
  String get comingSoon => 'Em breve';

  @override
  String get theme => 'Tema';

  @override
  String get carryOutCalculation => 'Executar Cálculo';

  @override
  String get plus5Weights => '+5% Pesos';

  @override
  String get minus5Weights => '-5% Pesos';

  @override
  String get save => 'Salvar';

  @override
  String get load => 'Carregar';

  @override
  String get delete => 'Excluir';

  @override
  String get csv => 'CSV';

  @override
  String get stock => 'Estoque';

  @override
  String get perSub => 'Por Subst.';

  @override
  String get mix => 'Mix';

  @override
  String get ratios => 'Razões';

  @override
  String get reset => 'Redefinir';

  @override
  String get copyTargets => 'Copiar->Alvos';

  @override
  String get copyDb => 'Copiar->BD';

  @override
  String get volume => 'Volume';

  @override
  String get units => 'Unidades';

  @override
  String get mass => 'Massa:';

  @override
  String get conc => 'Conc:';

  @override
  String get calcMode => 'Modo de Cálculo';

  @override
  String get inputDesiredConcentrations => 'Inserir Concentrações Desejadas';

  @override
  String get concentrationsFromWeights => 'Concentrações a partir dos Pesos';

  @override
  String get solutionMode => 'Modo de Solução';

  @override
  String get directAddition => 'Adição direta';

  @override
  String get concentratedAB => 'Concentrado A+B';

  @override
  String get ecModel => 'Modelo de EC';

  @override
  String get lmcV2 => 'LMCv2';

  @override
  String get empirical => 'Empírico';

  @override
  String get loadWaterProfile => 'Carregar perfil de água';

  @override
  String get none => 'Nenhum';

  @override
  String get applyToCalculation => 'Aplicar ao cálculo';

  @override
  String get noSubstancesSelected => 'Nenhuma substância selecionada';

  @override
  String nSelected(int count) {
    return '$count selecionadas';
  }

  @override
  String get selectSubstances => 'Selecionar Substâncias';

  @override
  String get freeElementDof => 'Elemento livre (DOF)';

  @override
  String get volErr => 'Erro Vol (±L)';

  @override
  String get wtErr => 'Erro Bal (±g)';

  @override
  String get siSource => 'Fonte de Si';

  @override
  String get dofDescription =>
      'O Grau de Liberdade (Degree of Freedom — DOF) permite que um nutriente varie livremente durante o cálculo de mínimos quadrados. Quando um elemento é escolhido como DOF, sua concentração final não é restrita ao valor alvo, sendo determinada pelas proporções das substâncias selecionadas.\n\nNa maioria dos casos, o Potássio (K) é a melhor escolha, pois nutrientes à base de K são abundantes e baratos.';

  @override
  String get noneFullyRestricted => 'Nenhum (sistema totalmente restrito)';

  @override
  String get recommended => 'Recomendado';

  @override
  String get versionNumber => '1.0.0+1';

  @override
  String get aboutDescription =>
      'Calculadora de soluções nutritivas hidropônicas';

  @override
  String get credits => 'Créditos';

  @override
  String get aboutHistory =>
      'HydroBuddy é uma reimplementação em Dart/Flutter do HydroBuddy original, desenvolvido por Daniel Fernandez em Pascal/Lazarus.\n\nO HydroBuddy original é uma ferramenta de código aberto para cálculo de soluções nutritivas hidropônicas, amplamente utilizada por pesquisadores e produtores ao redor do mundo.';

  @override
  String get license => 'Licença';

  @override
  String get gplLicense => 'Este projeto é distribuído sob a licença GPL v3.';

  @override
  String get instrumentPrecisionDescription =>
      'Esses valores são usados para propagação de erro nos cálculos de incerteza das soluções preparadas.';

  @override
  String get volumeError => 'Erro do Volume (mL)';

  @override
  String get volumetricGlasswareUncertainty =>
      'Incerteza da vidraria volumétrica';

  @override
  String get weightError => 'Erro da Balança (g)';

  @override
  String get analyticalBalanceUncertainty => 'Incerteza da balança analítica';

  @override
  String get nutritionalRatios => 'Ratios Nutricionais';

  @override
  String get executeCalculationFirst => 'Execute o cálculo primeiro';

  @override
  String get notAvailable => 'N/D';

  @override
  String get perSubstanceAnalysis => 'Análise por Substância';

  @override
  String substanceIdNoContribution(int id) {
    return 'Substância ID $id — sem contribuição';
  }

  @override
  String weightCostFormat(String weight, String cost) {
    return 'Peso: $weight g | Custo: R\$ $cost';
  }

  @override
  String get element => 'Elemento';

  @override
  String get ppmContributed => 'ppm contribuído';

  @override
  String get percentOfTarget => '% do alvo';

  @override
  String get stockAnalysis => 'Análise de Estoque (A+B)';

  @override
  String get factors => 'Fatores';

  @override
  String dilutionFactorLabel(String factor) {
    return 'Fator de diluição: ${factor}x';
  }

  @override
  String stockVolumeLabel(String volume) {
    return 'Volume de estoque: $volume L';
  }

  @override
  String get substance => 'Substância';

  @override
  String get stockA => 'Estoque A (g)';

  @override
  String get stockB => 'Estoque B (g)';

  @override
  String get totalWeight => 'Peso Total (g)';

  @override
  String get mixComposition => 'Composição do Mix';

  @override
  String get summary => 'Resumo';

  @override
  String totalDryWeight(String weight) {
    return 'Peso seco total: $weight g';
  }

  @override
  String totalSolids(String total) {
    return 'Sólidos totais (ppm): $total';
  }

  @override
  String get npkLabel => 'Rótulo NPK';

  @override
  String get npkDetailed => 'NPK Detalhado';

  @override
  String get otherElements => 'Outros Elementos';

  @override
  String get weightPercent => '% peso';

  @override
  String get compareFertilizers => 'Comparar Fertilizantes';

  @override
  String get fillAllFieldsValid =>
      'Preencha todos os campos com valores válidos';

  @override
  String get checkNpkValues =>
      'Verifique os valores NPK de ambos os fertilizantes';

  @override
  String get fertilizer1 => 'Fertilizante 1';

  @override
  String get fertilizer2 => 'Fertilizante 2';

  @override
  String get name => 'Nome';

  @override
  String get massG => 'Massa (g)';

  @override
  String get volumeL => 'Volume (L)';

  @override
  String get compare => 'Comparar';

  @override
  String get resultPpm => 'Resultado (ppm)';

  @override
  String get difference => 'Diferença';

  @override
  String get commercialFertilizer => 'Fertilizante Comercial';

  @override
  String get invalidNpkFormat => 'Formato NPK inválido. Use ex: 10-10-10';

  @override
  String get invalidNpkValues => 'Valores NPK inválidos. Use números.';

  @override
  String get volumeMustBePositive => 'Volume deve ser maior que zero';

  @override
  String get calculate => 'Calcular';

  @override
  String get phAdjustment => 'Ajuste de pH';

  @override
  String get currentPh => 'pH atual';

  @override
  String get targetPh => 'pH alvo';

  @override
  String get acid => 'Ácido';

  @override
  String get volumeAndTargetPhMustBePositive =>
      'Volume e pH alvo devem ser maiores que zero';

  @override
  String get currentPhMustBeGreaterThanTarget =>
      'pH atual deve ser maior que o pH alvo';

  @override
  String get loading => 'Carregando...';

  @override
  String get editAnalysis => 'Editar Análise';

  @override
  String get newAnalysis => 'Nova Análise';

  @override
  String get nameRequired => 'Nome obrigatorio';

  @override
  String get compositionPercent => 'Composição (%)';

  @override
  String get noTissueAnalysis => 'Nenhuma análise de tecido cadastrada';

  @override
  String get deleteAnalysis => 'Excluir Análise';

  @override
  String confirmDeleteTissue(String name) {
    return 'Deseja excluir \"$name\"?';
  }

  @override
  String get cancel => 'Cancelar';

  @override
  String get newProfile => 'Novo Perfil';

  @override
  String get editProfile => 'Editar Perfil';

  @override
  String get deleteProfile => 'Excluir Perfil';

  @override
  String confirmDeleteProfile(String name) {
    return 'Deseja excluir \"$name\"?';
  }

  @override
  String get searchProfile => 'Buscar perfil...';

  @override
  String get noWaterProfile => 'Nenhum perfil de água cadastrado';

  @override
  String get defaultLabel => 'Padrão';

  @override
  String get noAdditionalParameters => 'Sem parâmetros adicionais';

  @override
  String get compositionPpm => 'Composição (ppm)';

  @override
  String get preparedTanks => 'Tanques Preparados';

  @override
  String get noTanksPrepared => 'Nenhum tanque preparado';

  @override
  String get tapPlusToCreate => 'Toque no + para criar um novo';

  @override
  String get deleteTank => 'Excluir Tanque';

  @override
  String confirmDeleteTank(String name) {
    return 'Excluir \"$name\"?';
  }

  @override
  String remainingVolume(String date, String remaining) {
    return '$date | Restante: ${remaining}L';
  }

  @override
  String get active => 'ativo';

  @override
  String get consumed => 'consumido';

  @override
  String get registerIrrigation => 'Registrar Rega';

  @override
  String get finalize => 'Finalizar';

  @override
  String get register => 'Registrar';

  @override
  String get finalizeTank => 'Finalizar Tanque';

  @override
  String get confirmFinalizeTank => 'Marcar o tanque como consumido?';

  @override
  String get noIrrigationRegistered => 'Nenhuma rega registrada';

  @override
  String get editSubstance => 'Editar Substancia';

  @override
  String get newSubstance => 'Nova Substancia';

  @override
  String get formula => 'Fórmula';

  @override
  String get source => 'Origem';

  @override
  String get purity => 'Pureza (0.0 a 1.0)';

  @override
  String get invalidNumber => 'Numero invalido';

  @override
  String get valueBetween => 'Valor entre 0.0 e 1.0';

  @override
  String get costPerKg => 'Custo (R\$/kg)';

  @override
  String get liquid => 'Liquido';

  @override
  String get density => 'Densidade (g/mL)';

  @override
  String get onlyForLiquids => 'Apenas para liquidos';

  @override
  String get concentrationType => 'Tipo de Concentracao';

  @override
  String get elementalComposition => 'Composicao Elementar (%)';

  @override
  String get searchSubstance => 'Buscar substancia...';

  @override
  String get addSubstance => 'Adicionar substancia';

  @override
  String get prepareTank => 'Preparar Tanque';

  @override
  String get tankNameHint => 'ex: Tomate Semana 3';

  @override
  String get selectEllipsis => 'Selecione...';

  @override
  String get selectFormulation => 'Selecione uma formulação';

  @override
  String get volumeRequired => 'Informe o volume';

  @override
  String get invalidVolume => 'Volume inválido';

  @override
  String get measurementsOptional => 'Medições (opcional)';

  @override
  String get actualEc => 'EC real';

  @override
  String get actualPh => 'pH real';

  @override
  String get note => 'Nota';

  @override
  String get observations => 'Observações...';

  @override
  String get registerPreparation => 'Registrar Preparo';

  @override
  String get recipeSummary => 'Resumo da Receita';

  @override
  String get placeholderRecipe => 'KNO3: --g    MgSO4: --g    Ca(NO3)2: --g';

  @override
  String get placeholderMicros => 'KH2PO4: --g    Micros: --g';

  @override
  String get placeholderEcCost => 'EC previsto: -- mS/cm    Custo: --/L';

  @override
  String get noFormulations => 'Nenhuma formulação cadastrada';

  @override
  String get newFormulation => 'Nova Formulação';

  @override
  String get unit => 'Unidade';

  @override
  String get create => 'Criar';

  @override
  String get deleteFormulation => 'Excluir Formulação';

  @override
  String confirmDeleteFormulation(String name) {
    return 'Deseja excluir \"$name\"?';
  }

  @override
  String get targetNutrients => 'Nutrientes Alvo';

  @override
  String get target => 'Alvo';

  @override
  String get result => 'Resultado';

  @override
  String get gePercent => 'GE%';

  @override
  String get iePercent => 'IE%';

  @override
  String get fillTargetAndSelectSubstances =>
      'Preencha os nutrientes alvo e selecione substâncias';

  @override
  String get elementsStringGrid1 => 'Elementos — StringGrid1';

  @override
  String get substancesStringGrid2 => 'Substâncias — StringGrid2';

  @override
  String get ecCost => 'EC / Custo';

  @override
  String get warnings => 'Avisos';

  @override
  String get amountG => 'Quantidade (g)';

  @override
  String get cost => 'Custo';

  @override
  String get ec => 'EC';

  @override
  String get totalCost => 'Custo Total';

  @override
  String get substanceSelection => 'Seleção de Substâncias';

  @override
  String errorLoadingSubstances(String error) {
    return 'Erro ao carregar substâncias: $error';
  }

  @override
  String get apply => 'Aplicar';

  @override
  String get available => 'Disponíveis';

  @override
  String get used => 'Usadas';

  @override
  String get empty => 'Vazio';

  @override
  String get addArrow => 'Adicionar >>';

  @override
  String get removeArrow => '<< Remover';

  @override
  String get setAmount => 'Definir Quantidade';

  @override
  String get resetAmounts => 'Redefinir Quantidades';

  @override
  String get addNew => 'Adicionar Nova';

  @override
  String get edit => 'Editar';

  @override
  String get deleteFromDb => 'Excluir do BD';

  @override
  String get saveList => 'Salvar Lista';

  @override
  String get loadList => 'Carregar Lista';

  @override
  String get removeAll => 'Remover Todas';

  @override
  String get weightG => 'Peso (g)';

  @override
  String get ok => 'OK';

  @override
  String get confirmExclusion => 'Confirmar Exclusão';

  @override
  String confirmRemoveSubstance(String name) {
    return 'Remover \"$name\"?';
  }

  @override
  String get noSubstancesRegistered => 'Nenhuma substancia cadastrada';

  @override
  String get formulationNotFound => 'Formulação não encontrada';

  @override
  String get thisFormulationDoesNotExist => 'Esta formulação não existe.';

  @override
  String historyFormulation(String name) {
    return 'Histórico: $name';
  }

  @override
  String get noSnapshots => 'Nenhum snapshot registrado';

  @override
  String get newSnapshot => 'Novo Snapshot';

  @override
  String get optional => 'Opcional';

  @override
  String get valuesRestored => 'Valores restaurados no editor de formulação';

  @override
  String errorRestoring(String error) {
    return 'Erro ao restaurar: $error';
  }

  @override
  String get restore => 'Restaurar';

  @override
  String get manual => 'manual';

  @override
  String get autoSave => 'auto save';

  @override
  String get beforeEdit => 'antes de editar';
}
