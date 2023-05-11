<?xml version="1.0" encoding="UTF-8"?>
<!-- generated with COPASI 4.38 (Build 268) (http://www.copasi.org) at 2023-05-09T10:11:38Z -->
<?oxygen RNGSchema="http://www.copasi.org/static/schema/CopasiML.rng" type="xml"?>
<COPASI xmlns="http://www.copasi.org/static/schema" versionMajor="4" versionMinor="38" versionDevel="268" copasiSourcesModified="0">
  <ListOfFunctions>
    <Function key="Function_40" name="Rate Law for PPA" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_40">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2021-04-23T10:12:45Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        E_PPA*kcat_F*(1/(1+(Km_PP/PP)))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_264" name="E_PPA" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_263" name="kcat_F" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_262" name="PP" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_261" name="Km_PP" order="3" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_41" name="Rate Law for PPK3_A" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_41">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2021-04-23T10:18:35Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        E_PPK3*(((kcat_F*(ADP/Km_ADP))-(kcat_F*(1/K_eq_PPK3_A)*(ATP/(Km_ADP))))/((1+(ADP/Km_ADP))+(1+(ATP/Km_ATP))-1))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_267" name="E_PPK3" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_266" name="kcat_F" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_265" name="ADP" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_250" name="Km_ADP" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_268" name="ATP" order="4" role="product"/>
        <ParameterDescription key="FunctionParameter_269" name="Km_ATP" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_270" name="K_eq_PPK3_A" order="6" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_42" name="Rate Law for FKP (fucokinase)" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_42">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2021-07-16T11:37:19Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        E_FKP*(((kcat_F*(Fuc/Km_Fuc)*(ATP/Km_ATP))-(kcat_F*(1/K_eq_FKP_fk)*((Fuc1P*ADP)/(Km_Fuc*Km_ATP))))/(((1+(Fuc/Km_Fuc))*(1+(ATP/Km_ATP)))+(((1+(Fuc1P/Km_Fuc1P))*(1+(ADP/Km_ADP)))-1)))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_277" name="E_FKP" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_276" name="kcat_F" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_275" name="Fuc" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_274" name="Km_Fuc" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_273" name="ATP" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_272" name="Km_ATP" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_271" name="Fuc1P" order="6" role="product"/>
        <ParameterDescription key="FunctionParameter_278" name="Km_Fuc1P" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_279" name="ADP" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_280" name="Km_ADP" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_281" name="K_eq_FKP_fk" order="10" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_43" name="Rate Law for FKP (guanylyltransferase)" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_43">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2021-07-16T11:46:13Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        ((ki_PP)/(ki_PP+PP))*(E_FKP*(((kcat_F*(Fuc1P/Km_Fuc1P)*(GTP/Km_GTP))-(kcat_F*(1/K_eq_FKP_gt)*((GDP_Fuc*PP)/(Km_Fuc1P*Km_GTP))))/(((1+(Fuc1P/Km_Fuc1P))*(1+(GTP/Km_GTP)))+((1+(GDP_Fuc/Km_GDP_Fuc))*(1+(PP/Km_PP)))-1)))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_292" name="E_FKP" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_291" name="kcat_F" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_290" name="Fuc1P" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_289" name="Km_Fuc1P" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_288" name="GTP" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_287" name="Km_GTP" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_286" name="GDP_Fuc" order="6" role="product"/>
        <ParameterDescription key="FunctionParameter_285" name="Km_GDP_Fuc" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_284" name="PP" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_283" name="Km_PP" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_282" name="K_eq_FKP_gt" order="10" role="constant"/>
        <ParameterDescription key="FunctionParameter_293" name="ki_PP" order="11" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_44" name="Rate Law for PPK3_G" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_44">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2021-07-16T11:48:13Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        E_PPK3*(((kcat_F*(GDP/Km_GDP))-(kcat_F*(1/K_eq_PPK3_G)*(GTP/Km_GDP)))/((1+(GDP/Km_GDP))+(1+(GTP/Km_GTP))-1))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_305" name="E_PPK3" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_304" name="kcat_F" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_303" name="GDP" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_302" name="Km_GDP" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_301" name="GTP" order="4" role="product"/>
        <ParameterDescription key="FunctionParameter_300" name="Km_GTP" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_299" name="K_eq_PPK3_G" order="6" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_45" name="Rate Law for GMPK" type="UserDefined" reversible="unspecified">
      <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Function_45">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2021-07-16T11:52:22Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        E_GMPK*(((kcat_F*(GMP/Km_GMP)*(ATP/Km_ATP))-(kcat_F*(1/K_eq_GMPK)*((GDP*ADP)/(Km_GMP*Km_ATP))))/(((1+(GMP/Km_GMP))*(1+(ATP/Km_ATP)))+((1+(GDP/Km_GDP))*(1+(ADP/Km_ADP)))-1))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_307" name="E_GMPK" order="0" role="modifier"/>
        <ParameterDescription key="FunctionParameter_306" name="kcat_F" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_294" name="GMP" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_295" name="Km_GMP" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_296" name="ATP" order="4" role="substrate"/>
        <ParameterDescription key="FunctionParameter_297" name="Km_ATP" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_298" name="GDP" order="6" role="product"/>
        <ParameterDescription key="FunctionParameter_308" name="Km_GDP" order="7" role="constant"/>
        <ParameterDescription key="FunctionParameter_309" name="ADP" order="8" role="product"/>
        <ParameterDescription key="FunctionParameter_310" name="Km_ADP" order="9" role="constant"/>
        <ParameterDescription key="FunctionParameter_311" name="K_eq_GMPK" order="10" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
  </ListOfFunctions>
  <Model key="Model_1" name="GDP-Fucose_v7XGSK" simulationType="time" timeUnit="h" volumeUnit="l" areaUnit="m²" lengthUnit="m" quantityUnit="mmol" type="deterministic" avogadroConstant="6.0221408570000002e+23">
    <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Model_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2021-03-12T13:42:48Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

    </MiriamAnnotation>
    <Comment>
      GDP-Fucose Model

Cell-free production of GDP-Fucose from Fucose, Guanosine, ATP and PolyP (created by Reza Mahour and Dr. Thomas Rexer)

includes PPA reaction to convert diphosphate to 2 inorganic phosphates

XGSK = GSK reaction (Guanosine -> GMP) removed; start directly with initial GMP
    </Comment>
    <ListOfCompartments>
      <Compartment key="Compartment_0" name="compartment" simulationType="fixed" dimensionality="3" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Compartment_0">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2021-03-12T13:47:34Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Compartment>
    </ListOfCompartments>
    <ListOfMetabolites>
      <Metabolite key="Metabolite_0" name="PP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_4">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2021-03-12T13:48:30Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_1" name="P" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2021-03-12T13:48:43Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_2" name="ATP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_2">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2021-03-12T13:49:11Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_3" name="ADP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_3">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2021-03-12T13:49:26Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_4" name="E_PPA" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_4">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2021-04-23T10:13:23Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_5" name="E_PPK3" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_5">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2021-04-23T10:19:14Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_6" name="E_FKP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_6">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2021-07-16T11:37:19Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_7" name="Fuc" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_20">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2021-07-16T11:37:19Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_8" name="Fuc1P" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_20">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2021-07-16T11:37:19Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_9" name="GDP_Fucose" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_9">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2021-07-16T11:41:01Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_10" name="GTP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_23">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2021-07-16T11:41:01Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_11" name="GDP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_11">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2021-07-16T11:48:11Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_12" name="GMP" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Metabolite_26">
<dcterms:created>
<rdf:Description>
<dcterms:W3CDTF>2021-07-16T11:50:04Z</dcterms:W3CDTF>
</rdf:Description>
</dcterms:created>
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_13" name="E_GMPK" simulationType="reactions" compartment="Compartment_0" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_13">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2021-07-16T11:52:22Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
    </ListOfMetabolites>
    <ListOfModelValues>
      <ModelValue key="ModelValue_0" name="GDP-Fucose at 40h" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" />
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1" name="E_tot" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" />
        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[E_FKP],Reference=InitialConcentration>+&lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[E_GMPK],Reference=InitialConcentration>+&lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[E_PPA],Reference=InitialConcentration>+&lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[E_PPK3],Reference=InitialConcentration>
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_2" name="GDP_Fucose_at_24h" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" />
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_3" name="Yield_Fucose" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" />
        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[GDP_Fucose_at_24h],Reference=Value>/&lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[Dyn. Updated Initial Fucose Conc],Reference=Value>
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_4" name="Yield_GMP" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" />
        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[GDP_Fucose_at_24h],Reference=Value>/&lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[Dyn. Updated Initial GMP Conc],Reference=Value>
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_5" name="Substrate Weighted Cost" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" />
        </MiriamAnnotation>
        <Comment>
          Extra factors are used to convert mmol/l concentrations to g/l concentrations since prices are given as Euros/g:
sructure of the terms: price * mmol/l concentration * MW in g/mmol

-> unit of the toal weighted sum will be: (Euros/g)*(mmol/l)*(g/mmol) = Euros/l
        </Comment>
        <Expression>
          0.25*&lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[GMP],Reference=InitialConcentration>*0.36322+5.66*&lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[Fuc],Reference=InitialConcentration>*0.16416+0.51*&lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[ATP],Reference=InitialConcentration>*0.50718
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_6" name="Productivity" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" />
        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[GDP_Fucose_at_24h],Reference=Value>/&lt;CN=Root,Model=GDP-Fucose_v7XGSK,Reference=Time>
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_7" name="S_tot" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" />
        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[Fuc],Reference=InitialConcentration>+&lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[GMP],Reference=InitialConcentration>+&lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[ATP],Reference=InitialConcentration>
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_8" name="Dyn. Updated Initial Fucose Conc" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" />
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_9" name="Dyn. Updated Initial GMP Conc" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" />
        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_10" name="Enzyme Weighted Cost" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" />
        </MiriamAnnotation>
        <Comment>
          Extra factors are used to convert mmol/l concentrations to g/l concentrations since prices are given as Euros/g:
sructure of the terms: price * mmol/l concentration * MW in g/mmol

-> unit of the toal weighted sum will be: (Euros/g)*(mmol/l)*(g/mmol) = Euros/l
        </Comment>
        <Expression>
          200.449*&lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[E_FKP],Reference=InitialConcentration>*105.66+58.64511*&lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[E_GMPK],Reference=InitialConcentration>*23.592+162.4384*&lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[E_PPA],Reference=InitialConcentration>*19.313+541.7541*&lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[E_PPK3],Reference=InitialConcentration>*34.74
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_11" name="Fixed Cost" simulationType="fixed" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" />
        </MiriamAnnotation>
        <Comment>
          (10h * 50 Euros/h) / 1 litre
Unit: Euros/l
        </Comment>
      </ModelValue>
      <ModelValue key="ModelValue_12" name="Cost per Product" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" />
        </MiriamAnnotation>
        <Comment>
          Unit: (Euros/litre) / (mmol/litre) -> Euros/mmol
        </Comment>
        <Expression>
          (&lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[Enzyme Weighted Cost],Reference=InitialValue>+&lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[Substrate Weighted Cost],Reference=InitialValue>+&lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[Fixed Cost],Reference=InitialValue>)/&lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[GDP_Fucose_at_24h],Reference=Value>
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_13" name="E_tot_MW" simulationType="assignment" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" />
        </MiriamAnnotation>
        <Expression>
          105.66*&lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[E_FKP],Reference=InitialConcentration>+23.592*&lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[E_GMPK],Reference=InitialConcentration>+19.313*&lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[E_PPA],Reference=InitialConcentration>+34.74*&lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[E_PPK3],Reference=InitialConcentration>
        </Expression>
      </ModelValue>
    </ListOfModelValues>
    <ListOfReactions>
      <Reaction key="Reaction_0" name="FKP (fucokinase)" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_0">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2021-03-12T13:47:22Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_7" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_2" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_8" stoichiometry="1"/>
          <Product metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_6" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_6913" name="kcat_F" value="2090.24"/>
          <Constant key="Parameter_6912" name="Km_Fuc" value="0.0829302"/>
          <Constant key="Parameter_6910" name="Km_ATP" value="67.3693"/>
          <Constant key="Parameter_6909" name="Km_Fuc1P" value="329.877"/>
          <Constant key="Parameter_6911" name="Km_ADP" value="589.44"/>
          <Constant key="Parameter_6908" name="K_eq_FKP_fk" value="4"/>
        </ListOfConstants>
        <KineticLaw function="Function_42" unitType="Default" scalingCompartment="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_277">
              <SourceParameter reference="Metabolite_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_276">
              <SourceParameter reference="Parameter_6913"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_275">
              <SourceParameter reference="Metabolite_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_274">
              <SourceParameter reference="Parameter_6912"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_273">
              <SourceParameter reference="Metabolite_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_272">
              <SourceParameter reference="Parameter_6910"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_271">
              <SourceParameter reference="Metabolite_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_278">
              <SourceParameter reference="Parameter_6909"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_279">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_280">
              <SourceParameter reference="Parameter_6911"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_281">
              <SourceParameter reference="Parameter_6908"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1" name="FKP (guanylyltransferase)" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2021-03-12T13:48:03Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_8" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_10" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_9" stoichiometry="1"/>
          <Product metabolite="Metabolite_0" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_6" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_6907" name="kcat_F" value="186930"/>
          <Constant key="Parameter_6905" name="Km_Fuc1P" value="0.000189157"/>
          <Constant key="Parameter_6904" name="Km_GTP" value="68.4462"/>
          <Constant key="Parameter_6906" name="Km_GDP_Fuc" value="58.1025"/>
          <Constant key="Parameter_6903" name="Km_PP" value="16.4335"/>
          <Constant key="Parameter_6902" name="K_eq_FKP_gt" value="20"/>
          <Constant key="Parameter_6900" name="ki_PP" value="5.50658e-07"/>
        </ListOfConstants>
        <KineticLaw function="Function_43" unitType="Default" scalingCompartment="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_292">
              <SourceParameter reference="Metabolite_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_291">
              <SourceParameter reference="Parameter_6907"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_290">
              <SourceParameter reference="Metabolite_8"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_289">
              <SourceParameter reference="Parameter_6905"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_288">
              <SourceParameter reference="Metabolite_10"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_287">
              <SourceParameter reference="Parameter_6904"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_286">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_285">
              <SourceParameter reference="Parameter_6906"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_284">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_283">
              <SourceParameter reference="Parameter_6903"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_282">
              <SourceParameter reference="Parameter_6902"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_293">
              <SourceParameter reference="Parameter_6900"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_2" name="PPA" reversible="false" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_2">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2021-03-12T13:48:33Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_0" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_1" stoichiometry="2"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_4" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_6899" name="kcat_F" value="704161"/>
          <Constant key="Parameter_6901" name="Km_PP" value="0.499668"/>
        </ListOfConstants>
        <KineticLaw function="Function_40" unitType="Default" scalingCompartment="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_264">
              <SourceParameter reference="Metabolite_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_263">
              <SourceParameter reference="Parameter_6899"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_262">
              <SourceParameter reference="Metabolite_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_261">
              <SourceParameter reference="Parameter_6901"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_3" name="GMPK" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_3">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2021-03-12T13:49:15Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_12" stoichiometry="1"/>
          <Substrate metabolite="Metabolite_2" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_11" stoichiometry="1"/>
          <Product metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_13" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_6898" name="kcat_F" value="970528"/>
          <Constant key="Parameter_6897" name="Km_GMP" value="0.480157"/>
          <Constant key="Parameter_6895" name="Km_ATP" value="0.0927887"/>
          <Constant key="Parameter_6894" name="Km_GDP" value="1.98525"/>
          <Constant key="Parameter_6896" name="Km_ADP" value="69.5606"/>
          <Constant key="Parameter_6893" name="K_eq_GMPK" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_45" unitType="Default" scalingCompartment="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_307">
              <SourceParameter reference="Metabolite_13"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_306">
              <SourceParameter reference="Parameter_6898"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_294">
              <SourceParameter reference="Metabolite_12"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_295">
              <SourceParameter reference="Parameter_6897"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_296">
              <SourceParameter reference="Metabolite_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_297">
              <SourceParameter reference="Parameter_6895"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_298">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_308">
              <SourceParameter reference="Parameter_6894"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_309">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_310">
              <SourceParameter reference="Parameter_6896"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_311">
              <SourceParameter reference="Parameter_6893"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_4" name="PPK3_G" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_4">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2021-03-12T13:50:05Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_10" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_6892" name="kcat_F" value="178908"/>
          <Constant key="Parameter_7530" name="Km_GDP" value="4.06803"/>
          <Constant key="Parameter_7531" name="Km_GTP" value="0.234493"/>
          <Constant key="Parameter_7533" name="K_eq_PPK3_G" value="1.81168"/>
        </ListOfConstants>
        <KineticLaw function="Function_44" unitType="Default" scalingCompartment="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_305">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_304">
              <SourceParameter reference="Parameter_6892"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_303">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_302">
              <SourceParameter reference="Parameter_7530"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_301">
              <SourceParameter reference="Metabolite_10"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_300">
              <SourceParameter reference="Parameter_7531"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_299">
              <SourceParameter reference="Parameter_7533"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_5" name="PPK3_A" reversible="true" fast="false" addNoise="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_5">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2021-03-12T14:00:05Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfProducts>
          <Product metabolite="Metabolite_2" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_5" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_7529" name="kcat_F" value="129129"/>
          <Constant key="Parameter_7532" name="Km_ADP" value="2.0836"/>
          <Constant key="Parameter_7505" name="Km_ATP" value="0.0696633"/>
          <Constant key="Parameter_7506" name="K_eq_PPK3_A" value="0.897652"/>
        </ListOfConstants>
        <KineticLaw function="Function_41" unitType="Default" scalingCompartment="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment]">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_267">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_266">
              <SourceParameter reference="Parameter_7529"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_265">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_250">
              <SourceParameter reference="Parameter_7532"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_268">
              <SourceParameter reference="Metabolite_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_269">
              <SourceParameter reference="Parameter_7505"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_270">
              <SourceParameter reference="Parameter_7506"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
    </ListOfReactions>
    <ListOfEvents>
      <Event key="Event_0" name="Save GDP-Fucose at 40h" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" />
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=GDP-Fucose_v7XGSK,Reference=Time> == 40
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[GDP-Fucose at 40h]" targetKey="ModelValue_0">
            <Expression>
              &lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[GDP_Fucose],Reference=Concentration>
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_1" name="Save GDP-Fucose at 24h" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" />
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=GDP-Fucose_v7XGSK,Reference=Time> == 24
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[GDP_Fucose_at_24h]" targetKey="ModelValue_2">
            <Expression>
              &lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[GDP_Fucose],Reference=Concentration>
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_2" name="Save Initial Fucose Conc" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" />
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=GDP-Fucose_v7XGSK,Reference=Time> == 0.00000000001
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[Dyn. Updated Initial Fucose Conc]" targetKey="ModelValue_8">
            <Expression>
              &lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[Fuc],Reference=Concentration>
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
      <Event key="Event_3" name="Save Initial GMP Conc" fireAtInitialTime="0" persistentTrigger="0">
        <MiriamAnnotation>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" />
        </MiriamAnnotation>
        <TriggerExpression>
          &lt;CN=Root,Model=GDP-Fucose_v7XGSK,Reference=Time> == 0.00000000001
        </TriggerExpression>
        <ListOfAssignments>
          <Assignment target="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[Dyn. Updated Initial GMP Conc]" targetKey="ModelValue_9">
            <Expression>
              &lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[GMP],Reference=Concentration>
            </Expression>
          </Assignment>
        </ListOfAssignments>
      </Event>
    </ListOfEvents>
    <ListOfModelParameterSets activeSet="ModelParameterSet_1">
      <ModelParameterSet key="ModelParameterSet_1" name="Initial State">
        <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#ModelParameterSet_1">
</rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[PP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[P]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[ATP]" value="3.6132845141999999e+21" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[ADP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[E_PPA]" value="1.8709081354695614e+19" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[E_PPK3]" value="1.7334889032536783e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[E_FKP]" value="3.9896827709005578e+18" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[Fuc]" value="1.5476902002489999e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[Fuc1P]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[GDP_Fucose]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[GTP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[GDP]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[GMP]" value="1.5476902002489999e+22" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[E_GMPK]" value="3.8289295495060562e+18" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[GDP-Fucose at 40h]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[E_tot]" value="0.046928797000000001" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[GDP_Fucose_at_24h]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[Yield_Fucose]" value="NaN" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[Yield_GMP]" value="NaN" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[Substrate Weighted Cost]" value="27.764701219999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[Productivity]" value="NaN" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[S_tot]" value="57.399999999999999" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[Dyn. Updated Initial Fucose Conc]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[Dyn. Updated Initial GMP Conc]" value="0" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[Enzyme Weighted Cost]" value="300.74952926938772" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[Fixed Cost]" value="500" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[Cost per Product]" value="INF" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[E_tot_MW]" value="1.550000078664" type="ModelValue" simulationType="assignment"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[FKP (fucokinase)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[FKP (fucokinase)],ParameterGroup=Parameters,Parameter=kcat_F" value="2090.2399999999998" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[FKP (fucokinase)],ParameterGroup=Parameters,Parameter=Km_Fuc" value="0.082930199999999996" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[FKP (fucokinase)],ParameterGroup=Parameters,Parameter=Km_ATP" value="67.369299999999996" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[FKP (fucokinase)],ParameterGroup=Parameters,Parameter=Km_Fuc1P" value="329.87700000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[FKP (fucokinase)],ParameterGroup=Parameters,Parameter=Km_ADP" value="589.44000000000005" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[FKP (fucokinase)],ParameterGroup=Parameters,Parameter=K_eq_FKP_fk" value="4" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[FKP (guanylyltransferase)]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[FKP (guanylyltransferase)],ParameterGroup=Parameters,Parameter=kcat_F" value="186930" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[FKP (guanylyltransferase)],ParameterGroup=Parameters,Parameter=Km_Fuc1P" value="0.00018915699999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[FKP (guanylyltransferase)],ParameterGroup=Parameters,Parameter=Km_GTP" value="68.446200000000005" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[FKP (guanylyltransferase)],ParameterGroup=Parameters,Parameter=Km_GDP_Fuc" value="58.102499999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[FKP (guanylyltransferase)],ParameterGroup=Parameters,Parameter=Km_PP" value="16.433499999999999" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[FKP (guanylyltransferase)],ParameterGroup=Parameters,Parameter=K_eq_FKP_gt" value="20" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[FKP (guanylyltransferase)],ParameterGroup=Parameters,Parameter=ki_PP" value="5.5065799999999998e-07" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[PPA]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[PPA],ParameterGroup=Parameters,Parameter=kcat_F" value="704161" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[PPA],ParameterGroup=Parameters,Parameter=Km_PP" value="0.499668" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[GMPK]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[GMPK],ParameterGroup=Parameters,Parameter=kcat_F" value="970528" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[GMPK],ParameterGroup=Parameters,Parameter=Km_GMP" value="0.480157" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[GMPK],ParameterGroup=Parameters,Parameter=Km_ATP" value="0.092788700000000002" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[GMPK],ParameterGroup=Parameters,Parameter=Km_GDP" value="1.98525" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[GMPK],ParameterGroup=Parameters,Parameter=Km_ADP" value="69.560599999999994" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[GMPK],ParameterGroup=Parameters,Parameter=K_eq_GMPK" value="1" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[PPK3_G]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[PPK3_G],ParameterGroup=Parameters,Parameter=kcat_F" value="178908" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[PPK3_G],ParameterGroup=Parameters,Parameter=Km_GDP" value="4.0680300000000003" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[PPK3_G],ParameterGroup=Parameters,Parameter=Km_GTP" value="0.23449300000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[PPK3_G],ParameterGroup=Parameters,Parameter=K_eq_PPK3_G" value="1.81168" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[PPK3_A]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[PPK3_A],ParameterGroup=Parameters,Parameter=kcat_F" value="129129" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[PPK3_A],ParameterGroup=Parameters,Parameter=Km_ADP" value="2.0836000000000001" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[PPK3_A],ParameterGroup=Parameters,Parameter=Km_ATP" value="0.069663299999999997" type="ReactionParameter" simulationType="fixed"/>
            <ModelParameter cn="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Reactions[PPK3_A],ParameterGroup=Parameters,Parameter=K_eq_PPK3_A" value="0.89765200000000001" type="ReactionParameter" simulationType="fixed"/>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
    </ListOfModelParameterSets>
    <StateTemplate>
      <StateTemplateVariable objectReference="Model_1"/>
      <StateTemplateVariable objectReference="Metabolite_1"/>
      <StateTemplateVariable objectReference="Metabolite_2"/>
      <StateTemplateVariable objectReference="Metabolite_10"/>
      <StateTemplateVariable objectReference="Metabolite_11"/>
      <StateTemplateVariable objectReference="Metabolite_8"/>
      <StateTemplateVariable objectReference="Metabolite_0"/>
      <StateTemplateVariable objectReference="Metabolite_9"/>
      <StateTemplateVariable objectReference="Metabolite_7"/>
      <StateTemplateVariable objectReference="Metabolite_3"/>
      <StateTemplateVariable objectReference="Metabolite_12"/>
      <StateTemplateVariable objectReference="ModelValue_1"/>
      <StateTemplateVariable objectReference="ModelValue_3"/>
      <StateTemplateVariable objectReference="ModelValue_4"/>
      <StateTemplateVariable objectReference="ModelValue_5"/>
      <StateTemplateVariable objectReference="ModelValue_6"/>
      <StateTemplateVariable objectReference="ModelValue_7"/>
      <StateTemplateVariable objectReference="ModelValue_10"/>
      <StateTemplateVariable objectReference="ModelValue_12"/>
      <StateTemplateVariable objectReference="ModelValue_13"/>
      <StateTemplateVariable objectReference="Metabolite_4"/>
      <StateTemplateVariable objectReference="Metabolite_5"/>
      <StateTemplateVariable objectReference="Metabolite_6"/>
      <StateTemplateVariable objectReference="Metabolite_13"/>
      <StateTemplateVariable objectReference="Compartment_0"/>
      <StateTemplateVariable objectReference="ModelValue_0"/>
      <StateTemplateVariable objectReference="ModelValue_2"/>
      <StateTemplateVariable objectReference="ModelValue_8"/>
      <StateTemplateVariable objectReference="ModelValue_9"/>
      <StateTemplateVariable objectReference="ModelValue_11"/>
    </StateTemplate>
    <InitialState type="initialState">
      0 0 3.6132845141999999e+21 0 0 0 0 0 1.5476902002489999e+22 0 1.5476902002489999e+22 0.046928797000000001 NaN NaN 27.764701219999999 NaN 57.399999999999999 300.74952926938772 INF 1.550000078664 1.8709081354695614e+19 1.7334889032536783e+18 3.9896827709005578e+18 3.8289295495060562e+18 1 0 0 0 0 500 
    </InitialState>
  </Model>
  <ListOfTasks>
    <Task key="Task_17" name="Steady-State" type="steadyState" scheduled="false" updateModel="false">
      <Report reference="Report_11" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="JacobianRequested" type="bool" value="1"/>
        <Parameter name="StabilityAnalysisRequested" type="bool" value="1"/>
      </Problem>
      <Method name="Enhanced Newton" type="EnhancedNewton">
        <Parameter name="Resolution" type="unsignedFloat" value="1.0000000000000001e-09"/>
        <Parameter name="Derivation Factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Use Newton" type="bool" value="1"/>
        <Parameter name="Use Integration" type="bool" value="1"/>
        <Parameter name="Use Back Integration" type="bool" value="0"/>
        <Parameter name="Accept Negative Concentrations" type="bool" value="0"/>
        <Parameter name="Iteration Limit" type="unsignedInteger" value="50"/>
        <Parameter name="Maximum duration for forward integration" type="unsignedFloat" value="1000000000"/>
        <Parameter name="Maximum duration for backward integration" type="unsignedFloat" value="1000000"/>
        <Parameter name="Target Criterion" type="string" value="Distance and Rate"/>
      </Method>
    </Task>
    <Task key="Task_18" name="Time-Course" type="timeCourse" scheduled="false" updateModel="false">
      <Report reference="Report_12" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="2400"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="24"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="100000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
    <Task key="Task_19" name="Scan" type="scan" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="Subtask" type="unsignedInteger" value="1"/>
        <ParameterGroup name="ScanItems">
        </ParameterGroup>
        <Parameter name="Output in subtask" type="bool" value="1"/>
        <Parameter name="Adjust initial conditions" type="bool" value="0"/>
        <Parameter name="Continue on Error" type="bool" value="0"/>
      </Problem>
      <Method name="Scan Framework" type="ScanFramework">
      </Method>
    </Task>
    <Task key="Task_20" name="Elementary Flux Modes" type="fluxMode" scheduled="false" updateModel="false">
      <Report reference="Report_13" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="EFM Algorithm" type="EFMAlgorithm">
      </Method>
    </Task>
    <Task key="Task_21" name="Optimization" type="optimization" scheduled="false" updateModel="false">
      <Report reference="Report_14" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Subtask" type="cn" value="CN=Root,Vector=TaskList[Time-Course]"/>
        <ParameterText name="ObjectiveExpression" type="expression">
          &lt;CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[GDP_Fucose_at_24h],Reference=Value>
        </ParameterText>
        <Parameter name="Maximize" type="bool" value="1"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
          <ParameterGroup name="OptimizationItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[E_FKP],Reference=InitialConcentration"/>
            <Parameter name="LowerBound" type="cn" value="0.00021"/>
            <Parameter name="UpperBound" type="cn" value="0.01491"/>
            <Parameter name="StartValue" type="float" value="0.0066250240000000002"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[E_GMPK],Reference=InitialConcentration"/>
            <Parameter name="LowerBound" type="cn" value="0.002413333"/>
            <Parameter name="UpperBound" type="cn" value="0.50706"/>
            <Parameter name="StartValue" type="float" value="0.0063580870000000001"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[E_PPA],Reference=InitialConcentration"/>
            <Parameter name="LowerBound" type="cn" value="0.00319"/>
            <Parameter name="UpperBound" type="cn" value="0.22363"/>
            <Parameter name="StartValue" type="float" value="0.03106716"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[E_PPK3],Reference=InitialConcentration"/>
            <Parameter name="LowerBound" type="cn" value="0.00018"/>
            <Parameter name="UpperBound" type="cn" value="0.0129"/>
            <Parameter name="StartValue" type="float" value="0.0028785260000000002"/>
          </ParameterGroup>
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
          <ParameterGroup name="OptimizationItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Values[E_tot],Reference=Value"/>
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="UpperBound" type="cn" value="0.04693"/>
            <Parameter name="StartValue" type="float" value="0.32621923279999998"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[ADP],Reference=Concentration"/>
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="UpperBound" type="cn" value="inf"/>
            <Parameter name="StartValue" type="float" value="1.5293241930000001"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[ATP],Reference=Concentration"/>
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="UpperBound" type="cn" value="inf"/>
            <Parameter name="StartValue" type="float" value="4.4373670379999997"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[Fuc1P],Reference=Concentration"/>
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="UpperBound" type="cn" value="inf"/>
            <Parameter name="StartValue" type="float" value="6.1923853580000001"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[Fuc],Reference=Concentration"/>
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="UpperBound" type="cn" value="inf"/>
            <Parameter name="StartValue" type="float" value="1.5555044410000001e-06"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[GDP],Reference=Concentration"/>
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="UpperBound" type="cn" value="inf"/>
            <Parameter name="StartValue" type="float" value="1.1341575450000001"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[GDP_Fucose],Reference=Concentration"/>
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="UpperBound" type="cn" value="inf"/>
            <Parameter name="StartValue" type="float" value="16.80761309"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[GMP],Reference=Concentration"/>
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="UpperBound" type="cn" value="inf"/>
            <Parameter name="StartValue" type="float" value="0.083830605429999996"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[GTP],Reference=Concentration"/>
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="UpperBound" type="cn" value="inf"/>
            <Parameter name="StartValue" type="float" value="4.1624593130000003"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[PP],Reference=Concentration"/>
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="UpperBound" type="cn" value="inf"/>
            <Parameter name="StartValue" type="float" value="1.864877629"/>
          </ParameterGroup>
          <ParameterGroup name="OptimizationItem">
            <Parameter name="ObjectCN" type="cn" value="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[P],Reference=Concentration"/>
            <Parameter name="LowerBound" type="cn" value="0"/>
            <Parameter name="UpperBound" type="cn" value="inf"/>
            <Parameter name="StartValue" type="float" value="29.885470909999999"/>
          </ParameterGroup>
        </ParameterGroup>
      </Problem>
      <Method name="Genetic Algorithm" type="GeneticAlgorithm">
        <Parameter name="Log Verbosity" type="unsignedInteger" value="0"/>
        <Parameter name="Number of Generations" type="unsignedInteger" value="200"/>
        <Parameter name="Population Size" type="unsignedInteger" value="20"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
        <Parameter name="Mutation Variance" type="float" value="0.10000000000000001"/>
        <Parameter name="Stop after # Stalled Generations" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_22" name="Parameter Estimation" type="parameterFitting" scheduled="false" updateModel="false">
      <Report reference="Report_15" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
        <Parameter name="Steady-State" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <Parameter name="Time-Course" type="cn" value="CN=Root,Vector=TaskList[Time-Course]"/>
        <Parameter name="Create Parameter Sets" type="bool" value="0"/>
        <Parameter name="Use Time Sens" type="bool" value="0"/>
        <Parameter name="Time-Sens" type="cn" value=""/>
        <ParameterGroup name="Experiment Set">
        </ParameterGroup>
        <ParameterGroup name="Validation Set">
          <Parameter name="Weight" type="unsignedFloat" value="1"/>
          <Parameter name="Threshold" type="unsignedInteger" value="5"/>
        </ParameterGroup>
      </Problem>
      <Method name="Evolution Strategy (SRES)" type="EvolutionaryStrategySR">
        <Parameter name="Log Verbosity" type="unsignedInteger" value="0"/>
        <Parameter name="Number of Generations" type="unsignedInteger" value="200"/>
        <Parameter name="Population Size" type="unsignedInteger" value="20"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
        <Parameter name="Pf" type="float" value="0.47499999999999998"/>
        <Parameter name="Stop after # Stalled Generations" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_23" name="Metabolic Control Analysis" type="metabolicControlAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_16" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_17"/>
      </Problem>
      <Method name="MCA Method (Reder)" type="MCAMethod(Reder)">
        <Parameter name="Modulation Factor" type="unsignedFloat" value="1.0000000000000001e-09"/>
        <Parameter name="Use Reder" type="bool" value="1"/>
        <Parameter name="Use Smallbone" type="bool" value="1"/>
      </Method>
    </Task>
    <Task key="Task_24" name="Lyapunov Exponents" type="lyapunovExponents" scheduled="false" updateModel="false">
      <Report reference="Report_17" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="ExponentNumber" type="unsignedInteger" value="3"/>
        <Parameter name="DivergenceRequested" type="bool" value="1"/>
        <Parameter name="TransientTime" type="float" value="0"/>
      </Problem>
      <Method name="Wolf Method" type="WolfMethod">
        <Parameter name="Orthonormalization Interval" type="unsignedFloat" value="1"/>
        <Parameter name="Overall time" type="unsignedFloat" value="1000"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
      </Method>
    </Task>
    <Task key="Task_25" name="Time Scale Separation Analysis" type="timeScaleSeparationAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_18" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
      </Problem>
      <Method name="ILDM (LSODA,Deuflhard)" type="TimeScaleSeparation(ILDM,Deuflhard)">
        <Parameter name="Deuflhard Tolerance" type="unsignedFloat" value="0.0001"/>
      </Method>
    </Task>
    <Task key="Task_26" name="Sensitivities" type="sensitivities" scheduled="false" updateModel="false">
      <Report reference="Report_19" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="SubtaskType" type="unsignedInteger" value="1"/>
        <ParameterGroup name="TargetFunctions">
          <Parameter name="SingleObject" type="cn" value=""/>
          <Parameter name="ObjectListType" type="unsignedInteger" value="7"/>
        </ParameterGroup>
        <ParameterGroup name="ListOfVariables">
          <ParameterGroup name="Variables">
            <Parameter name="SingleObject" type="cn" value=""/>
            <Parameter name="ObjectListType" type="unsignedInteger" value="41"/>
          </ParameterGroup>
          <ParameterGroup name="Variables">
            <Parameter name="SingleObject" type="cn" value=""/>
            <Parameter name="ObjectListType" type="unsignedInteger" value="0"/>
          </ParameterGroup>
        </ParameterGroup>
      </Problem>
      <Method name="Sensitivities Method" type="SensitivitiesMethod">
        <Parameter name="Delta factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Delta minimum" type="unsignedFloat" value="9.9999999999999998e-13"/>
      </Method>
    </Task>
    <Task key="Task_27" name="Moieties" type="moieties" scheduled="false" updateModel="false">
      <Report reference="Report_20" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="Householder Reduction" type="Householder">
      </Method>
    </Task>
    <Task key="Task_28" name="Cross Section" type="crosssection" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
        <Parameter name="LimitCrossings" type="bool" value="0"/>
        <Parameter name="NumCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitOutTime" type="bool" value="0"/>
        <Parameter name="LimitOutCrossings" type="bool" value="0"/>
        <Parameter name="PositiveDirection" type="bool" value="1"/>
        <Parameter name="NumOutCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitUntilConvergence" type="bool" value="0"/>
        <Parameter name="ConvergenceTolerance" type="float" value="0"/>
        <Parameter name="Threshold" type="float" value="0"/>
        <Parameter name="DelayOutputUntilConvergence" type="bool" value="0"/>
        <Parameter name="OutputConvergenceTolerance" type="float" value="0"/>
        <ParameterText name="TriggerExpression" type="expression">
          
        </ParameterText>
        <Parameter name="SingleVariable" type="cn" value=""/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="100000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
    <Task key="Task_29" name="Linear Noise Approximation" type="linearNoiseApproximation" scheduled="false" updateModel="false">
      <Report reference="Report_21" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_17"/>
      </Problem>
      <Method name="Linear Noise Approximation" type="LinearNoiseApproximation">
      </Method>
    </Task>
    <Task key="Task_30" name="Time-Course Sensitivities" type="timeSensitivities" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="AutomaticStepSize" type="bool" value="0"/>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="Use Values" type="bool" value="0"/>
        <Parameter name="Values" type="string" value=""/>
        <ParameterGroup name="ListOfParameters">
        </ParameterGroup>
        <ParameterGroup name="ListOfTargets">
        </ParameterGroup>
      </Problem>
      <Method name="LSODA Sensitivities" type="Sensitivities(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="9.9999999999999995e-07"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="9.9999999999999998e-13"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
        <Parameter name="Max Internal Step Size" type="unsignedFloat" value="0"/>
      </Method>
    </Task>
  </ListOfTasks>
  <ListOfReports>
    <Report key="Report_11" name="Steady-State" taskType="steadyState" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Steady-State]"/>
      </Footer>
    </Report>
    <Report key="Report_12" name="Time-Course" taskType="timeCourse" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Time-Course],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Time-Course],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_13" name="Elementary Flux Modes" taskType="fluxMode" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Elementary Flux Modes],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_14" name="Optimization" taskType="optimization" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_15" name="Parameter Estimation" taskType="parameterFitting" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_16" name="Metabolic Control Analysis" taskType="metabolicControlAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_17" name="Lyapunov Exponents" taskType="lyapunovExponents" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_18" name="Time Scale Separation Analysis" taskType="timeScaleSeparationAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_19" name="Sensitivities" taskType="sensitivities" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_20" name="Moieties" taskType="moieties" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Moieties],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Moieties],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_21" name="Linear Noise Approximation" taskType="linearNoiseApproximation" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Result"/>
      </Footer>
    </Report>
  </ListOfReports>
  <GUI>
    <ListOfSliders>
      <Slider key="Slider_0" associatedEntityKey="Task_18" objectCN="CN=Root,Model=GDP-Fucose_v7XGSK,Vector=Compartments[compartment],Vector=Metabolites[PP],Reference=InitialConcentration" objectType="float" objectValue="0" minValue="0" maxValue="20" tickNumber="1000" tickFactor="100" scaling="linear"/>
    </ListOfSliders>
  </GUI>
  <ListOfUnitDefinitions>
    <UnitDefinition key="Unit_1" name="meter" symbol="m">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_0">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        m
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_5" name="second" symbol="s">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_4">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        s
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_13" name="Avogadro" symbol="Avogadro">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_12">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Avogadro
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_17" name="item" symbol="#">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_16">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        #
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_35" name="liter" symbol="l">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_34">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        0.001*m^3
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_41" name="mole" symbol="mol">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_40">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        Avogadro*#
      </Expression>
    </UnitDefinition>
    <UnitDefinition key="Unit_67" name="hour" symbol="h">
      <MiriamAnnotation>
<rdf:RDF
xmlns:dcterms="http://purl.org/dc/terms/"
xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<rdf:Description rdf:about="#Unit_66">
</rdf:Description>
</rdf:RDF>
      </MiriamAnnotation>
      <Expression>
        3600*s
      </Expression>
    </UnitDefinition>
  </ListOfUnitDefinitions>
</COPASI>
