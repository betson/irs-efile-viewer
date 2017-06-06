<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS943_943PRStyle.xsl"/>
	<xsl:output method="html" indent="yes" />
	<xsl:strip-space elements="*" />
	<xsl:param name="FormData" select="$RtnDoc/IRS943_943PR" />
	<xsl:param name="SubType" select="/AppData/Parameters/SubmissionType" />
	<xsl:template name="DotLoop">		
		<xsl:param name="DotQty"/>
		<xsl:if test="$DotQty &gt; 0">
			&lt;span style="width:11px;" &gt;&lt;/span&gt;.
			<xsl:call-template name="DotLoop">				
				<xsl:with-param name="DotQty" select="$DotQty - 1"/>
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
			  <xsl:when test="$Language='ENGLISH'">IRS Form 943 SSPR</xsl:when>
			  <xsl:otherwise>IRS Form 943 PR</xsl:otherwise>
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
	<xsl:variable name="FormName">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">IRS943SSPR</xsl:when>
			  <xsl:otherwise>IRS943PR</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Form </xsl:when>
			  <xsl:otherwise>Formulario </xsl:otherwise>
		</xsl:choose>
	</xsl:variable>	
	<xsl:variable name="FormTitleText">
		<xsl:choose>
			  <xsl:when test="$SubType='943' and $Language='ENGLISH'">943</xsl:when>
			  <xsl:when test="$SubType='943PR' and $Language='ENGLISH'">&lt;span style="font-size:9pt;"&gt;943-PR (Eng)&lt;/span&gt;</xsl:when>
			  <xsl:when test="$SubType='943' and $Language='SPANISH'">943</xsl:when>
			  <xsl:when test="$SubType='943PR' and $Language='SPANISH'">&lt;span style="font-size:10pt;"&gt;943-PR&lt;/span&gt;</xsl:when>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormNameText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Employer’s Annual Federal Tax Return for Agricultural Employees</xsl:when>
			  <xsl:otherwise>Planilla para la Declaraci&amp;#243;n Anual de la Contribuci&amp;#243;n Federal del Patrono de Empleados Agr&amp;#237;colas</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>	
	<xsl:variable name="FormOMBNoText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">OMB No. 1545-0035</xsl:when>
			  <xsl:otherwise>OMB No. 1545-0035</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormDetailsText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'"> Information about Form 943 and its separate instructions is at &lt;i&gt;www.irs.gov/form943&lt;/i&gt;.</xsl:when>
			  <xsl:otherwise>Para más información, vea las instrucciones por separado.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PrintTypeText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="font-weight:normal;text-align:center;"&gt;Type&lt;br/&gt;or&lt;br/&gt;Print.&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="font-weight:bold;font-size:10pt;width:100%;padding-top:8mm;text-align:center;"&gt;Escriba a&lt;br/&gt;
			  Maquinilla&lt;br/&gt;
			  o en Letra de&lt;br/&gt;
			  Molde&lt;/span&gt;			  
			  </xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PrintTypeHeight">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">50.2mm</xsl:when>
			  <xsl:otherwise>30mm</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PrintTypePadding">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">9</xsl:when>
			  <xsl:otherwise>2</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="NameText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Name (as distinguished from trade name)</xsl:when>
			  <xsl:otherwise>Nombre (el de usted, no el del negocio)</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="CalendarYearText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Calendar year</xsl:when>
			  <xsl:otherwise>A&amp;#241;o natural</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="TradeNameText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Trade name, if any</xsl:when>
			  <xsl:otherwise>Nombre comercial, si existe</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="EINText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Employer identification number (EIN)</xsl:when>
			  <xsl:otherwise>N&amp;#250;mero de identificaci&amp;#243;n patronal &lt;i&gt;(EIN)&lt;/i&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="AddressText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Address (number and street)</xsl:when>
			  <xsl:otherwise>Direcci&amp;#243;n (calle y n&amp;#250;mero)</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="CityStateZipText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">City, state, and ZIP code</xsl:when>
			  <xsl:otherwise>Ciudad o pueblo, provincia o estado, pais y zona postal &lt;i&gt;(ZIP)&lt;/i&gt; o c&amp;#243;digo postal extranjero&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="AddressDifferentText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">If address is&lt;br/&gt;different from&lt;br/&gt;prior return,&lt;br/&gt;check here.</xsl:when>
			  <xsl:otherwise>Si su direcci&amp;#243;n no&lt;br/&gt;es la misma que&lt;br/&gt;apareci&amp;#243;&lt;br/&gt;en su planilla&lt;br/&gt;anterior, marque&lt;br/&gt;esta casilla</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line1Text">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Number of agricultural employees employed in the pay period that includes March 12, 2013</xsl:when>
			  <xsl:otherwise>N&amp;#250;mero de empleados agr&amp;#237;colas durante el período de n&amp;#243;mina que incluye el 12 de marzo de 2013</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SSRateText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'"></xsl:when>
			  <xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SSRateHeight">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">8</xsl:when>
			  <xsl:otherwise>4</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line2Text">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Total wages subject to social security tax&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="8"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="float:left"&gt;Total de salarios sujetos a la contribuci&amp;#243;n al Seguro Social&lt;/span&gt;
					 &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="4"/>
							</xsl:call-template>
							&lt;/span&gt;
			  </xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line3Text">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Social security tax (multiply line 2 by 12.4% (.124))&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="14"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="float:left"&gt;Contribuci&amp;#243;n al Seguro Social (multiplique la l&amp;#237;nea &lt;b&gt;2&lt;/b&gt; por el 12.4% (.124))&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="8"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line4Text">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Total wages subject to Medicare tax&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="10"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="float:left;"&gt;Total de salarios sujetos a la contribuci&amp;#243;n al Medicare&lt;/span&gt;
				 &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="5"/>
							</xsl:call-template>
							&lt;/span&gt;
			  </xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line5Text">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Medicare tax (multiply line 4 by 2.9% (.029))&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="16"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="float:left"&gt;Contribuci&amp;#243;n al &lt;i&gt;Medicare&lt;/i&gt; (multiplique la l&amp;#237;nea &lt;b&gt;4&lt;/b&gt; por el 2.9% (.029))&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="10"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line6Text">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Total wages subject to Additional Medicare Tax withholding&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="4"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="float:left"&gt;Total de salarios sujetos a la retenci&amp;#243;n de la Contribuci&amp;#243;n Adicional al &lt;i&gt;Medicare&lt;/i&gt;&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="7"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line7Text">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Additional Medicare Tax withholding (multiply line 6 by 0.9% (.009))&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="10"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="float:left"&gt;Retenci&amp;#243;n de la Contributi&amp;#243;n Adicional al &lt;i&gt;Medicare&lt;/i&gt; (multiplique la línea &lt;b&gt;6&lt;/b&gt; por 0.9% (.009))&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="4"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line8Text">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Federal income tax withheld&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="21"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <!--<xsl:otherwise>&lt;span style="width:138mm;height:3.5mm;background-color:lightgray;"&gt;&lt;/span&gt;</xsl:otherwise>-->
			  <xsl:otherwise>
				&lt;div style="float:left;width:98%;background-color:lightgrey"&gt;&lt;/div&gt;
			  </xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line9Text">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Total taxes before adjustments. Add lines 3, 5, 7, and 8&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="14"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="float:left"&gt;Total de contribuciones antes de los ajustes. Sume las l&amp;#237;neas &lt;b&gt;3&lt;/b&gt;, &lt;b&gt;5&lt;/b&gt; y &lt;b&gt;7&lt;/b&gt;&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="9"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line10Text">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Current year&amp;#39;s adjustments&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="22"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="float:left"&gt;Ajustes del a&amp;#241;o en curso&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="22"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line11Text">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Total taxes after adjustments (line 9 as adjusted by line 10)&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="12"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>Total de las contribuciones despu&amp;#233;s de considerar los ajustes (la l&amp;#237;nea &lt;b&gt;9&lt;/b&gt; seg&amp;#250;n ajustada por la l&amp;#237;nea &lt;b&gt;10&lt;/b&gt;)</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line12Text">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Total deposits for 2013, including overpayment applied from a prior year and Form 943-X&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="4"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>Total de dep&amp;#243;sitos hechos en 2013, incluyendo todo exceso pagado y aplicado de un a&amp;#241;o anterior&lt;br/&gt;&lt;span style="float:left"&gt;y cantidad pagada en exceso aplicada del Formulario 943-X (PR)&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="11"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line13aText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;COBRA premium assistance payments&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="18"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="float:left"&gt;Pagos de asistencia para las primas de &lt;i&gt;COBRA&lt;/i&gt;&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="16"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line13bText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Number of individuals provided COBRA premium assistance&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="3"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="font-size:6pt;float:left;"&gt;N&amp;#250;mero de individuos que recibieron pagos de asistencia para las primas de &lt;i&gt;COBRA&lt;/i&gt;&lt;/span&gt;
				   &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="1"/>
							</xsl:call-template>
							&lt;/span&gt;
			  </xsl:otherwise>
		</xsl:choose>
	</xsl:variable>	
	<xsl:variable name="Line14Text">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;Add lines 12 and 13a&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="23"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="float:left"&gt;Sume las l&amp;#237;neas &lt;b&gt;12&lt;/b&gt; y &lt;b&gt;13a&lt;/b&gt;&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="22"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line15Text">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;&lt;b&gt;Balance due.&lt;/b&gt; If line 11 is more than 14, enter the difference and see the instructions&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="5"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;b&gt;Saldo adeudado.&lt;/b&gt; Si la l&amp;#237;nea &lt;b&gt;11&lt;/b&gt; es mayor que la l&amp;#237;nea &lt;b&gt;14&lt;/b&gt;, anote la diferencia y vea las instrucciones</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="AllFilersText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;b&gt;All filers:&lt;/b&gt; If line 11 is less than $2,500, &lt;b&gt;do not&lt;/b&gt; complete line 17 &lt;b&gt;or&lt;/b&gt; Form 943-A.</xsl:when>
			  <xsl:otherwise>&lt;b&gt;Todos los contribuyentes:&lt;/b&gt; Si la l&amp;#237;nea &lt;b&gt;11&lt;/b&gt; es menos de $2,500, &lt;b&gt;no complete&lt;/b&gt; la l&amp;#237;nea &lt;b&gt;17 ni&lt;/b&gt; el Formulario 943A-PR.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SemiWeeklyText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;b&gt;Semiweekly schedule depositors:&lt;/b&gt; Complete Form 943-A and check here</xsl:when>
			  <xsl:otherwise>&lt;b&gt;Depositantes de itinerario bisemanal:&lt;/b&gt; Complete el&lt;/br&gt;Formulario 943A-PR y marque aqu&amp;#237;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="MonthlyText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;b&gt;Monthly schedule depositors:&lt;/b&gt; Complete line 17 and check here</xsl:when>
			  <xsl:otherwise>&lt;b&gt;Depositantes de itinerario mensual:&lt;/b&gt; Complete la l&amp;#237;nea &lt;b&gt;17&lt;/b&gt;&lt;/br&gt;y marque aqu&amp;#237;.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line17Text">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;b&gt;Monthly Summary of Federal Tax Liability.&lt;/b&gt; (&lt;b&gt;Do not&lt;/b&gt; complete if you were a semiweekly schedule depositor.)</xsl:when>
			  <xsl:otherwise>&lt;b&gt;REGISTRO MENSUAL DE LA OBLIGACI&amp;#211;N CONTRIBUTIVA FEDERAL.&lt;/b&gt; (&lt;b&gt;No lo complete&lt;/b&gt; si es depositante de itinerario bisemanal).</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="JanuaryText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;January&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="3"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="float:left"&gt;enero&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="3"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FebruaryText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;February&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="3"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="float:left"&gt;febrero&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="3"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="MarchText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;March&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="3"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="float:left"&gt;marzo&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="3"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="AprilText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;April&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="4"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="float:left"&gt;abril&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="4"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="MayText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;May&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="4"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="float:left"&gt;mayo&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="3"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="JuneText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;June&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="4"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="float:left"&gt;junio&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="4"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="JulyText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;July&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="4"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="float:left"&gt;julio&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="4"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="AugustText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;August&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="3"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="float:left"&gt;agosto&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="3"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SeptemberText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;September&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="2"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="float:left"&gt;septiembre&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="2"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="OctoberText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;October&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="3"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="float:left"&gt;octubre&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="3"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="NovemberText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;November&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="2"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="float:left"&gt;noviembre&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="2"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="DecemberText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;December&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="2"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>&lt;span style="float:left"&gt;diciembre&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="2"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="MText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Total liability for&lt;br/&gt;year (add lines &lt;b&gt;A&lt;/b&gt;&lt;br/&gt;&lt;span style="float:left"&gt;through &lt;b&gt;L&lt;/b&gt;)&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">					
								<xsl:with-param name="DotQty" select="2"/>
							</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			  <xsl:otherwise>Obligaci&amp;#243;n total para el a&amp;#242;o (sume las l&amp;#237;neas &lt;b&gt;A&lt;/b&gt; a &lt;b&gt;L&lt;/b&gt;)</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="TaxLiabilityMonthText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Tax liability for month</xsl:when>
			  <xsl:otherwise>Obligaci&amp;#243;n contributiva&lt;br/&gt;para el mes de</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="DesigneeText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Third-&lt;br/&gt;Party&lt;br/&gt;Designee</xsl:when>
			  <xsl:otherwise>&lt;span style="font-size:7pt;text-align:center;width:100%"&gt;Tercero&lt;br/&gt;Autorizado&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="DiscussText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Do you want to allow another person to discuss this return with the IRS (see separate instructions)?</xsl:when>
			  <xsl:otherwise>&amp;#191;Desea permitir que otra persona hable sobre esta planilla con el &lt;i&gt;IRS&lt;/i&gt; (vea las instrucciones)?</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="YesText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Yes. Complete the following.</xsl:when>
			  <xsl:otherwise>S&amp;#237;. Complete lo siguiente.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="DesigneeNameText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Designee&amp;#39;s&lt;br/&gt;name</xsl:when>
			  <xsl:otherwise>Nombre de esta&lt;br/&gt;persona</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="DesigneePhoneText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Phone&lt;br/&gt;no.</xsl:when>
			  <xsl:otherwise>N&amp;#250;mero de&lt;br/&gt;tel&amp;#233;fono</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PINText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Personal identification&lt;br/&gt;number (PIN)</xsl:when>
			  <xsl:otherwise>N&amp;#250;mero de identificaci&amp;#243;n&lt;br/&gt;personal &lt;i&gt;(PIN)&lt;/i&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SignHereText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Sign&lt;br/&gt;Here</xsl:when>
			  <xsl:otherwise>Firme&lt;br/&gt;Aqu&amp;#237;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SignHere1Padding">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">9</xsl:when>
			  <xsl:otherwise>6</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SignHere2Padding">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">6</xsl:when>
			  <xsl:otherwise>3</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PenaltiesText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, and to the best of my knowledge and belief, it is true, correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge.</xsl:when>
			  <xsl:otherwise>Bajo pena de perjurio, afirmo que he examinado esta planilla, incluyendo todos los anexos y declaraciones adjuntos, y que, a mi leal saber y entender es ver&amp;#237;dica, correcta y completa. La declaraci&amp;#243;n del preparador (que no sea el contribuyente) est&amp;#225; basada en toda informaci&amp;#243;n de la cual el preparador tiene conocimiento.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SignatureText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Signature</xsl:when>
			  <xsl:otherwise>Firma</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PrintText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Print Your&lt;br/&gt;Name and Title</xsl:when>
			  <xsl:otherwise>Escriba su nombre y cargo</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="DateText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Date</xsl:when>
			  <xsl:otherwise>Fecha</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Text">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'"></xsl:when>
			  <xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PaidPreparerText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Paid&lt;br/&gt;Preparer&lt;br/&gt;Use Only</xsl:when>
			  <xsl:otherwise>&lt;span style="font-size:8pt;line-height:100%;"&gt;Para Uso&lt;br/&gt;Exclusivo&lt;br/&gt;Del&lt;br/&gt;Preparador&lt;br/&gt;Remunerado&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PreparerNameText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Print/Type preparer’s name</xsl:when>
			  <xsl:otherwise>Nombre del preparador</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PreparerSignatureText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Preparer’s signature</xsl:when>
			  <xsl:otherwise>Firma del preparador</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="CheckText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Check</xsl:when>
			  <xsl:otherwise>Marque aqu&amp;#237;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SelfEmployedText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">if self-employed</xsl:when>
			  <xsl:otherwise>si el preparador trabaja por cuenta propia</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FirmNameText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Firm’s name</xsl:when>
			  <xsl:otherwise>&lt;b&gt;Nombre de la empresa&lt;/b&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FirmEINText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Firm’s EIN</xsl:when>
			  <xsl:otherwise>&lt;b&gt;&lt;i&gt;EIN&lt;/i&gt; de la empresa&lt;/b&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FirmAddressText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Firm’s address</xsl:when>
			  <xsl:otherwise>&lt;b&gt;Direcci&amp;#243;n de la empresa&lt;/b&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FirmPhoneText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Phone no.</xsl:when>
			  <xsl:otherwise>&lt;b&gt;N&amp;#250;m. de tel&amp;#233;fono&lt;/b&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PrivacyText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">For Privacy Act and Paperwork Reduction Act Notice, see the separate instructions.</xsl:when>
			  <xsl:otherwise>Vea el Aviso sobre la Ley de Confidencialidad de&lt;br/&gt;Informaci&amp;#243;n y la Ley de Reducci&amp;#243;n de Tr&amp;#225;mites en las instrucciones.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="CatNoText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Cat. No. 11252K</xsl:when>
			  <xsl:otherwise>Cat. No. 17029B</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="RevText">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">Rev.</xsl:when>
			  <xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormNoText">
		<xsl:choose>
			  <xsl:when test="$SubType='943' and $Language='ENGLISH'">943</xsl:when>
			  <xsl:when test="$SubType='943PR' and $Language='ENGLISH'">&lt;span style="font-size:7pt;"&gt;943-PR (Eng)&lt;/span&gt;</xsl:when>
			  <xsl:when test="$SubType='943' and $Language='SPANISH'">943</xsl:when>
			  <xsl:when test="$SubType='943PR' and $Language='SPANISH'">&lt;span style="font-size:7pt;"&gt;943-PR&lt;/span&gt;</xsl:when>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SpanishOff">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'">1</xsl:when>
			  <xsl:otherwise>0</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SpanishPageBreakAfter">
		<xsl:choose>
			  <xsl:when test="$Language='ENGLISH'"></xsl:when>
			  <xsl:otherwise>page-break-after:always;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:template match="/">
		<html lang="{$HtmlLang}">
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)">
					</xsl:with-param></xsl:call-template>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache" />
				<meta http-equiv="Cache-Control" content="no-cache" />
				<meta http-equiv="Expires" content="0" />
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private" />
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
				<meta name="Description" content="{$MetaContent}" />
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
				<xsl:call-template name="InitJS"/>
				<style type="text/css"> 
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS943_943PRStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>  
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass" >
				<form name="Form943">
					<span style="font-family:arial;">
						<xsl:call-template name="DocumentHeader"></xsl:call-template>
					</span>
					<!-- Begin Form Number and Name -->
		<div class="styBB" style="width:187mm;height:24mm;float:none;clear:both;">
      <div class="styFNBox" style="width:29mm;height:24mm;">
        <xsl:value-of select="$FormText" /><span class="styFormNumber"><xsl:value-of disable-output-escaping="yes" select="$FormTitleText" /></span><br />
        <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$FormData"/>
        </xsl:call-template><br/>
        
		<div class="styAgency" style="font-size:7.5pt;vertical-align:bottom;padding-top:4mm;">
          Department of the Treasury<br/>
          Internal Revenue Service
        </div>
      </div>
      <div class="styFTBox" style="width:128mm;height:24mm; ">
        <div class="styMainTitle" style="height:4mm;padding-top:2mm;"><xsl:value-of disable-output-escaping="yes" select="$FormNameText" /></div>    
		 <div class="styFBT" style="height:3mm;margin-top:2mm;font:size:6pt;width:128mm;">
		 <img src="{$ImagePath}/1040PR_Bullet_Sm.gif"  alt="Bullet Image"/><xsl:value-of disable-output-escaping="yes" select="$FormDetailsText" /><br/>                  
        </div>
      </div>
      
      <div class="styTYBox" style="width:30mm;height:24mm;">
        <div class="styOMB" style="height:8mm;padding-top:2mm;">
        <xsl:value-of select="$FormOMBNoText" /></div>
       <div class="styTY" style="padding-top:2mm;">20<span class="styTYColor">13</span>
              </div>        
      </div>
    </div>
    
    <div class="styBB" style="width:187mm;float:none;clear:both;">
    <div class="styGenericDiv" style="width:28.8mm;height:{$PrintTypeHeight};padding-top:{$PrintTypePadding}mm;"><b><xsl:value-of disable-output-escaping="yes" select="$PrintTypeText" /></b></div>
    <div class="styGenericDiv" style="width:128mm;border-right:1px solid black;border-left:1px solid black;">
		<div class="styGenericDiv" style="width:128mm;border-bottom:1px solid black;">
		<div class="styGenericDiv" style="width:77.8mm;height:10mm;padding-left:2mm;border-right:1px solid black;"><xsl:value-of disable-output-escaping="yes" select="$NameText" /><br/>
			<xsl:call-template name="PopulateReturnHeaderFiler">
			<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
		</xsl:call-template><br/>
		<xsl:call-template name="PopulateReturnHeaderFiler">
			<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
		</xsl:call-template>
					
		</div>
		<div class="styGenericDiv" style="width:50mm;"><xsl:value-of disable-output-escaping="yes" select="$EINText" /><br/>
			<xsl:call-template name="PopulateReturnHeaderFiler">
				<xsl:with-param name="TargetNode">EIN</xsl:with-param>
				<xsl:with-param name="EINChanged">true</xsl:with-param>
			</xsl:call-template>
		</div>
		</div>
		<div class="styGenericDiv" style="width:127.9mm;height:10mm;border-bottom:1px solid black;padding-left:2mm;">
		<xsl:value-of select="$TradeNameText" /><br/>
			<xsl:if test="$RtnHdrData/Filer/TradeName/BusinessNameLine1">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine1"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:if test="$RtnHdrData/Filer/TradeName/BusinessNameLine2"><br/>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine2"/>
				</xsl:call-template>
			</xsl:if>			
		</div>	
		<div class="styGenericDiv" style="width:77.9mm;height:10mm;padding-left:2mm;"><xsl:value-of disable-output-escaping="yes" select="$AddressText" /><br/>
			<xsl:if test="$RtnHdrData/Filer/USAddress">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1"/>
				</xsl:call-template><br/>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine2"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1"/>
				</xsl:call-template><br />
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine2"/>
				</xsl:call-template>
			</xsl:if>
		</div>
		<div class="styGenericDiv" style="width:127.7mm;height:10mm;padding-left:2mm;border-top:1px solid black;"><xsl:value-of disable-output-escaping="yes" select="$CityStateZipText" /><br/>
			<xsl:if test="$RtnHdrData/Filer/USAddress">
				<xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>					
				</xsl:call-template>
			</xsl:if>
			<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
				<xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>					
				</xsl:call-template><span style="width:2px;"/>
				<xsl:call-template name="PopulateReturnHeaderFiler">
					<xsl:with-param name="TargetNode">Country</xsl:with-param>					
				</xsl:call-template>
			</xsl:if>				
		</div>
		<!-- BEGIN LINE FUTURE RETURNS ENGLISH -->
    <xsl:if test="$Language='ENGLISH'">               
          <div class="styGenericDiv" style="width:127.7mm;height:10mm;padding-left:2mm;padding-top:4mm;border-top:1px solid black;">
				<span style="">If you do not have to file returns in the future, check here </span>
				<span style="font-weight:bold;padding-right:3mm;padding-left:3mm;">
					.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
				</span>
				<img src="{$ImagePath}/1040PR_Bullet_Sm.gif"  alt="Bullet Image"/><span style="width:3mm;"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/FutureFilingNotRequiredInd"/>								
								<xsl:with-param name="BackupName">IRS943FutureFilingNotRequiredInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/FutureFilingNotRequiredInd"/>
								<xsl:with-param name="BackupName">IRS943FutureFilingNotRequiredInd</xsl:with-param>
							</xsl:call-template>							
						</label>
          </div>
          </xsl:if>
          <!-- END LINE FUTRE RETURNS ENGLISH -->  
    </div>
    <div class="styGenericDiv" style="width:29.4mm;height:{$PrintTypeHeight};padding-left:3mm;padding-top:3mm;"><span class="styBoldText"><xsl:value-of disable-output-escaping="yes" select="$AddressDifferentText" /></span><span style="width:1mm;"/><img src="{$ImagePath}/1040PR_Bullet_Sm.gif"  alt="Bullet Image"/><span style="width:2mm;"/>
			<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/PriorAddressInd"/>
								<xsl:with-param name="BackupName">IRS943PriorAddressInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/PriorAddressInd"/>
								<xsl:with-param name="BackupName">IRS943PriorAddressInd</xsl:with-param>
							</xsl:call-template>							
						</label>
