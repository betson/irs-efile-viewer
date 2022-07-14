<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS499W2PRStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="FormData" select="$RtnDoc/IRS499W2PR"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($FormData)"/>
          </xsl:call-template>
        </title>
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="IRS Form 499W2PR"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS499W2PRStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="FormW2">
          <xsl:call-template name="DocumentHeaderLandscape"/>
          
          <div style="width:256mm;">
            <br/>
          </div>
          <!-- Remove this later -->
          <!-- Big box covers entire form -->
          <div style="width:255mm;border-bottom:1px solid black">
            <div class="styGenericDiv" style="width:155mm;">
              <div class="styGenericDiv" style="width:100%;height:17mm;border-right:0px solid black;">
                <span style="width:34mm;">
                  Formulario
                  <br/>
                  <b>Form 499R-2/W-2PR</b>
                  <br/>
                  Rev. 09.12
                </span>
                <span style="width:120mm;text-align:center;padding-bottom:3mm;">
                  GOBIERNO DE PUERTO RICO - GOVERNMENT OF PUERTO RICO
                  <br/>
                  DEPARTAMENTO DE HACIENDA - DEPARTMENT OF THE TREASURY
                </span>
                <span style="width:34mm;font-family:OCR-A,courier;font-size:14pt;">
                  222
                </span>
                <span style="width:120  mm;font-size:8pt;font-weight:bold;text-align:center;padding-bottom:2mm;">
                  COMPROBANTE DE RETENCION - WITHHOLDING STATEMENT
                </span>
              </div>
            
              <div class="styGenericDiv" style="width:105mm;                 border-left:1px solid black;                 border-right:1px solid black;                 border-top:1px solid black;               ">
                <div class="styIRS499W2PRCell" style="height:13mm;">
                  1. Nombre - First Name
                  <br/>
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$FormData/EmployeeNm"/>
                  </xsl:call-template>
                  <span style="width:2mm;"/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Line 1 - Employee Name Control</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$FormData/EmployeeNameControlTxt"/>
                  </xsl:call-template>
                </div>
                <div class="styIRS499W2PRCell" style="height:13mm;">
                  Apellido(s) - Surname(s)
                  <br/>
                  <br/>
                </div>
                <div class="styIRS499W2PRCell" style="height:19mm;">
                  Dirección Postal del Empleado - Employee's Mailing Address
                  <br/>
                  <br/>
                  <xsl:choose>
                    <xsl:when test="$FormData/EmployeeUSAddress">
                      <xsl:call-template name="PopulateUSAddressTemplate">
                        <xsl:with-param name="TargetNode" select="$FormData/EmployeeUSAddress"/>
                      </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                      <td class="styTableCellText" style="width:58mm;">
                        <xsl:call-template name="PopulateForeignAddressTemplate">
                          <xsl:with-param name="TargetNode" select="$FormData/EmployeeForeignAddress"/>
                        </xsl:call-template>
                      </td>
                    </xsl:otherwise>                    
                  </xsl:choose>
                </div>
                <div class="styIRS499W2PRCell" style="height:30.8mm;">
                  2. Nombre y Dirección Postal del Patrono
                  <br/>
                  <span style="width:3.75mm"/>
                  Employer's Name and Mailing Address
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$FormData/EmployerName/BusinessNameLine1Txt"/>
                  </xsl:call-template>
                  <span style="width:2mm"/>
                  <xsl:call-template name="LinkToLeftoverDataTableInline">
                    <xsl:with-param name="Desc">Line 2 - Employer Name Control</xsl:with-param>
                    <xsl:with-param name="TargetNode" select="$FormData/EmployerNameControlTxt"/>
                  </xsl:call-template>
                  <br/>
                  <xsl:if test="$FormData/EmployerName/BusinessNameLine2Txt">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/EmployerName/BusinessNameLine2Txt"/>
                    </xsl:call-template>
                    <br/>
                  </xsl:if>
                  <xsl:choose>
                    <xsl:when test="$FormData/EmployerUSAddress">
                      <xsl:call-template name="PopulateUSAddressTemplate">
                        <xsl:with-param name="TargetNode" select="$FormData/EmployerUSAddress"/>
                      </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                      <td class="styTableCellText" style="width:58mm;">
                        <xsl:call-template name="PopulateForeignAddressTemplate">
						  <xsl:with-param name="MainForm">true</xsl:with-param>
                          <xsl:with-param name="TargetNode" select="$FormData/EmployerForeignAddress"/>
                        </xsl:call-template>
                      </td>
                    </xsl:otherwise>                    
                  </xsl:choose>
                </div>
                <div class="styIRS499W2PRCell" style="height:7mm;">
                  Número de Teléfono del Patrono
                  <br/>
                  Employer's Telephone Number<span style="width:2mm"/>
                  <xsl:call-template name="PopulatePhoneNumber">
                        <xsl:with-param name="TargetNode" select="$FormData/EmployerTelephoneNum"/>
                  </xsl:call-template>
                </div>
                <div class="styIRS499W2PRCell" style="height:8.3mm;">
                  Fecha Cese de Operaciones: 
                  <span style="width:2mm"/>
                  Día<span style="width:10.5mm"/>
                  Mes<span style="width:13.5mm"/>
                  Año
                  <br/>
                  Cease of Operations Date: 
                  <span style="width:5mm"/>
                  Day  
                  <span style="width:8mm;border-bottom:1px solid black;padding-left:2mm;">
                    <xsl:call-template name="PopulateDay">
                        <xsl:with-param name="TargetNode" select="$FormData/CeaseOperationsDt"/>
                    </xsl:call-template>
                  </span>
                  <span style="width:1mm"/>
                  Month  
                  <span style="width:8mm;border-bottom:1px solid black;padding-left:2mm;">
                    <xsl:call-template name="PopulateMonth">
                        <xsl:with-param name="TargetNode" select="$FormData/CeaseOperationsDt"/>
                    </xsl:call-template>
                  </span>
                  <span style="width:2mm"/>
                  Year
                  <span style="width:8mm;border-bottom:1px solid black;padding-left:1mm;">
                    <xsl:call-template name="PopulateYear">
                        <xsl:with-param name="TargetNode" select="$FormData/CeaseOperationsDt"/>
                    </xsl:call-template>
                  </span>
                </div>
                <div class="styIRS499W2PRCell" style="height:18mm;border-bottom-width:0px;">
                  Número Control - Control Number
                  <br/>
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$FormData/ControlNum"/>
                  </xsl:call-template>                
                </div>
              </div>

              <div class="styGenericDiv" style="width:50mm;                 border-right:0px solid black;                 border-top:1px solid black;               ">
                <div class="styIRS499W2PRCell" style="height:10.4mm;">
                  3. Núm. Seguro Social<br/>                
                  <span style="width:3.75mm"/>Social Security No.<br/>
                  <span style="width:100%;text-align:center">
                    <xsl:call-template name="PopulateSSN">
                      <xsl:with-param name="TargetNode" select="$FormData/SSN"/>
                    </xsl:call-template>
                  </span>
                </div>
                <div class="styIRS499W2PRCell" style="height:10.4mm;">
                  4. Núm. de Ident. Patronal<br/>                
                  <span style="width:3.75mm"/>Employer Ident. No. (EIN)<br/>
                  <span style="width:100%;text-align:center">
                    <xsl:call-template name="PopulateEIN">
                      <xsl:with-param name="TargetNode" select="$FormData/EIN"/>
                    </xsl:call-template>
                  </span>
                </div>            
                <div class="styIRS499W2PRCell" style="height:16.5mm;">
                  5. Fecha en que comenzó a recibir
                  <br/>                
                  <span style="width:3.75mm"/>la pensión - Date on which you
                  <br/>                
                  <span style="width:3.75mm"/>started to receive the pension
                  <br/>        
                  Día<span style="width:9mm"/>
                  Mes<span style="width:9.5mm"/>
                  Año
                  <br/>
                  Day  
                  <span style="width:6mm;border-bottom:1px solid black;padding-left:1mm;">
                    <xsl:call-template name="PopulateDay">
                        <xsl:with-param name="TargetNode" select="$FormData/PensionReceiptStartDt"/>
                    </xsl:call-template>
                  </span>
                  <span style="width:1mm"/>
                  Month  
                  <span style="width:6mm;border-bottom:1px solid black;padding-left:1mm;">
                    <xsl:call-template name="PopulateMonth">
                        <xsl:with-param name="TargetNode" select="$FormData/PensionReceiptStartDt"/>
                    </xsl:call-template>
                  </span>
                  <span style="width:0mm"/>
                  Year
                  <span style="width:8mm;border-bottom:1px solid black;padding-left:.5mm;">
                    <xsl:call-template name="PopulateYear">
                        <xsl:with-param name="TargetNode" select="$FormData/PensionReceiptStartDt"/>
                    </xsl:call-template>
                  </span>
                </div>
                <div class="styIRS499W2PRCell" style="height:10.4mm;">
                  6. Costo de Pensión o Anualidad<br/>                
                  <span style="width:3.75mm"/>Cost of Pension or Annuity<br/>
                  <span style="width:48mm;text-align:right">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/EmployeeContributionsAmt"/>
                    </xsl:call-template>
                  </span>
                </div>
                <div class="styIRS499W2PRCell" style="height:13.2mm;font-family:Arial;">
                  6A. Costo de cubierta de salud auspiciada<br/>                
                  <span style="width:3.75mm"/>por el patrono - Cost of employer-<br/>
                  <span style="width:3.75mm"/>sponsored health coverage<br/>
                  <span style="width:48mm;text-align:right;font-family:Verdana;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/EmplrSponsoredHealthCvrCostAmt"/>
                    </xsl:call-template>
                  </span>
                </div>
                <div class="styIRS499W2PRCell" style="height:10.4mm;">
                  6B. Donativos<br/>                
                  <span style="width:3.75mm"/>Charitable Contributions<br/>
                  <span style="width:48mm;text-align:right">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TotalCharitableContriAmt"/>
                    </xsl:call-template>
                  </span>
                </div>
                <div class="styIRS499W2PRCell" style="height:37.5mm;font-family:arial;font-size:8pt;font-weight:bold;text-align:center;border-bottom-width:0px;">
					<span style="width:100%">Original</span>
                    <span style="width:100%">Envíe a: - Send to:</span>
                    <span style="width:100%">Social Security Adm.</span>
                    <span style="width:100%">Wilkes-Barre D.O.C.</span>          
                    <span style="width:100%">Wilkes-Barre, PA 18769-0001</span>
                  <span style="height:8.5mm;width:24mm;padding-left:7mm;">
                    <span style="width:100%">Con la</span>
                    <span style="width:100%">With the</span>
                  </span>
                  <span style="height:8.5mm;width:24mm;">
                    W-3PR
                  </span>
                  <span style="width:24mm;padding-left:11mm;font-weight:normal;float:left;">
                    <span style="width:100%">Año:</span>
                    <span style="width:100%">Year:</span>
                  </span>
                  <span style="width:24mm;font-family:Arial Narrow;font-size:16pt;float:left;">
                    2014
                    <span style="width:2mm;"/>
                    <xsl:call-template name="LinkToLeftoverDataTableInline">
                      <xsl:with-param name="Desc">Bottom Center - Standard Or Non Standard Code</xsl:with-param>
                      <xsl:with-param name="TargetNode" select="$FormData/StandardOrNonStandardCd"/>
                    </xsl:call-template>
                  </span>
                </div>
              </div>
              <div class="styGenericDiv" style="width:100%;height:7.5mm;border-left:1px solid black;border-top:1px solid black;text-align:center;">
                <span style="font-weight:bold">
                  Fecha de radicación: 31 de enero - Filing date: January 31
                </span>
                <br/>
                Instrucciones al dorso de Copia D - Instructions on back of Copy D
              </div>

            </div>
            <!--END Left Half DIV-->  
            <div class="styGenericDiv" style="width:50mm;               border-right:1px solid black;      border-left:1px solid black;               border-top:1px solid black;             ">
              <div class="styIRS499W2PRCell" style="height:17mm;font-family:arial;font-weight:bold;padding-top:.5mm">
                INFORMACION PARA EL DEPARTAMENTO DE HACIENDA
                <br/>
                <br/>
                DEPARTMENT OF THE TREASURY INFORMATION
              </div>

              <div class="styIRS499W2PRCell" style="height:9mm;">
                7. Sueldos - Wages
                <br/>
                <span style="width:48mm;text-align:right">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/WagesAmt"/>
                  </xsl:call-template>
                </span>
              </div>
              <div class="styIRS499W2PRCell" style="height:9mm;">
                8. Comisiones - Commissions
                <br/>
                <span style="width:48mm;text-align:right">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/CommissionsAmt"/>
                  </xsl:call-template>
                </span>
              </div>            
              <div class="styIRS499W2PRCell" style="height:9mm;">
                9. Concesiones - Allowances
                <br/>
                <span style="width:48mm;text-align:right">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/ExpenseAllowancesAmt"/>
                  </xsl:call-template>
                </span>
              </div>            
              <div class="styIRS499W2PRCell" style="height:9mm;">
                10. Propinas - Tips
                <br/>
                <span style="width:48mm;text-align:right">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/EmployeeTipsAmt"/>
                  </xsl:call-template>
                </span>
              </div>            
              <div class="styIRS499W2PRCell" style="height:9mm;">
                11. Total = 7 + 8 + 9 + 10
                <br/>
                <span style="width:48mm;text-align:right">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/TotalIncomeAmt"/>
                  </xsl:call-template>
                </span>
              </div>            
              <div class="styIRS499W2PRCell" style="height:11.5mm;">
                12. <span style="font-size:6pt;">Gastos Reemb. y Beneficios Marginales</span>
                <br/>
                <span style="width:5.25mm"/><span style="font-family:arial;">Reimb. Expenses and Fringe Benefits</span>
                <br/>                
                <span style="width:48mm;text-align:right">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/EmployeeReimbursedExpenseAmt"/>
                  </xsl:call-template>
                </span>
              </div>            
              <div class="styIRS499W2PRCell" style="height:9mm;">
                13. Cont. Retenida - Tax Withheld
                <br/>
                <span style="width:48mm;text-align:right">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/WithholdingAmt"/>
                  </xsl:call-template>
                </span>
              </div>            
              <div class="styIRS499W2PRCell" style="height:11.5mm;">
                14. <span style="font-family:arial;">Fondo de Retiro Gubernamental</span><br/>                
                <span style="font-family:arial;padding-left:5.25mm;">Governmental Retirement Fund</span><br/>                
                <span style="width:48mm;text-align:right">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/RetirementFundAmt"/>
                  </xsl:call-template>
                </span>
              </div>            
              <div class="styIRS499W2PRCell" style="height:11.5mm;">
                15. Aportaciones a Planes Cualific.
                <br/>
                <span style="width:5.25mm"/>Contributions to CODA PLANS
                <br/>                
                <span style="width:48mm;text-align:right">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/ContributionsToCODAPlansAmt"/>
                  </xsl:call-template>
                </span>
              </div>            
              <div class="styIRS499W2PRCell" style="height:11.5mm;">
                16. Salarios bajo Ley 324-2004
                <br/>                
                <span style="width:5.25mm"/>
                Salaries under Act 324-2004
                <br/>                
                <span style="width:48mm;text-align:right">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/EmergOTSalariesPdUndACT324Amt"/>
                  </xsl:call-template>
                </span>
              </div>
              <div class="styIRS499W2PRCell" style="height:16.9mm;font-family:Arial;border-bottom-width:0px;">
                16A. Aportaciones al Programa Ahorra y<br/>
                <span style="width:4.25mm"/>Duplica tu Dinero - Contributions to the<br/>
                <span style="width:4.25mm"/><span style="font-family:Arial Narrow;">Save and Double your Money Program</span><br/>
                <span style="width:48mm;text-align:right;font-family:Verdana;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/SaveAndDoubleMonyProgContriAmt"/>
                  </xsl:call-template>
                </span>
              </div>      
            </div>

            <div class="styGenericDiv" style="width:50mm;               border-right:1px solid black;               border-top:1px solid black;             ">
              <div class="styIRS499W2PRCell" style="height:17mm;font-family:arial;font-weight:bold;padding-top:.5mm">
                INFORMACION PARA EL SEGURO SOCIAL
                <br/>                
                <br/>                
                SOCIAL SECURITY INFORMATION
              </div>
              <div class="styIRS499W2PRCell" style="height:16.6mm;">
                17. Total Sueldos Seguro Social
                <br/>                
                <span style="width:5.25mm"/>Social Security Wages
                <br/>                
                <br/>                
                <span style="width:48mm;text-align:right">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/SocialSecurityWagesAmt"/>
                  </xsl:call-template>
                </span>
              </div>            
              <div class="styIRS499W2PRCell" style="height:16.6mm;">
                18. Seguro Social Retenido
                <br/>                
                <span style="width:5.25mm"/>Social Security Tax Withheld
                <br/>                
                <br/>                
                <span style="width:48mm;text-align:right">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTaxAmt"/>
                  </xsl:call-template>
                </span>
              </div>            
              <div class="styIRS499W2PRCell" style="height:16.6mm;">
                19. Total Sueldos y Pro. Medicare
                <br/>                
                <span style="width:5.25mm"/>Medicare Wages and Tips
                <br/>                
                <br/>                
                <span style="width:48mm;text-align:right">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MedicareWagesAndTipsAmt"/>
                  </xsl:call-template>
                </span>
              </div>            
              <div class="styIRS499W2PRCell" style="height:16.8mm;">
                20. Contrib. Medicare Retenida
                <br/>                
                <span style="width:5.25mm"/>Medicare Tax Withheld
                <br/>                
                <br/>                
                <span style="width:48mm;text-align:right">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/MedicareTaxWithheldAmt"/>
                  </xsl:call-template>
                </span>
              </div>            
              <div class="styIRS499W2PRCell" style="height:16mm;">
                21. Propinas Seguro Social
                <br/>                
                <span style="width:5.25mm"/>Social Security Tips
                <span style="width:48mm;text-align:right;padding-top:2mm;">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTipsAmt"/>
                  </xsl:call-template>
                </span>
              </div>            
              <div class="styIRS499W2PRCell" style="height:16.8mm;">
                22. Seguro Social no Retenido en 
                <br/>                
                <span style="width:5.25mm"/>Propinas - Uncollected Social 
                <br/>                
                <span style="width:5.25mm"/>Security Tax on Tips
                <br/>                
                <span style="width:48mm;text-align:right">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/UncollectedSocSecTaxOnTipsAmt"/>
                  </xsl:call-template>
                </span>
              </div>            
              <div class="styIRS499W2PRCell" style="height:17.3mm;border-bottom-width:0px">
                23. Contrib. Medicare no Retenida
                <br/>                
                <span style="width:5.25mm"/>                
                en Propinas - Uncollected 
                <br/>                
                <span style="width:5.25mm"/>                
                Medicare Tax on Tips
                <br/>                
                <span style="width:48mm;text-align:right">
                  <xsl:call-template name="PopulateAmount">
                    <xsl:with-param name="TargetNode" select="$FormData/UncollectedMedcrTaxOnTipsAmt"/>
                  </xsl:call-template>
                </span>
              </div>              
            </div>
          </div>
          
          <div class="pageEnd"><br/></div>
          
          <div class="styLeftOverTitleLineLandscape" id="LeftoverData">
            <div class="styLeftOverTitle" style="float:left">
              Additional Data        
            </div>
            <div class="styLeftOverButtonContainerLandscape" style="width:auto;float:right;">
              <input class="styLeftoverTableBtn" type="button" TabIndex="1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <!-- Additional Data Table -->
          <table class="styLeftOverTblLandscape">
            <xsl:call-template name="PopulateCommonLeftoverLandscape">
              <xsl:with-param name="TargetNode" select="$FormData"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRowLandscape">
              <xsl:with-param name="Desc">Line 1 - Employee Name Control</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/EmployeeNameControlTxt"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRowLandscape">
              <xsl:with-param name="Desc">Line 2 - Employer Name Control</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/EmployerNameControlTxt"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRowLandscape">
              <xsl:with-param name="Desc">Bottom Center - Standard Or Non Standard Code</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/StandardOrNonStandardCd"/>
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>
          </table>
          <!-- END Left Over Table -->
          
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>