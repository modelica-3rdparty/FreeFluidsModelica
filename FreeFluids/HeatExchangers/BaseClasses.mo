within FreeFluids.HeatExchangers;

package BaseClasses
  partial model HEXtubesDefinition
    replaceable package MediumI = FreeFluids.TMedia.Fluids.Water constrainedby Modelica.Media.Interfaces.PartialMedium "inner pipe medium";
    replaceable package MediumA = FreeFluids.TMedia.Fluids.Water constrainedby Modelica.Media.Interfaces.PartialMedium "annulus medium";
    FreeFluids.Interfaces.FluidPortA Iin annotation(
      Placement(visible = true, transformation(origin = {-92, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FreeFluids.Interfaces.FluidPortB Iout annotation(
      Placement(visible = true, transformation(origin = {92, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FreeFluids.Interfaces.FluidPortA Oin annotation(
      Placement(visible = true, transformation(origin = {70, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FreeFluids.Interfaces.FluidPortB Oout annotation(
      Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    parameter Modelica.Units.SI.Distance iElevDiff=0 "inner pipe differential elevation: out elev. - in elev." annotation(
      Dialog(tab = "Flow data"));
    parameter Modelica.Units.SI.Distance oElevDiff=0 "outer flow differential elevation: out elev. - in elev." annotation(
      Dialog(tab = "Flow data"));
    parameter Boolean iIsCircular=true "if false, the inner pipe is not circular" annotation(
      Dialog(tab = "Inner pipe data"));
    parameter Modelica.Units.SI.Distance iDi(displayUnit = "mm") = 0.0 "inner pipe internal diameter, if circular" annotation(
      Dialog(tab = "Inner pipe data"));
    parameter Modelica.Units.SI.Area iSection = 0 "inner pipe flow section, if not circular" annotation(
      Dialog(tab = "Inner pipe data"));
    parameter Modelica.Units.SI.Distance iPerimeter = 0 "inner pipe perimeter, if not circular" annotation(
      Dialog(tab = "Inner pipe data"));
    parameter Modelica.Units.SI.Distance iThickness(displayUnit = "mm") = 1e-3 "inner pipe thickness" annotation(
      Dialog(tab = "Inner pipe data"));
    parameter Modelica.Units.SI.Distance iRoughness(displayUnit = "mm") = 1.5e-005 "inner pipe roughness. SS:1.5e-5, Steel new:4.6e-5, Steel old:2.0e-4, Concrete:1.5e-3" annotation(
      Dialog(tab = "Inner pipe data"));
    parameter Modelica.Units.SI.Density iRhoWall(displayUnit = "kg/m3") = 8000 "inner pipe wall density" annotation(
      Dialog(tab = "Inner pipe data"));
    parameter Modelica.Units.SI.ThermalConductivity iKwall = 16 "inner pipe wall thermal conductivity. Al=210, Cu=390, Steel=50, SS=17" annotation(
      Dialog(tab = "Inner pipe data"));
    parameter Modelica.Units.SI.ThermalInsulance iFoulingF = 0.0002 "inner pipe side fouling factor.Typical: 0.00018 for thermal oil, or treated cooling water" annotation(
      Dialog(tab = "Heat transfer"));
    parameter Modelica.Units.SI.Distance iLTube = 0 "stright length of each individual inner pipe" annotation(
      Dialog(tab = "Inner pipe data"));
    parameter Integer iNumPipes = 1 "number of inner pipes that form a common pass" annotation(
      Dialog(tab = "Inner pipe data"));
    parameter Integer iNumParallel = 1 "number of parallel inner passes. Normally it is the number of exchangers" annotation(
      Dialog(tab = "Inner pipe data"));
    parameter Integer iNumSerial=2 "number of serial inner passes  (Each hairpin has two serial passes)" annotation(
      Dialog(tab = "Inner pipe data"));
    parameter Integer iNumUturns=1 "number of U turns in each exchanger" annotation(
      Dialog(tab = "Inner pipe data"));
    parameter Real iNumVelocityHeads=1.5 "inner pipe number of velocity heads to consider in pressure loss" annotation(
      Dialog(tab = "Flow data"));
    parameter Boolean iUturnHT=false "if true, the U turn surface is used for heat transfer"  annotation(
      Dialog(tab = "Inner pipe data"));
    parameter Modelica.Units.SI.ThermalInsulance oFoulingF = 0.0002 "outer flow fouling factor.Typical: 0.00018 for thermal oil, or treated cooling water" annotation(
      Dialog(tab = "Heat transfer"));
    parameter Boolean useHTcorr=true "if true, the heat transfer correction factor is used"  annotation(
      Dialog(tab = "Heat transfer"));
              
    parameter Boolean useFins=false "if true, fins are taken into account in calculations" annotation(
      Dialog(tab = "Fins data"));
    parameter Modelica.Units.SI.Density finRho = 0 "fin density. Al=2700, Cu=8930, Steel=7830, SS=8000" annotation(
      Dialog(tab = "Fins data"));
    parameter Modelica.Units.SI.ThermalConductivity finK = 210 "fin thermal conductivity. Al=210, Cu=390, Steel=50, SS=17" annotation(
      Dialog(tab = "Fins data"));
    parameter Modelica.Units.SI.Distance finThickness(displayUnit = "mm") = 0.0 "fin thickness" annotation(
      Dialog(tab = "Fins data"));
  
    parameter Boolean counterCurrent=true "true if flow is counter-current, otherwise it will be considered co-current" annotation(
      Dialog(tab = "Heat transfer"));
  
    Integer ItotalNumPipes "total number of individual inner pipes";
    Modelica.Units.SI.Distance IiPerimeter "inner pipe internal wetted perimeter"; 
    Modelica.Units.SI.Area IiSection "inner pipe internal flow section";
    Modelica.Units.SI.Distance IDh "internal pipe hydraulic diameter";
    Modelica.Units.SI.Area IiArea "total inner pipes internal heat transfer area";
    Modelica.Units.SI.Distance IoPerimeter "inner pipe external perimeter";  
    Modelica.Units.SI.Area IoSection "inner pipe external section";
    Modelica.Units.SI.Area IoArea "total inner pipes external heat transfer area";
    MediumI.ThermodynamicState IStateIn "inner flow inlet state";
    MediumI.ThermodynamicState IStateOut "inner flow outlet state";
    Modelica.Units.SI.Temperature ITin "inner flow inlet temperature";
    Modelica.Units.SI.Temperature ITout "iiner flow outlet temperature";
    Modelica.Units.SI.Temperature IT "inner pipe average temperature";  
    MediumI.ThermodynamicState IStateWall "inner pipe wall state for correction factors
     calculation";
    Modelica.Units.SI.Temperature ITwall "inner pipe wall temperature";
    Modelica.Units.SI.DynamicViscosity IMuWall(min = 1e-6, start = 1e-3, max = 1e6) "inner pipe wall dynamic viscosity";
    Real IPlossCorr "internal pipe pressure loss correction factor";
    Modelica.Units.SI.AbsolutePressure IPloss "internal pipe pressure loss by friction";
    Real IHTcorr "internal pipe heat transfer correction factor";
    Modelica.Units.SI.NusseltNumber INu "inner pipe Nusselt number";
    Modelica.Units.SI.CoefficientOfHeatTransfer IH(min = 1, start = 1000) "inner pipe average heat transfer coefficient"; 
      
  
    MediumA.ThermodynamicState OStateIn "outer flow inlet state";
    MediumA.ThermodynamicState OStateOut "outer flow outlet state";
    Modelica.Units.SI.Temperature OTin "outer flow inlet temperature";
    Modelica.Units.SI.Temperature OTout "outer flow outlet temperature";
    Modelica.Units.SI.Temperature OT "outer flow average temperature";  
    Real OPlossCorr "outer flow pressure loss correction factor";
    Modelica.Units.SI.AbsolutePressure OPloss "outer flow pressure loss by friction";
    Modelica.Units.SI.Area OiArea "total outer flow internal area for heat transfer";
    Fraction OiEfficiency "outer flow internal area efficiency";
    Modelica.Units.SI.NusseltNumber ONu "outer flow nusselt number for internal heat transfer";
    Modelica.Units.SI.CoefficientOfHeatTransfer OHi(min = 1, start = 1000) "annulus average heat transfer coefficient to inner pipe";
  
    Modelica.Units.SI.ThermalResistance TRii "total resitance for the transfer between inner fluid and inner wall";
    Modelica.Units.SI.ThermalResistance TRio "total resitance for the transfer between outer fluid and inner wall";
    Modelica.Units.SI.ThermalResistance TRi "total resitance for the transfer between inner and outer fluids";
    Modelica.Units.SI.CoefficientOfHeatTransfer Ui "global heat transfer coefficient referenced to total inner flow area"; 
    Modelica.Units.SI.TemperatureDifference ILMTD "LMTD between inner and outer fluids";
  
    Modelica.Units.SI.Power IW "heat exchanged between inner and outer fluids. Positive if heat enters the inner fluid" ;
    
    Modelica.Units.SI.Length IEquivLength "internal pipe equivalent length for pressure drop";
    Fraction ILMTDcorr "internal LMTD correction factor";
  annotation(
      Documentation(info = "<html><head></head><body>Contains just the definitions of the inner pipe elements needed for the development of the outer flow models. With no equations, in order to allow multiple inheritance of the model without giving too many equations.</body></html>")); 
  end HEXtubesDefinition;

  partial model HEXtubes
    extends HEXtubesDefinition; 
  
  algorithm
    if iIsCircular==true then
      IiPerimeter:=pi*iDi;
      IiSection:=pi*iDi^2/4;
      IDh:=iDi;
      IoPerimeter:=pi*(iDi+2*iThickness);
      IoSection:=pi*(iDi+2*iThickness)^2/4;
    else
      IiPerimeter:=iPerimeter;
      IiSection:=iSection;
      IDh:=4*iSection/iPerimeter;
      IoPerimeter:=iPerimeter+8*iThickness;
      IoSection:=iSection+(iPerimeter+4*iThickness)*iThickness;
    end if;
    ItotalNumPipes:=iNumParallel*iNumSerial*iNumPipes;
    IEquivLength:=iNumSerial*iLTube;
    IiArea:=ItotalNumPipes*iLTube*IiPerimeter; 
  equation
    Iout.X=Iin.X;
    Iout.Elevation=Iin.Elevation+iElevDiff;
    Iout.G=-Iin.G;
    IStateIn = MediumI.setState_phX(Iin.P, Iin.H, Iin.X);
    IStateOut = MediumI.setState_phX(Iout.P, Iout.H, Iout.X); 
    ITin = MediumI.temperature(IStateIn);
    ITout = MediumI.temperature(IStateOut);
    ITwall=(TRio*IT+TRii*OT)/(TRio+TRii);
    //ITwall=(IH*IiArea*IT+OHi*OiArea*OiEfficiency*OT)/(IH*IiArea+OHi*OiArea*OiEfficiency);
    //ITwall =(ITin+ITout+OTin+OTout)/4;
    IStateWall = MediumI.setState_pTX((Iin.P + Iout.P) / 2, ITwall, Iin.X); 
    IMuWall = MediumI.dynamicViscosity(IStateWall);
  
    Oout.X=Oin.X;
    Oout.Elevation=Oin.Elevation+oElevDiff;
    Oout.G=-Oin.G;
    OStateIn = MediumA.setState_phX(Oin.P, Oin.H, Oin.X);
    OStateOut = MediumA.setState_phX(Oout.P, Oout.H, Oout.X);    
    OTin = MediumA.temperature(OStateIn);
    OTout = MediumA.temperature(OStateOut);
    
    if counterCurrent==true then  
      if noEvent((ITin - OTout) * (ITout - OTin) <= 0) then
        ILMTD = 0;
      elseif noEvent(abs(ITin - OTout - ITout + OTin)<0.001) then
        ILMTD = ITin - OTout;
      else
        ILMTD = (ITin - OTout - ITout + OTin) / log((ITin - OTout) / (ITout - OTin));
      end if;
    else
      if noEvent((ITin - OTin) * (ITout - OTout) <= 0) then
        ILMTD = 0;
      elseif noEvent(abs(ITin - OTin - ITout + OTout)<0.001) then
        ILMTD = ITin - OTout;
      else
        ILMTD = (ITin - OTin - ITout + OTout) / log((ITin - OTin) / (ITout - OTout));
      end if;  
    end if;
    TRii=1/(IH*IiArea)+iFoulingF/IiArea;
    TRio=oFoulingF/(OiArea*OiEfficiency)+1/(OHi*OiArea*OiEfficiency);
    TRi=1/(IH*IiArea)+iFoulingF/IiArea+log((IDh+2*iThickness)/IDh)/(iKwall*2*pi*ItotalNumPipes*iLTube)+oFoulingF/(OiArea*OiEfficiency)+1/(OHi*OiArea*OiEfficiency);
    IW=-ILMTD*ILMTDcorr/TRi;
    Iout.H=Iin.H+IW/Iin.G "kinetic and gravitational energy are not taken into account";
    Oout.H=Oin.H-IW/Oin.G "kinetic and gravitational energy are not taken into account";
    Ui=1/(TRi*IiArea);
  annotation(
      Documentation(info = "<html><head></head><body>Here come the equations missing in the HEXtubesDefinition model. The model has the elements and equations common to forced convection and gas condensation.<div>It is not clear how to calculate the average wall temperature used to introduce corrections in the calculated heat transfer coefficient. I see three possibilities:</div><div>· The average temperature of both streams at both ends.</div><div>· Split the temperature difference (between the two streams average temperatures) according to the respective heat trasfer resistance of each flow. It seems better, as it is clear that the wall temperature will be closer to the stream with less heat transfer resistance.</div><div>· Calculate a wall temperature that will produce the same heat transfer considering the LMTD between this temperature and one of the streams. This is a more complex calculation, and I have not checked that the obtained temperature is the same for both streams.</div><div>For now, split the temperature according to the resistance seems the best option.</div></body></html>"));end HEXtubes;

  partial model HEXtubesForcedConvection
    extends HEXtubes;
    parameter Boolean useTwistedTapeInserts = false "if true, twisted tape inserts will be used in inner pipes" annotation(
      Dialog(tab = "Heat transfer"));
    parameter Modelica.Units.SI.Length tapeWidth(displayUnit="mm") = iDi "only if twisted tape inserts are used" annotation(
      Dialog(tab = "Heat transfer"));
    parameter Modelica.Units.SI.Length tapeThickness(displayUnit="mm") = iThickness "only if twisted tape inserts are used" annotation(
      Dialog(tab = "Heat transfer"));    
    parameter Real twistRatio = 6 "Length of a 180 degrees twist divided by Di, if twisted tape inserts are used" annotation(
      Dialog(tab = "Heat transfer"));  
    MediumI.ThermodynamicState IStateAvg "inner pipe average state for physical properties calculation";
    Modelica.Units.SI.Density IRho(displayUnit = "kg/m3") "inner pipe average density";
    Modelica.Units.SI.DynamicViscosity IMu(min = 1e-6, start = 1e-3, max = 1e6) "inner pipe average dynamic viscosity";
    Modelica.Units.SI.SpecificHeatCapacity ICp(start = 2000.0) "inner pipe average heat capacity";
    Modelica.Units.SI.ThermalConductivity IK(start = 0.1) "inner pipe average thermal conductivity";
    Modelica.Units.SI.PrandtlNumber IPr "inner pipe Prandt number";
    Modelica.Units.SI.VolumeFlowRate IQ(displayUnit = "m3/h") "inner pipe total volume flow rate at average conditions";
    Modelica.Units.SI.Velocity IV(start = 1) "velocity at average conditions referenced to the empty pipe. Normally between 0.9 and 3.0 m/s for liquids";
    Modelica.Units.SI.ReynoldsNumber IRe(min = 0.01, start = 20000) "inner pipe Reynolds number at average conditions";
    Real IFl(start = 0.01) "internal flowlaminar Darcy's friction factor at average conditions";
    Real IFt(start = 0.01) "internal flow turbulent Darcy's friction factor at average conditions";
    Real IF(start = 0.01) "internal flow Darcy's friction factor at average conditions";
    Modelica.Units.SI.RayleighNumber IRa " inner flow Rayleigh number";
    Real ISw "inner flowSwirl number";
    Real IfSmooth;
  
  equation
    IStateAvg = MediumI.setState_phX((Iin.P + Iout.P) / 2, (Iin.H + Iout.H) / 2, Iin.X);
    IT = MediumI.temperature(IStateAvg);   
    IRho = abs(MediumI.density(IStateAvg));
    IMu = MediumI.dynamicViscosity(IStateAvg);
    ICp = MediumI.specificHeatCapacityCp(IStateAvg);
    IK = MediumI.thermalConductivity(IStateAvg);
    IPr = ICp * IMu / IK;
    IQ = Iin.G / IRho;
    IV = abs(IQ / (iNumParallel*iNumPipes*IiSection));
    if noEvent(Iin.G < (-1e-7) or Iin.G > 1e-7) then
      IRe = IDh * abs(Iin.G) / (iNumParallel*iNumPipes*IiSection * IMu) + 0.01 "in order to avoid division by 0 calculating F";
      
    else
      IRe = 0.01;
  
    end if;
  
    if useTwistedTapeInserts==true then
      ISw=(IRe*pi/(twistRatio^0.5*(pi-4*tapeThickness/IDh)))*(1+(pi/(2*twistRatio))^2)^0.5;
      //IRa=g_n*IRho^2*IDh^3*MediumI.isobaricExpansionCoefficient(IStateAvg)*abs(Twall-Tsurf)*IPr/IMu^2;
      IRa=0;
      IFl=4*15.767/IRe*(pi/(pi-4*tapeThickness/IDh))*((pi+2-2*tapeThickness/IDh)/(pi-4*tapeThickness/IDh))^2*(1+(pi/2/twistRatio)^2)*(1+1e-6*ISw^2.55)^(1/6) "laminar flow friction factor";
      IFt=4*0.0791/IRe^0.25*(pi/(pi-4*tapeThickness/IDh))*((pi+2-2*tapeThickness/IDh)/(pi-4*tapeThickness/IDh))^1.25*(1+2.752/twistRatio^1.29) "turbulent flow friction factor";
      IF = (IFl^10+IFt^10)^0.1;
    else
      ISw=0;
      IRa=0;
      IFl=0;
      IFt=0;
      IF = 8 * ((8 / IRe) ^ 12 + ((37530 / IRe) ^ 16 + (-2.457 * log((7 / IRe) ^ 0.9 + 0.27 * iRoughness / IDh)) ^ 16) ^ (-1.5)) ^ (1 / 12) "Churchill equation for Darcy's friction factor";
    end if;
    
    if IRho>= 300 then
      IPlossCorr=(IMuWall/IMu)^0.25 "friction correction factor for liquids. In laminar flow is higher. S.Kalkaç pag. 89";
    else
      IPlossCorr=(ITwall/IT)^0.9 "friction correction factor for gases";
    end if;
    IPloss = homotopy(0.5 * IV ^ 2 * IRho * IPlossCorr * (IF * IEquivLength / IDh + iNumVelocityHeads), 0.5 * IV ^ 2 * IRho * (IF * IEquivLength / IDh + iNumVelocityHeads));
    Iout.P-Iin.P = (-sign(Iin.G) * IPloss) + (Iin.Elevation - Iout.Elevation + 1e-5) * g_n * IRho "momentum change is not taken into account.1 e-5 is to avoid division by 0";
    
     if useHTcorr == true then
      if useTwistedTapeInserts==true then
        if IRho>300 then
          if noEvent(ITwall>IT) then
            IHTcorr = homotopy((IMu / IMuWall) ^ 0.18,1) "liquid heating heat transfer correction factor with inserts";
          else
            IHTcorr = homotopy((IMu / IMuWall) ^ 0.3,1) "liquid cooling heat transfer correction factor with inserts";
          end if;
        else
          if noEvent(ITwall>IT) then
            IHTcorr = homotopy((IT / ITwall) ^ 0.45,1) "gas heating heat transfer correction factor with inserts";
          else
            IHTcorr = homotopy((IT / ITwall) ^ 0.15,1) "gas cooling heat transfer correction factor with inserts";
          end if;
        end if;
      else
        if IRho>300 then
          IHTcorr = homotopy((IMu / IMuWall) ^ 0.11,1) "liquids heat transfer correction factor without inserts";
        else
          IHTcorr = 1 "gases without inserts";
        end if;
      end if;
    else
      IHTcorr = 1;
    end if;
    if noEvent(IRe > 10000) then
      IfSmooth = (0.78173 * log(IRe) - 1.5) ^ (-2);
        INu = OpenModelica.Internal.realAbs(IfSmooth / 8 * IRe * IPr / (1 + 12.7 * (IfSmooth / 8) ^ 0.5 * (IPr ^ (2/3) - 1)) * (1 + (IDh / iLTube) ^ (2/3)) * IHTcorr) "Pethukov/Gnielinsky equation for smooth tubes, VDI mean";
        
    elseif noEvent(IRe < 2100) then
      IfSmooth = 0;
      if noEvent(iLTube>0.05*IRe*IPr*IDh) then
        INu = abs((3.66 ^ 3 + 0.7 ^ 3 + (1.615 * (IRe * IPr * IDh / iLTube) ^ (1/3) - 0.7) ^ 3)^(1/3))* IHTcorr "VDI Atlas";
        //INu = abs((3.66 ^ 3 + 0.7 ^ 3 + (1.65 * (IRe * IPr * IDh / iLTube) ^ 0.333 - 0.7) ^ 3 + ((2 / (1 + 22 * IPr)) ^ (1 / 6) * (IRe * IPr * IDh / iLTube) ^ 0.5) ^ 3) ^ 0.333 * IHTcorr) "Gnielinsky-Martin correlation for constant wall temperature: VDI mean";
      else
        INu = abs(1.615 * (IRe * IPr * IDh / iLTube) ^ (1/3))* IHTcorr;
      //INu = abs(1.86 * (IRe * IPr * IDh / iLtube) ^ 0.333 * IHTcorr) "Sieder-Tate equation for laminar flow";
      end if;
    else
  //interpolation between turbulent and laminar flow
      IfSmooth = (0.78173 * log(10000) - 1.5) ^ (-2);
      INu = (abs(IfSmooth / 8 * 10000 * IPr / (1 + 12.7 * (IfSmooth / 8) ^ 0.5 * (IPr ^ (2/3) - 1)) * (1 + (IDh / iLTube) ^ (2/3)) ) * (IRe - 2100) / 7900 + abs((3.66 ^ 3 + 0.7 ^ 3 + (1.65 * (2100 * IPr * IDh / iLTube) ^ (1/3) - 0.7) ^ 3 ) ^ (1/3)) * (10000 - IRe) / 7900)* IHTcorr "VDI G1 4.2";
    end if;
    IH=INu*IK/IDh;
    
    ILMTDcorr=1;    
  end HEXtubesForcedConvection;

  partial model DoublePipeHEX
  "double pipe heat exchanger with internal and external forced convection transfer"
    extends HEXtubesDefinition;
    parameter Boolean oIsCircular=true "if false, the outer pipe is not circular" annotation(
      Dialog(tab = "Outer pipe data"));
    parameter Modelica.Units.SI.Distance oDi(displayUnit = "mm") = 0.0 "outer pipe internal diameter, if circular" annotation(
      Dialog(tab = "Outer pipe data"));
    parameter Modelica.Units.SI.Area oSection = 0 "outer pipe raw section, if not circular. The section of the inner pipe will be substracted from it" annotation(
      Dialog(tab = "Outer pipe data"));
    parameter Modelica.Units.SI.Distance oPerimeter = 0 "outer pipe internal perimeter, if not circular" annotation(
      Dialog(tab = "Outer pipe data"));
    parameter Modelica.Units.SI.Distance oThickness(displayUnit = "mm") = 1e-3 "outer pipe thickness" annotation(
      Dialog(tab = "Outer pipe data"));
    parameter Modelica.Units.SI.Distance oRoughness(displayUnit = "mm") = 1.5e-005 "outer pipe roughness. SS:1.5e-5, Steel new:4.6e-5, Steel old:2.0e-4, Concrete:1.5e-3" annotation(
      Dialog(tab = "Outer pipe data"));
    parameter Modelica.Units.SI.Density oRhoWall(displayUnit = "kg/m3") = 8000 "outer pipe wall density" annotation(
      Dialog(tab = "Outer pipe data"));
    parameter Modelica.Units.SI.ThermalConductivity oKwall = 16 "outer pipe wall thermal conductivity. Al=210, Cu=390, Steel=50, SS=17" annotation(
      Dialog(tab = "Outer pipe data"));
    parameter Modelica.Units.SI.Distance thicknessInsul(displayUnit = "mm") = 0 "insulation thickness" annotation(
      Dialog(tab = "Outer pipe data"));    
    parameter Real oNumVelocityHeads=0 "outer flow number of velocity heads to consider in pressure loss" annotation(
      Dialog(tab = "Flow data"));    
    
    parameter Boolean oSerialFlow=false "if false, annulus flow is splitted in the same number of parallel flows than the inner flow" annotation(
      Dialog(tab = "Flow data"));  
  
    parameter Integer finNum = 1 "number of longitudinal fins on each individual inner pipe" annotation(
      Dialog(tab = "Fins data"));
    parameter Modelica.Units.SI.Distance finLength = iLTube "length of each longitudinal fin" annotation(
      Dialog(tab = "Fins data"));
    parameter Modelica.Units.SI.Distance finHeight(displayUnit = "mm") = 0.0 "fin height" annotation(
      Dialog(tab = "Fins data"));
  
    Modelica.Units.SI.Distance FinsPerimeter "wetted fins perimeter on each internal pipe";
    Modelica.Units.SI.Area FinsSection "fins section on each internal pipe";
    Modelica.Units.SI.Area FinsArea "total fins area for heat transfer";
  
    Modelica.Units.SI.Distance OoPerimeter "outer pipe external perimeter";  
    Modelica.Units.SI.Area OoSection "Outer pipe external section";
    Modelica.Units.SI.Distance OiPerimeter "Outer pipe internal wetted perimeter"; 
    Modelica.Units.SI.Area OiSection "Outer pipe total internal section";
    
    Modelica.Units.SI.Distance Operimeter "annulus wetted perimeter";
    Modelica.Units.SI.Area Osection "annulus nett flow section";  
    Modelica.Units.SI.Distance ODh "annulus hydraulic diameter";
    
    MediumA.ThermodynamicState OStateAvg "outer flow average state for physical properties calculation";
    MediumA.ThermodynamicState OiStateWall "annulus internal wall state for correction factors calculation";
    Modelica.Units.SI.Density ORho(displayUnit = "kg/m3") "annulus average density";
    Modelica.Units.SI.DynamicViscosity OMu(min = 1e-6, start = 1e-3, max = 1e6) "annulus average dynamic viscosity";
    Modelica.Units.SI.SpecificHeatCapacity OCp(start = 2000.0) "annulus average heat capacity";
    Modelica.Units.SI.ThermalConductivity OK(start = 0.1) "annulus average thermal conductivity";  
    Modelica.Units.SI.DynamicViscosity OiMuWall(min = 1e-6, start = 1e-3, max = 1e6) "annulus inner wall dynamic viscosity"; 
    Modelica.Units.SI.PrandtlNumber OPr "annulus Prandt number";
    Modelica.Units.SI.VolumeFlowRate OQ(displayUnit = "m3/h") "total annulus volume flow rate at average conditions";
    Modelica.Units.SI.ReynoldsNumber ORe(min = 0.01, start = 20000) "annulus average Reynolds number";
    Real OF(start = 0.01) "annulus Darcy's friction factor at average conditions";
  
    Real OfSmooth;
    Modelica.Units.SI.CoefficientOfHeatTransfer AHo(min = 1, start = 1000) "annulus average heat transfer coefficient to outer pipe";
    Modelica.Units.SI.Diameter ADei "annulus diameter for heat transfer to internal pipe";
    Modelica.Units.SI.Diameter ADeo "annulus diameter for heat transfer to external surface";
  
    Modelica.Units.SI.Velocity OV(start = 1) "annulus flow velocity at average conditions. Normally between 0.9 and 3.0 m/s for liquids";
    Real FinM;
  
    Modelica.Units.SI.Length OEquivLength "external pipe equivalent length for pressure drop";
  
    Real OiHTcorr=0.873 "external flow internal heat trasfer correction factor";
  
  algorithm
    if useFins==true then
      IoArea:=ItotalNumPipes*iLTube*(IoPerimeter-finNum*finThickness);
    else
      IoArea:=ItotalNumPipes*iLTube*IoPerimeter;      
    end if;
  
  
    FinsPerimeter:=finNum*(2*finHeight+finThickness);
    FinsSection:=finNum*finHeight*finThickness;
    FinsArea:=ItotalNumPipes*finLength*FinsPerimeter;
    
    if oIsCircular==true then
      OoPerimeter:=pi*(oDi+2*oThickness);
      OoSection:=pi*(oDi+2*oThickness)^2/4;  
      OiPerimeter:=pi*oDi;
      OiSection:=pi*oDi^2/4;
    else
      OoPerimeter:=oPerimeter+8*oThickness;
      OoSection:=oSection+(oPerimeter+4*oThickness)*oThickness;
      OiPerimeter:=oPerimeter;
      OiSection:=oSection;
    end if;
    if oSerialFlow==false then
      OEquivLength:=iNumSerial*iLTube;  
    else
      OEquivLength:=iNumParallel*iNumSerial*iLTube;
    end if;
    
    if useFins==true then
      Operimeter:=iNumPipes*(IoPerimeter-finNum*finThickness+FinsPerimeter)+OiPerimeter;
      Osection:=OiSection-iNumPipes*(IoSection+FinsSection);
      ADei:=4*Osection/(iNumPipes*(IoPerimeter-finNum*finThickness+FinsPerimeter));
      OiArea:=IoArea+FinsArea;
    else
      Operimeter:=iNumPipes*IoPerimeter+OiPerimeter;
      Osection:=OiSection-iNumPipes*IoSection;
      ADei:=4*Osection/(iNumPipes*IoPerimeter);
      OiArea:=IoArea;
    end if;
    ODh:=4*Osection/Operimeter;
    ADeo:=4*Osection/OiPerimeter; 
  
   
  equation
   
    OStateAvg = MediumA.setState_phX((Oin.P + Oout.P) / 2, (Oin.H + Oout.H) / 2, Oin.X);
  OiStateWall = MediumA.setState_pTX((Oin.P + Oout.P) / 2, ITwall, Oin.X);
    OT = MediumA.temperature(OStateAvg);   
    ORho = abs(MediumA.density(OStateAvg));
    OMu = MediumA.dynamicViscosity(OStateAvg);
    OCp = MediumA.specificHeatCapacityCp(OStateAvg);
    OK = MediumA.thermalConductivity(OStateAvg);
    OiMuWall = MediumA.dynamicViscosity(OiStateWall);
    OPr = OCp * OMu / OK;
    
    OQ = Oin.G / ORho;
    if oSerialFlow==false then
      OV = abs(OQ / (Osection*iNumParallel));  
    else
      OV = abs(OQ / (Osection));
    end if;
    if noEvent(Oin.G < (-1e-7) or Oin.G > 1e-7) then
      ORe = ODh * abs(Oin.G) / (Osection * OMu) + 0.01 "in order to avoid division by 0 calculating F";
      OF = 8 * ((8 / ORe) ^ 12 + ((37530 / ORe) ^ 16 + (-2.457 * log((7 / ORe) ^ 0.9 + 0.27 * oRoughness / ODh)) ^ 16) ^ (-1.5)) ^ (1 / 12) "Churchill equation for Darcy's friction factor";
    else
      ORe = 0.01;
      OF = 6400;
    end if; 
    if ORho>= 300 then
      OPlossCorr=1.64;//(OiMuWall/OMu)^0.25 "friction correction factor for liquids. In laminar flow is higher. S.Kalkaç pag. 89";
    else
      OPlossCorr=(ITwall/OT)^0.9 "friction correction factor for gases";
    end if;
    OPloss = homotopy(0.5 * OV ^ 2 * ORho * OPlossCorr * (OF * OEquivLength / ODh + oNumVelocityHeads), 0.5 * OV ^ 2 * ORho * (OF * OEquivLength / ODh + oNumVelocityHeads));
    Oout.P-Oin.P = (-sign(Oin.G) * OPloss) + (Oin.Elevation - Oout.Elevation + 1e-5) * g_n * ORho "momentum change is not taken into account.ForcedConvection1 e-5 is to avoid division by 0";
    
    if noEvent(ORe > 10000) then
      OfSmooth = (0.78173 * log(ORe) - 1.5) ^ (-2);
      ONu = OpenModelica.Internal.realAbs(OfSmooth / 8 * ORe * OPr / (1 + 12.7 * (OfSmooth / 8) ^ 0.5 * (OPr ^ (2/3) - 1)) * (1 + (ODh / iLTube) ^ (2/3)) * OiHTcorr) "Pethukov/Gnielinsky equation for smooth tubes, VDI Atlas mean";
    
    elseif noEvent(ORe < 2100) then
      OfSmooth = 0;
      if noEvent(iLTube>0.05*ORe*OPr*ODh) then
        ONu = abs((3.66 ^ 3 + 0.7 ^ 3 + (1.615 * (ORe * OPr * ODh / iLTube) ^ (1/3) - 0.7) ^ 3)^(1/3))* OiHTcorr "VDI Atlas";
      else
        ONu=1.615 * (ORe * OPr * ODh / iLTube) ^ (1/3)* OiHTcorr "VDI Atlas mean. Developing laminar flow, constant wall temperature";
        //ONu=1.86 * (ORe * OPr * ODh / iLTube) ^ (1/3)* OiHTcorr "Sieder-Tate. Recommended by Kalkaç. But this is for local Nusselt, not for average";
        //ONu=3.66+1.2*(4*OiSection/((IDh+2*iThickness)*OiPerimeter))^0.8+(0.19*(1+0.14*(4*OiSection/((IDh+2*iThickness)*OiPerimeter))^0.5)*(ORe*OPr*ODh/iLTube)^0.8)/(1+0.117*(ORe*OPr*ODh/iLTube)^0.467) "Gnielinski, Serth, pag.55";
      end if;
    else
  //interpolation between turbulent and laminar flow
      OfSmooth = (0.78173 * log(10000) - 1.5) ^ (-2);
      ONu = (abs(OfSmooth / 8 * 10000 * OPr / (1 + 12.7 * (OfSmooth / 8) ^ 0.5 * (OPr ^ (2/3) - 1)) * (1 + (ODh / iLTube) ^ 0.667) ) * (ORe - 2100) / 7900 + abs((3.66 ^ 3 + 0.7 ^ 3 + (1.615 * (2100 * OPr * ODh / iLTube) ^ (1/3) - 0.7) ^ 3) ^ (1/3)) * (10000 - ORe) / 7900)* OiHTcorr "VDI G1 4.2";
    end if;
    OHi=ONu*OK/ODh;
    AHo=ONu*OK/ADeo;
    if useFins==true then
      FinM=(2*OHi/(finThickness*finK))^0.5;
      OiEfficiency=1-(1-tanh(FinM*finHeight)/(FinM*finHeight))*FinsArea/OiArea;
    else
      FinM=0;
      OiEfficiency=1;
    end if;
  
  annotation(
      Icon(graphics = {Rectangle(origin = {0, 35}, fillColor = {0, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-80, 5}, {80, -15}}), Text(origin = {90, -8}, lineColor = {0, 0, 255}, extent = {{-150, 100}, {146, 42}}, textString = "%name"), Rectangle(origin = {0, -35}, fillColor = {0, 85, 255}, fillPattern = FillPattern.Solid, extent = {{-80, 15}, {80, -5}}), Rectangle(origin = {-20, 14}, lineColor = {0, 85, 255}, extent = {{-60, 6}, {100, -34}}), Line(origin = {0, 60}, points = {{0, -20}, {0, 20}}, color = {32, 102, 241}, thickness = 0.5), Line(origin = {0, -60}, points = {{0, 20}, {0, -20}, {0, -20}}, color = {30, 81, 241}, thickness = 0.5)}));       
  end DoublePipeHEX;
  
  partial model GasCooledHEX
    extends HEXtubesDefinition(redeclare replaceable package MediumA=Modelica.Media.Air.DryAirNasa,iKwall=50);
    parameter Integer iNumRows(start = 1) "number of pipe rows passed by the gas flow" annotation(
      Dialog(tab = "Inner pipe data"));
    parameter Boolean iStaggered = true "if false, inline distribution" annotation(
      Dialog(tab = "Inner pipe data"));
    parameter Modelica.Units.SI.Distance iTubePitch(displayUnit = "mm")=2*iDi "distance between tubes" annotation(
      Dialog(tab = "Inner pipe data"));
    parameter Modelica.Units.SI.Distance iDop(displayUnit = "mm")=iDi+2*iThickness "inner pipe outer diameter, or width, perpenticular to gas flow" annotation(
      Dialog(tab = "Inner pipe data"));
    parameter Modelica.Units.SI.Distance finDistance(displayUnit = "mm") "distance between fins" annotation(
      Dialog(tab = "Fins data"));
    parameter Boolean finIsCircular = true "if false rectangular fin is used" annotation(
      Dialog(tab = "Fins data"));
    parameter Modelica.Units.SI.Distance finDiameter(displayUnit = "mm") "fin external diameter, if circular" annotation(
      Dialog(tab = "Fins data"));
    parameter Modelica.Units.SI.Distance finWidth(displayUnit = "mm") "side length perpenticular to flow, if rectangular" annotation(
      Dialog(tab = "Fins data"));
    parameter Modelica.Units.SI.Distance finHeight(displayUnit = "mm") "side length along flow, if rectangular" annotation(
      Dialog(tab = "Fins data"));    
    parameter Boolean useBYnusselt = false "if true, the Briggs and Youg Nusselt calc. will be used, otherwise the Ganguli's one" annotation(
      Dialog(tab = "Heat transfer"));
    Modelica.Units.SI.Area IoAreaRaw(start = 1.0) "total external surface of tubes without the fins";
    Modelica.Units.SI.Area FinsArea(start = 1.0) "total external surface of fins";
    Modelica.Units.SI.Area OiArea(start = 1.0) "total external surface of tubes and fins";
    Modelica.Units.SI.Area Sface(start = 1.0) "total area perpenticular to gas flow";
    Modelica.Units.SI.Area Sflow(start = 1.0) "total free area available for gas flow";
    Real OFinRatio;
    Real OPhi;
    MediumA.ThermodynamicState OStateAvg "outer flow average state for physical properties calculation";
    Modelica.Units.SI.Density ORho(displayUnit = "kg/m3") "outer flow average density";
    Modelica.Units.SI.DynamicViscosity OMu(min = 1e-6, start = 1e-3, max = 1e6) "outer flow average dynamic viscosity";
    Modelica.Units.SI.SpecificHeatCapacity OCp(start = 2000.0) "outer flow average heat capacity";
    Modelica.Units.SI.ThermalConductivity OK(start = 0.1) "outer flow average thermal conductivity";
    Modelica.Units.SI.PrandtlNumber OPr "outer flow Prandt number";
    Modelica.Units.SI.VolumeFlowRate OQ(displayUnit = "m3/h") "total outer volume flow rate at average conditions";
    Modelica.Units.SI.Velocity Vmax "gas velocity at the free surface";
    Modelica.Units.SI.Velocity Vface "gas velocity as per Sface. Typical: 2.5-3.5 m/s";
    Modelica.Units.SI.ReynoldsNumber ORe(min = 0.01, start = 20000) "outer flow average Reynolds number";
    Real Oa;
    Modelica.Units.SI.ReynoldsNumber OReff "outer flow effective Reynolds number";
    Real OF(start = 0.01) "outer flow Fanning's friction factor at average conditions";
    Modelica.Units.SI.NusseltNumber ONuGan "gas side Nusselt number as per Ganguli";
    Modelica.Units.SI.NusseltNumber ONuBY "gas side Nusselt as for Briggs and Young"; 
    Real OX;
    
  algorithm
    IoAreaRaw:=ItotalNumPipes*iLTube*IoPerimeter;
    Sface := iLTube * iTubePitch * ItotalNumPipes / iNumRows;
    if finIsCircular == true then
      FinsArea := (0.5 * pi * finDiameter ^ 2 - 2*IoSection) * iLTube / finDistance * ItotalNumPipes;
      //Sflow := ((iTubePitch - iDop) * (finDistance - finThickness) - (iTubePitch - finDiameter) * finThickness) * iLTube / finDistance * (ItotalNumPipes / iNumRows);
      Sflow := ((iTubePitch - iDop)-(finDiameter-iDop)*finThickness/finDistance) * iLTube*ItotalNumPipes / iNumRows;
      OFinRatio:= finDiameter / iDop;
    else
      FinsArea := 2*(finWidth*finHeight- IoSection) * iLTube / finDistance * ItotalNumPipes;
      Sflow := ((iTubePitch - iDop)-(finWidth-iDop)*finThickness/finDistance) * iLTube*ItotalNumPipes / iNumRows;
      if iStaggered==false then
        OFinRatio:=1.28*min(finWidth,finHeight)/iDop*(max(finWidth,finHeight)/min(finWidth,finHeight)-0.2)^0.5 "as per Schmidt, Zabronsky, and
  Rich, Air Cooled Heat Exchangers, D.G.Kroger. But rectified according to VDI Atlas";
      else
        OFinRatio:=1.27*min(finWidth,finHeight)/iDop*(max(finWidth,finHeight)/min(finWidth,finHeight)-0.3)^0.5 "as per Schmidt, Zabronsky, and
  Rich, Air Cooled Heat Exchangers, D.G.Kroger. According to VDI Atlas this is not totally correct";
      end if;    
    end if;
    OPhi := (OFinRatio - 1) * (1 + 0.35 * log(OFinRatio));
  
    if useFins==true then
      IoArea:=ItotalNumPipes*iLTube*IoPerimeter*(finDistance-finThickness)/finDistance;    
      OiArea := FinsArea + IoArea;
    else
      Sflow:=Sface;
      IoArea:=ItotalNumPipes*iLTube*IoPerimeter;
      OiArea := IoArea;         
    end if;
  
  //missing quadrangular
  equation
    OStateAvg = MediumA.setState_phX((Oin.P + Oout.P) / 2, (Oin.H + Oout.H) / 2, Oin.X);
    OT = MediumA.temperature(OStateAvg);   
    ORho = abs(MediumA.density(OStateAvg));
    OMu = MediumA.dynamicViscosity(OStateAvg);
    OCp = MediumA.specificHeatCapacityCp(OStateAvg);
    OK = MediumA.thermalConductivity(OStateAvg);
    OPr = OCp * OMu / OK;
    OQ = Oin.G / ORho;
    Vmax = OQ / Sflow;
    Vface = OQ / Sface;
    ORe = iDop * Vmax * ORho / OMu;
    Oa = (iTubePitch - finDiameter) / iDop;
    OReff = 2 * ORe * (finDistance - finThickness) / (finDiameter - iDop);
    OF = (1 + 2 * exp(Oa / 4) / (1 + Oa)) * (0.021 + 27.2 / OReff + 0.29 / OReff ^ 0.2);
    OPlossCorr=1.0;
    OPloss = 2 * OF * iNumRows * Vmax ^ 2 * ORho;
    Oout.P-Oin.P = (-sign(Oin.G) * OPloss) + (Oin.Elevation - Oout.Elevation + 1e-5) * g_n * ORho "momentum change is not taken into account. 1 e-5 is to avoid division by 0";
    
    if iNumRows < 4 then
      if iStaggered == false then
        ONuGan = 0.2 * ORe ^ 0.6 * OPr ^ 0.33333 * (OiArea / IoAreaRaw) ^ (-0.15);
      else
        ONuGan = if iNumRows == 3 then 0.36 * ORe ^ 0.6 * OPr ^ 0.33333 * (OiArea / IoAreaRaw) ^ (-0.15) else 0.33 * ORe ^ 0.6 * OPr ^ 0.33333 * (OiArea / IoAreaRaw) ^ (-0.15);
      end if;
    else
      ONuGan = if iStaggered == true then 0.38 * ORe ^ 0.6 * OPr ^ 0.33333 * (OiArea / IoAreaRaw) ^ (-0.15) else 0.22 * ORe ^ 0.6 * OPr ^ 0.33333 * (OiArea / IoAreaRaw) ^ (-0.15);
    end if;
    ONuBY = 0.134 * ORe ^ 0.681 * OPr ^ 0.3333 * ((finDistance - finThickness) / (finDiameter - iDop)) ^ 0.2 * ((finDistance - finThickness) / finThickness) ^ 0.1134;
    if useBYnusselt == true then
      ONu = ONuBY;
    else
      ONu = ONuGan;
    end if;
      OHi = ONu * OK / iDop;
    if useFins==true then
      OX = 0.5 * OPhi * iDop * (2 * OHi / (finK * finThickness)) ^ 0.5;
      OiEfficiency=1 - (1 - tanh(OX) / OX) * FinsArea / OiArea;
    else
      OX=0;
      OiEfficiency=1;
    end if;
  annotation(
      Icon(graphics = {Line(origin = {-79.8217, -0.588363}, points = {{0, 20}, {0, -20}}), Line(origin = {79.0307, -0.479763}, points = {{0, 20}, {0, -20}, {0, -20}}), Line(origin = {-0.682365, -0.371163}, points = {{-80, 0}, {80, 0}, {80, 0}}), Line(origin = {-70.3095, -0.766643}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-60.705, -0.653653}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-40.818, -0.540663}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-51.2135, -0.653653}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-0.761468, -0.427663}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-11.157, -0.540663}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-20.6485, -0.540663}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-30.253, -0.653653}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {68.4475, -0.427663}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {58.956, -0.427663}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {49.3515, -0.540663}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {38.7865, -0.427663}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {28.391, -0.540663}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {18.8995, -0.540663}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {9.29505, -0.653653}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {68.5605, 19.0638}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-0.569375, 19.1203}, points = {{-80, 0}, {80, 0}, {80, 0}}), Line(origin = {59.069, 19.0638}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {49.4645, 18.9508}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {38.8995, 19.0638}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {28.504, 18.9508}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {19.0125, 18.9508}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {9.40803, 18.8378}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-0.648474, 19.0638}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-11.044, 18.9508}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-20.5355, 18.9508}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-30.14, 18.8378}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-40.705, 18.9508}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-51.1005, 18.8378}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-60.592, 18.8378}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-70.1965, 18.7248}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {68.5605, -20.8797}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-0.56937, -20.8232}, points = {{-80, 0}, {80, 0}, {80, 0}}), Line(origin = {59.069, -20.8797}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {49.4645, -20.9927}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {38.8995, -20.8797}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {28.504, -20.9927}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {19.0125, -20.9927}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {9.40803, -21.1057}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-0.648474, -20.8797}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-11.044, -20.9927}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-20.5355, -20.9927}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-30.14, -21.1057}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-40.705, -20.9927}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-51.1005, -21.1057}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-60.592, -21.1057}, points = {{0, 4}, {0, -4}, {0, -4}}), Line(origin = {-70.1965, -21.2187}, points = {{0, 4}, {0, -4}, {0, -4}}), Ellipse(origin = {-33, -74}, extent = {{-33, 6}, {33, -6}}), Ellipse(origin = {33, -74}, extent = {{-33, 6}, {33, -6}}), Line(origin = {-59.7131, -49.5658}, points = {{0, -14}, {0, 6}, {0, 6}}), Polygon(origin = {-61, -38}, points = {{1, 6}, {-5, -6}, {7, -6}, {1, 6}, {1, 6}}), Line(origin = {-29.5437, -49.4527}, points = {{0, -14}, {0, 6}, {0, 6}}), Polygon(origin = {-31, -38}, points = {{1, 6}, {-5, -6}, {7, -6}, {1, 6}, {1, 6}}), Line(origin = {30.9692, -49.5179}, points = {{0, -14}, {0, 6}, {0, 6}}), Polygon(origin = {29, -38}, points = {{1, 6}, {-5, -6}, {7, -6}, {1, 6}, {1, 6}}), Polygon(origin = {-1, -38}, points = {{1, 6}, {-5, -6}, {7, -6}, {1, 6}, {1, 6}}), Line(origin = {0.0476988, -49.9179}, points = {{0, -14}, {0, 6}, {0, 6}}), Polygon(origin = {59, -38}, points = {{1, 6}, {-5, -6}, {7, -6}, {1, 6}, {1, 6}}), Line(origin = {60.4952, -49.6221}, points = {{0, -14}, {0, 6}, {0, 6}}), Text(origin = {72, 53}, lineColor = {22, 41, 240}, extent = {{-58, -25}, {58, 25}}, textString = "%name")}));
  end GasCooledHEX;
end BaseClasses;