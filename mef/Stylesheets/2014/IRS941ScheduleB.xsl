<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS941ScheduleBStyle.xsl"/> 
  <xsl:param name="FormData" select="$RtnDoc/IRS941ScheduleB"/>
  <xsl:param name="SubType" select="/AppData/Parameters/SubmissionType" />
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:template name="MonthLoop">
			<xsl:param name="monthiterations"/>
			<xsl:if test="$monthiterations &lt; 4">
				<div style="width:187mm;padding:1mm;font-weight:bold;"><xsl:value-of select="$MonthText" /><span style="width:2px;" /><xsl:value-of select="$monthiterations" /></div>
				<div style="width:144mm;height:48mm;float:left;">								
				<xsl:call-template name="DayLoop">
					<xsl:with-param name="dayiterations" select="'1'"/>
					<xsl:with-param name="monthiterations" select="$monthiterations"/>
				</xsl:call-template>
				</div>
				<div style="width:39mm;border:2px solid black;height:16mm;float:right;background-color:white;padding: 1mm 1mm 0mm 1mm;"><span style="font-weight:bold;"><xsl:value-of disable-output-escaping="yes" select="$TaxLiabilityText" /><span style="width:2px;" /><xsl:value-of select="$MonthText" /><span style="width:2px;" /><xsl:value-of select="$monthiterations" /></span><br /><br />
				<xsl:for-each select="$FormData/TaxLiabilityQtrMonthlyDetail[MonthOfQuarterCd=$monthiterations]">
													<div style="text-align:right;padding-top:4.5mm;">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TotalTaxLiabilityAmt"/>
													</xsl:call-template>
													</div>
										
				</xsl:for-each>
				</div>
				<xsl:call-template name="MonthLoop">
					<xsl:with-param name="monthiterations" select="$monthiterations + 1"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:template>
		
		<xsl:template name="DayLoop">
			<xsl:param name="dayiterations"/>
			<xsl:param name="monthiterations"/>	
			<xsl:if test="$dayiterations &lt; 32">
				<xsl:variable name="StartDiv">
					<xsl:choose>
						  <xsl:when test="$dayiterations = 1 or $dayiterations = 9 or $dayiterations = 17 or $dayiterations = 25">&lt;div style="width:36mm;float:left;"&gt;</xsl:when>
						  <xsl:otherwise></xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:variable name="EndDiv">
					<xsl:choose>
						  <xsl:when test="$dayiterations = 8 or $dayiterations = 16 or $dayiterations = 24 or $dayiterations = 31">&lt;/div&gt;</xsl:when>
						  <xsl:otherwise></xsl:otherwise>
					</xsl:choose>
				</xsl:variable>
				<xsl:value-of disable-output-escaping="yes" select="$StartDiv" />
				<div style="width:4mm;height:5.5mm;margin:.25mm .5mm .25mm .5mm;padding-right:1mm;float:left;padding-top:2mm;"><xsl:value-of select="$dayiterations" /></div>
				<div style="width:30mm;height:5.5mm;border:1px solid black;padding-right:1mm;margin:.25mm .5mm .25mm .5mm;float:left;background-color:white;text-align:right;padding-top:2mm;">
					<!--M: <xsl:value-of select="$monthiterations" /> D: <xsl:value-of select="$dayiterations" />-->
												<xsl:for-each select="$FormData/TaxLiabilityQtrMonthlyDetail[MonthOfQuarterCd=$monthiterations]">
													<xsl:for-each select="DailyTaxLiabilityDetail[DayNum=$dayiterations]">
													<xsl:call-template name="PopulateAmount">
														<xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
													</xsl:call-template>
													</xsl:for-each>	
												</xsl:for-each>	
				</div>
				<xsl:value-of disable-output-escaping="yes" select="$EndDiv" />
				<xsl:call-template name="DayLoop">
					<xsl:with-param name="dayiterations" select="$dayiterations + 1"/>
					<xsl:with-param name="monthiterations" select="$monthiterations"/>
				</xsl:call-template>
			</xsl:if>
		</xsl:template>        
	<xsl:variable name="HtmlLang">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">EN-US</xsl:when>
			  <xsl:otherwise>ES</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="MetaContent">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">IRS Form 941 Schedule B SSPR</xsl:when>
			  <xsl:otherwise>IRS Form 941 Schedule B PR</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormName">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">IRS941ScheduleBSSPR</xsl:when>
			  <xsl:otherwise>IRS941ScheduleBPR</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>	
	<xsl:variable name="FormTitleText">
		<xsl:choose>
			  <xsl:when test="$SubType='941' and $Language='ENGLISH'">Schedule B (Form 941):</xsl:when>
			  <xsl:when test="$SubType='941SS' and $Language='ENGLISH'">Schedule B (Form 941):</xsl:when>
			  <xsl:when test="$SubType='941PR' and $Language='ENGLISH'">Schedule B (Form 941-PR (Eng)):</xsl:when>
			  <xsl:when test="$SubType='941' and $Language='SPANISH'">Anexo B (Formulario 941):</xsl:when>
			  <xsl:when test="$SubType='941SS' and $Language='SPANISH'">Anexo B (Formulario 941):</xsl:when>
			  <xsl:when test="$SubType='941PR' and $Language='SPANISH'">Anexo B (Formulario 941-PR):</xsl:when>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormNameText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Report of Tax Liability for Semiweekly Schedule Depositors</xsl:when>
			  <xsl:otherwise>Registro de la Obligaci&amp;#243;n Contributiva para los Depositantes de Itinerario Bisemanal</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormRevText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">(Rev. January 2014)</xsl:when>
			  <xsl:otherwise>(Rev. enero de 2014)</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormOMBNoText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">OMB No. 1545-0029</xsl:when>
			  <xsl:otherwise>OMB No. 1545-0029</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormUpperRightNumber">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">960314</xsl:when>
			  <xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="EINLabel">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Employer identification number&lt;br/&gt;(EIN)</xsl:when>
			  <xsl:otherwise>N&amp;#250;mero de identificaci&amp;#243;n&lt;br/&gt;patronal (EIN)</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="NameLabel">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;br/&gt;&lt;b&gt;Name&lt;/b&gt; (not your trade name)</xsl:when>
			  <xsl:otherwise>&lt;b&gt;Nombre&lt;/b&gt; (el de usted, no&lt;br/&gt;el de su negocio)</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="CalendarYearLabel">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;br/&gt;Calendar year</xsl:when>
			  <xsl:otherwise>&lt;br/&gt;A&amp;#241;o natural</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="AlsoCheckText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;br/&gt;(Also check quarter)</xsl:when>
			  <xsl:otherwise>&lt;br/&gt;&lt;b&gt;(Marque tambi&amp;#233;n el trimestre a la derecha).&lt;/b&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="QuarterHeading1">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Report for this Quarter...</xsl:when>
			  <xsl:otherwise>Informe para este trimestre...</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="QuarterHeading2">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">(Check one.)</xsl:when>
			  <xsl:otherwise>(Marque uno).</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Quarter1Label">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">January, February, March</xsl:when>
			  <xsl:otherwise>enero, febrero, marzo</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Quarter2Label">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">April, May, June</xsl:when>
			  <xsl:otherwise>abril, mayo, junio</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Quarter3Label">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">July, August, September</xsl:when>
			  <xsl:otherwise>julio, agosto, septiembre</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Quarter4Label">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">October, November, December</xsl:when>
			  <xsl:otherwise>octubre, noviembre, diciembre</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="InstructionsText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Use this schedule to show your TAX LIABILITY for the quarter; DO NOT use it to show your deposits. When you file this form with Form 941 or Form 941-SS, DO NOT change your tax liability by adjustments reported on any Forms 941-X or 944-X. You must fill out this form and attach it to Form 941 or Form 941-SS if you are a semiweekly schedule depositor or became one because your accumulated tax liability on any day was $100,000 or more. Write your daily tax liability on the numbered space that corresponds to the date wages were paid. See Section 11 in Pub. 15 (Circular E), Employer&amp;#39;s Tax Guide, for details.</xsl:when>
			  <xsl:otherwise>Use este anexo para mostrar su OBLIGACI&amp;#211;N CONTRIBUTIVA para el trimestre; NO LO USE para mostrar sus dep&amp;#243;sitos de contribuci&amp;#243;n. Cuando radique este formulario con el Formulario 941-PR NO CAMBIE su obligaci&amp;#243;n contributiva por ajustes declarados en todo Formulario 941-X (PR), 944-X (PR) o 944-X (SP). Tiene que llenar este formulario y adjuntarlo al Formulario 941-PR si es depositante de itinerario bisemanal o si su obligaci&amp;#243;n contributiva acumulada en un d&amp;#237;a determinado fue $100,000 o m&amp;#225;s. Anote sus obligaciones contributivas diarias en el espacio numerado que corresponda a la fecha en la cual se pagaron los salarios. Vea el apartado 11 de la Publicaci&amp;#243;n 179 (Circular PR), Gu&amp;#237;a Contributiva Federal para Patronos Puertorrique&amp;#241;os, para m&amp;#225;s detalles.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="MonthText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Month</xsl:when>
			  <xsl:otherwise>Mes</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="TaxLiabilityText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Tax liability for</xsl:when>
			  <xsl:otherwise>Obligaci&amp;#243;n contributiva&lt;br/&gt;para el</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="TotalLiabilityText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Fill in your total liability for the quarter (Month 1 + Month 2 + Month 3) </xsl:when>
			  <xsl:otherwise>Escriba el total de su obligaci&amp;#243;n contributiva para el trimestre (Mes 1 + Mes 2 + Mes 3)</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="TotalMustEqualText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Total must equal line 10 on Form 941 or Form 941-SS.</xsl:when>
			  <xsl:otherwise>El total tiene que ser igual a la cantidad de la l&amp;#237;nea 10 del Formulario 941-PR.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="TotalLiabilityLabel">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Total liability for the quarter</xsl:when>
			  <xsl:otherwise>Obligaci&amp;#243;n total para el&lt;br/&gt;trimestre</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FooterLeftText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">For Paperwork Reduction Act Notice, see separate instructions.</xsl:when>
			  <xsl:otherwise>Para el Aviso sobre la Ley de Reducci&amp;#243;n de Tr&amp;#225;mites, vea las&lt;br/&gt;instrucciones por separado.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FooterMiddleText1">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">IRS.gov/form941</xsl:when>
			  <xsl:otherwise>IRS.gov/form941pr</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FooterMiddleText2">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Cat. No. 11967Q</xsl:when>
			  <xsl:otherwise>Cat. No. 12465Z</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FooterRightText">
		<xsl:choose>
			  <xsl:when test="$SubType='941' and $Language='ENGLISH'">Schedule B (Form 941)</xsl:when>
			  <xsl:when test="$SubType='941SS' and $Language='ENGLISH'">Schedule B (Form 941)</xsl:when>
			  <xsl:when test="$SubType='941PR' and $Language='ENGLISH'">Schedule B (Form 941-PR (Eng))</xsl:when>
			  <xsl:when test="$SubType='941' and $Language='SPANISH'">Anexo B (Formulario 941)</xsl:when>
			  <xsl:when test="$SubType='941SS' and $Language='SPANISH'">Anexo B (Formulario 941)</xsl:when>
			  <xsl:when test="$SubType='941PR' and $Language='SPANISH'">Anexo B (Formulario 941-PR)</xsl:when>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FooterRevText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">(Rev. 1-2014)</xsl:when>
			  <xsl:otherwise>(Rev. 1-2014) </xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="EnglishBreak">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;br/&gt;</xsl:when>
			  <xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SpanishBreak">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'"></xsl:when>
			  <xsl:otherwise>&lt;br/&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
  <!-- /////////////////////////////////////////////////////////////////////////////////////////////////////// -->   
    
    <xsl:template match="/">    
  
    <html lang="{$HtmlLang}">
      <head>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($FormData)"/>
          </xsl:call-template>
        </title>      
    
        <!--  No Browser Caching  -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set  -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="{$MetaContent}"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS941ScheduleBStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="" style="font-family:arial;">
          <!--  Begin Header section 1 -->
          <xsl:call-template name="DocumentHeader"/>
          <div class="styGenericDiv" style="width:187mm;padding-top:2mm;">
			  <div class="styGenericDiv" style="float:left"><span class="styBoldText" style="font-size:14pt;"><xsl:value-of disable-output-escaping="yes" select="$FormTitleText" /></span></div>
			  <div class="styGenericDiv" style="float:right"><span class="styBoldText" style="font-size:10pt;"><xsl:value-of disable-output-escaping="yes" select="$FormUpperRightNumber" /></span></div>
          </div>
          <div class="styGenericDiv" style="width:187mm;">
			  <div class="styGenericDiv" style="float:left"><span class="styBoldText" style="font-size:12pt;"><xsl:value-of disable-output-escaping="yes" select="$FormNameText" /></span></div>          
          </div>   
          <div class="styGenericDiv" style="width:187mm;">
			  <div class="styGenericDiv" style="float:left;width:50mm;"><span style="font-size:7pt;"><xsl:value-of disable-output-escaping="yes" select="$FormRevText" /></span></div>
			  <div class="styGenericDiv" style="float:left"><span style="font-size:7pt;">Department of the Treasury — Internal Revenue Service</span></div>
          <div class="styGenericDiv" style="float:right"><span style="font-size:7pt;"><xsl:value-of disable-output-escaping="yes" select="$FormOMBNoText" /></span></div>
          </div>
          <div class="styGenericDiv" style="width:187mm;padding-top:2mm;">
			  <div class="styGenericDiv" style="float:left;width:122mm;">
				  <div class="styGenericDiv" style="float:left;width:122mm;">
				  <div class="styGenericDiv" style="float:left;width:42mm;">
					  <span class="styBoldText" style="font-size:7pt;"><xsl:value-of disable-output-escaping="yes" select="$EINLabel" /></span>
				  </div>
				  <div class="styGenericDiv" style="float:left;border:1px solid black;width:79.9mm;height:7mm;font-size:8pt;padding-top:2mm;padding-left:2mm;text-align:center;">
					  <xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">EIN</xsl:with-param>
									</xsl:call-template>				  
				  </div>
				  </div>
				  <div class="styGenericDiv" style="float:left;width:122mm;padding-top:2mm;">
				  <div class="styGenericDiv" style="float:left;width:42mm;">
					  <span style="font-size:7pt;"><xsl:value-of disable-output-escaping="yes" select="$NameLabel" /></span>
				  </div>
				  <div class="styGenericDiv" style="float:left;border:1px solid black;width:79.9mm;height:7mm;font-size:8pt;padding-top:2mm;padding-left:2mm;">
					  <xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
									</xsl:call-template><br />
									<xsl:call-template name="PopulateReturnHeaderFiler">
										<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
									</xsl:call-template>
				  </div>
				  </div>
				   <div class="styGenericDiv" style="float:left;width:122mm;padding-top:2mm;">
				  <div class="styGenericDiv" style="float:left;width:42mm;">
					  <span class="styBoldText" style="font-size:7pt;"><xsl:value-of disable-output-escaping="yes" select="$CalendarYearLabel" /></span>
				  </div>
				  <div class="styGenericDiv" style="float:left;border:1px solid black;width:29.9mm;height:7mm;font-size:8pt;padding-top:2mm;padding-left:2mm;text-align:center;">
					  <xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
							<xsl:with-param name="BackupName">IRS941ScheduleBCalendarYear</xsl:with-param>
						</xsl:call-template>				  
				  </div>
				  <div class="styGenericDiv" style="float:right;">
					  <xsl:choose>
						  <xsl:when test="$Language='ENGLISH'"><span style="font-size:7pt;align:right;"><xsl:value-of disable-output-escaping="yes" select="$AlsoCheckText" /></span></xsl:when>
						  <xsl:otherwise><span style="font-size:6pt;align:right;"><xsl:value-of disable-output-escaping="yes" select="$AlsoCheckText" /></span></xsl:otherwise>
					  </xsl:choose>
				  </div>
				  </div>
				  
			  </div>
			  
			  <div class="styGenericDiv" style="float:right;width:60mm;height:35mm;border:1px solid black;padding:2mm;">
				  <div class="styGenericDiv" style="width:56mm;background-color:black;font-color:white;font-weight:bold;padding:1mm;">
					  <span style="font-size:8pt;font-weight:bold;color:white;"><xsl:value-of disable-output-escaping="yes" select="$QuarterHeading1" /></span><br />
					  <span style="font-size:7pt;font-weight:bold;color:white;"><xsl:value-of disable-output-escaping="yes" select="$QuarterHeading2" /></span>
				  </div>
				  <div style="float:left;clear:none;padding-top:2mm;width:56mm;">
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="contains($RtnHdrData/QuarterEndingDt, '-03')"/>
								<xsl:with-param name="BackupName">IRS941ScheduleBQuarterEndingDt[1]</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="contains($RtnHdrData/QuarterEndingDt, '-03')"/>
								<xsl:with-param name="BackupName">IRS941ScheduleBQuarterEndingDt[1]</xsl:with-param>
							</xsl:call-template>
							<span style="font-size:7pt;padding-left:1mm;"><b>1: </b> <xsl:value-of disable-output-escaping="yes" select="$Quarter1Label" /></span>
						</label>
				</div>
				<div style="float:left;clear:none;padding-top:2mm;width:56mm;">
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="contains($RtnHdrData/QuarterEndingDt, '-06')"/>
								<xsl:with-param name="BackupName">IRS941ScheduleBQuarterCd[2]</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="contains($RtnHdrData/QuarterEndingDt, '-06')"/>
								<xsl:with-param name="BackupName">IRS941ScheduleBQuarterCd[2]</xsl:with-param>
							</xsl:call-template>
							<span style="font-size:7pt;padding-left:1mm;"><b>2: </b> <xsl:value-of disable-output-escaping="yes" select="$Quarter2Label" /></span>
						</label>
				</div>
				<div style="float:left;clear:none;padding-top:2mm;width:56mm;">
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="contains($RtnHdrData/QuarterEndingDt, '-09')"/>
								<xsl:with-param name="BackupName">IRS941ScheduleBQuarterCd[3]</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="contains($RtnHdrData/QuarterEndingDt, '-09')"/>
								<xsl:with-param name="BackupName">IRS941ScheduleBQuarterCd[3]</xsl:with-param>
							</xsl:call-template>
							<span style="font-size:7pt;padding-left:1mm;"><b>3: </b> <xsl:value-of disable-output-escaping="yes" select="$Quarter3Label" /></span>
						</label>
				</div>
				<div style="float:left;clear:none;padding-top:2mm;width:56mm;">					
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateEnumeratedCheckbox">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="contains($RtnHdrData/QuarterEndingDt, '-12')"/>
								<xsl:with-param name="BackupName">IRS941ScheduleBQuarterCd[4]</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"/>
								<xsl:with-param name="DisplayedCheckboxValue" select="contains($RtnHdrData/QuarterEndingDt, '-12')"/>
								<xsl:with-param name="BackupName">IRS941ScheduleBQuarterCd[4]</xsl:with-param>
							</xsl:call-template>
							<span style="font-size:7pt;padding-left:1mm;"><b>4: </b> <xsl:value-of disable-output-escaping="yes" select="$Quarter4Label" /></span>
						</label>
				</div>
			  </div>
          </div>      
		<div class="styGenericDiv" style="width:187mm;padding-top:2mm;padding-bottom:2mm;">
			  <span class="styBoldText" style="font-size:7.5pt;"><xsl:value-of disable-output-escaping="yes" select="$InstructionsText" /></span>			  
        </div>      
        
		<div style="width:187mm;">
		<xsl:call-template name="MonthLoop">
			<xsl:with-param name="monthiterations" select="'1'"/>
		</xsl:call-template>
		</div>
		<div style="width:187mm;height;9mm;border-bottom:2px solid black;">
				<div style="width:148mm;height:9mm;float:left;font-size:7pt;padding-top:5mm;padding-right:2mm;">
				<div style="float:right;text-align:left;"><xsl:value-of disable-output-escaping="yes" select="$TotalLiabilityText" /><span style="width:5px;" /><img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/><br />
				<b><xsl:value-of disable-output-escaping="yes" select="$TotalMustEqualText" /></b></div>
				</div>
				<div style="width:38.9mm;border:2px solid black;border-bottom:0px solid black;height:9mm;float:right;padding: 1mm 1mm 0mm 1mm;"><span style="font-weight:bold;"><xsl:value-of disable-output-escaping="yes" select="$TotalLiabilityLabel" /></span><br /><xsl:value-of disable-output-escaping="yes" select="$EnglishBreak" />
				<div style="text-align:right;padding-top:1mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalQuarterTaxLiabilityAmt"/>
					</xsl:call-template>
					</div>
				</div>
		</div>

	
     <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
          <div style="float:left;">
              <span class="styBoldText" style="font-size:7pt;"><xsl:value-of disable-output-escaping="yes" select="$FooterLeftText" /></span>                 
              
            </div>
            <div style="float:left;">
              <span style="font-size:7pt;margin-left:25px;"><xsl:value-of disable-output-escaping="yes" select="$FooterMiddleText1" /></span>
              
              </div>
              
              <div style="float:left;">
              <span style="font-size:7pt;margin-left:25px;"><xsl:value-of select="$FooterMiddleText2" /></span>                
             </div>
            <div style="float:right;">
              <span class="styBoldText" style="font-size:7pt;"><xsl:value-of disable-output-escaping="yes" select="$FooterRightText" /></span> <xsl:value-of disable-output-escaping="yes" select="$FooterRevText" />                     
              
            </div>
          </div>
          <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
            <div class="styLeftOverTitle">
              Additional Data        
            </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <!-- Additional Data Table -->
          <xsl:variable name="TableWidth">100</xsl:variable>
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$FormData"/>
              <xsl:with-param name="DescWidth" select="$TableWidth"/>
            </xsl:call-template> 
            </table>        
              
			  </form>
			</body>
		</html>       
	</xsl:template>
  
</xsl:stylesheet>