</div>
    </div>    
    <!-- BEGIN LINE FUTURE RETURNS SPANISH -->
    <xsl:if test="$Language='SPANISH'">               
          <div class="styBB" style="width:187mm;float:none;clear:both;">            
            <div class="styLNDesc" style="width:186.8mm;">
				<span style="">Si no espera tener que radicar esta planilla en el futuro, marque esta casilla </span>
				<span style="font-weight:bold;padding-right:3mm;padding-left:3mm;">
					.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
				</span>
				<img src="{$ImagePath}/1040PR_Bullet_Sm.gif"  alt="Bullet Image"/><span style="width:3mm;"/>
						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/FutureFilingNotRequiredInd"/>
								<xsl:with-param name="BackupName">IRS943FutureFilingNotRequiredInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/FutureFilingNotRequiredInd"/>
								<xsl:with-param name="BackupName">IRS943FutureFilingNotRequiredInd</xsl:with-param>
							</xsl:call-template>							
						</label>				
            </div>  
          </div>
          </xsl:if>
          <!-- END LINE FUTRE RETURNS SPANISH -->
          <!-- BEGIN LINE 1 -->                   
          <div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
            <div class="styLNLeftNumBoxSD" style="border-bottom:1px solid black;">1</div>
            <div class="styLNDesc" style="width:138.8mm;border-bottom:1px solid black;">
				<xsl:value-of disable-output-escaping="yes" select="$Line1Text" /><span style="width:5px;" /><img src="{$ImagePath}/1040PR_Bullet_Sm.gif"  alt="Bullet Image"/>
            </div>
            <div class="styLNRightNumBox">1</div>
            <div class="styLNAmountBox">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$FormData/EmployeeCnt"/>
				</xsl:call-template>
            </div>
          </div>
          <!-- END LINE 1 -->
          <!-- BEGIN LINE SS Tax Rate -->
          <xsl:if test="$Language='SPANISH'">
          <div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
            <div class="styLNDesc" style="width:146.8mm;border-bottom:0px solid black;">
				<span style="float:left;font-weight:bold;"><xsl:value-of disable-output-escaping="yes" select="$SSRateText" /></span>
            </div>
            <div class="styLNRightNumBox" style="height:{$SSRateHeight}mm;background-color:lightgrey;border-bottom-width:0px;border-top-width:0px;" />
            <div class="styLNAmountBox" style="height:{$SSRateHeight}mm;border-bottom-width:0px; border-top-width:0px;" />
          </div>
          </xsl:if>
          <!-- END LINE SS Tax Rate -->  
          <!-- BEGIN LINE 2 -->                 
          <div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
            <div class="styLNLeftNumBoxSD">2</div>
            <div class="styLNDesc" style="width:98.85mm;">
				<xsl:value-of disable-output-escaping="yes" select="$Line2Text" />
            </div>
            <div class="styLNRightNumBox" style="height:4.4mm">2</div>
            <div class="styLNAmountBox" style="font-size:6pt;height:4.4mm">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTaxCashWagesAmt"/>
				</xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height:4.4mm;width:7.95mm;background-color:lightgrey;border-bottom-width:0px;border-top-width:0px;" />
            <div class="styLNAmountBox" style="height:4.4mm;border-bottom-width:0px; border-top-width:0px;" />
          </div>
          <!-- END LINE 2 -->
          <!-- BEGIN LINE 3 -->                  
          <div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
            <div class="styLNLeftNumBoxSD">3</div>
            <div class="styLNDesc" style="width:138.8mm;">
				<xsl:value-of disable-output-escaping="yes" select="$Line3Text" />
            </div>
            <div class="styLNRightNumBox" style="height:4.4mm">3</div>
            <div class="styLNAmountBox" style="font-size:6pt;height:4.4mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/SocialSecurityTaxAmt"/>
				</xsl:call-template>
            </div>
          </div>
          <!-- END LINE 3 -->
          <!-- BEGIN LINE 4 -->
          <div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
            <div class="styLNLeftNumBoxSD">4</div>
            <div class="styLNDesc" style="width:98.85mm;">
				<xsl:value-of disable-output-escaping="yes" select="$Line4Text" />
            </div>
            <div class="styLNRightNumBox" style="height:4.4mm">4</div>
            <div class="styLNAmountBox" style="font-size:6pt;height:4.4mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/MedicareTaxCashWagesAmt"/>
				</xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height:4.4mm;width:7.95mm;background-color:lightgrey;border-bottom-width:0px;border-top-width:0px;" />
            <div class="styLNAmountBox" style="height:4.4mm;border-bottom-width:0px; border-top-width:0px;" />
          </div>
          <!-- END LINE 4 -->
          <!-- BEGIN LINE 5 -->                 
          <div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
            <div class="styLNLeftNumBoxSD">5</div>
            <div class="styLNDesc" style="width:138.8mm;">
				<xsl:value-of disable-output-escaping="yes" select="$Line5Text" />
            </div>
            <div class="styLNRightNumBox" style="height:4.4mm">5</div>
            <div class="styLNAmountBox" style="font-size:6pt;height:4.4mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/MedicareTaxWithheldAmt"/>
				</xsl:call-template>
            </div>
          </div>
          <!-- END LINE 5 -->
         
          <!-- BEGIN LINE 6 (ENG) -->                 
          <div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
            <div class="styLNLeftNumBoxSD">6</div>
            <xsl:choose>
				<xsl:when test="$Language = 'ENGLISH'">
					<div class="styLNDesc" style="width:98.85mm;">
						<xsl:value-of disable-output-escaping="yes" select="$Line6Text" />
					</div>
					<div class="styLNRightNumBox" style="height:4.4mm">6</div>
					<div class="styLNAmountBox" style="font-size:6pt;height:4.4mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotMedcrTaxCashWagesAddnlWhAmt"/>
						</xsl:call-template>
					</div>
					<div class="styLNRightNumBox" style="height:4.4mm;width:7.95mm;background-color:lightgrey;border-bottom-width:0px;border-top-width:0px;" />
					<div class="styLNAmountBox" style="height:4.4mm;border-bottom-width:0px; border-top-width:0px;" />
				</xsl:when>
				<xsl:otherwise>
					<div class="styLNDesc" style="width:138.8mm;">
						<xsl:value-of disable-output-escaping="yes" select="$Line6Text" />
					</div>
					<div class="styLNRightNumBox" style="height:4.4mm">6</div>
					<div class="styLNAmountBox" style="font-size:6pt;height:4.4mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$FormData/TotMedcrTaxCashWagesAddnlWhAmt"/>
						</xsl:call-template>
					</div>
				</xsl:otherwise>
            </xsl:choose>
          </div>
          <!-- END LINE 6 (ENG) -->
          <!-- BEGIN LINE 7 (ENG) -->                 
          <div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
            <div class="styLNLeftNumBoxSD">7</div>
            <div class="styLNDesc" style="width:138.8mm;">
				<xsl:value-of disable-output-escaping="yes" select="$Line7Text" />
            </div>
            <div class="styLNRightNumBox" style="height:4.4mm">7</div>
            <div class="styLNAmountBox" style="font-size:6pt;height:4.4mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/AddnlMedicareTaxWithholdingAmt"/>
				</xsl:call-template>
            </div>
          </div>
          <!-- END LINE 7 (ENG) -->
       
          <!-- BEGIN LINE 8 -->                 
          <div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
            <div class="styLNLeftNumBoxSD">8</div>
            <div class="styLNDesc" style="width:138.8mm;">
				<xsl:value-of disable-output-escaping="yes" select="$Line8Text" />
            </div>
            <xsl:if test="$Language='ENGLISH'">
				<div class="styLNRightNumBox" style="height:4.4mm">8</div>
				<div class="styLNAmountBox" style="font-size:6pt;height:4.4mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/FederalIncomeTaxWithheldAmt"/>
					</xsl:call-template>
				</div>
            </xsl:if>
            <xsl:if test="$Language='SPANISH'">
				<div class="styLNRightNumBox" style="height:4.4mm;border-bottom-width:0mm;"/>
				<div class="styLNAmountBox" style="font-size:6pt;height:4.4mm;border-bottom-width:0mm;"/>
            </xsl:if>
          </div>
          <!-- END LINE 8 -->
          <!-- BEGIN LINE 9 -->                 
          <div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
            <div class="styLNLeftNumBoxSD">9</div>
            <div class="styLNDesc" style="width:138.8mm;">
				<xsl:value-of disable-output-escaping="yes" select="$Line9Text" />
            </div>
            <div class="styLNRightNumBox" style="height:4.4mm">9</div>
            <div class="styLNAmountBox" style="font-size:6pt;height:4.4mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/TotalTaxBeforeAdjustmentAmt"/>
				</xsl:call-template>
            </div>
          </div>
          <!-- END LINE 9 -->
          <!-- BEGIN LINE 10 -->                 
          <div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
          <xsl:if test="$Language='ENGLISH'">
            <div class="styLNLeftNumBox">10</div>
            </xsl:if>
            <xsl:if test="$Language='SPANISH'">
            <div class="styLNLeftNumBox">10</div>
            </xsl:if>
            <div class="styLNDesc" style="width:138.8mm;">
				<xsl:value-of disable-output-escaping="yes" select="$Line10Text" />
            </div>
            <div class="styLNRightNumBox" style="height:4.4mm">10</div>
            <div class="styLNAmountBox" style="font-size:6pt;height:4.4mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/CurrentYearAdjustmentAmt"/>
				</xsl:call-template>
            </div>
          </div>
          <!-- END LINE 10 -->
          <!-- BEGIN LINE 11 -->                 
          <div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
          <xsl:if test="$Language='ENGLISH'">
            <div class="styLNLeftNumBox">11</div>
            </xsl:if>
            <xsl:if test="$Language='SPANISH'">
            <div class="styLNLeftNumBox">11</div>
            </xsl:if>
            <div class="styLNDesc" style="width:138.8mm;">
				<xsl:value-of disable-output-escaping="yes" select="$Line11Text" />
            </div>
            <div class="styLNRightNumBox" style="height:4.4mm">11</div>
            <div class="styLNAmountBox" style="font-size:6pt;height:4.4mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/TotalTaxAfterAdjustmentAmt"/>
				</xsl:call-template>
            </div>
          </div>
          <!-- END LINE 11 -->
          <!-- BEGIN LINE 12 -->                 
          <div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
            <div class="styLNLeftNumBox">12</div>
            <div class="styLNDesc" style="width:138.8mm;">
				<xsl:value-of disable-output-escaping="yes" select="$Line12Text" />
            </div>
            <div class="styLNRightNumBox" style="height:4.4mm;"><xsl:value-of disable-output-escaping="yes" select="$SpanishBreak" />12</div>
            <div class="styLNAmountBox" style="height:4.4mm;"><xsl:value-of disable-output-escaping="yes" select="$SpanishBreak" />
				<span style="font-size:6pt;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/TotalTaxDepositAmt"/>
				</xsl:call-template></span>
            </div>
          </div>
          <!-- END LINE 12 -->
          <!-- BEGIN LINE 13a -->
          <xsl:if test="$Language='ENGLISH'">
          <div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
			  <div class="styLNLeftNumBox"/>
			  <div class="styLNDesc" style="width:138.8mm;"/>
			  <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
			  <div class="styLNAmountBox" style="border-bottom-width:0px;"/>
          </div>                   
          </xsl:if>
          <div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
            <div class="styLNLeftNumBox">13a</div>
            <div class="styLNDesc" style="width:138.8mm;">
				<xsl:value-of disable-output-escaping="yes" select="$Line13aText" />
            </div>
            <div class="styLNRightNumBox" style="height:4.4mm">13a</div>
            <div class="styLNAmountBox" style="font-size:6pt;height:4.4mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/COBRAAssistanceGrp/COBRAPremiumSubsidyAmt"/>
				</xsl:call-template>
            </div>
          </div>
          <!-- END LINE 13a -->
          <!-- BEGIN LINE 13b -->
          <div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
            <div class="styLNLeftNumBox">13b</div>
            <div class="styLNDesc" style="width:98.85mm;">
				<xsl:value-of disable-output-escaping="yes" select="$Line13bText" />
            </div>
            <div class="styLNRightNumBox">13b</div>
            <div class="styLNAmountBox">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$FormData/COBRAAssistanceGrp/COBRAPremiumSubsidyRcpntCnt"/>
				</xsl:call-template>
            </div>
            <div class="styLNRightNumBox" style="height:4.4mm;width:7.95mm;background-color:lightgrey;border-bottom-width:0px;border-top-width:0px;" />
            <div class="styLNAmountBox" style="height:4.4mm;border-bottom-width:0px; border-top-width:0px;" />
          </div>
          <!-- END LINE 13b -->
          <!-- BEGIN LINE 14 -->
          <xsl:if test="$Language='ENGLISH'">
          <div class="styGenericDiv" style="width:187mm;float:none;clear:both;">
			  <div class="styLNLeftNumBox"/>
			  <div class="styLNDesc" style="width:138.8mm;"/>
			  <div class="styLNRightNumBox" style="border-bottom-width:0px;"/>
			  <div class="styLNAmountBox" style="border-bottom-width:0px;"/>
          </div>   
          </xsl:if>                
          <div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
            <div class="styLNLeftNumBox">14</div>
            <div class="styLNDesc" style="width:138.8mm;">
				<xsl:value-of disable-output-escaping="yes" select="$Line14Text" />
            </div>
            <div class="styLNRightNumBox" style="height:4.4mm">14</div>
            <div class="styLNAmountBox" style="font-size:6pt;height:4.4mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/TotalPaymentCreditAmt"/>
				</xsl:call-template>
            </div>
          </div>
          <!-- END LINE 14 -->
          <!-- BEGIN LINE 15 -->                             
          <div class="styBB" style="width:187mm;border-bottom-width:0px;float:none;clear:both;">
            <div class="styLNLeftNumBox">15</div>
            <div class="styLNDesc" style="width:136.15mm;">
				<xsl:value-of disable-output-escaping="yes" select="$Line15Text" />
            </div>
            <div class="styGenericDiv" style="padding-top:1mm;padding-right:2px;"><img src="{$ImagePath}/1040PR_Bullet_Sm.gif"  alt="Bullet Image"/></div>
            <div class="styLNRightNumBox" style="height:4.4mm">15</div>
            <div class="styLNAmountBox" style="font-size:6pt;height:4.4mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
				</xsl:call-template>
            </div>
          </div>
          <!-- END LINE 15 -->
          <!-- BEGIN LINE 16 ENGLISH-->
          <xsl:if test="$Language='ENGLISH'">           
          <div class="styBB" style="width:187mm;float:none;clear:both;">
            <div class="styLNLeftNumBox">16</div>
            <div class="styLNDesc" style="width:auto;float:left;">
				<span style="font-size:6pt;"><b>Overpayment.</b></span> If line 14 is more than line 11, enter the difference <img src="{$ImagePath}/1040PR_Bullet_Sm.gif"  alt="Bullet Image"/>
				<span>$</span>
            </div>
            <div class="styLNDesc" style="width:25mm;text-align:right;float:left;font-size:6pt;padding-top:1mm;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/OverpaidAmt"/>
				</xsl:call-template>
            </div>
            <div class="styLNDesc" style="width:auto;float:right;">
				<span style="">Check one:</span>				
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
									<xsl:with-param name="BackupName">IRS943ApplyOverpaymentNextReturnInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
									<xsl:with-param name="BackupName">IRS943ApplyOverpaymentNextReturnInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:1mm;"/>Apply to next return.<span style="width:1mm;"/>
							</label>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
									<xsl:with-param name="BackupName">IRS943RefundOverpaymentInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
									<xsl:with-param name="BackupName">IRS943RefundOverpaymentInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:1mm;"/>Send a refund.
							</label>
						</span>
            </div>        
          </div>
          </xsl:if>
          <!-- END LINE 16 ENGLISH -->
          <!-- BEGIN LINE 16 SPANISH -->  
          <xsl:if test="$Language='SPANISH'">              
          <div class="styBB" style="width:187mm;float:none;clear:both;">          
            <div class="styLNLeftNumBox">16</div>
            <div class="styLNDesc" style="width:141mm;float:left;">
				<span style="float:left;"><b>Cantidad pagada en exceso.</b> Si la línea <b>14</b> es mayor que la línea <b>11</b>, anote la diferencia</span>
				<span style="float:right;font-weight:bold;padding-right:3mm;">
					.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.					
					<span style="width:11px;"/><img src="{$ImagePath}/1040PR_Bullet_Sm.gif"  alt="Bullet Image"/> $
				</span>				
            </div>
            <div class="styLNAmountBox" style="float:right;width:38mm;border-bottom:1px dashed black;border-left-width:0px;">
				<xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/OverpaidAmt"/>
				</xsl:call-template>
            </div>            
            <div class="styLNDesc" style="width:186.8mm;padding-left:8mm;">
				<span style="">Marque uno: </span>
				<span style="width:6mm;"/>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
									<xsl:with-param name="BackupName">IRS943ApplyOverpaymentNextReturnInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
									<xsl:with-param name="BackupName">IRS943ApplyOverpaymentNextReturnInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm;"/>Aplíquese a la próxima planilla. <span style="width:6mm;"/>
							</label>
						</span>
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
							</xsl:call-template>
							<input type="checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
									<xsl:with-param name="BackupName">IRS943RefundOverpaymentInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
									<xsl:with-param name="BackupName">IRS943RefundOverpaymentInd</xsl:with-param>
								</xsl:call-template>
								<span style="width:2mm;"/>Envíe un reembolso.
							</label>
						</span>
            </div>
          </div>
          </xsl:if>
          <!-- END LINE 16 SPANISH -->
          <!-- BEGIN ALL FILERS SECTION -->
          <div class="styGenericDiv" style="width:187mm;padding-bottom:3mm;float:none;clear:both;">
			  <div class="styGenericDiv" style="width:187mm;">				  
				  <div class="styIRS943Bullet">•</div>
				  <div class="styGenericDiv" style="width:175mm;float:left;"><xsl:value-of disable-output-escaping="yes" select="$AllFilersText" /></div>	  
			  </div>
			  <xsl:if test="$Language='ENGLISH'"> 
			  <div class="styGenericDiv" style="width:95mm;float:left;">
				  <div class="styIRS943Bullet">•</div>
				  <div style="float:left;font-size:6pt;">
					  <xsl:value-of disable-output-escaping="yes" select="$SemiWeeklyText" /><span style="padding-left:2px;padding-right:2px;">
					  <xsl:call-template name="SetFormLinkInline">
						  <xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
						</xsl:call-template>
						<img src="{$ImagePath}/1040PR_Bullet_Sm.gif"  alt="Bullet Image"/></span>
					  <input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
								<xsl:with-param name="BackupName">IRS943SemiweeklyScheduleDepositorInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
								<xsl:with-param name="BackupName">IRS943SemiweeklyScheduleDepositorInd</xsl:with-param>
							</xsl:call-template>							
						</label>				  
				  </div>
				  			  
			  </div>
			  <div class="styGenericDiv" style="width:92mm;float:right;">
				  <div class="styIRS943Bullet">•</div>
				  <div style="float:left;font-size:6pt;">
					  <xsl:value-of disable-output-escaping="yes" select="$MonthlyText" /><span style="padding-left:2px;padding-right:2px;"><img src="{$ImagePath}/1040PR_Bullet_Sm.gif"  alt="Bullet Image"/></span>
					  <input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorInd"/>
								<xsl:with-param name="BackupName">IRS943MonthlyScheduleDepositorInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorInd"/>
								<xsl:with-param name="BackupName">IRS943MonthlyScheduleDepositorInd</xsl:with-param>
							</xsl:call-template>							
						</label>				  
				  </div>
				  			  
			  </div>
			  </xsl:if>
			  <xsl:if test="$Language='SPANISH'"> 
			  <div class="styGenericDiv" style="width:95mm;float:left;padding-top:1mm;">
				  <div class="styIRS943Bullet">•</div>
				  <div style="float:left;font-size:6pt;">
					  <xsl:value-of disable-output-escaping="yes" select="$SemiWeeklyText" /><span style="padding-left:2px;padding-right:2px;">
					  <xsl:call-template name="SetFormLinkInline">
						  <xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
						</xsl:call-template>
						<span style="font-weight:bold;padding-right:3mm;padding-left:3mm;">					.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.										
				</span>
						<img src="{$ImagePath}/1040PR_Bullet_Sm.gif"  alt="Bullet Image"/></span>
					  <input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
								<xsl:with-param name="BackupName">IRS943SemiweeklyScheduleDepositorInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/SemiweeklyScheduleDepositorInd"/>
								<xsl:with-param name="BackupName">IRS943SemiweeklyScheduleDepositorInd</xsl:with-param>
							</xsl:call-template>							
						</label>				  
				  </div>
				  			  
			  </div>
			  <div class="styGenericDiv" style="width:92mm;float:right;padding-top:1mm;">
				  <div class="styIRS943Bullet">•</div>
				  <div style="float:left;font-size:6pt;">
					  <xsl:value-of disable-output-escaping="yes" select="$MonthlyText" />
					  <span style="font-weight:bold;padding-right:3mm;padding-left:3mm;">
					.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.
					<span style="width:11px;"/>.					
				</span>					  
					  <span style="padding-left:2px;padding-right:2px;"><img src="{$ImagePath}/1040PR_Bullet_Sm.gif"  alt="Bullet Image"/></span>
					  <input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorInd"/>
								<xsl:with-param name="BackupName">IRS943MonthlyScheduleDepositorInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$FormData/MonthlyScheduleDepositorInd"/>
								<xsl:with-param name="BackupName">IRS943MonthlyScheduleDepositorInd</xsl:with-param>
							</xsl:call-template>							
						</label>				  
				  </div>
				  			  
			  </div>
			  </xsl:if>
			  
          </div>
          <!-- END ALL FILERS SECTION -->
          <!-- BEGIN LINE 17 -->
          <div class="styGenericDiv" style="width:187mm;border:2px solid black;float:none;clear:both;"> 
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBoxSD">17</div>
				<div class="styLNDesc" style="width:170mm;">
					<xsl:value-of disable-output-escaping="yes" select="$Line17Text" />
				</div>
			</div>
			<div class="styGenericDiv" style="width:187mm;height:27mm;">
			<div class="styIRS943MonthlyGrp">
				<div class="styIRS943MonthNm"></div>
				<div class="styIRS943MonthAmt" style="font-size:8px;text-align:center;padding-top:.75mm;"><b><xsl:value-of disable-output-escaping="yes" select="$TaxLiabilityMonthText" /></b></div>
				<div class="styIRS943MonthNm">
					<div class="styIRS943MonthLetter">A</div>
					<div class="styIRS943Month"><xsl:value-of disable-output-escaping="yes" select="$JanuaryText" /></div>
				</div>
				<div class="styIRS943MonthAmt">
					<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'JANUARY']">
						<xsl:call-template name="PopulateAmount">
							 <xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
						</xsl:call-template>  
					</xsl:for-each>				
				</div>
				<div class="styIRS943MonthNm">
					<div class="styIRS943MonthLetter">B</div>
					<div class="styIRS943Month"><xsl:value-of disable-output-escaping="yes" select="$FebruaryText" /></div>				
				</div>
				<div class="styIRS943MonthAmt">
					<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'FEBRUARY']">
						<xsl:call-template name="PopulateAmount">
							 <xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
						</xsl:call-template>  
					</xsl:for-each>
				</div>
				<div class="styIRS943MonthNm">
					<div class="styIRS943MonthLetter">C</div>
					<div class="styIRS943Month"><xsl:value-of disable-output-escaping="yes" select="$MarchText" /></div>
				</div>
				<div class="styIRS943MonthAmt">
					<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'MARCH']">
						<xsl:call-template name="PopulateAmount">
							 <xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
						</xsl:call-template>  
					</xsl:for-each>
				</div>
				<div class="styIRS943MonthNm">
					<div class="styIRS943MonthLetter">D</div>
					<div class="styIRS943Month"><xsl:value-of disable-output-escaping="yes" select="$AprilText" /></div>
				</div>
				<div class="styIRS943MonthAmt">
					<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'APRIL']">
						<xsl:call-template name="PopulateAmount">
							 <xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
						</xsl:call-template>  
					</xsl:for-each>
				</div>
				<div class="styIRS943MonthNm">
					<div class="styIRS943MonthLetter">E</div>
					<div class="styIRS943Month"><xsl:value-of disable-output-escaping="yes" select="$MayText" /></div>
				</div>
				<div class="styIRS943MonthAmt" style="border-bottom:0px;">
					<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'MAY']">
						<xsl:call-template name="PopulateAmount">
							 <xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
						</xsl:call-template>  
					</xsl:for-each>
				</div>			
			</div>
			<div class="styIRS943MonthlyBGrp">
				<div class="styIRS943MonthBNm"></div>
				<div class="styIRS943MonthBAmt" style="font-size:8px;text-align:center;padding-top:.75mm;"><b><xsl:value-of disable-output-escaping="yes" select="$TaxLiabilityMonthText" /></b></div>
				<div class="styIRS943MonthBNm">
					<div class="styIRS943MonthBLetter">F</div>
					<div class="styIRS943Month"><xsl:value-of disable-output-escaping="yes" select="$JuneText" /></div>
				</div>
				<div class="styIRS943MonthBAmt">
					<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'JUNE']">
						<xsl:call-template name="PopulateAmount">
							 <xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
						</xsl:call-template>  
					</xsl:for-each>
				</div>
				<div class="styIRS943MonthBNm">
					<div class="styIRS943MonthBLetter">G</div>
					<div class="styIRS943Month"><xsl:value-of disable-output-escaping="yes" select="$JulyText" /></div>
				</div>
				<div class="styIRS943MonthBAmt">
					<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'JULY']">
						<xsl:call-template name="PopulateAmount">
							 <xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
						</xsl:call-template>  
					</xsl:for-each>
				</div>
				<div class="styIRS943MonthBNm">
					<div class="styIRS943MonthBLetter">H</div>
					<div class="styIRS943Month"><xsl:value-of disable-output-escaping="yes" select="$AugustText" /></div>
				</div>
				<div class="styIRS943MonthBAmt">
					<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'AUGUST']">
						<xsl:call-template name="PopulateAmount">
							 <xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
						</xsl:call-template>  
					</xsl:for-each>
				</div>
				<div class="styIRS943MonthBNm">
					<div class="styIRS943MonthBLetter">I</div>
					<div class="styIRS943Month"><xsl:value-of disable-output-escaping="yes" select="$SeptemberText" /></div>
				</div>
				<div class="styIRS943MonthBAmt">
					<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'SEPTEMBER']">
						<xsl:call-template name="PopulateAmount">
							 <xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
						</xsl:call-template>  
					</xsl:for-each>
				</div>
				<div class="styIRS943MonthBNm">
					<div class="styIRS943MonthBLetter">J</div>
					<div class="styIRS943Month"><xsl:value-of disable-output-escaping="yes" select="$OctoberText" /></div>
				</div>
				<div class="styIRS943MonthBAmt" style="border-bottom:0px;">
					<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'OCTOBER']">
						<xsl:call-template name="PopulateAmount">
							 <xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
						</xsl:call-template>  
					</xsl:for-each>
				</div>			
			</div>
			<div class="styIRS943MonthlyBGrp" style="width:62.8mm;">
				<div class="styIRS943MonthBNm" style="width:32.8mm;float:left;"/>
				<div class="styIRS943MonthCAmt" style="float:right;font-size:8px;text-align:center;padding-top:.75mm;"><b><xsl:value-of disable-output-escaping="yes" select="$TaxLiabilityMonthText" /></b></div>
				<div class="styIRS943MonthBNm" style="width:32.8mm;float:left;">
					<div class="styIRS943MonthLetter">K</div>
					<div class="styIRS943Month"><xsl:value-of disable-output-escaping="yes" select="$NovemberText" /></div>
				</div>
				<div class="styIRS943MonthCAmt" style="float:right;">
					<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'NOVEMBER']">
						<xsl:call-template name="PopulateAmount">
							 <xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
						</xsl:call-template>  
					</xsl:for-each>
				</div>
				
				<div class="styIRS943MonthBNm" style="width:32.8mm;float:left;">
					<div class="styIRS943MonthLetter">L</div>
					<div class="styIRS943Month"><xsl:value-of disable-output-escaping="yes" select="$DecemberText" /></div>
				</div>
				<div class="styIRS943MonthCAmt" style="float:right;">
					<xsl:for-each select="$FormData/TaxLiabilityMonthlyDetailGrp[MonthCd = 'DECEMBER']">
						<xsl:call-template name="PopulateAmount">
							 <xsl:with-param name="TargetNode" select="TaxLiabilityAmt"/>
						</xsl:call-template>  
					</xsl:for-each>
				</div>
				
				<div class="styIRS943MonthBNm" style="width:32.8mm;padding-top:3mm;float:left;">
					<div class="styIRS943MonthLetter" style="height:10.5mm;">M</div>
					<div class="styIRS943Month"><xsl:value-of disable-output-escaping="yes" select="$MText" /></div>
				</div>
				<div class="styIRS943MonthCAmt" style="border-bottom:0px;height:13.5mm;padding-top:9mm;float:right;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$FormData/TotalTaxLiabilityAmt"/>
					</xsl:call-template>					
				</div>					
			</div>
			</div>          
          </div>   
          <!-- END LINE 17 -->
  <!-- 3rd party -->
		<div style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;float:none;clear:both;">
			<div style="width:15mm;height:12.4mm;float:left;clear:none;border-right:1px solid black">
				<span class="styMainTitle" style="font-size:9pt;">
					<xsl:value-of disable-output-escaping="yes" select="$DesigneeText" />
					</span>
			</div>
			<div style="float:left;clear:none;width:172mm;padding-top:.5mm;">
				<div style="font-size:6pt;float:left;clear:none;padding-left:2mm;"><xsl:value-of disable-output-escaping="yes" select="$DiscussText" />
				</div>
				<div style="float:left;clear:none;padding-left:15mm;font-size:6pt;">
					<!-- Checkbox -->
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
							<xsl:with-param name="BackupName">IRS943DiscussWithThirdPartyYesInd</xsl:with-param>
						</xsl:call-template>
					</input>
					<label>
						<xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
							<xsl:with-param name="BackupName">IRS943DiscussWithThirdPartyYesInd</xsl:with-param>
						</xsl:call-template>
						<span style="padding-left:1mm;"><xsl:value-of disable-output-escaping="yes" select="$YesText" /></span>
                    </label>
				</div>
				<div style="float:left;clear:none;padding-left:5mm;font-size:6pt;">
					<!-- Checkbox -->
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateNoCheckbox">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
							<xsl:with-param name="BackupName">IRS943DiscussWithThirdPartyNoInd</xsl:with-param>
						</xsl:call-template>									
					</input>
					<label>
						<xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
							<xsl:with-param name="BackupName">IRS943DiscussWithThirdPartyNoInd</xsl:with-param>
						</xsl:call-template>
						<span style="padding-left:1mm;">No.</span>
					</label>
				</div>
			</div>
			<div style="height:9mm;float:left;clear:none;width:172mm;padding-top:2mm;">
				<div style="height:7mm;float:left;clear:none;width:auto;padding-left:2mm;font-weight:bold;font-size:6pt;">
					<xsl:value-of disable-output-escaping="yes" select="$DesigneeNameText" />
					<span style="width:2px;"/>
					<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
				</div>
				<div style="width:46mm;float:left;clear:none;">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeNm"/>
						<xsl:with-param name="BackupName">IRS943ThirdPartyDesigneeNm</xsl:with-param>
					</xsl:call-template>	
				</div>
				<div style="float:left;clear:none;width:auto;padding-left:.5mm;font-weight:bold;font-size:6pt;">
					<xsl:value-of disable-output-escaping="yes" select="$DesigneePhoneText" />
                    <span style="width:2px;"/>
					<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
				</div>
				<div style="float:left;clear:none;width:31mm;padding-top:3mm;">
					<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum">
						<xsl:call-template name="PopulatePhoneNumber">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum"/>
							<xsl:with-param name="BackupName">IRS943ThirdPartyDesigneePhoneNum</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum">
					<span style="font-size:5pt;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum"/>
							<xsl:with-param name="BackupName">IRS943ThirdPartyDesigneeFrgnPhoneNum</xsl:with-param>
						</xsl:call-template>
						</span>
					</xsl:if>
				</div>				
				<div style="height:5mm;width:24mm;float:right;clear:none;">
					<div class="styLNCtrNumBox" style="float:right;width:23mm;border-top-width:1px;padding-top:1mm;">
						<xsl:call-template name="PopulatePin">
							<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePIN"/>
							<xsl:with-param name="BackupName">IRS943ThirdPartyDesigneePIN</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
				<div style="float:right;clear:none;width:33mm;padding-left:.5mm;font-weight:bold;font-size:6pt;">
					<xsl:value-of disable-output-escaping="yes" select="$PINText" />
                    <span style="width:8mm;"/>
					<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
				</div>
			</div>
		</div>					
		<!-- Sign Here -->
		
		<div style="width:187mm;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;float:none;clear:both;{$SpanishPageBreakAfter}">
			<div style="width:14.7mm;height:19mm;float:left;clear:none;padding-top:3.5mm;">
				<span class="styMainTitle" style="font-size:15pt;">
					<xsl:value-of disable-output-escaping="yes" select="$SignHereText" />
					</span>
			</div>
			<div style="float:left;clear:none;width:171.9mm;padding-top:.5mm;border-left:1px solid black;">
			<div style="float:left;clear:none;width:171.9mm;padding-top:.5mm;">
				<div style="font-size:6pt;float:left;clear:none;padding-left:2mm;"><xsl:value-of disable-output-escaping="yes" select="$PenaltiesText" />
				</div>				
			</div>
			<div style="height:auto;float:left;clear:none;width:171.9mm;padding-top:2mm;">
				<div style="height:auto;float:left;clear:none;width:18mm;padding-left:2mm;font-weight:bold;font-size:6pt;padding-top:{$SignHere1Padding}mm;">
					<xsl:value-of disable-output-escaping="yes" select="$SignatureText" />
					<span style="width:2px;"/>
					<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
				</div>
				<div style="width:46mm;float:left;clear:none;padding-top:{$SignHere1Padding}mm;">
				<xsl:call-template name="PopulatePin">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/SignatureOptionCd"/>
				</xsl:call-template>
				<xsl:call-template name="PopulatePin">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/PIN"/>
				</xsl:call-template>
				<xsl:call-template name="PopulatePin">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerPIN"/>
				</xsl:call-template>			
				</div>				
				<div style="float:left;clear:none;width:25mm;padding-left:.5mm;font-weight:bold;font-size:6pt;padding-top:{$SignHere2Padding}mm;">
					<xsl:value-of disable-output-escaping="yes" select="$PrintText" />
                    <span style="width:2px;"/>
					<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
				</div>
				<div style="float:left;clear:none;width:auto;padding-top:{$SignHere2Padding}mm;">
					<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PersonNm">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PersonNm"/>
							</xsl:call-template>
							</xsl:if>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerNm"/>
							</xsl:call-template>
							<br/>
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/Title">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/Title"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerTitle">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerTitle"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/ReportingAgentPINGrp/RAPINEnteredByCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/ReportingAgentPINGrp/RAPINEnteredByCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PartnershipAuthorizationCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/CorporationAuthorizationCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/ExemptOrgAuthorizationCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/EstateAuthorizationCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/IndividualAuthorizationCd"/>
								</xsl:call-template>
							</xsl:if>
				</div>				
				<div style="height:5mm;width:auto;float:right;clear:none;padding-top:{$SignHere1Padding}mm;">					
					<xsl:if test="$RtnHdrData/SignatureDocumentGrp/SignatureDt">
				<xsl:call-template name="PopulateMonthDayYear">
					<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/SignatureDt"/>
				</xsl:call-template>
				</xsl:if>
			<xsl:if test="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt">
				<xsl:call-template name="PopulateMonthDayYear">
						<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerSignatureDt"/>
					</xsl:call-template>	
					</xsl:if>						
				</div>
				<div style="float:right;clear:none;width:auto;padding-left:.5mm;font-weight:bold;font-size:6pt;padding-top:{$SignHere1Padding}mm;">
					<xsl:value-of disable-output-escaping="yes" select="$DateText" />
                    <span style="width:1mm;"/>
					<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
					<span style="width:1mm;"/>
				</div>
			</div>
			</div>
		</div>
					<!-- paid preparer -->					
					<div class="styBB" style="width:187mm;font-size:6pt;float:none;clear:both;">
						<div style="width:22mm;height:22mm;padding-top:3mm;float:left;clear:none;">
							<span class="styMainTitle" style="font-size:13pt;">
									<xsl:value-of disable-output-escaping="yes" select="$PaidPreparerText" />
									</span>
						</div>
						<div style="width:164.5mm;float:left;clear:none;border-left:1px solid black;">
							<div style="width:164mm;height:100%;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:100%;width:46.8mm;padding-top:0mm;border-right:1 solid black;">
								<xsl:value-of disable-output-escaping="yes" select="$PreparerNameText" /><br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
										<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerPersonNm</xsl:with-param>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:100%;width:46.5mm;padding-top:0mm;border-right:1 solid black;padding-left:1mm;">
								<xsl:value-of disable-output-escaping="yes" select="$PreparerSignatureText" />
							</div>
								<div class="styLNDesc" style="height:100%;width:15mm;border-right:1 solid black;padding-top:0mm;padding-left:1mm;"><xsl:value-of disable-output-escaping="yes" select="$DateText" /> <br/>
									<xsl:call-template name="PopulateMonthDayYear">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SignatureDt"/>
									</xsl:call-template>
								</div>
								<div class="styLNDesc" style="height:auto;width:25mm;border-right:1 solid black;padding-top:.5mm;padding-bottom:0mm;padding-left:1mm;">
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployediSelfEmployedInd"/>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployedInd</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of disable-output-escaping="yes" select="$CheckText" /> 
										<input class="styCkbox" type="checkbox" style="width:4mm;">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
												<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSelfEmployedInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<span style="width:4px;"/><xsl:value-of disable-output-escaping="yes" select="$SelfEmployedText" />
									</label>
								</div>
								<div class="styLNDesc" style="height:6mm;width:30mm;padding-top:0mm;padding-left:1mm;">
								<xsl:if test="$Language='SPANISH'">
								<i>PTIN</i></xsl:if>
								<xsl:if test="$Language='ENGLISH'">
								PTIN</xsl:if>
                             <br/>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PreparerSSN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPreparerSSN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationPTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/STIN">
										<xsl:call-template name="PopulateReturnHeaderPaidPreparerInformation">
											<xsl:with-param name="TargetNode">STIN</xsl:with-param>
											<xsl:with-param name="BackupName">$RtnHdrDataPaidPreparerInformationSTIN</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
								<div class="styLNDesc" style="height:6mm;width:108.5mm;border-right:1 solid black;">
									<span class="styGenericDiv" style=""><xsl:value-of disable-output-escaping="yes" select="$FirmNameText" /> 
									<span style="width:2.2mm;"/>
										<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
										<span style="width:4px;"/>
									</span>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine1">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine1"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2"><br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2"/>
											</xsl:call-template>
										</xsl:if>
									</div>		
								</div>
								<div class="styLNDesc" style="height:6mm;width:52mm;padding-left:1mm;"><xsl:value-of disable-output-escaping="yes" select="$FirmEINText" />
								<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									<span style="width:4px;"/>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN">
											<xsl:call-template name="PopulateEIN">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmEIN"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/MissingEINReasonCd"/>
											</xsl:call-template>
										</xsl:if>									
								</div>
							</div>
							<div style="width:164mm;float:left;clear:none;">
								<div class="styLNDesc" style="width:108.5mm;border-right:1 solid black;">
									<div class="styGenericDiv" style="padding-right:.5mm;"><xsl:value-of disable-output-escaping="yes" select="$FirmAddressText" /> 
									<img src="{$ImagePath}/1040_Bullet.gif" alt="Right pointing arrowhead image"/>
									</div>
									<div class="styGenericDiv" style="padding-right:.5mm;">
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine1"/>
											</xsl:call-template><br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine2"/>
											</xsl:call-template><br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/City"/>
											</xsl:call-template>,<span style="width:1mm;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/State"/>
											</xsl:call-template><span style="width:2mm;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/ZIPCode"/>
											</xsl:call-template>
											</xsl:if>
										<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine1"/>
											</xsl:call-template><br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine2"/>
											</xsl:call-template><br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/City"/>
											</xsl:call-template>,<span style="width:1mm;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ProvinceOrState"/>
											</xsl:call-template><span style="width:2mm;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/PostalCode"/>
											</xsl:call-template><span style="width:2mm;"/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/Country"/>
											</xsl:call-template>
										</xsl:if>										
									</div>
								</div>
								<div class="styLNDesc" style="width:32mm;padding-left:1mm;"> <xsl:value-of disable-output-escaping="yes" select="$FirmPhoneText" /> <span style="width:1px;"/><br />
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum">
										<xsl:call-template name="PopulatePhoneNumber">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PhoneNum"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/ForeignPhoneNum"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
						</div>
					</div>
					<!-- END PREPARER SIGNATURE SECTION -->
    <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;">
            <div style="float:left;">
              <span class="styBoldText" style="font-size:6pt;">
                <xsl:value-of disable-output-escaping="yes" select="$PrivacyText" />
              </span>
            </div>
            <div style="float:right;">
              <span style="width:50px;"/>  
                <xsl:value-of disable-output-escaping="yes" select="$FormText" /> 
              <span class="styBoldText" style="font-size:6pt;"><xsl:value-of disable-output-escaping="yes" select="$FormNoText" />             
              </span> (<xsl:value-of disable-output-escaping="yes" select="$RevText" />2013)
            </div>
            <div style="float:right;text-align:center;width:26mm;font-size:6pt;">
              <xsl:value-of disable-output-escaping="yes" select="$CatNoText" />
            </div>
          </div>
          <!-- END Page Break and Footer-->
          
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