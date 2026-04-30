import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt'),
  ];

  /// Application title
  ///
  /// In en, this message translates to:
  /// **'HydroBuddy'**
  String get appTitle;

  /// Calculator screen title
  ///
  /// In en, this message translates to:
  /// **'Calculator'**
  String get calculator;

  /// Substances screen title
  ///
  /// In en, this message translates to:
  /// **'Substances'**
  String get substances;

  /// Formulation history screen title
  ///
  /// In en, this message translates to:
  /// **'Formulations'**
  String get formulations;

  /// Tank preparation screen title
  ///
  /// In en, this message translates to:
  /// **'Tank'**
  String get tank;

  /// Settings screen title
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// About screen title
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// Instrument precision screen title
  ///
  /// In en, this message translates to:
  /// **'Instrument Precision'**
  String get instrumentPrecision;

  /// Degree of freedom screen title
  ///
  /// In en, this message translates to:
  /// **'Degree of Freedom'**
  String get degreeOfFreedom;

  /// Water quality screen title
  ///
  /// In en, this message translates to:
  /// **'Water Quality'**
  String get waterQuality;

  /// Tissue analysis screen title
  ///
  /// In en, this message translates to:
  /// **'Tissue Analysis'**
  String get tissueAnalysis;

  /// Settings tile: About HydroBuddy
  ///
  /// In en, this message translates to:
  /// **'About HydroBuddy'**
  String get aboutHydroBuddy;

  /// Settings tile: Language
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Snackbar message for unavailable features
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoon;

  /// Settings tile: Theme
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// Button to run calculation
  ///
  /// In en, this message translates to:
  /// **'Carry Out Calculation'**
  String get carryOutCalculation;

  /// Tooltip: increase weights by 5%
  ///
  /// In en, this message translates to:
  /// **'+5% Weights'**
  String get plus5Weights;

  /// Tooltip: decrease weights by 5%
  ///
  /// In en, this message translates to:
  /// **'-5% Weights'**
  String get minus5Weights;

  /// General save action
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// General load action
  ///
  /// In en, this message translates to:
  /// **'Load'**
  String get load;

  /// General delete action
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// CSV export button
  ///
  /// In en, this message translates to:
  /// **'CSV'**
  String get csv;

  /// Stock analysis button
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get stock;

  /// Per substance analysis button
  ///
  /// In en, this message translates to:
  /// **'Per Sub'**
  String get perSub;

  /// Mix analysis button
  ///
  /// In en, this message translates to:
  /// **'Mix'**
  String get mix;

  /// Nutritional ratios button
  ///
  /// In en, this message translates to:
  /// **'Ratios'**
  String get ratios;

  /// Reset targets
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// Copy results to targets
  ///
  /// In en, this message translates to:
  /// **'Copy->Targets'**
  String get copyTargets;

  /// Copy results to database
  ///
  /// In en, this message translates to:
  /// **'Copy->DB'**
  String get copyDb;

  /// Volume section label
  ///
  /// In en, this message translates to:
  /// **'Volume'**
  String get volume;

  /// Units section label
  ///
  /// In en, this message translates to:
  /// **'Units'**
  String get units;

  /// Mass label
  ///
  /// In en, this message translates to:
  /// **'Mass:'**
  String get mass;

  /// Concentration label
  ///
  /// In en, this message translates to:
  /// **'Conc:'**
  String get conc;

  /// Calculation mode section label
  ///
  /// In en, this message translates to:
  /// **'Calc Mode'**
  String get calcMode;

  /// Radio option for calculation mode
  ///
  /// In en, this message translates to:
  /// **'Input Desired Concentrations'**
  String get inputDesiredConcentrations;

  /// Radio option for calculation mode
  ///
  /// In en, this message translates to:
  /// **'Concentrations from Weights'**
  String get concentrationsFromWeights;

  /// Solution mode section label
  ///
  /// In en, this message translates to:
  /// **'Solution Mode'**
  String get solutionMode;

  /// Radio option for solution mode
  ///
  /// In en, this message translates to:
  /// **'Direct addition'**
  String get directAddition;

  /// Radio option for concentrated solution mode
  ///
  /// In en, this message translates to:
  /// **'Concentrated A+B'**
  String get concentratedAB;

  /// EC model section label
  ///
  /// In en, this message translates to:
  /// **'EC Model'**
  String get ecModel;

  /// EC model option
  ///
  /// In en, this message translates to:
  /// **'LMCv2'**
  String get lmcV2;

  /// EC model option
  ///
  /// In en, this message translates to:
  /// **'Empirical'**
  String get empirical;

  /// Dropdown label for water quality
  ///
  /// In en, this message translates to:
  /// **'Load water profile'**
  String get loadWaterProfile;

  /// No selection option
  ///
  /// In en, this message translates to:
  /// **'None'**
  String get none;

  /// Checkbox label
  ///
  /// In en, this message translates to:
  /// **'Apply to calculation'**
  String get applyToCalculation;

  /// Empty state message
  ///
  /// In en, this message translates to:
  /// **'No substances selected'**
  String get noSubstancesSelected;

  /// Count of selected substances
  ///
  /// In en, this message translates to:
  /// **'{count} selected'**
  String nSelected(int count);

  /// Button to open substance selection
  ///
  /// In en, this message translates to:
  /// **'Select Substances'**
  String get selectSubstances;

  /// Section label for degree of freedom element
  ///
  /// In en, this message translates to:
  /// **'Free element (DOF)'**
  String get freeElementDof;

  /// Volume error input label
  ///
  /// In en, this message translates to:
  /// **'Vol err (±L)'**
  String get volErr;

  /// Weight error input label
  ///
  /// In en, this message translates to:
  /// **'Wt err (±g)'**
  String get wtErr;

  /// Silicon source section label
  ///
  /// In en, this message translates to:
  /// **'Si source'**
  String get siSource;

  /// Explanation text on degree of freedom screen
  ///
  /// In en, this message translates to:
  /// **'The Degree of Freedom (DOF) allows a nutrient to vary freely during the least-squares calculation. When an element is chosen as DOF, its final concentration is not constrained to the target value, being determined by the proportions of selected substances.\n\nIn most cases, Potassium (K) is the best choice, since K-based nutrients are abundant and inexpensive.'**
  String get dofDescription;

  /// Radio option for no DOF
  ///
  /// In en, this message translates to:
  /// **'None (fully restricted system)'**
  String get noneFullyRestricted;

  /// Badge indicating recommended choice
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get recommended;

  /// App version number
  ///
  /// In en, this message translates to:
  /// **'1.0.0+1'**
  String get versionNumber;

  /// App description on about screen
  ///
  /// In en, this message translates to:
  /// **'Hydroponic nutrient solution calculator'**
  String get aboutDescription;

  /// Credits section title
  ///
  /// In en, this message translates to:
  /// **'Credits'**
  String get credits;

  /// Historical context about the app
  ///
  /// In en, this message translates to:
  /// **'HydroBuddy is a Dart/Flutter reimplementation of the original HydroBuddy, developed by Daniel Fernandez in Pascal/Lazarus.\n\nThe original HydroBuddy is an open-source tool for hydroponic nutrient solution calculation, widely used by researchers and growers around the world.'**
  String get aboutHistory;

  /// License section title
  ///
  /// In en, this message translates to:
  /// **'License'**
  String get license;

  /// License information
  ///
  /// In en, this message translates to:
  /// **'This project is distributed under the GPL v3 license.'**
  String get gplLicense;

  /// Description on instrument precision screen
  ///
  /// In en, this message translates to:
  /// **'These values are used for error propagation in the uncertainty calculations of prepared solutions.'**
  String get instrumentPrecisionDescription;

  /// Volume error input label
  ///
  /// In en, this message translates to:
  /// **'Volume Error (mL)'**
  String get volumeError;

  /// Helper text for volume error
  ///
  /// In en, this message translates to:
  /// **'Volumetric glassware uncertainty'**
  String get volumetricGlasswareUncertainty;

  /// Weight error input label
  ///
  /// In en, this message translates to:
  /// **'Balance Error (g)'**
  String get weightError;

  /// Helper text for weight error
  ///
  /// In en, this message translates to:
  /// **'Analytical balance uncertainty'**
  String get analyticalBalanceUncertainty;

  /// Ratio screen title
  ///
  /// In en, this message translates to:
  /// **'Nutritional Ratios'**
  String get nutritionalRatios;

  /// Message when no calculation has been run
  ///
  /// In en, this message translates to:
  /// **'Run a calculation first'**
  String get executeCalculationFirst;

  /// Not available abbreviation
  ///
  /// In en, this message translates to:
  /// **'N/A'**
  String get notAvailable;

  /// Per-substance analysis screen title
  ///
  /// In en, this message translates to:
  /// **'Per-Substance Analysis'**
  String get perSubstanceAnalysis;

  /// Message when substance has no contribution
  ///
  /// In en, this message translates to:
  /// **'Substance ID {id} — no contribution'**
  String substanceIdNoContribution(int id);

  /// Weight and cost display format
  ///
  /// In en, this message translates to:
  /// **'Weight: {weight} g | Cost: R\$ {cost}'**
  String weightCostFormat(String weight, String cost);

  /// Column header: element
  ///
  /// In en, this message translates to:
  /// **'Element'**
  String get element;

  /// Column header: contributed ppm
  ///
  /// In en, this message translates to:
  /// **'ppm contributed'**
  String get ppmContributed;

  /// Column header: percent of target
  ///
  /// In en, this message translates to:
  /// **'% of target'**
  String get percentOfTarget;

  /// Stock analysis screen title
  ///
  /// In en, this message translates to:
  /// **'Stock Analysis (A+B)'**
  String get stockAnalysis;

  /// Factors card title
  ///
  /// In en, this message translates to:
  /// **'Factors'**
  String get factors;

  /// Dilution factor display
  ///
  /// In en, this message translates to:
  /// **'Dilution factor: {factor}x'**
  String dilutionFactorLabel(String factor);

  /// Stock volume display
  ///
  /// In en, this message translates to:
  /// **'Stock volume: {volume} L'**
  String stockVolumeLabel(String volume);

  /// Column header: substance
  ///
  /// In en, this message translates to:
  /// **'Substance'**
  String get substance;

  /// Column header: stock A weight
  ///
  /// In en, this message translates to:
  /// **'Stock A (g)'**
  String get stockA;

  /// Column header: stock B weight
  ///
  /// In en, this message translates to:
  /// **'Stock B (g)'**
  String get stockB;

  /// Column header: total weight
  ///
  /// In en, this message translates to:
  /// **'Total Weight (g)'**
  String get totalWeight;

  /// Mix analysis screen title
  ///
  /// In en, this message translates to:
  /// **'Mix Composition'**
  String get mixComposition;

  /// Summary card title
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// Total dry weight display
  ///
  /// In en, this message translates to:
  /// **'Total dry weight: {weight} g'**
  String totalDryWeight(String weight);

  /// Total solids display
  ///
  /// In en, this message translates to:
  /// **'Total solids (ppm): {total}'**
  String totalSolids(String total);

  /// NPK label card title
  ///
  /// In en, this message translates to:
  /// **'NPK Label'**
  String get npkLabel;

  /// NPK detailed card title
  ///
  /// In en, this message translates to:
  /// **'NPK Detailed'**
  String get npkDetailed;

  /// Other elements card title
  ///
  /// In en, this message translates to:
  /// **'Other Elements'**
  String get otherElements;

  /// Column header: weight percent
  ///
  /// In en, this message translates to:
  /// **'% weight'**
  String get weightPercent;

  /// Comparison screen title
  ///
  /// In en, this message translates to:
  /// **'Compare Fertilizers'**
  String get compareFertilizers;

  /// Validation error message
  ///
  /// In en, this message translates to:
  /// **'Fill all fields with valid values'**
  String get fillAllFieldsValid;

  /// Validation error for NPK
  ///
  /// In en, this message translates to:
  /// **'Check the NPK values of both fertilizers'**
  String get checkNpkValues;

  /// Fertilizer 1 label
  ///
  /// In en, this message translates to:
  /// **'Fertilizer 1'**
  String get fertilizer1;

  /// Fertilizer 2 label
  ///
  /// In en, this message translates to:
  /// **'Fertilizer 2'**
  String get fertilizer2;

  /// Name field label
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Mass input label
  ///
  /// In en, this message translates to:
  /// **'Mass (g)'**
  String get massG;

  /// Volume input label
  ///
  /// In en, this message translates to:
  /// **'Volume (L)'**
  String get volumeL;

  /// Compare button
  ///
  /// In en, this message translates to:
  /// **'Compare'**
  String get compare;

  /// Result section title
  ///
  /// In en, this message translates to:
  /// **'Result (ppm)'**
  String get resultPpm;

  /// Difference column header
  ///
  /// In en, this message translates to:
  /// **'Difference'**
  String get difference;

  /// Commercial fertilizer screen title
  ///
  /// In en, this message translates to:
  /// **'Commercial Fertilizer'**
  String get commercialFertilizer;

  /// NPK format error
  ///
  /// In en, this message translates to:
  /// **'Invalid NPK format. Use e.g. 10-10-10'**
  String get invalidNpkFormat;

  /// NPK values error
  ///
  /// In en, this message translates to:
  /// **'Invalid NPK values. Use numbers.'**
  String get invalidNpkValues;

  /// Volume validation error
  ///
  /// In en, this message translates to:
  /// **'Volume must be greater than zero'**
  String get volumeMustBePositive;

  /// Calculate button
  ///
  /// In en, this message translates to:
  /// **'Calculate'**
  String get calculate;

  /// pH adjustment screen title
  ///
  /// In en, this message translates to:
  /// **'pH Adjustment'**
  String get phAdjustment;

  /// Current pH input label
  ///
  /// In en, this message translates to:
  /// **'Current pH'**
  String get currentPh;

  /// Target pH input label
  ///
  /// In en, this message translates to:
  /// **'Target pH'**
  String get targetPh;

  /// Acid selection label
  ///
  /// In en, this message translates to:
  /// **'Acid'**
  String get acid;

  /// Validation error
  ///
  /// In en, this message translates to:
  /// **'Volume and target pH must be greater than zero'**
  String get volumeAndTargetPhMustBePositive;

  /// Validation error
  ///
  /// In en, this message translates to:
  /// **'Current pH must be greater than target pH'**
  String get currentPhMustBeGreaterThanTarget;

  /// Generic loading message
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// Edit tissue analysis title
  ///
  /// In en, this message translates to:
  /// **'Edit Analysis'**
  String get editAnalysis;

  /// New tissue analysis title
  ///
  /// In en, this message translates to:
  /// **'New Analysis'**
  String get newAnalysis;

  /// Validation: name required
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get nameRequired;

  /// Section label
  ///
  /// In en, this message translates to:
  /// **'Composition (%)'**
  String get compositionPercent;

  /// Empty state message
  ///
  /// In en, this message translates to:
  /// **'No tissue analyses registered'**
  String get noTissueAnalysis;

  /// Delete confirmation dialog title
  ///
  /// In en, this message translates to:
  /// **'Delete Analysis'**
  String get deleteAnalysis;

  /// Delete confirmation message
  ///
  /// In en, this message translates to:
  /// **'Delete \"{name}\"?'**
  String confirmDeleteTissue(String name);

  /// Cancel button
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// New water quality profile title
  ///
  /// In en, this message translates to:
  /// **'New Profile'**
  String get newProfile;

  /// Edit water quality profile title
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// Delete profile dialog title
  ///
  /// In en, this message translates to:
  /// **'Delete Profile'**
  String get deleteProfile;

  /// Delete confirmation
  ///
  /// In en, this message translates to:
  /// **'Delete \"{name}\"?'**
  String confirmDeleteProfile(String name);

  /// Search hint for profiles
  ///
  /// In en, this message translates to:
  /// **'Search profile...'**
  String get searchProfile;

  /// Empty state message
  ///
  /// In en, this message translates to:
  /// **'No water profiles registered'**
  String get noWaterProfile;

  /// Default label on chip
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get defaultLabel;

  /// Empty subtitle
  ///
  /// In en, this message translates to:
  /// **'No additional parameters'**
  String get noAdditionalParameters;

  /// Section label
  ///
  /// In en, this message translates to:
  /// **'Composition (ppm)'**
  String get compositionPpm;

  /// Tank history screen title
  ///
  /// In en, this message translates to:
  /// **'Prepared Tanks'**
  String get preparedTanks;

  /// Empty state message
  ///
  /// In en, this message translates to:
  /// **'No tanks prepared'**
  String get noTanksPrepared;

  /// Hint to create tank
  ///
  /// In en, this message translates to:
  /// **'Tap + to create a new one'**
  String get tapPlusToCreate;

  /// Delete tank dialog title
  ///
  /// In en, this message translates to:
  /// **'Delete Tank'**
  String get deleteTank;

  /// Delete tank confirmation
  ///
  /// In en, this message translates to:
  /// **'Delete \"{name}\"?'**
  String confirmDeleteTank(String name);

  /// Remaining volume subtitle
  ///
  /// In en, this message translates to:
  /// **'{date} | Remaining: {remaining}L'**
  String remainingVolume(String date, String remaining);

  /// Tank active status
  ///
  /// In en, this message translates to:
  /// **'active'**
  String get active;

  /// Tank consumed status
  ///
  /// In en, this message translates to:
  /// **'consumed'**
  String get consumed;

  /// Register irrigation button/dialog title
  ///
  /// In en, this message translates to:
  /// **'Register Irrigation'**
  String get registerIrrigation;

  /// Finalize tank button
  ///
  /// In en, this message translates to:
  /// **'Finalize'**
  String get finalize;

  /// Confirm register button
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// Finalize tank dialog title
  ///
  /// In en, this message translates to:
  /// **'Finalize Tank'**
  String get finalizeTank;

  /// Confirm finalize tank
  ///
  /// In en, this message translates to:
  /// **'Mark the tank as consumed?'**
  String get confirmFinalizeTank;

  /// Empty irrigation list
  ///
  /// In en, this message translates to:
  /// **'No irrigations registered'**
  String get noIrrigationRegistered;

  /// Edit substance screen title
  ///
  /// In en, this message translates to:
  /// **'Edit Substance'**
  String get editSubstance;

  /// New substance screen title
  ///
  /// In en, this message translates to:
  /// **'New Substance'**
  String get newSubstance;

  /// Formula field label
  ///
  /// In en, this message translates to:
  /// **'Formula'**
  String get formula;

  /// Source field label
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get source;

  /// Purity field label
  ///
  /// In en, this message translates to:
  /// **'Purity (0.0 to 1.0)'**
  String get purity;

  /// Validation error
  ///
  /// In en, this message translates to:
  /// **'Invalid number'**
  String get invalidNumber;

  /// Validation error
  ///
  /// In en, this message translates to:
  /// **'Value between 0.0 and 1.0'**
  String get valueBetween;

  /// Cost field label
  ///
  /// In en, this message translates to:
  /// **'Cost (R\$/kg)'**
  String get costPerKg;

  /// Liquid toggle label
  ///
  /// In en, this message translates to:
  /// **'Liquid'**
  String get liquid;

  /// Density field label
  ///
  /// In en, this message translates to:
  /// **'Density (g/mL)'**
  String get density;

  /// Density hint when not liquid
  ///
  /// In en, this message translates to:
  /// **'Only for liquids'**
  String get onlyForLiquids;

  /// Dropdown label
  ///
  /// In en, this message translates to:
  /// **'Concentration Type'**
  String get concentrationType;

  /// Section label
  ///
  /// In en, this message translates to:
  /// **'Elemental Composition (%)'**
  String get elementalComposition;

  /// Search hint
  ///
  /// In en, this message translates to:
  /// **'Search substance...'**
  String get searchSubstance;

  /// FAB label
  ///
  /// In en, this message translates to:
  /// **'Add substance'**
  String get addSubstance;

  /// Prepare tank screen title
  ///
  /// In en, this message translates to:
  /// **'Prepare Tank'**
  String get prepareTank;

  /// Hint for tank name
  ///
  /// In en, this message translates to:
  /// **'e.g. Tomato Week 3'**
  String get tankNameHint;

  /// Dropdown placeholder
  ///
  /// In en, this message translates to:
  /// **'Select...'**
  String get selectEllipsis;

  /// Validation error
  ///
  /// In en, this message translates to:
  /// **'Select a formulation'**
  String get selectFormulation;

  /// Volume validation error
  ///
  /// In en, this message translates to:
  /// **'Enter the volume'**
  String get volumeRequired;

  /// Volume validation error
  ///
  /// In en, this message translates to:
  /// **'Invalid volume'**
  String get invalidVolume;

  /// Section label
  ///
  /// In en, this message translates to:
  /// **'Measurements (optional)'**
  String get measurementsOptional;

  /// EC field label
  ///
  /// In en, this message translates to:
  /// **'Actual EC'**
  String get actualEc;

  /// pH field label
  ///
  /// In en, this message translates to:
  /// **'Actual pH'**
  String get actualPh;

  /// Note field label
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// Note field hint
  ///
  /// In en, this message translates to:
  /// **'Observations...'**
  String get observations;

  /// Submit button
  ///
  /// In en, this message translates to:
  /// **'Register Preparation'**
  String get registerPreparation;

  /// Card title
  ///
  /// In en, this message translates to:
  /// **'Recipe Summary'**
  String get recipeSummary;

  /// Placeholder recipe text
  ///
  /// In en, this message translates to:
  /// **'KNO3: --g    MgSO4: --g    Ca(NO3)2: --g'**
  String get placeholderRecipe;

  /// Placeholder micros text
  ///
  /// In en, this message translates to:
  /// **'KH2PO4: --g    Micros: --g'**
  String get placeholderMicros;

  /// Placeholder EC and cost
  ///
  /// In en, this message translates to:
  /// **'Predicted EC: -- mS/cm    Cost: --/L'**
  String get placeholderEcCost;

  /// Empty state message
  ///
  /// In en, this message translates to:
  /// **'No formulations registered'**
  String get noFormulations;

  /// New formulation dialog title
  ///
  /// In en, this message translates to:
  /// **'New Formulation'**
  String get newFormulation;

  /// Unit field label
  ///
  /// In en, this message translates to:
  /// **'Unit'**
  String get unit;

  /// Create button
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// Delete formulation dialog title
  ///
  /// In en, this message translates to:
  /// **'Delete Formulation'**
  String get deleteFormulation;

  /// Delete confirmation
  ///
  /// In en, this message translates to:
  /// **'Delete \"{name}\"?'**
  String confirmDeleteFormulation(String name);

  /// Section label for target nutrients table
  ///
  /// In en, this message translates to:
  /// **'Target Nutrients'**
  String get targetNutrients;

  /// Column header: target value
  ///
  /// In en, this message translates to:
  /// **'Target'**
  String get target;

  /// Column header: result value
  ///
  /// In en, this message translates to:
  /// **'Result'**
  String get result;

  /// Column header: gross error percent
  ///
  /// In en, this message translates to:
  /// **'GE%'**
  String get gePercent;

  /// Column header: instrumental error percent
  ///
  /// In en, this message translates to:
  /// **'IE%'**
  String get iePercent;

  /// Empty state message on results
  ///
  /// In en, this message translates to:
  /// **'Fill in target nutrients and select substances'**
  String get fillTargetAndSelectSubstances;

  /// Results section label
  ///
  /// In en, this message translates to:
  /// **'Elements — StringGrid1'**
  String get elementsStringGrid1;

  /// Results section label
  ///
  /// In en, this message translates to:
  /// **'Substances — StringGrid2'**
  String get substancesStringGrid2;

  /// Results section label
  ///
  /// In en, this message translates to:
  /// **'EC / Cost'**
  String get ecCost;

  /// Warnings section label
  ///
  /// In en, this message translates to:
  /// **'Warnings'**
  String get warnings;

  /// Column header: amount in grams
  ///
  /// In en, this message translates to:
  /// **'Amount (g)'**
  String get amountG;

  /// Column header: cost
  ///
  /// In en, this message translates to:
  /// **'Cost'**
  String get cost;

  /// EC label
  ///
  /// In en, this message translates to:
  /// **'EC'**
  String get ec;

  /// Total cost label
  ///
  /// In en, this message translates to:
  /// **'Total Cost'**
  String get totalCost;

  /// Sheet title
  ///
  /// In en, this message translates to:
  /// **'Substance Selection'**
  String get substanceSelection;

  /// Error message
  ///
  /// In en, this message translates to:
  /// **'Error loading substances: {error}'**
  String errorLoadingSubstances(String error);

  /// Apply button
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// Available substances panel title
  ///
  /// In en, this message translates to:
  /// **'Available'**
  String get available;

  /// Used substances panel title
  ///
  /// In en, this message translates to:
  /// **'Used'**
  String get used;

  /// List empty state
  ///
  /// In en, this message translates to:
  /// **'Empty'**
  String get empty;

  /// Add button
  ///
  /// In en, this message translates to:
  /// **'Add >>'**
  String get addArrow;

  /// Remove button
  ///
  /// In en, this message translates to:
  /// **'<< Remove'**
  String get removeArrow;

  /// Set amount button/dialog title
  ///
  /// In en, this message translates to:
  /// **'Set Amount'**
  String get setAmount;

  /// Reset amounts button
  ///
  /// In en, this message translates to:
  /// **'Reset Amounts'**
  String get resetAmounts;

  /// Add new button
  ///
  /// In en, this message translates to:
  /// **'Add New'**
  String get addNew;

  /// Edit button
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// Delete from database button
  ///
  /// In en, this message translates to:
  /// **'Delete f/DB'**
  String get deleteFromDb;

  /// Save list button
  ///
  /// In en, this message translates to:
  /// **'Save List'**
  String get saveList;

  /// Load list button
  ///
  /// In en, this message translates to:
  /// **'Load List'**
  String get loadList;

  /// Remove all button
  ///
  /// In en, this message translates to:
  /// **'Remove All'**
  String get removeAll;

  /// Weight input label
  ///
  /// In en, this message translates to:
  /// **'Weight (g)'**
  String get weightG;

  /// OK button
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// Delete confirmation dialog title
  ///
  /// In en, this message translates to:
  /// **'Confirm Exclusion'**
  String get confirmExclusion;

  /// Delete confirmation
  ///
  /// In en, this message translates to:
  /// **'Remove \"{name}\"?'**
  String confirmRemoveSubstance(String name);

  /// Empty state
  ///
  /// In en, this message translates to:
  /// **'No substances registered'**
  String get noSubstancesRegistered;

  /// Error: formulation not found
  ///
  /// In en, this message translates to:
  /// **'Formulation not found'**
  String get formulationNotFound;

  /// Error message
  ///
  /// In en, this message translates to:
  /// **'This formulation does not exist.'**
  String get thisFormulationDoesNotExist;

  /// History screen title
  ///
  /// In en, this message translates to:
  /// **'History: {name}'**
  String historyFormulation(String name);

  /// Empty state
  ///
  /// In en, this message translates to:
  /// **'No snapshots recorded'**
  String get noSnapshots;

  /// New snapshot dialog title
  ///
  /// In en, this message translates to:
  /// **'New Snapshot'**
  String get newSnapshot;

  /// Optional field hint
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// Snackbar message
  ///
  /// In en, this message translates to:
  /// **'Values restored in the formulation editor'**
  String get valuesRestored;

  /// Error message
  ///
  /// In en, this message translates to:
  /// **'Error restoring: {error}'**
  String errorRestoring(String error);

  /// Restore button
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get restore;

  /// Manual snapshot trigger type
  ///
  /// In en, this message translates to:
  /// **'manual'**
  String get manual;

  /// Auto-save trigger type
  ///
  /// In en, this message translates to:
  /// **'auto save'**
  String get autoSave;

  /// Before edit trigger type
  ///
  /// In en, this message translates to:
  /// **'before edit'**
  String get beforeEdit;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
