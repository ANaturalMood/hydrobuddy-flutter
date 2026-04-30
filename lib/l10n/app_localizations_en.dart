// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'HydroBuddy';

  @override
  String get calculator => 'Calculator';

  @override
  String get substances => 'Substances';

  @override
  String get formulations => 'Formulations';

  @override
  String get tank => 'Tank';

  @override
  String get settings => 'Settings';

  @override
  String get about => 'About';

  @override
  String get instrumentPrecision => 'Instrument Precision';

  @override
  String get degreeOfFreedom => 'Degree of Freedom';

  @override
  String get waterQuality => 'Water Quality';

  @override
  String get tissueAnalysis => 'Tissue Analysis';

  @override
  String get aboutHydroBuddy => 'About HydroBuddy';

  @override
  String get language => 'Language';

  @override
  String get comingSoon => 'Coming soon';

  @override
  String get theme => 'Theme';

  @override
  String get carryOutCalculation => 'Carry Out Calculation';

  @override
  String get plus5Weights => '+5% Weights';

  @override
  String get minus5Weights => '-5% Weights';

  @override
  String get save => 'Save';

  @override
  String get load => 'Load';

  @override
  String get delete => 'Delete';

  @override
  String get csv => 'CSV';

  @override
  String get stock => 'Stock';

  @override
  String get perSub => 'Per Sub';

  @override
  String get mix => 'Mix';

  @override
  String get ratios => 'Ratios';

  @override
  String get reset => 'Reset';

  @override
  String get copyTargets => 'Copy->Targets';

  @override
  String get copyDb => 'Copy->DB';

  @override
  String get volume => 'Volume';

  @override
  String get units => 'Units';

  @override
  String get mass => 'Mass:';

  @override
  String get conc => 'Conc:';

  @override
  String get calcMode => 'Calc Mode';

  @override
  String get inputDesiredConcentrations => 'Input Desired Concentrations';

  @override
  String get concentrationsFromWeights => 'Concentrations from Weights';

  @override
  String get solutionMode => 'Solution Mode';

  @override
  String get directAddition => 'Direct addition';

  @override
  String get concentratedAB => 'Concentrated A+B';

  @override
  String get ecModel => 'EC Model';

  @override
  String get lmcV2 => 'LMCv2';

  @override
  String get empirical => 'Empirical';

  @override
  String get loadWaterProfile => 'Load water profile';

  @override
  String get none => 'None';

  @override
  String get applyToCalculation => 'Apply to calculation';

  @override
  String get noSubstancesSelected => 'No substances selected';

  @override
  String nSelected(int count) {
    return '$count selected';
  }

  @override
  String get selectSubstances => 'Select Substances';

  @override
  String get freeElementDof => 'Free element (DOF)';

  @override
  String get volErr => 'Vol err (±L)';

  @override
  String get wtErr => 'Wt err (±g)';

  @override
  String get siSource => 'Si source';

  @override
  String get dofDescription =>
      'The Degree of Freedom (DOF) allows a nutrient to vary freely during the least-squares calculation. When an element is chosen as DOF, its final concentration is not constrained to the target value, being determined by the proportions of selected substances.\n\nIn most cases, Potassium (K) is the best choice, since K-based nutrients are abundant and inexpensive.';

  @override
  String get noneFullyRestricted => 'None (fully restricted system)';

  @override
  String get recommended => 'Recommended';

  @override
  String get versionNumber => '1.0.0+1';

  @override
  String get aboutDescription => 'Hydroponic nutrient solution calculator';

  @override
  String get credits => 'Credits';

  @override
  String get aboutHistory =>
      'HydroBuddy is a Dart/Flutter reimplementation of the original HydroBuddy, developed by Daniel Fernandez in Pascal/Lazarus.\n\nThe original HydroBuddy is an open-source tool for hydroponic nutrient solution calculation, widely used by researchers and growers around the world.';

  @override
  String get license => 'License';

  @override
  String get gplLicense =>
      'This project is distributed under the GPL v3 license.';

  @override
  String get instrumentPrecisionDescription =>
      'These values are used for error propagation in the uncertainty calculations of prepared solutions.';

  @override
  String get volumeError => 'Volume Error (mL)';

  @override
  String get volumetricGlasswareUncertainty =>
      'Volumetric glassware uncertainty';

  @override
  String get weightError => 'Balance Error (g)';

  @override
  String get analyticalBalanceUncertainty => 'Analytical balance uncertainty';

  @override
  String get nutritionalRatios => 'Nutritional Ratios';

  @override
  String get executeCalculationFirst => 'Run a calculation first';

  @override
  String get notAvailable => 'N/A';

  @override
  String get perSubstanceAnalysis => 'Per-Substance Analysis';

  @override
  String substanceIdNoContribution(int id) {
    return 'Substance ID $id — no contribution';
  }

  @override
  String weightCostFormat(String weight, String cost) {
    return 'Weight: $weight g | Cost: R\$ $cost';
  }

  @override
  String get element => 'Element';

  @override
  String get ppmContributed => 'ppm contributed';

  @override
  String get percentOfTarget => '% of target';

  @override
  String get stockAnalysis => 'Stock Analysis (A+B)';

  @override
  String get factors => 'Factors';

  @override
  String dilutionFactorLabel(String factor) {
    return 'Dilution factor: ${factor}x';
  }

  @override
  String stockVolumeLabel(String volume) {
    return 'Stock volume: $volume L';
  }

  @override
  String get substance => 'Substance';

  @override
  String get stockA => 'Stock A (g)';

  @override
  String get stockB => 'Stock B (g)';

  @override
  String get totalWeight => 'Total Weight (g)';

  @override
  String get mixComposition => 'Mix Composition';

  @override
  String get summary => 'Summary';

  @override
  String totalDryWeight(String weight) {
    return 'Total dry weight: $weight g';
  }

  @override
  String totalSolids(String total) {
    return 'Total solids (ppm): $total';
  }

  @override
  String get npkLabel => 'NPK Label';

  @override
  String get npkDetailed => 'NPK Detailed';

  @override
  String get otherElements => 'Other Elements';

  @override
  String get weightPercent => '% weight';

  @override
  String get compareFertilizers => 'Compare Fertilizers';

  @override
  String get fillAllFieldsValid => 'Fill all fields with valid values';

  @override
  String get checkNpkValues => 'Check the NPK values of both fertilizers';

  @override
  String get fertilizer1 => 'Fertilizer 1';

  @override
  String get fertilizer2 => 'Fertilizer 2';

  @override
  String get name => 'Name';

  @override
  String get massG => 'Mass (g)';

  @override
  String get volumeL => 'Volume (L)';

  @override
  String get compare => 'Compare';

  @override
  String get resultPpm => 'Result (ppm)';

  @override
  String get difference => 'Difference';

  @override
  String get commercialFertilizer => 'Commercial Fertilizer';

  @override
  String get invalidNpkFormat => 'Invalid NPK format. Use e.g. 10-10-10';

  @override
  String get invalidNpkValues => 'Invalid NPK values. Use numbers.';

  @override
  String get volumeMustBePositive => 'Volume must be greater than zero';

  @override
  String get calculate => 'Calculate';

  @override
  String get phAdjustment => 'pH Adjustment';

  @override
  String get currentPh => 'Current pH';

  @override
  String get targetPh => 'Target pH';

  @override
  String get acid => 'Acid';

  @override
  String get volumeAndTargetPhMustBePositive =>
      'Volume and target pH must be greater than zero';

  @override
  String get currentPhMustBeGreaterThanTarget =>
      'Current pH must be greater than target pH';

  @override
  String get loading => 'Loading...';

  @override
  String get editAnalysis => 'Edit Analysis';

  @override
  String get newAnalysis => 'New Analysis';

  @override
  String get nameRequired => 'Name is required';

  @override
  String get compositionPercent => 'Composition (%)';

  @override
  String get noTissueAnalysis => 'No tissue analyses registered';

  @override
  String get deleteAnalysis => 'Delete Analysis';

  @override
  String confirmDeleteTissue(String name) {
    return 'Delete \"$name\"?';
  }

  @override
  String get cancel => 'Cancel';

  @override
  String get newProfile => 'New Profile';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get deleteProfile => 'Delete Profile';

  @override
  String confirmDeleteProfile(String name) {
    return 'Delete \"$name\"?';
  }

  @override
  String get searchProfile => 'Search profile...';

  @override
  String get noWaterProfile => 'No water profiles registered';

  @override
  String get defaultLabel => 'Default';

  @override
  String get noAdditionalParameters => 'No additional parameters';

  @override
  String get compositionPpm => 'Composition (ppm)';

  @override
  String get preparedTanks => 'Prepared Tanks';

  @override
  String get noTanksPrepared => 'No tanks prepared';

  @override
  String get tapPlusToCreate => 'Tap + to create a new one';

  @override
  String get deleteTank => 'Delete Tank';

  @override
  String confirmDeleteTank(String name) {
    return 'Delete \"$name\"?';
  }

  @override
  String remainingVolume(String date, String remaining) {
    return '$date | Remaining: ${remaining}L';
  }

  @override
  String get active => 'active';

  @override
  String get consumed => 'consumed';

  @override
  String get registerIrrigation => 'Register Irrigation';

  @override
  String get finalize => 'Finalize';

  @override
  String get register => 'Register';

  @override
  String get finalizeTank => 'Finalize Tank';

  @override
  String get confirmFinalizeTank => 'Mark the tank as consumed?';

  @override
  String get noIrrigationRegistered => 'No irrigations registered';

  @override
  String get editSubstance => 'Edit Substance';

  @override
  String get newSubstance => 'New Substance';

  @override
  String get formula => 'Formula';

  @override
  String get source => 'Source';

  @override
  String get purity => 'Purity (0.0 to 1.0)';

  @override
  String get invalidNumber => 'Invalid number';

  @override
  String get valueBetween => 'Value between 0.0 and 1.0';

  @override
  String get costPerKg => 'Cost (R\$/kg)';

  @override
  String get liquid => 'Liquid';

  @override
  String get density => 'Density (g/mL)';

  @override
  String get onlyForLiquids => 'Only for liquids';

  @override
  String get concentrationType => 'Concentration Type';

  @override
  String get elementalComposition => 'Elemental Composition (%)';

  @override
  String get searchSubstance => 'Search substance...';

  @override
  String get addSubstance => 'Add substance';

  @override
  String get prepareTank => 'Prepare Tank';

  @override
  String get tankNameHint => 'e.g. Tomato Week 3';

  @override
  String get selectEllipsis => 'Select...';

  @override
  String get selectFormulation => 'Select a formulation';

  @override
  String get volumeRequired => 'Enter the volume';

  @override
  String get invalidVolume => 'Invalid volume';

  @override
  String get measurementsOptional => 'Measurements (optional)';

  @override
  String get actualEc => 'Actual EC';

  @override
  String get actualPh => 'Actual pH';

  @override
  String get note => 'Note';

  @override
  String get observations => 'Observations...';

  @override
  String get registerPreparation => 'Register Preparation';

  @override
  String get recipeSummary => 'Recipe Summary';

  @override
  String get placeholderRecipe => 'KNO3: --g    MgSO4: --g    Ca(NO3)2: --g';

  @override
  String get placeholderMicros => 'KH2PO4: --g    Micros: --g';

  @override
  String get placeholderEcCost => 'Predicted EC: -- mS/cm    Cost: --/L';

  @override
  String get noFormulations => 'No formulations registered';

  @override
  String get newFormulation => 'New Formulation';

  @override
  String get unit => 'Unit';

  @override
  String get create => 'Create';

  @override
  String get deleteFormulation => 'Delete Formulation';

  @override
  String confirmDeleteFormulation(String name) {
    return 'Delete \"$name\"?';
  }

  @override
  String get targetNutrients => 'Target Nutrients';

  @override
  String get target => 'Target';

  @override
  String get result => 'Result';

  @override
  String get gePercent => 'GE%';

  @override
  String get iePercent => 'IE%';

  @override
  String get fillTargetAndSelectSubstances =>
      'Fill in target nutrients and select substances';

  @override
  String get elementsStringGrid1 => 'Elements — StringGrid1';

  @override
  String get substancesStringGrid2 => 'Substances — StringGrid2';

  @override
  String get ecCost => 'EC / Cost';

  @override
  String get warnings => 'Warnings';

  @override
  String get amountG => 'Amount (g)';

  @override
  String get cost => 'Cost';

  @override
  String get ec => 'EC';

  @override
  String get totalCost => 'Total Cost';

  @override
  String get substanceSelection => 'Substance Selection';

  @override
  String errorLoadingSubstances(String error) {
    return 'Error loading substances: $error';
  }

  @override
  String get apply => 'Apply';

  @override
  String get available => 'Available';

  @override
  String get used => 'Used';

  @override
  String get empty => 'Empty';

  @override
  String get addArrow => 'Add >>';

  @override
  String get removeArrow => '<< Remove';

  @override
  String get setAmount => 'Set Amount';

  @override
  String get resetAmounts => 'Reset Amounts';

  @override
  String get addNew => 'Add New';

  @override
  String get edit => 'Edit';

  @override
  String get deleteFromDb => 'Delete f/DB';

  @override
  String get saveList => 'Save List';

  @override
  String get loadList => 'Load List';

  @override
  String get removeAll => 'Remove All';

  @override
  String get weightG => 'Weight (g)';

  @override
  String get ok => 'OK';

  @override
  String get confirmExclusion => 'Confirm Exclusion';

  @override
  String confirmRemoveSubstance(String name) {
    return 'Remove \"$name\"?';
  }

  @override
  String get noSubstancesRegistered => 'No substances registered';

  @override
  String get formulationNotFound => 'Formulation not found';

  @override
  String get thisFormulationDoesNotExist => 'This formulation does not exist.';

  @override
  String historyFormulation(String name) {
    return 'History: $name';
  }

  @override
  String get noSnapshots => 'No snapshots recorded';

  @override
  String get newSnapshot => 'New Snapshot';

  @override
  String get optional => 'Optional';

  @override
  String get valuesRestored => 'Values restored in the formulation editor';

  @override
  String errorRestoring(String error) {
    return 'Error restoring: $error';
  }

  @override
  String get restore => 'Restore';

  @override
  String get manual => 'manual';

  @override
  String get autoSave => 'auto save';

  @override
  String get beforeEdit => 'before edit';
}
