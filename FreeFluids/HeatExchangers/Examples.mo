within FreeFluids.HeatExchangers;

package Examples
  extends Modelica.Icons.ExamplesPackage;

  package MineralOil
    extends Modelica.Media.Interfaces.PartialSimpleMedium(mediumName = "Mineral Oil", cp_const = 1902, cv_const = 1902, d_const = 885.27, eta_const = 0.075, lambda_const = 0.1442, a_const = 1000, T_min = 273.15, T_max = 573.15, T0 = 273.15, MM_const = 3);
  end MineralOil;

  package Hydrocarbon
    extends Modelica.Media.Interfaces.PartialSimpleMedium(mediumName = "Hydrocarbon", cp_const = 2302.74, cv_const = 2302.74, d_const = 799.96, eta_const = 0.0005, lambda_const = 0.1419, a_const = 1000, T_min = 273.15, T_max = 573.15, T0 = 373.15, MM_const = 3);
  end Hydrocarbon;

  package Kerosene
    extends Modelica.Media.Interfaces.PartialSimpleMedium(mediumName = "Kerosene", cp_const = 2470.212, cv_const = 2470.212, d_const = 785, eta_const = 0.00040097751, lambda_const = 0.13672804, a_const = 1000, T_min = 273.15, T_max = 573.15, T0 = 373.15, MM_const = 3);
  end Kerosene;

  package CrudeOil
    extends Modelica.Media.Interfaces.PartialSimpleMedium(mediumName = "Crude Oil", cp_const = 2051.532, cv_const = 2051.532, d_const = 850, eta_const = 0.0035963962, lambda_const = 0.13326657, a_const = 1000, T_min = 273.15, T_max = 573.15, T0 = 373.15, MM_const = 3);
  end CrudeOil;

  model HEXsimpleWater
    extends Modelica.Icons.Example;
    FreeFluids.HeatExchangers.HEXsimple HEX(redeclare package Medium = FreeFluids.LMedia.Fluids.Water, dP(displayUnit = "bar") = -12750, extCp = 1000, extTin = 383.15, extTout = 353.15, refG = 19.44444444444444, s = 31.1646, u = 400, useFixedDiffP = false) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FreeFluids.Interfaces.FlowSourceSP Source(redeclare package Medium = FreeFluids.LMedia.Fluids.Water, P(displayUnit = "bar") = 600000, T = 298.15) annotation(
      Placement(visible = true, transformation(origin = {-52, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FreeFluids.Interfaces.FlowSink Sink(redeclare package Medium = FreeFluids.LMedia.Fluids.Water, G = 19.44444444444444) annotation(
      Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(Source.PortB, HEX.PortA) annotation(
      Line(points = {{-42, 0}, {-10, 0}, {-10, 0}, {-10, 0}}, color = {0, 127, 255}));
    connect(HEX.PortB, Sink.PortA) annotation(
      Line(points = {{10, 0}, {50, 0}, {50, 0}, {50, 0}}, color = {0, 127, 255}));
    annotation(
      Documentation(info = "<html><head></head><body><br></body></html>"),
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
  end HEXsimpleWater;

  model HEXgeneric1PhWater
    extends Modelica.Icons.Example;
    FreeFluids.HeatExchangers.HEXgeneric1Ph HEX(redeclare package Medium = FreeFluids.LMedia.Fluids.Water, di = 0.02058, exchangerType = FreeFluids.Types.ExchangerType.shellAndTubes, extCp = 4194, extG(displayUnit = "kg/h"), extTin = 383.15, extTout = 353.15, fixExternalFlow = false, numPasses = 2, numTubesTotal = 80, thickness = 0.00211, tubeLength = 5, u = 400) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FreeFluids.Interfaces.FlowSourceSP Source(redeclare package Medium = FreeFluids.LMedia.Fluids.Water, P(displayUnit = "Pa") = 600000, T = 298.15) annotation(
      Placement(visible = true, transformation(origin = {-52, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FreeFluids.Interfaces.FlowSink Sink(redeclare package Medium = FreeFluids.LMedia.Fluids.Water, G = 19.44444444444444) annotation(
      Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(Source.PortB, HEX.PortA) annotation(
      Line(points = {{-42, 0}, {-10, 0}, {-10, 0}, {-10, 0}}, color = {0, 127, 255}));
    connect(HEX.PortB, Sink.PortA) annotation(
      Line(points = {{10, 0}, {50, 0}, {50, 0}, {50, 0}}, color = {0, 127, 255}));
    annotation(
      Documentation(info = "<html><head></head><body><br></body></html>"),
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
  end HEXgeneric1PhWater;

  model HEXgeneric1PhThermalOil
    extends Modelica.Icons.Example;
    FreeFluids.HeatExchangers.HEXgeneric1Ph HEX(redeclare package Medium = FreeFluids.LMedia.Fluids.MarlothermSH, di = 0.02058, exchangerType = FreeFluids.Types.ExchangerType.crossflow, extCp = 1006.01, extG(displayUnit = "kg/h") = 22.3439, extSratio = 28.35, extTin = 305.15, extTout = 333.15, fixExternalFlow = true, numPasses = 3, numRows = 6, numTubesTotal = 132, numVelocityHeads = 4.5, thickness = 0.00241, tubeLength = 4, u = 16.155) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FreeFluids.Interfaces.FlowSourceSP Source(redeclare package Medium = FreeFluids.LMedia.Fluids.MarlothermSH, P(displayUnit = "Pa") = 499999.9999999999, T = 375.15) annotation(
      Placement(visible = true, transformation(origin = {-52, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FreeFluids.Interfaces.FlowSink Sink(redeclare package Medium = FreeFluids.LMedia.Fluids.MarlothermSH, G = 27.5278) annotation(
      Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(Source.PortB, HEX.PortA) annotation(
      Line(points = {{-42, 0}, {-10, 0}, {-10, 0}, {-10, 0}}, color = {0, 127, 255}));
    connect(HEX.PortB, Sink.PortA) annotation(
      Line(points = {{10, 0}, {50, 0}, {50, 0}, {50, 0}}, color = {0, 127, 255}));
    annotation(
      Documentation(info = "<html><head></head><body><br></body></html>"),
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
  end HEXgeneric1PhThermalOil;

  model HEXgeneric2PhSteamCondensing
    extends Modelica.Icons.Example;
    FreeFluids.HeatExchangers.HEXgeneric2Ph HEX(redeclare package Medium = Modelica.Media.Water.StandardWater, PLossFrictionG(displayUnit = ""), PLossFrictionL(displayUnit = ""), di = 0.02058, extCp = 1003, extG(displayUnit = "kg/s") = 22.3439, extSratio = 28, extTin = 305.15, extTout = 333.15, fixExternalFlow = true, isCircular = true, numPasses = 3, numRows = 6, numTubesTotal = 132, numVelocityHeads = 7, perimeter = 0.0735, section = 0.0002851, thickness = 0.00211, tubeLength = 4, u = 11.39, useDiameter = true, useSectionAndPerimeter = false) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FreeFluids.Interfaces.FlowSource Source(redeclare package Medium = Modelica.Media.Water.StandardWater, P = 200000, sourceOption = FreeFluids.Types.SourceOption.useSatGasP) annotation(
      Placement(visible = true, transformation(origin = {-52, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FreeFluids.Interfaces.FlowSink Sink(redeclare package Medium = Modelica.Media.Water.StandardWater, G = 0.5555555555555556) annotation(
      Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(Source.PortB, HEX.PortA) annotation(
      Line(points = {{-42, 0}, {-10, 0}, {-10, 0}, {-10, 0}}, color = {0, 127, 255}));
    connect(HEX.PortB, Sink.PortA) annotation(
      Line(points = {{10, 0}, {50, 0}, {50, 0}, {50, 0}}, color = {0, 127, 255}));
    annotation(
      Documentation(info = "<html><head></head><body><span style=\"font-family: 'Bitstream Vera Sans Mono'; font-size: 12px;\">If used with FreeFluids.TMedia, run with the old frontend. This is done by checking the box at \"Simulation Setup/Translation flags/Enable old frontend for code generation\"</span></body></html>"),
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 1),
      __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian");
  end HEXgeneric2PhSteamCondensing;

  model TestFactors
    parameter FreeFluids.Types.TemaShell shellType = FreeFluids.Types.TemaShell.E;
    parameter Real Tti = 230, Tto = 150, Tsi = 100, Tso = 160;
    parameter Integer numS = 2;
    parameter Integer numT = 6;
    Real P, R, NTU, F;
    Real Alpha, S, F2;
  equation
    P = (Tto - Tti)/(Tsi - Tti);
    R = (Tsi - Tso)/(Tto - Tti);
    P = (1 - exp((R - 1)*NTU*F))/(1 - R*exp((R - 1)*NTU*F));
//P = 0.615;
//R = 0.75;
    F = FreeFluids.HeatExchangers.Functions.ShellLMTDfactor(shellType, numS, numT, R, NTU);
    Alpha = ((1 - R*P)/(1 - P))^(1/numS);
    S = (Alpha - 1)/(Alpha - R);
    F2 = (R^2 + 1)^0.5*log((1 - S)/(1 - R*S))/((R - 1)*log((2 - S*(R + 1 - (R^2 + 1)^0.5))/(2 - S*(R + 1 + (R^2 + 1)^0.5))));
  end TestFactors;

  model DoublePipeTest
    extends Modelica.Icons.Example;
    FreeFluids.HeatExchangers.DoublePipeHEXfc HEX(redeclare package MediumO = MineralOil, redeclare package MediumI = FreeFluids.TMedia.Fluids.Water, finHeight = 0.0127, finK = 52, finNum = 30, finThickness = 0.0009000000000000002, iDi = 0.02093, iFoulingF = 0.088e-3, iKwall = 52, iLTube = 4.5, iNumSerial = 4, iNumUturns = 3, iRoughness = 1e-05, iThickness = 0.002870000000000001, oDi = 0.05250000000000001, oFoulingF = 0.176e-3, oThickness = 0.005000000000000001, useFins = true) annotation(
      Placement(visible = true, transformation(origin = {0, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    FreeFluids.Interfaces.FlowSourceSP SourceA(redeclare package Medium = MineralOil, P(displayUnit = "Pa") = 1e9, T = 338.15) annotation(
      Placement(visible = true, transformation(origin = {70, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    FreeFluids.Interfaces.FlowSink SinkA(G(displayUnit = "kg/s") = 3, externalG = true, fix = FreeFluids.Types.BoundaryOption.fixFlow) annotation(
      Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
    Interfaces.FlowSource SourceI(redeclare package Medium = FreeFluids.TMedia.Fluids.Water, P = 200000, T = 293.15) annotation(
      Placement(visible = true, transformation(origin = {-70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Interfaces.FlowSink SinkI(G(displayUnit = "kg/s") = 1.425, fix = FreeFluids.Types.BoundaryOption.fixFlow) annotation(
      Placement(visible = true, transformation(origin = {72, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    Modelica.Blocks.Sources.Ramp Gramp(duration = 1, height = -90, offset = 93) annotation(
      Placement(visible = true, transformation(origin = {-120, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//HEX.IW=58638;
    connect(SourceI.PortB, HEX.Iin) annotation(
      Line(points = {{-60, 0}, {-18, 0}}, color = {0, 127, 255}));
    connect(HEX.Iout, SinkI.PortA) annotation(
      Line(points = {{18, 0}, {62, 0}}, color = {0, 127, 255}));
    connect(Gramp.y, SinkA.Gext) annotation(
      Line(points = {{-108, 44}, {-64, 44}, {-64, 58}}, color = {0, 0, 127}));
    connect(SinkA.PortA, HEX.Oout) annotation(
      Line(points = {{-60, 70}, {0, 70}, {0, 18}}, color = {0, 127, 255}));
    connect(SourceA.PortB, HEX.Oin) annotation(
      Line(points = {{60, -48}, {0, -48}, {0, -18}}, color = {0, 127, 255}));
    annotation(
      Documentation(info = "<html><head></head><body>Modified example 7.2 from Heat Exchangers 3rd edition (S.Kalkaç et. alt.).<div>The difference in pressure drop for the annulus is due to the wall viscosity correction factor.</div></body></html>"),
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
  end DoublePipeTest;

  model GasCoolerTest
    extends Modelica.Icons.Example;
    FreeFluids.HeatExchangers.GasCooledHEXfc HEX(redeclare package MediumI = Hydrocarbon, redeclare package MediumO = Modelica.Media.Air.DryAirNasa, finDiameter = 0.05715, finDistance = 0.00254, finHeight = 0.054, finIsCircular = true, finK = 209, finThickness = 0.00033, finWidth = 0.054, iDi = 0.02058, iFoulingF = 0.000176, iKwall = 16.7, iLTube = 10.9728, iNumPipes = 56, iNumRows = 4, iNumSerial = 4, iRoughness = 2.000000000000001e-05, iStaggered = true, iThickness = 0.00241, iTubePitch(displayUnit = "m") = 0.0635, oFoulingF = 0, useBYnusselt = true, useFins = true) annotation(
      Placement(visible = true, transformation(origin = {-20, 8}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    FreeFluids.Interfaces.FlowSourceSP SourceA(redeclare package Medium = Modelica.Media.Air.DryAirNasa, P(displayUnit = "Pa") = 100325, T = 308.15) annotation(
      Placement(visible = true, transformation(origin = {-20, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    FreeFluids.Interfaces.FlowSink SinkA(redeclare package Medium = Modelica.Media.Air.DryAirNasa, G(displayUnit = "kg/h") = 130.7030555555556, fix = FreeFluids.Types.BoundaryOption.fixFlow) annotation(
      Placement(visible = true, transformation(origin = {-20, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    FreeFluids.Interfaces.FlowSourceSP SourceI(redeclare package Medium = Hydrocarbon, P(displayUnit = "Pa") = 444000, T = 394.25) annotation(
      Placement(visible = true, transformation(origin = {-90, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FreeFluids.Interfaces.FlowSink SinkI(redeclare package Medium = Hydrocarbon, G(displayUnit = "kg/h") = 31.4995, fix = FreeFluids.Types.BoundaryOption.fixFlow) annotation(
      Placement(visible = true, transformation(origin = {52, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//HEX.IW=-5.46e6;
    connect(SourceI.PortB, HEX.Iin) annotation(
      Line(points = {{-80, 8}, {-38, 8}}, color = {0, 127, 255}));
    connect(HEX.Iout, SinkI.PortA) annotation(
      Line(points = {{-2, 8}, {42, 8}}, color = {0, 127, 255}));
    connect(SinkA.PortA, HEX.Oout) annotation(
      Line(points = {{-20, 66}, {-20, 26}}, color = {0, 127, 255}));
    connect(SourceA.PortB, HEX.Oin) annotation(
      Line(points = {{-20, -38}, {-20, -10}}, color = {0, 127, 255}));
    annotation(
      Diagram(coordinateSystem(extent = {{-100, 100}, {80, -60}})),
      Documentation(info = "<html><head></head><body>Example 12.1 from Process Heat Transfer Principles and Applications (R.W.Serth)</body></html>"),
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 1));
  end GasCoolerTest;

  model GasCoolerTestCond
    extends Modelica.Icons.Example;
    FreeFluids.HeatExchangers.GasCooledHEXc HEX(redeclare package MediumI = FreeFluids.TMedia.Fluids.Water, redeclare package MediumO = Modelica.Media.Air.DryAirNasa, finDiameter = 0.05715, finDistance = 0.00254, finHeight = 0.054, finIsCircular = true, finK = 209, finThickness = 0.00033, finWidth = 0.054, iDi = 0.02058, iFoulingF = 0.000176, iKwall = 16.7, iLTube = 5, iNumPipes = 56, iNumRows = 4, iNumSerial = 4, iRoughness = 4.600000000000001e-05, iStaggered = true, iThickness = 0.00241, iTubePitch(displayUnit = "mm") = 0.0635, oFoulingF = 0, useBYnusselt = true, useFins = true) annotation(
      Placement(visible = true, transformation(origin = {-20, 8}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
    FreeFluids.Interfaces.FlowSourceSP SourceA(redeclare package Medium = Modelica.Media.Air.DryAirNasa, P(displayUnit = "Pa") = 100325, T = 338.15) annotation(
      Placement(visible = true, transformation(origin = {-20, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    FreeFluids.Interfaces.FlowSink SinkA(redeclare package Medium = Modelica.Media.Air.DryAirNasa, G(displayUnit = "kg/h") = 126.389, fix = FreeFluids.Types.BoundaryOption.fixFlow) annotation(
      Placement(visible = true, transformation(origin = {-20, 76}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    FreeFluids.Interfaces.FlowSource SourceI(redeclare package Medium = FreeFluids.TMedia.Fluids.Water, P(displayUnit = "bar") = 200000, sourceOption = FreeFluids.Types.SourceOption.useSatGasP) annotation(
      Placement(visible = true, transformation(origin = {-90, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FreeFluids.Interfaces.FlowSink SinkI(redeclare package Medium = FreeFluids.TMedia.Fluids.Water, G(displayUnit = "kg/h") = 1.111111111111111, fix = FreeFluids.Types.BoundaryOption.fixFlow) annotation(
      Placement(visible = true, transformation(origin = {52, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
//HEX.IW=-5.46e6;
    connect(SourceI.PortB, HEX.Iin) annotation(
      Line(points = {{-80, 8}, {-38, 8}}, color = {0, 127, 255}));
    connect(HEX.Iout, SinkI.PortA) annotation(
      Line(points = {{-2, 8}, {42, 8}}, color = {0, 127, 255}));
    connect(SinkA.PortA, HEX.Oout) annotation(
      Line(points = {{-20, 66}, {-20, 26}}, color = {0, 127, 255}));
    connect(SourceA.PortB, HEX.Oin) annotation(
      Line(points = {{-20, -38}, {-20, -10}}, color = {0, 127, 255}));
    annotation(
      Diagram(coordinateSystem(extent = {{-100, 100}, {80, -60}})),
      Documentation(info = "<html><head></head><body>Example 12.1 from Process Heat Transfer Principles and Applications (R.W.Serth)</body></html>"),
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 1));
  end GasCoolerTestCond;

  model ShellTubesTest
    extends Modelica.Icons.Example;
    FreeFluids.HeatExchangers.ShellAndTubesHEXfc_fc HEX(redeclare package MediumI = CrudeOil, redeclare package MediumO = Kerosene, BaCutRatio = 0.2, cBaSh(displayUnit = "mm") = 0.005059999999999999, cBuSh = 0.0339, cTuBa = 0.00079, dShI = 0.48895, equalBaffleDistance = true, iDi = 0.0211836, iFoulingF = 0.0005283, iKwall = 50, iLTube = 4.2672, iNumPipes = 31, iNumSerial = 4, iThickness = 0.00211, inletBaffleDistance = 0.09779, numBa = 42, numSS = 1, oFoulingF = 0.000352, outletBaffleDistance = 0.09779, pitchRatio = 1.25, shellNozzlesDi = 0.07790000000000001, triangularPitch = false) annotation(
      Placement(visible = true, transformation(origin = {8.88178e-16, -2.66454e-15}, extent = {{-36, -36}, {36, 36}}, rotation = 0)));
    FreeFluids.Interfaces.FlowSourceSP SourceI(redeclare package Medium = CrudeOil, P(displayUnit = "Pa") = 399999.9999999999, T = 310.927778) annotation(
      Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FreeFluids.Interfaces.FlowSourceSP SourceS(redeclare package Medium = Kerosene, P(displayUnit = "Pa") = 399999.9999999999, T = 472.03889) annotation(
      Placement(visible = true, transformation(origin = {0, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    FreeFluids.Interfaces.FlowSink SinkI(redeclare package Medium = CrudeOil, G(displayUnit = "kg/h") = 18.89968222222222) annotation(
      Placement(visible = true, transformation(origin = {82, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FreeFluids.Interfaces.FlowSink SinkS(redeclare package Medium = Kerosene, G(displayUnit = "kg/h") = 5.669904722222222) annotation(
      Placement(visible = true, transformation(origin = {0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  equation
    connect(SourceI.PortB, HEX.Iin) annotation(
      Line(points = {{-70, 0}, {-32, 0}}, color = {0, 127, 255}));
    connect(HEX.Iout, SinkI.PortA) annotation(
      Line(points = {{32, 0}, {72, 0}}, color = {0, 127, 255}));
    connect(HEX.Oin, SourceS.PortB) annotation(
      Line(points = {{0, -32}, {0, -54}}, color = {0, 127, 255}));
    connect(HEX.Oout, SinkS.PortA) annotation(
      Line(points = {{0, 32}, {0, 60}}, color = {0, 127, 255}));
    annotation(
      Documentation(info = "<html><head></head><body>Example 5.1 and 6.1 from Heat Transfer Principles and Applications 1st edition, R.W.Serth</body></html>"),
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 1));
  end ShellTubesTest;

  model ShellTubesTestCond
    extends Modelica.Icons.Example;
    FreeFluids.HeatExchangers.ShellAndTubesHEXc_fc HEX(redeclare package MediumI = FreeFluids.TMedia.Fluids.Water, redeclare package MediumO = FreeFluids.LMedia.Fluids.Water, BaCutRatio = 0.1639, cBaSh(displayUnit = "mm") = 0.004799999999999998, cBuSh = 0.0127, cTuBa = 0.00092, dShI = 0.9, equalBaffleDistance = false, iDi = 0.0466, iFoulingF = 0.0002, iKwall = 17, iLTube = 3.8, iNumPipes = 164, iNumSerial = 1, iThickness = 0.0021, inletBaffleDistance = 0.48, isVertical = true, numBa = 14, numSS = 1, oFoulingF = 0.00035, outletBaffleDistance = 0.48, pitchRatio = 1.25, shellNozzlesDi = 0.202, triangularPitch = true) annotation(
      Placement(visible = true, transformation(origin = {8.88178e-16, -2.66454e-15}, extent = {{-36, -36}, {36, 36}}, rotation = 0)));
    FreeFluids.Interfaces.FlowSource SourceI(redeclare package Medium = FreeFluids.TMedia.Fluids.Water, P(displayUnit = "Pa") = 399999.9999999999, T = 375.15, sourceOption = FreeFluids.Types.SourceOption.useSatGasT) annotation(
      Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FreeFluids.Interfaces.FlowSourceSP SourceS(redeclare package Medium = FreeFluids.LMedia.Fluids.Water, P(displayUnit = "Pa") = 399999.9999999999, T = 310.15) annotation(
      Placement(visible = true, transformation(origin = {0, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    FreeFluids.Interfaces.FlowSink SinkI(redeclare package Medium = FreeFluids.TMedia.Fluids.Water, G(displayUnit = "kg/h") = 1.555555555555556, fix = FreeFluids.Types.BoundaryOption.fixFlow) annotation(
      Placement(visible = true, transformation(origin = {82, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FreeFluids.Interfaces.FlowSink SinkS(redeclare package Medium = FreeFluids.LMedia.Fluids.Water, G(displayUnit = "kg/h") = 25) annotation(
      Placement(visible = true, transformation(origin = {0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  equation
    connect(SourceI.PortB, HEX.Iin) annotation(
      Line(points = {{-70, 0}, {-32, 0}}, color = {0, 127, 255}));
    connect(HEX.Iout, SinkI.PortA) annotation(
      Line(points = {{32, 0}, {72, 0}}, color = {0, 127, 255}));
    connect(HEX.Oin, SourceS.PortB) annotation(
      Line(points = {{0, -32}, {0, -54}}, color = {0, 127, 255}));
    connect(HEX.Oout, SinkS.PortA) annotation(
      Line(points = {{0, 32}, {0, 60}}, color = {0, 127, 255}));
    annotation(
      Documentation(info = "<html><head></head><body>Example from an HTRI checked case</body></html>"),
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 1));
  end ShellTubesTestCond;
end Examples;
