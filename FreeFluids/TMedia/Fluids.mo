within FreeFluids.TMedia;
  package Fluids
    package AceticAcid
      extends FreeFluids.TMedia.TMedium(final mediumName = "AceticAcid", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataAL.AceticAcid}, refState="IIR", reference_T=273.15);
    end AceticAcid;
  
    package Acetone
      extends FreeFluids.TMedia.TMedium(final mediumName = "Acetone", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataAL.Acetone}, refState = "IIR");
    end Acetone;

  package AcrylicAcid
    extends FreeFluids.TMedia.TMedium(final mediumName = "AcrylicAcid", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataAL.AcrylicAcid}, refState="IIR", reference_T=273.15);
  end AcrylicAcid;

    package Ammonia
      extends FreeFluids.TMedia.TMedium(final mediumName = "Ammonia", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataAL.Ammonia}, reference_T = 273.15);
    end Ammonia;

  package Benzene
    extends FreeFluids.TMedia.TMedium(final mediumName = "Benzene", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataAL.Benzene}, refState="IIR", reference_T=273.15);
  end Benzene;

    package Butane_n
      extends TMedium(final mediumName = "Butane_n", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataAL.Butane_n}, refState = "IIR", reference_T = 273.15);
    end Butane_n;

    package Butanol_n
      extends FreeFluids.TMedia.TMedium(final mediumName = "n-Butanol", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataAL.Butanol_n});
    end Butanol_n;
		
    package CO2
      extends FreeFluids.TMedia.TMedium(final mediumName = "Carbon dioxide", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataAL.CO2});
    end CO2;

  package Cyclohexane
    extends FreeFluids.TMedia.TMedium(final mediumName = "Cyclohexane", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataAL.Cyclohexane}, refState="IIR", reference_T=273.15);
  end Cyclohexane;

  package D4
    extends FreeFluids.TMedia.TMedium(final mediumName = "D4", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataAL.D4}, refState="IIR", reference_T=273.15);
  end D4;

  package D5
    extends FreeFluids.TMedia.TMedium(final mediumName = "D5", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataAL.D5}, refState="IIR", reference_T=273.15);
  end D5;

    package DecanoicAcid
      extends FreeFluids.TMedia.TMedium(final mediumName = "DecanoicAcid", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataAL.DecanoicAcid}, refState = "IIR", reference_T = 273.15);
    end DecanoicAcid;

    package Dichlorodifluormethane
      extends FreeFluids.TMedia.TMedium(final mediumName = "Dichlorodifluormethane", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataAL.Dichlorodifluormethane}, reference_T = 273.15, refState = "ASHRAE");
    end Dichlorodifluormethane;

  package Dioxane_1_4
    extends FreeFluids.TMedia.TMedium(final mediumName = "Dioxane_1_4", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataAL.Dioxane_1_4}, refState="IIR", reference_T=273.15);
  end Dioxane_1_4;

    package Ethane
      extends FreeFluids.TMedia.TMedium(final mediumName = "Ethane", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataAL.Ethane}, refState = "IIR", reference_T = 273.15);
    end Ethane;

    package Ethanol
      extends FreeFluids.TMedia.TMedium(final mediumName = "Ethanol", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataAL.Ethanol}, reference_T = 273.15);
    end Ethanol;

    package EthyleneGlycol
      extends FreeFluids.TMedia.TMedium(final mediumName = "Ethylene glycol", final singleState = false, p_default = 3.0e5, T_default = 423.15, fluidConstants = {FreeFluids.MediaCommon.MediaDataAL.EthyleneGlycol});
    end EthyleneGlycol;
    
    package Heptane_n
      extends FreeFluids.TMedia.TMedium(final mediumName = "n-Heptane", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataAL.Heptane_n}, refState = "IIR", reference_T = 273.15);
    end Heptane_n;

    package Hexane_n
      extends FreeFluids.TMedia.TMedium(final mediumName = "n-Hexane", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataAL.Hexane_n}, refState = "IIR", reference_T = 273.15, p_default = 5.0e5, T_default = 293.15);
    end Hexane_n;

    package Isobutane
      extends FreeFluids.TMedia.TMedium(final mediumName = "Isobutane", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataAL.Isobutane}, reference_T = 273.15);
    end Isobutane;

    package MarlothermSH
      extends FreeFluids.TMedia.TMedium(final mediumName = "Marlotherm SH", final singleState = false, onePhase=true, p_default = 3.0e5, T_default = 473.15, reference_T = 273.15, fluidConstants = {FreeFluids.MediaCommon.MediaDataMZ.MarlothermSH});
    end MarlothermSH;

    package Methane
      extends TMedium(final mediumName = "Methane", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataMZ.Methane}, refState = "IIR", reference_T = 273.15);
    end Methane;
    
    package Methanol
      extends FreeFluids.TMedia.TMedium(final mediumName = "Methanol", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataMZ.Methanol}, refState="IIR", reference_T=273.15);
    end Methanol;

  package MethylEthylKetone
    extends FreeFluids.TMedia.TMedium(final mediumName = "MethylEthylKetone", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataMZ.MethylEthylKetone}, refState="IIR", reference_T=273.15);
  end MethylEthylKetone;

  package MethylMethacrylate
    extends FreeFluids.TMedia.TMedium(final mediumName = "MethylMethacrylate", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataMZ.MethylMethacrylate}, refState="IIR", reference_T=273.15);
  end MethylMethacrylate;

    package N2
      extends FreeFluids.TMedia.TMedium(final mediumName = "Nitrogen", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataMZ.N2});
    end N2;

  package Nonane_n
    extends FreeFluids.TMedia.TMedium(final mediumName = "Nonane_n", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataMZ.Nonane_n}, refState="IIR", reference_T=273.15);
  end Nonane_n;

    package O2
      extends FreeFluids.TMedia.TMedium(final mediumName = "Oxygen", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataMZ.O2});
    end O2;

  package Octane_n
    extends FreeFluids.TMedia.TMedium(final mediumName = "Octane_n", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataMZ.Octane_n}, refState="IIR", reference_T=273.15);
  end Octane_n;

    package Pentane_n
      extends TMedium(final mediumName = "Pentane_n", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataMZ.Pentane_n}, refState = "IIR", reference_T = 273.15);
    end Pentane_n;

  package PhthalicAnhydride
    extends FreeFluids.TMedia.TMedium(final mediumName = "PhthalicAnhydride", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataMZ.PhthalicAnhydride}, refState="IIR", reference_T=273.15);
  end PhthalicAnhydride;

  package Propanal
    extends FreeFluids.TMedia.TMedium(final mediumName = "Propanal", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataMZ.Propanal}, refState="IIR", reference_T=273.15);
  end Propanal;  

    package Propane
      extends TMedium(final mediumName = "Propane", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataMZ.Propane}, refState = "NBP");
    end Propane;

  package PropyleneGlycol
    extends FreeFluids.TMedia.TMedium(final mediumName = "PropyleneGlycol", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataMZ.PropyleneGlycol}, refState="IIR", reference_T=273.15);
  end PropyleneGlycol;

    package R134A
      extends TMedium(final mediumName = "R134A", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataMZ.R134A}, refState = "ASHRAE", reference_T = 273.15);
    end R134A;

    package R410A
      extends TMedium(final mediumName = "R410A", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataMZ.R410A}, refState = "ASHRAE", reference_T = 273.15);
    end R410A;

    package ShellS2
      extends FreeFluids.TMedia.TMedium(final mediumName = "Shell S2", final singleState = false, onePhase=true, p_default = 3.0e5, T_default = 473.15, reference_T = 273.15, fluidConstants = {FreeFluids.MediaCommon.MediaDataMZ.ShellS2});
    end ShellS2;

  package Styrene
    extends FreeFluids.TMedia.TMedium(final mediumName = "Styrene", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataMZ.Styrene}, refState="IIR", reference_T=273.15);
  end Styrene;

  package SulfurDioxide
    extends FreeFluids.TMedia.TMedium(final mediumName = "SulfurDioxide", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataMZ.SulfurDioxide}, refState="IIR", reference_T=273.15);
  end SulfurDioxide;

    package Toluene
      extends FreeFluids.TMedia.TMedium(final mediumName = "Toluene", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataMZ.Toluene}, reference_T = 273.15, p_default = 5.0e5, T_default = 393.15);
    end Toluene;

    package Water
      extends FreeFluids.TMedia.TMedium(final mediumName = "Water", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataMZ.Water}, reference_T = 273.16, refState = "User", p_default = 5.0e5, T_default = 393.15);
    end Water;

    package Xylene_m
      extends FreeFluids.TMedia.TMedium(final mediumName = "Xylene_m", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataMZ.Xylene_m}, refState = "NBP", reference_T = 273.15);
    end Xylene_m;
    
  package Xylene_p
    extends FreeFluids.TMedia.TMedium(final mediumName = "Xylene_p", final singleState = false, fluidConstants = {FreeFluids.MediaCommon.MediaDataMZ.Xylene_p}, refState="IIR", reference_T=273.15);
  end Xylene_p;
  end Fluids;
