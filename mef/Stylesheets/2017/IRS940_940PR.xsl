<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS940_940PRStyle.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS940_940PR"/>
	<xsl:param name="SubType" select="/AppData/Parameters/SubmissionType"/>
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
			<xsl:when test="$Language='ENGLISH'">IRS Form 940 SSPR</xsl:when>
			<xsl:otherwise>IRS Form 940 PR</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="EnglishBreak">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;br/&gt;</xsl:when>
			<xsl:otherwise/>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SpanishBreak">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'"/>
			<xsl:otherwise>&lt;br/&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormName">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">IRS940SSPR</xsl:when>
			<xsl:otherwise>IRS940PR</xsl:otherwise>
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
			<xsl:when test="$SubType='940' and $Language='ENGLISH'">940 for 2017:</xsl:when>
			<xsl:when test="$SubType='940PR' and $Language='ENGLISH'">&lt;span style="font-size:9pt;"&gt;940-PR (Eng) for 2017:&lt;/span&gt;</xsl:when>
			<xsl:when test="$SubType='940' and $Language='SPANISH'">940 para 2017:</xsl:when>
			<xsl:when test="$SubType='940PR' and $Language='SPANISH'">940-PR para 2017:</xsl:when>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormTitleWidth">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">43</xsl:when>
			<xsl:otherwise>63</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormNameText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Employer&apos;s Annual Federal Unemployment (FUTA) Tax Return</xsl:when>
			<xsl:otherwise>Planilla para la Declaraci&amp;#243;n Federal Anual del Patrono de la Contribuci&amp;#243;n Federal para el Desempleo (&lt;i&gt;FUTA&lt;/i&gt;)</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormNameWidth">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">114</xsl:when>
			<xsl:otherwise>94</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormNameHeight">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">10</xsl:when>
			<xsl:otherwise>12.5</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormNameSize">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">14</xsl:when>
			<xsl:otherwise>13</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormUpperRightNumber">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">850113</xsl:when>
			<xsl:otherwise>&lt;br/&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormUpperRightNumber2">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">850212</xsl:when>
			<xsl:otherwise>&lt;br/&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormOMBNoText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">OMB No. 1545-0028</xsl:when>
			<xsl:otherwise>OMB No. 1545-0028</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="EINText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Employer identification number (EIN)</xsl:when>
			<!--<xsl:otherwise>N&amp;#250;mero de Identificaci&amp;#243;n&lt;br/&gt;Patronal &lt;i&gt;(EIN)&lt;/i&gt;</xsl:otherwise>-->
			<xsl:otherwise>N&amp;#250;mero de Identificaci&amp;#243;n Patronal &lt;i&gt;(EIN)&lt;/i&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="EIN2Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Employer identification number (EIN)</xsl:when>
			<xsl:otherwise>N&amp;#250;mero de Identificaci&amp;#243;n Patronal &lt;i&gt;(EIN)&lt;/i&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="NameText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;b&gt;Name&lt;/b&gt; &lt;i&gt;(not your trade name)&lt;/i&gt;</xsl:when>
			<xsl:otherwise>&lt;b&gt;Nombre&lt;/b&gt; (el de usted, no el de su negocio)</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="NameBoxWidth">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">86</xsl:when>
			<xsl:otherwise>70</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="TradeNameText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;b&gt;Trade name&lt;/b&gt; &lt;i&gt;(if any)&lt;/i&gt;</xsl:when>
			<xsl:otherwise>&lt;b&gt;Nombre comercial&lt;/b&gt; (si alguno)</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="TradeNameBoxWidth">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">94</xsl:when>
			<xsl:otherwise>83</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="AddressText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Address</xsl:when>
			<xsl:otherwise>Direcci&amp;#243;n</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="NumberText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Number</xsl:when>
			<xsl:otherwise>N&amp;#250;mero</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="StreetText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Street</xsl:when>
			<xsl:otherwise>Calle</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SuiteText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Suite or room number</xsl:when>
			<xsl:otherwise>N&amp;#250;mero de oficina o de habitaci&amp;#243;n</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SuiteWidth">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">52</xsl:when>
			<xsl:otherwise>45</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="CityText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">City</xsl:when>
			<xsl:otherwise>Ciudad</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="StateText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">State</xsl:when>
			<xsl:otherwise>Estado</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="ZipText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">ZIP code</xsl:when>
			<xsl:otherwise>C&amp;#243;digo postal (ZIP)</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PPZipText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">ZIP code</xsl:when>
			<xsl:otherwise>C&amp;#243;digo&lt;br/&gt; postal (&lt;i&gt;ZIP&lt;/i&gt;)</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="StateWidth">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">67</xsl:when>
			<xsl:otherwise>65</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="ZipWidth">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">16</xsl:when>
			<xsl:otherwise>9</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="ForeignCountryText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Foreign country name</xsl:when>
			<xsl:otherwise>Nombre del pa&amp;#237;s extranjero</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="ForeignProvinceWidth">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">33</xsl:when>
			<xsl:otherwise>37</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="ForeignPostalCdTextWidth">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">21</xsl:when>
			<xsl:otherwise>24</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="ForeignProvinceText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Foreign province/county</xsl:when>
			<xsl:otherwise>Provincia extranjera/condado</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="ForeignPostalCdText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Foreign postal code</xsl:when>
			<xsl:otherwise>C&amp;#243;digo postal extranjero</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="ReturnTypeText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Type of Return</xsl:when>
			<xsl:otherwise>Clase de planilla</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="CheckAllApplyText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">(Check all that apply.)</xsl:when>
			<xsl:otherwise>(Marque todas las que le apliquen).</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="ReturnTypeAText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Amended</xsl:when>
			<xsl:otherwise>Enmendada</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="ReturnTypeBText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Successor employer</xsl:when>
			<xsl:otherwise>Patrono sucesor</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="ReturnTypeCText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">No payments to employees in 2017</xsl:when>
			<xsl:otherwise>Ning&amp;#250;n pago hecho a los empleados en 2017</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="ReturnTypeDText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Final: Business closed or stopped paying wages</xsl:when>
			<xsl:otherwise>Final: Se cerr&amp;#243; el negocio o dej&amp;#243; de pagar salarios</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="ReturnTypeInstructionsText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Go to </xsl:when>
			<xsl:otherwise>Instrucciones y formularios para a&amp;#241;os anteriores est&amp;#225;n disponibles en </xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SeparateInstructionsText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Read the separate instructions before you complete this form. Please type or print within the boxes.</xsl:when>
			<xsl:otherwise>Lea las instrucciones por separado antes de completar este formulario. Escriba en letra de molde o a maquinilla dentro de los encasillados.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PartText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Part</xsl:when>
			<xsl:otherwise>Parte</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PartNameWidth">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">13</xsl:when>
			<xsl:otherwise>16</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PartDescWidth">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">173.5</xsl:when>
			<xsl:otherwise>170.5</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Part1Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left;font-size:7.7pt;"&gt;Tell us about your return. If any line does NOT apply, leave it blank. See instructions before completing Part 1.</xsl:when>
			<xsl:otherwise>&lt;span style="float:left;font-size:7.6pt;"&gt;Infórmenos sobre su planilla. Si NO le corresponde una línea, déjela en blanco. Vea las instrucciones antes de
			&lt;br/&gt;&lt;span style="float:left"&gt;completar la Parte 1.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line1aText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">If you had to pay state unemployment tax in one state only, enter the state abbreviation.</xsl:when>
			<xsl:otherwise>Si tuvo que pagar la contribuci&amp;#243;n estatal para el desempleo &amp;#250;nicamente en Puerto Rico,&lt;br/&gt;&lt;span style="float:left"&gt;escriba &#34;PR&#34; en los dos espacios siguientes&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="15"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line1bText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">If you had to pay state unemployment tax in more than one state, you are a multi-state&lt;br/&gt;
			  &lt;span style="float:left"&gt;employer&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="25"/>
				</xsl:call-template>
							&lt;/span&gt;
			  </xsl:when>
			<xsl:otherwise>Si tuvo que pagar la contribuci&amp;#243;n estatal para el desempleo en m&amp;#225;s de un estado, usted&lt;br/&gt;&lt;span style="float:left"&gt;es patrono en múltiples estados&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="18"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line1bBoxText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Check here. Complete Schedule A (Form 940).</xsl:when>
			<xsl:otherwise>Marque aqu&amp;#237;. Complete el Anexo A (&lt;span style="font-size:5.6pt;"&gt;Formulario 940-PR&lt;/span&gt;).</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line2Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left"&gt;If you paid wages in a state that is subject to CREDIT REDUCTION&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="7"/>
				</xsl:call-template>
							&lt;/span&gt;
			</xsl:when>
			<xsl:otherwise>&lt;span style="float:left"&gt;Si pag&amp;#243; salarios en un estado sujeto a la REDUCCI&amp;#211;N EN EL CR&amp;#201;DITO&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="7"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line2BoxText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Check here. Complete Schedule A (Form 940).</xsl:when>
			<xsl:otherwise>Marque aqu&amp;#237;. Complete el Anexo A (&lt;span style="font-size:5.6pt;"&gt;Formulario 940-PR&lt;/span&gt;).</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Part2Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Determine your FUTA tax before adjustments. If any line does NOT apply, leave it blank.</xsl:when>
			<xsl:otherwise>&lt;span style="font-size:7pt;"&gt;Determine su contribuci&amp;#243;n &lt;i&gt;FUTA&lt;/i&gt; sin considerar ajustes. Si NO le corresponde una línea, d&amp;#233;jela en blanco.&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line3Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left;"&gt;Total payments to all employees&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="18"/>
				</xsl:call-template>
							&lt;/span&gt;
			</xsl:when>
			<xsl:otherwise>&lt;span style="float:left;"&gt;Total de pagos hechos a todos sus empleados&lt;/span&gt;
						  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="14"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line4Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left;"&gt;Payments exempt from FUTA tax&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="9"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left;"&gt;Pagos exentos de la contribuci&amp;#243;n &lt;i&gt;FUTA&lt;/i&gt;&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="7"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line4CheckText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Check all that apply:</xsl:when>
			<xsl:otherwise>Marque todos los que le correspondan:</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line4aText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Fringe benefits</xsl:when>
			<xsl:otherwise>Beneficios marginales</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line4bText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Group-term life insurance</xsl:when>
			<xsl:otherwise>Seguro de vida colectivo a t&amp;#233;rmino</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line4cText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Retirement/Pension</xsl:when>
			<xsl:otherwise>Retiro/Pensi&amp;#243;n</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line4dText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Dependent care</xsl:when>
			<xsl:otherwise>Cuidado para dependientes</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line4eText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Other</xsl:when>
			<xsl:otherwise>Otro</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line5Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left;"&gt;Total of payments made to each employee in excess of $7,000&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="0"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			<xsl:otherwise>Total de pagos hechos a cada empleado en exceso de $7,000</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line6Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left;"&gt;&lt;b&gt;Subtotal&lt;/b&gt; (line 4 + line 5 = line 6)&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="19"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left;"&gt;&lt;b&gt;Subtotal&lt;/b&gt; (l&amp;#237;nea &lt;b&gt;4&lt;/b&gt; + l&amp;#237;nea &lt;b&gt;5&lt;/b&gt; = l&amp;#237;nea &lt;b&gt;6&lt;/b&gt;)&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="18"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line7Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left;"&gt;&lt;b&gt;Total taxable FUTA wages&lt;/b&gt; (line 3 &#45; line 6 = line 7). See instructions.&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="9"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left;"&gt;&lt;b&gt;Total de salarios sujetos a la contribuci&amp;#243;n &lt;i&gt;FUTA&lt;/i&gt;&lt;/b&gt; (l&amp;#237;nea &lt;b&gt;3&lt;/b&gt; - l&amp;#237;nea &lt;b&gt;6&lt;/b&gt; = l&amp;#237;nea&lt;b&gt;7&lt;/b&gt;) Vea las instrucciones&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="0"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line8Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left;"&gt;&lt;b&gt;FUTA tax before adjustments&lt;/b&gt; (line 7 x 0.006 = line 8)&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="13"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left;"&gt;&lt;b&gt;Total de la contribuci&amp;#243;n &lt;i&gt;FUTA&lt;/i&gt; antes de considerar los ajustes&lt;/b&gt; (l&amp;#237;nea &lt;b&gt;7&lt;/b&gt; x 0.006 = l&amp;#237;nea &lt;b&gt;8&lt;/b&gt;)&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="3"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Part3Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Determine your adjustments. If any line does NOT apply, leave it blank.</xsl:when>
			<xsl:otherwise>Determine sus ajustes. Si NO le corresponde una l&amp;#237;nea, d&amp;#233;jela en blanco.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line9Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;b&gt;If ALL of the taxable FUTA wages you paid were excluded from state unemployment tax,&lt;br/&gt;
			  &lt;span style=""&gt;multiply line 7 by 0.054&lt;/b&gt; (line 7 × 0.054 = line 9). Go to line 12&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="11"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="font-size:6.4pt;"&gt;&lt;b&gt;Si el TOTAL de los salarios sujetos a la contribuci&amp;#243;n &lt;i&gt;FUTA&lt;/i&gt; que pag&amp;#243; fue excluido de la contribuci&amp;#243;n estatal para el desempleo, multiplique la cantidad de la l&amp;#237;nea 7 por 0.054&lt;/b&gt; (l&amp;#237;nea &lt;b&gt;7&lt;/b&gt; x 0.054 = l&amp;#237;nea &lt;b&gt;9&lt;/b&gt;). Pase a la l&amp;#237;nea &lt;b&gt;12&lt;/b&gt;&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line10Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;b&gt;If SOME of the taxable FUTA wages you paid were excluded from state unemployment tax,&lt;br/&gt;
			  OR you paid ANY state unemployment tax late&lt;/b&gt; (after the due date for filing Form 940),&lt;br/&gt;
			   &lt;span style="float:left;"&gt;complete the worksheet in the instructions. Enter the amount from line 7 of the worksheet&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="3"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;b&gt;Si ALGUNOS salarios sujetos a la contribuci&amp;#243;n &lt;i&gt;FUTA&lt;/i&gt; que pag&amp;#243; fueron excluidos de la contribuci&amp;#243;n
estatal para el desempleo, O si pag&amp;#243; tarde ALGUNA PORCI&amp;#211;N de la contribuci&amp;#243;n estatal para el
desempleo&lt;/b&gt; &lt;span style="font-size:6pt;"&gt;(despu&amp;#233;s de la fecha l&amp;#237;mite para radicar el Formulario 940-PR)&lt;/span&gt;, complete la hoja de trabajo
en las instrucciones del Formulario 940, en ingl&amp;#233;s. Anote la cantidad de la l&amp;#237;nea &lt;b&gt;7&lt;/b&gt; de la hoja de trabajo.
&lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="2"/>
				</xsl:call-template>
							&lt;/span&gt;
</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line10BoxPadding">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">6</xsl:when>
			<xsl:otherwise>8</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line11Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left;"&gt;&lt;b&gt;If credit reduction applies,&lt;/b&gt; enter the total from Schedule A (Form 940)&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="8"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;b&gt;Si corresponde la reducci&amp;#243;n en el cr&amp;#233;dito,&lt;/b&gt; anote el total del Anexo A (Formulario 940-PR)
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="3"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Part4Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Determine your FUTA tax and balance due or overpayment. If any line does NOT apply, leave it blank.</xsl:when>
			<xsl:otherwise>Determine su contribuci&amp;#243;n &lt;i&gt;FUTA&lt;/i&gt; y saldo adeudado o cantidad pagada en exceso. Si NO le corresponde una línea, d&amp;#233;jela en blanco.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Part145Height">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">4</xsl:when>
			<xsl:otherwise>7</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line12Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left;"&gt;&lt;b&gt;Total FUTA tax after adjustments&lt;/b&gt; (lines 8 + 9 + 10 + 11 = line 12)&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="9"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;b&gt;Total de su contribuci&amp;#243;n &lt;i&gt;FUTA&lt;/i&gt; despu&amp;#233;s de considerar los ajustes&lt;/b&gt; (&lt;span style="font-size:6.5pt;"&gt;l&amp;#237;neas &lt;b&gt;8&lt;/b&gt; + &lt;b&gt;9&lt;/b&gt; + &lt;b&gt;10&lt;/b&gt; + &lt;b&gt;11&lt;/b&gt; = l&amp;#237;nea &lt;b&gt;12&lt;/b&gt;&lt;/span&gt;)</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line13Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left;"&gt;FUTA tax deposited for the year, including any overpayment applied from a prior year&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="2"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			<xsl:otherwise>Contribuci&amp;#243;n &lt;i&gt;FUTA&lt;/i&gt; depositada para el a&amp;#241;o, incluyendo toda cantidad pagada en exceso aplicada<br/>&lt;span style="float:left;"&gt;de un a&amp;#241;o anterior&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="23"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line13Padding">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'"/>
			<xsl:otherwise>3</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line14Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;b&gt;Balance due&lt;/b&gt;. If line 12 is more than line 13, enter the excess on line 14.</xsl:when>
			<xsl:otherwise>&lt;b&gt;Saldo adeudado&lt;/b&gt;. Si la l&amp;#237;nea &lt;b&gt;12&lt;/b&gt; es mayor que la l&amp;#237;nea &lt;b&gt;13&lt;/b&gt;, anote el excedente en la l&amp;#237;nea &lt;b&gt;14&lt;/b&gt;.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line14MoreText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">If line 14 is more than $500, you must deposit your tax.</xsl:when>
			<xsl:otherwise>Si la l&amp;#237;nea &lt;b&gt;14&lt;/b&gt; es mayor de $500, tiene que depositar la contribuci&amp;#243;n.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line14LessText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left;"&gt;If line 14 is $500 or less, you may pay with this return. See instructions.&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="7"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			<xsl:otherwise>Si la línea &lt;b&gt;14&lt;/b&gt; es $500 o menos, puede hacer su pago junto con esta planilla. Vea las instrucciones</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line15Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;b&gt;Overpayment&lt;/b&gt;. If line 13 is more than line 12, enter the excess on line 15 and check a box below.</xsl:when>
			<xsl:otherwise>&lt;b&gt;Cantidad pagada en exceso.&lt;/b&gt; Si la línea &lt;b&gt;13&lt;/b&gt; es mayor que la línea &lt;b&gt;12&lt;/b&gt;, anote el excedente en la l&amp;#237;nea&lt;br/&gt;&lt;span style="float:left;"&gt;&lt;b&gt;15&lt;/b&gt; y marque uno de los encasillados que aparecen a continuaci&amp;#243;n&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="9"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line15Padding">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'"/>
			<xsl:otherwise>3</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="MustCompleteText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">You &lt;b&gt;MUST&lt;/b&gt; complete both pages of this form and &lt;b&gt;SIGN&lt;/b&gt; it.</xsl:when>
			<xsl:otherwise>&lt;b&gt;TIENE&lt;/b&gt; que completar ambas p&amp;#225;ginas del Formulario 940-PR y luego &lt;b&gt;FIRMARLO.&lt;/b&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="CheckOneText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Check one:</xsl:when>
			<xsl:otherwise>Marque uno:</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="ApplyNextReturnText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Apply to next return.</xsl:when>
			<xsl:otherwise>Apl&amp;#237;quese a la pr&amp;#243;xima planilla.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SendRefundText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Send a refund.</xsl:when>
			<xsl:otherwise>Env&amp;#237;e un reembolso.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="ForPrivacyText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">For Privacy Act and Paperwork Reduction Act Notice, see the back of Form 940-V, Payment Voucher.</xsl:when>
			<xsl:otherwise>Para el Aviso sobre la Ley de Confidencialidad de Informaci&amp;#243;n y la Ley de Reducci&amp;#243;n de&lt;br /&gt;Tr&amp;#225;mites, vea el dorso del Formulario 940-V(PR), Comprobante de Pago.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="CatNoText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Cat. No. 11234O</xsl:when>
			<xsl:otherwise>Cat. No. 16996R</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FormNoText">
		<xsl:choose>
			<xsl:when test="$SubType='940' and $Language='ENGLISH'">940</xsl:when>
			<xsl:when test="$SubType='940PR' and $Language='ENGLISH'">940-PR (Eng)</xsl:when>
			<xsl:when test="$SubType='940' and $Language='SPANISH'">940</xsl:when>
			<xsl:when test="$SubType='940PR' and $Language='SPANISH'">940-PR</xsl:when>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="NextImageNm">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">940SSPR_Next</xsl:when>
			<xsl:otherwise>940SSPR_NextES</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Part5Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Report your FUTA tax liability by quarter only if line 12 is more than $500. If not, go to Part 6.</xsl:when>
			<xsl:otherwise>Informe su obligaci&amp;#243;n contributiva para la contribuci&amp;#243;n &lt;i&gt;FUTA&lt;/i&gt; por trimestre s&amp;#243;lo si la cantidad de la l&amp;#237;nea 12 es mayor que $500. Si no es as&amp;#237;, pase a la Parte 6.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Part5Padding">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'"/>
			<xsl:otherwise>1</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line16Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Report the amount of your FUTA tax liability for each quarter; do NOT enter the amount you deposited. If you had no liability for a quarter, leave the line blank.</xsl:when>
			<xsl:otherwise>Informe su obligaci&amp;#243;n contributiva para la contribuci&amp;#243;n FUTA por cada trimestre; NO anote la cantidad que deposit&amp;#243;. Si no adeud&amp;#243; ninguna contribuci&amp;#243;n por cualquier trimestre, deje la l&amp;#237;nea en blanco.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line16aText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left;"&gt;&lt;b&gt;1st quarter&lt;/b&gt; (January 1 &#45; March 31)&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="9"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left;"&gt;&lt;b&gt;1er trimestre&lt;/b&gt; (1 de enero &#45; 31 de marzo)&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="7"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line16bText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left;"&gt;&lt;b&gt;2nd quarter&lt;/b&gt; (April 1 &#45; June 30)&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="10"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left;"&gt;&lt;b&gt;2do trimestre&lt;/b&gt; (1 de abril &#45; 30 de junio)&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="8"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line16cText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left;"&gt;&lt;b&gt;3rd quarter&lt;/b&gt; (July 1 &#45; September 30)&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="9"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left;"&gt;&lt;b&gt;3er trimestre&lt;/b&gt; (1 de julio &#45; 30 de septiembre)&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="6"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line16dText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;span style="float:left;"&gt;&lt;b&gt;4th quarter&lt;/b&gt; (October 1 &#45; December 31)&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="8"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:when>
			<xsl:otherwise>&lt;span style="float:left;"&gt;&lt;b&gt;4to trimestre&lt;/b&gt; (1 de octubre &#45; 31 de diciembre)&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="6"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line17Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;b&gt;Total tax liability for the year&lt;/b&gt; (lines 16a + 16b + 16c + 16d = line 17)</xsl:when>
			<xsl:otherwise>&lt;b&gt;Total de la obligaci&amp;#243;n contributiva para el a&amp;#241;o&lt;/b&gt; (l&amp;#237;neas &lt;b&gt;16a&lt;/b&gt; + &lt;b&gt;16b&lt;/b&gt; + &lt;br/&gt;
			  &lt;span style="float:left;"&gt;&lt;b&gt;16c&lt;/b&gt; + &lt;b&gt;16d&lt;/b&gt; = l&amp;#237;nea &lt;b&gt;17&lt;/b&gt;)&lt;/span&gt;
			  &lt;span class="styBoldText" style="float:right;font-size:7pt;padding-right:10px;"&gt;
							  <xsl:call-template name="DotLoop">
					<xsl:with-param name="DotQty" select="14"/>
				</xsl:call-template>
							&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line17TotalText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Total must equal line 12.</xsl:when>
			<xsl:otherwise>Este total tiene que &lt;br/&gt;ser igual al de la l&amp;#237;nea 12.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line17BoxPadding">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">0</xsl:when>
			<xsl:otherwise>3</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Line17EqualLine12Padding">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">1</xsl:when>
			<xsl:otherwise>2.5</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Part6Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">May we speak with your third-party designee?</xsl:when>
			<xsl:otherwise>&amp;#191;Podemos hablar con su tercero autorizado?</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Part6QuestionText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">&lt;b&gt;Do you want to allow an employee, a paid tax preparer, or another person to discuss this return with the IRS? See the instructions for details.&lt;/b&gt;</xsl:when>
			<xsl:otherwise>&lt;b&gt;&amp;#191;Desea permitir que su empleado, preparador remunerado u otra persona hable sobre esta planilla con el &lt;i&gt;IRS&lt;/i&gt;? Vea las instrucciones para m&amp;#225;s detalles.&lt;/b&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="YesText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Yes.</xsl:when>
			<xsl:otherwise>Sí.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="DesigneeNameText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Designee&apos;s name and phone number</xsl:when>
			<xsl:otherwise>Nombre y n&amp;#250;m. de tel&amp;#233;fono de la persona</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="DesigneePINText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Select a 5-digit Personal Identification Number (PIN) to use when talking to IRS</xsl:when>
			<xsl:otherwise>Escoja un n&amp;#250;mero de identificaci&amp;#243;n personal &lt;i&gt;(PIN)&lt;/i&gt; de 5 d&amp;#237;gitos que se debe usar al hablar con el &lt;i&gt;IRS&lt;/i&gt;.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="Part7Text">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Sign here. You MUST complete both pages of this form and SIGN it.</xsl:when>
			<xsl:otherwise>Firme aqu&amp;#237;. TIENE que completar ambas p&amp;#225;ginas del formulario y FIRMARLO.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PenaltiesText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, and to the best of my knowledge and belief, it is true, correct, and complete, and that no part of any payment made to a state unemployment fund claimed as a credit was, or is to be, deducted from the payments made to employees. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge.</xsl:when>
			<xsl:otherwise>Bajo pena de perjurio, declaro que he examinado esta planilla, incluyendo todos los anexos y declaraciones adjuntos, y que, a mi leal saber y entender, es ver&amp;#237;dica, correcta y completa y que ninguna porci&amp;#243;n de los pagos hechos al fondo estatal de desempleo por la que reclamo cr&amp;#233;dito fue, ni ser&amp;#225;, deducida de los pagos hechos a mis empleados. La declaraci&amp;#243;n del preparador (que no sea el contribuyente) est&amp;#225; basada en toda informaci&amp;#243;n de la cual el preparador tiene conocimiento.</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SignText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Sign your&lt;br/&gt;name here</xsl:when>
			<xsl:otherwise>Firme su&lt;br/&gt;nombre&lt;br/&gt;aquí</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PrintNameText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Print your&lt;br/&gt;name here</xsl:when>
			<xsl:otherwise>Escriba su nombre en&lt;br/&gt;letra de molde aqu&amp;#237;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PrintTitleText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Print your&lt;br/&gt;title here</xsl:when>
			<xsl:otherwise>Escriba su cargo en&lt;br/&gt;letra de molde aqu&amp;#237;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PrintTextWidth">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">17</xsl:when>
			<xsl:otherwise>29</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PrintBoxWidth">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">49</xsl:when>
			<xsl:otherwise>41.5</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="DateText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Date</xsl:when>
			<xsl:otherwise>Fecha</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="BestNumberText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Best daytime phone</xsl:when>
			<xsl:otherwise>Mejor n&amp;#250;m. de tel&amp;#233;fono donde&lt;br/&gt;llamarlo durante el d&amp;#237;a</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="BestNumberTextWidth">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">71</xsl:when>
			<xsl:otherwise>83</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="BestNumberBoxWidth">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">36.5</xsl:when>
			<xsl:otherwise>28</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PaidPreparerText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Paid Preparer Use Only</xsl:when>
			<xsl:otherwise>Para uso exclusivo del preparador remunerado</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SelfEmployedText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Check if you are self-employed</xsl:when>
			<xsl:otherwise>Marque aqu&amp;#237; si trabaja por cuenta propia</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="SelfEmployedTextWidth">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">45</xsl:when>
			<xsl:otherwise>60</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PreparerNameText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Preparer&apos;s name</xsl:when>
			<xsl:otherwise>Nombre del&lt;br/&gt;preparador</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PPSPTINText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">PTIN</xsl:when>
			<xsl:otherwise>&lt;i&gt;PTIN&lt;/i&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PPSEINText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">EIN</xsl:when>
			<xsl:otherwise>&lt;i&gt;EIN&lt;/i&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PreparerSignatureText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Preparer&apos;s signature</xsl:when>
			<xsl:otherwise>Firma del&lt;br/&gt;preparador</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="FirmNameText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Firm&#39;s name (or yours if self-employed)</xsl:when>
			<xsl:otherwise>&lt;span style="font-size:6pt;"&gt;Nombre de la empresa (o el suyo, si trabaja por cuenta propia)&lt;/span&gt;</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PreparerPhoneText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Phone</xsl:when>
			<xsl:otherwise>N&amp;#250;m. de&lt;br/&gt;tel&amp;#233;fono</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="PageText">
		<xsl:choose>
			<xsl:when test="$Language='ENGLISH'">Page </xsl:when>
			<xsl:otherwise>P&amp;#225;gina </xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:template match="/">
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="{$HtmlLang}">
			<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($FormData)">
					</xsl:with-param>
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
				<meta name="Description" content="{$MetaContent}"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS940_940PRStyle"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form940">
					<xsl:call-template name="DocumentHeader"/>
					<!-- BEGIN FORM HEADER -->
					<div class="styBB" style="width:187mm;border-bottom-width:0px;">
						<div class="styFNBox" style="width:{$FormTitleWidth}mm;height:{$FormNameHeight}mm;border:0px;padding-left:.5mm;">
							<xsl:value-of select="$FormText"/>
							<span class="styFormNumber" style="font-size:15pt;">
								<xsl:value-of disable-output-escaping="yes" select="$FormTitleText"/>
							</span>
							<br/>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$FormData"/>
							</xsl:call-template>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$RtnDoc/BinaryAttachment"/>
							</xsl:call-template>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$RtnDoc/GeneralDependencySmall"/>
							</xsl:call-template>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$RtnDoc/FinalPayrollInfoStatement"/>
							</xsl:call-template>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$RtnDoc/IRS941ScheduleR"/>
							</xsl:call-template>
							<xsl:if test="$Language='SPANISH'">
								<xsl:choose>
									<xsl:when test="($FormData/@referenceDocumentId) and not($FormData/@referenceDocumentId='')">
										<br/>
										<div class="styAgency" style="font-size:7.5pt;font-weight:normal;">Department of the Treasury — Internal Revenue Service</div>
									</xsl:when>
									<xsl:otherwise>
										<div class="styAgency" style="font-size:7.5pt;padding-top:2.9mm;">Department of the Treasury — Internal Revenue Service</div>
									</xsl:otherwise>
								</xsl:choose>
							</xsl:if>
						</div>
						<div class="styFTBox" style="width:{$FormNameWidth}mm;text-align:left;height:{$FormNameHeight}mm;">
							<div class="styMainTitle" style="font-size:{$FormNameSize}px;padding-top:1mm;">
								<xsl:value-of disable-output-escaping="yes" select="$FormNameText"/>
							</div>
							<xsl:if test="$Language='ENGLISH'">
								<div class="styAgency" style="font-size:7.5pt;font-weight:normal;padding-top:1.2mm;">Department of the Treasury — Internal Revenue Service</div>
							</xsl:if>
						</div>
						<div class="styTYBox" style="width:30mm;height:{$FormNameHeight}mm;border:0px;">
							<div style="font-size:12pt;font-family:Courier New;font-weight:bold;text-align:right;">
								<xsl:value-of disable-output-escaping="yes" select="$FormUpperRightNumber"/>
							</div>
							<xsl:if test="$Language='ENGLISH'">
								<div class="styOMB" style="font-size:7pt;text-align:right;border:0px;padding-top:1mm;">
									<xsl:value-of disable-output-escaping="yes" select="$FormOMBNoText"/>
								</div>
							</xsl:if>
							<xsl:if test="$Language='SPANISH'">
								<div class="styOMB" style="font-size:7pt;text-align:right;border:0px;padding-top:3.5mm;">
									<xsl:value-of disable-output-escaping="yes" select="$FormOMBNoText"/>
								</div>
							</xsl:if>
						</div>
						<div class="styBB" style="float:left;border:black solid 1px; padding-top:.75mm; padding-left:2mm; padding-right:2mm;font-size:6.5pt;width:127mm;">
							<div style="width:122mm;padding-top:0mm;">
								<span style="float:left;padding-top:1.2mm;">
									<b>
										<xsl:value-of disable-output-escaping="yes" select="$EINText"/>
									</b>
								</span>
								<div style="float:right;">
									<span class="styLNCtrNumBox" style="width:67mm;border-top-width:1px;padding-top:1mm;float:right;height:6mm;">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">EIN</xsl:with-param>
											<xsl:with-param name="EINChanged">true</xsl:with-param>
										</xsl:call-template>
									</span>
								</div>
							</div>
							<div style="width:122mm;padding-bottom:1mm;padding-top:1mm;">
								<span style="float:left;padding-top:3mm;font-size:6.5pt;">
									<xsl:value-of disable-output-escaping="yes" select="$NameText"/>
								</span>
								<span class="styLNCtrNumBox" style="width:{$NameBoxWidth}mm;border-top-width:1px;padding-top:.5mm;padding-left:1mm;float:right;height:auto;text-align:left;">
									<xsl:if test="$RtnHdrData/Filer/BusinessName/BusinessNameLine1Txt">
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/Filer/BusinessName/BusinessNameLine2Txt">
										<br/>
										<xsl:call-template name="PopulateReturnHeaderFiler">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
							<div style="width:122mm;padding-bottom:1mm;padding-top:0mm;">
								<span style="float:left;padding-top:3mm;font-size:6.5pt;">
									<xsl:value-of disable-output-escaping="yes" select="$TradeNameText"/>
								</span>
								<span class="styLNCtrNumBox" style="width:{$TradeNameBoxWidth}mm;border-top-width:1px;padding-left:1mm;padding-top:1mm;float:right;height:auto;text-align:left;">
									<xsl:if test="$RtnHdrData/Filer/TradeName/BusinessNameLine1Txt">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine1Txt"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/Filer/TradeName/BusinessNameLine2Txt">
										<br/>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/TradeName/BusinessNameLine2Txt"/>
										</xsl:call-template>
									</xsl:if>
								</span>
							</div>
							<div style="width:122mm;padding-bottom:.5mm;padding-top:0mm;">
								<span style="float:left;padding-top:2mm;font-weight:bold;font-size:6.5pt;">
									<xsl:value-of disable-output-escaping="yes" select="$AddressText"/>
								</span>
								<!--<span style="float:right;">-->
								<span class="styLNCtrNumBox" style="width:107mm;border-top-width:1px;padding-left:1mm;padding-top:1mm;float:right;height:auto;text-align:left;">
									<xsl:if test="$RtnHdrData/Filer/USAddress">
										<xsl:if test="$RtnHdrData/Filer/USAddress/AddressLine1Txt">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine1Txt"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/Filer/USAddress/AddressLine2Txt">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/AddressLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:if>
									<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
										<xsl:if test="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine1Txt"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/Filer/ForeignAddress/AddressLine2Txt">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/AddressLine2Txt"/>
											</xsl:call-template>
										</xsl:if>
									</xsl:if>
								</span>
								<span style="width:122mm;font-size:5pt;vertical-align:middle;padding-left:15mm;">
									<xsl:value-of disable-output-escaping="yes" select="$NumberText"/>
									<span style="width:20mm"/>
									<xsl:value-of disable-output-escaping="yes" select="$StreetText"/>
									<span style="width:{$SuiteWidth}mm;"/>
									<xsl:value-of disable-output-escaping="yes" select="$SuiteText"/>
								</span>
								<span style="float:left;clear:none;width:15mm;border-top-width:1px;padding-top:1mm;height:6mm;text-align:left;"/>
								<span class="styLNCtrNumBox" style="width:64mm;border-top-width:1px;padding-top:0mm;padding-left:1mm;height:6mm;float:left;text-align:left;word-wrap:break-word;">
									<xsl:if test="$RtnHdrData/Filer/USAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/CityNm"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CityNm"/>
										</xsl:call-template>
									</xsl:if>
								</span>
								<span style="float:left;clear:none;width:2mm;border-top-width:1px;padding-top:1mm;height:6mm;text-align:left;"/>
								<span class="styLNCtrNumBox" style="width:15mm;border-top-width:1px;padding-top:1mm;height:6mm;">
									<xsl:if test="$RtnHdrData/Filer/USAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/StateAbbreviationCd"/>
										</xsl:call-template>
									</xsl:if>
								</span>
								<span style="float:left;clear:none;width:2mm;border-top-width:1px;padding-top:1mm;height:6mm;text-align:left;"/>
								<span class="styLNCtrNumBox" style="width:24mm;border-top-width:1px;padding-top:1mm;height:6mm;">
									<xsl:if test="$RtnHdrData/Filer/USAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/USAddress/ZIPCd"/>
										</xsl:call-template>
									</xsl:if>
								</span>
								<span style="width:122mm;font-size:5pt;vertical-align:middle;padding-left:15mm;">
									<xsl:value-of disable-output-escaping="yes" select="$CityText"/>
									<span style="width:{$StateWidth}mm"/>
									<xsl:value-of disable-output-escaping="yes" select="$StateText"/>
									<span style="width:{$ZipWidth}mm;"/>
									<xsl:value-of disable-output-escaping="yes" select="$ZipText"/>
								</span>
								<span style="float:left;clear:none;width:15mm;border-top-width:1px;padding-top:1mm;height:6mm;text-align:left;"/>
								<span class="styLNCtrNumBox" style="width:42mm;border-top-width:1px;padding-top:1mm;padding-left:1mm;height:6mm;text-align:left;">
									<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/CountryCd"/>
										</xsl:call-template>
									</xsl:if>
								</span>
								<span style="float:left;clear:none;width:2mm;border-top-width:1px;padding-top:1mm;height:6mm;text-align:left;"/>
								<span class="styLNCtrNumBox" style="width:33mm;border-top-width:1px;padding-top:1mm;height:6mm;">
									<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ProvinceOrStateNm"/>
										</xsl:call-template>
									</xsl:if>
								</span>
								<span style="float:left;clear:none;width:2mm;border-top-width:1px;padding-top:1mm;height:6mm;text-align:left;"/>
								<span class="styLNCtrNumBox" style="width:28mm;border-top-width:1px;padding-top:0mm;height:6mm;">
									<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/ForeignAddress/ForeignPostalCd"/>
										</xsl:call-template>
									</xsl:if>
								</span>
								<span style="width:122mm;font-size:5pt;vertical-align:middle;padding-left:15mm;">
									<span style="width:{$ForeignProvinceWidth}mm;text-align:left;">
										<xsl:value-of disable-output-escaping="yes" select="$ForeignCountryText"/>
									</span>
									<span style="width:2mm;"/>
									<span style="width:38mm;text-align:center;">
										<xsl:value-of disable-output-escaping="yes" select="$ForeignProvinceText"/>
									</span>
									<span style="width:2mm;"/>
									<span style="width:{$ForeignPostalCdTextWidth}mm;text-align:center;">
										<xsl:value-of disable-output-escaping="yes" select="$ForeignPostalCdText"/>
									</span>
								</span>
								<!--</span>-->
							</div>
						</div>
						<!-- "Type of Return" Checkboxes alt Language Switch -->
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div style="float:right;">
									<div class="styBB" style="border-left-width:1px;border-right-width:1px;border-top-width:1px;padding-left:2mm;padding-top:.75mm;padding-right:3mm;width:57mm;">
										<div style="color:white; background-color:black; font-size:8pt;font-weight:bold;float:left;clear:none;width:53mm;text-align:left;padding-left:1mm;padding-top:0.5mm;padding-bottom:0.8mm;padding-right:0.6mm;">
											<xsl:value-of disable-output-escaping="yes" select="$ReturnTypeText"/>
											<br/>
											<span style="font-size:7pt;">
												<xsl:value-of disable-output-escaping="yes" select="$CheckAllApplyText"/>
											</span>
										</div>
										<div style="width:53mm;float:none;clear:both;">
											<div style="width:53mm;padding-top:1mm;float:none;clear:both;">
												<div style="width:10mm;float:left;">
													<input type="checkbox" alt="Amended Return Indicator" class="styCkbox">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
															<xsl:with-param name="BackupName">IRS940AmendedReturnInd</xsl:with-param>
														</xsl:call-template>
													</input>
													<label>
														<xsl:call-template name="PopulateLabel">
															<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
															<xsl:with-param name="BackupName">IRS940AmendedReturnInd</xsl:with-param>
														</xsl:call-template>
													</label>
													<b>a. </b>
												</div>
												<div style="width:43mm;padding-top:1.4mm;float:left;">
													<xsl:value-of disable-output-escaping="yes" select="$ReturnTypeAText"/>
												</div>
											</div>
											<div style="width:53mm;padding-top:1mm;float:left;clear:both;">
												<div style="width:10mm;float:left;">
													<input type="checkbox" alt="Successor Employer" class="styCkbox">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="$FormData/SuccessorEmployerInd"/>
															<xsl:with-param name="BackupName">IRS940SuccessorEmployerInd</xsl:with-param>
														</xsl:call-template>
													</input>
													<label>
														<xsl:call-template name="PopulateLabel">
															<xsl:with-param name="TargetNode" select="$FormData/SuccessorEmployerInd"/>
															<xsl:with-param name="BackupName">IRS940SuccessorEmployerInd</xsl:with-param>
														</xsl:call-template>
													</label>
													<b>b. </b>
												</div>
												<div style="width:43mm;padding-top:1.4mm;float:left;">
													<xsl:value-of disable-output-escaping="yes" select="$ReturnTypeBText"/>
												</div>
											</div>
											<div style="width:53mm;padding-top:1mm;float:left;clear:both;">
												<!--<div style="float:left;clear:none;padding-top:1mm;">-->
												<div style="width:10mm;float:left;">
													<input type="checkbox" alt="No payments to employees in 2017" class="styCkbox">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="$FormData/NoPaymentsToEmployeesInd"/>
															<xsl:with-param name="BackupName">IRS940NoPaymentsToEmployeesInd</xsl:with-param>
														</xsl:call-template>
													</input>
													<label>
														<xsl:call-template name="PopulateLabel">
															<xsl:with-param name="TargetNode" select="$FormData/NoPaymentsToEmployeesInd"/>
															<xsl:with-param name="BackupName">IRS940NoPaymentsToEmployeesInd</xsl:with-param>
														</xsl:call-template>
													</label>
													<b>c. </b>
												</div>
												<div style="width:43mm;float:left;">
													<xsl:value-of disable-output-escaping="yes" select="$ReturnTypeCText"/>
												</div>
												<!--</div>-->
											</div>
											<div style="width:53mm;padding-top:1mm;float:left;clear:both;">
												<!--<div style="float:left;clear:none;padding-top:1mm;padding-bottom:2mm;">-->
												<div style="width:10mm;float:left;">
													<input type="checkbox" alt="Final Return. Future Filing Not Required" class="styCkbox">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="$FormData/FutureFilingNotRequiredInd"/>
															<xsl:with-param name="BackupName">IRS940FutureFilingNotRequiredInd</xsl:with-param>
														</xsl:call-template>
													</input>
													<label>
														<xsl:call-template name="PopulateLabel">
															<xsl:with-param name="TargetNode" select="$FormData/FutureFilingNotRequiredInd"/>
															<xsl:with-param name="BackupName">IRS940FutureFilingNotRequiredInd</xsl:with-param>
														</xsl:call-template>
													</label>
													<b>d. </b>
												</div>
												<div style="width:43mm;float:left;">
													<xsl:value-of disable-output-escaping="yes" select="$ReturnTypeDText"/>
												</div>
												<!--</div>-->
											</div>
											<!--</div>-->
										</div>
										<div style="width:52mm;padding-bottom:0.8mm;padding-top:1.5mm;float:none;clear:both;">
											<xsl:value-of disable-output-escaping="yes" select="$ReturnTypeInstructionsText"/>
											<a style="text-decoration:none;color:black;" href="http://www.irs.gov/Form940" title="Link to IRS.gov">
											<i>www.irs.gov/Form940</i> for the latest instructions.</a>
											<br/>
										</div>
									</div>
								</div>
							</xsl:when>
							<!-- Stop ENGLISH, start SPANISH -->
							<xsl:otherwise>
								<div style="float:right;">
									<div class="styBB" style="border-left-width:1px;border-right-width:1px;border-top-width:1px;padding-left:2mm;padding-top:.75mm;padding-right:3mm;width:57mm;">
										<div style="color:white; background-color:black; font-size:8pt;font-weight:bold;float:left;clear:none;width:53mm;text-align:left;padding-left:1mm;padding-top:0.5mm;padding-bottom:0.8mm;padding-right:0.6mm;">
											<xsl:value-of disable-output-escaping="yes" select="$ReturnTypeText"/>
											<br/>
											<span style="font-size:7pt;">
												<xsl:value-of disable-output-escaping="yes" select="$CheckAllApplyText"/>
											</span>
										</div>
										<div style="width:53mm;float:none;clear:both;">
											<div style="width:53mm;padding-top:1mm;float:none;clear:both;">
												<div style="width:10mm;float:left;">
													<input type="checkbox" alt="Enmendada" class="styCkbox">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
															<xsl:with-param name="BackupName">IRS940AmendedReturnInd</xsl:with-param>
														</xsl:call-template>
													</input>
													<label>
														<xsl:call-template name="PopulateLabel">
															<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
															<xsl:with-param name="BackupName">IRS940AmendedReturnInd</xsl:with-param>
														</xsl:call-template>
													</label>
													<b>a. </b>
												</div>
												<div style="width:43mm;padding-top:1.4mm;float:left;">
													<xsl:value-of disable-output-escaping="yes" select="$ReturnTypeAText"/>
												</div>
											</div>
											<div style="width:53mm;padding-top:1mm;float:left;clear:both;">
												<div style="width:10mm;float:left;">
													<input type="checkbox" alt="Patrono sucesor" class="styCkbox">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="$FormData/SuccessorEmployerInd"/>
															<xsl:with-param name="BackupName">IRS940SuccessorEmployerInd</xsl:with-param>
														</xsl:call-template>
													</input>
													<label>
														<xsl:call-template name="PopulateLabel">
															<xsl:with-param name="TargetNode" select="$FormData/SuccessorEmployerInd"/>
															<xsl:with-param name="BackupName">IRS940SuccessorEmployerInd</xsl:with-param>
														</xsl:call-template>
													</label>
													<b>b. </b>
												</div>
												<div style="width:43mm;padding-top:1.4mm;float:left;">
													<xsl:value-of disable-output-escaping="yes" select="$ReturnTypeBText"/>
												</div>
											</div>
											<div style="width:53mm;padding-top:1mm;float:left;clear:both;">
												<!--<div style="float:left;clear:none;padding-top:1mm;">-->
												<div style="width:10mm;float:left;">
													<input type="checkbox" alt="No hay pagos a los empleados en 2017" class="styCkbox">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="$FormData/NoPaymentsToEmployeesInd"/>
															<xsl:with-param name="BackupName">IRS940NoPaymentsToEmployeesInd</xsl:with-param>
														</xsl:call-template>
													</input>
													<label>
														<xsl:call-template name="PopulateLabel">
															<xsl:with-param name="TargetNode" select="$FormData/NoPaymentsToEmployeesInd"/>
															<xsl:with-param name="BackupName">IRS940NoPaymentsToEmployeesInd</xsl:with-param>
														</xsl:call-template>
													</label>
													<b>c. </b>
												</div>
												<div style="width:43mm;float:left;">
													<xsl:value-of disable-output-escaping="yes" select="$ReturnTypeCText"/>
												</div>
												<!--</div>-->
											</div>
											<div style="width:53mm;padding-top:1mm;float:left;clear:both;">
												<!--<div style="float:left;clear:none;padding-top:1mm;padding-bottom:2mm;">-->
												<div style="width:10mm;float:left;">
													<input type="checkbox" alt="Retorno Final. Presentación Futuro No se requiere" class="styCkbox">
														<xsl:call-template name="PopulateCheckbox">
															<xsl:with-param name="TargetNode" select="$FormData/FutureFilingNotRequiredInd"/>
															<xsl:with-param name="BackupName">IRS940FutureFilingNotRequiredInd</xsl:with-param>
														</xsl:call-template>
													</input>
													<label>
														<xsl:call-template name="PopulateLabel">
															<xsl:with-param name="TargetNode" select="$FormData/FutureFilingNotRequiredInd"/>
															<xsl:with-param name="BackupName">IRS940FutureFilingNotRequiredInd</xsl:with-param>
														</xsl:call-template>
													</label>
													<b>d. </b>
												</div>
												<div style="width:43mm;float:left;">
													<xsl:value-of disable-output-escaping="yes" select="$ReturnTypeDText"/>
												</div>
												<!--</div>-->
											</div>
											<!--</div>-->
										</div>
										<div style="width:52mm;padding-bottom:0.8mm;padding-top:1.5mm;float:none;clear:both;">
											<xsl:value-of disable-output-escaping="yes" select="$ReturnTypeInstructionsText"/>
											<a style="text-decoration:none;color:black;" href="http://www.irs.gov/form940" title="Link to IRS.gov">
												<i>www.irs.gov/form940</i>.</a>
											<br/>
										</div>
									</div>
								</div>
							</xsl:otherwise>
						</xsl:choose>
						<!-- End of "Type of Return" Checkboxes alt Language Switch -->
					</div>
					<div class="styLNDesc" style="width:187mm;">
						<xsl:value-of disable-output-escaping="yes" select="$SeparateInstructionsText"/>
					</div>
					<!--Part 1-->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:{$PartNameWidth}mm;text-align:center;height:{$Part145Height}mm;padding-top:{$Part5Padding}mm;">
							<xsl:value-of disable-output-escaping="yes" select="$PartText"/> 1:
</div>
						<div class="styPartDesc" style="width:{$PartDescWidth}mm;text-align:left;height:{$Part145Height}mm;padding-top:0mm;padding-left:2mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Part1Text"/>
						</div>
					</div>
					<div style="width:187mm;padding-left:0mm;padding-top:0mm;padding-bottom:0px;">
						<!--Line 1a-->
						<div style="width:187mm;height:7mm;font-size:7pt;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">
									<xsl:value-of disable-output-escaping="yes" select="$EnglishBreak"/>1a
									
								</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;font-weight:bold;">
									<xsl:value-of disable-output-escaping="yes" select="$EnglishBreak"/>
									<xsl:value-of disable-output-escaping="yes" select="$Line1aText"/>
								</div>
							</span>
							<span style="float:right;padding-top:2mm;padding-right:25mm;">
								<div class="styIRS940RightNumBox">1a</div>
								<div class="styIRS940LNAmountBox" style="width:12mm;border-top-width:1px;height:5mm;padding-right:4mm;background-color:white;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$FormData/FUTAStateCd"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 1b-->
						<div style="width:187mm;height:8mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">1b</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;font-weight:bold;">
									<xsl:value-of disable-output-escaping="yes" select="$Line1bText"/>
									<span style="float:left;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/MultiStateInd"/>
										</xsl:call-template>
									</span>
								</div>
							</span>
							<span style="float:right">
								<div class="styIRS940RightNumBox" style="float:left;padding-top:3.5mm;">1b</div>
								<div style="float:left;width:3mm;padding-top:3mm;">
									<!-- Checkbox 1b Indicator alt Language Switch -->
									<xsl:choose>
										<xsl:when test="$Language='ENGLISH'">
											<input type="checkbox" class="styCkbox" alt="MultiState Employer">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/MultiStateInd"/>
													<xsl:with-param name="BackupName">IRS940MultiStateInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</xsl:when>
										<!-- Checkbox 1b Indicator Stop ENGLISH, Start SPANISH -->
										<xsl:otherwise>
											<input type="checkbox" class="styCkbox" alt="Patrono en Múltiples Estados">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/MultiStateInd"/>
													<xsl:with-param name="BackupName">IRS940MultiStateInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</xsl:otherwise>
									</xsl:choose>
									<!-- End Checkbox 1b Indicator alt Language Switch -->
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/MultiStateInd"/>
											<xsl:with-param name="BackupName">IRS940MultiStateInd</xsl:with-param>
										</xsl:call-template>
									</label>
								</div>
								<div style="width:34mm;float:left;font-size:6.5pt;padding-top:2mm;padding-left:1.8mm;">
									<xsl:value-of disable-output-escaping="yes" select="$Line1bBoxText"/>
								</div>
							</span>
						</div>
						<!--Line 2-->
						<div style="width:187mm;height:8mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">2</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;font-weight:bold;">
									<xsl:value-of disable-output-escaping="yes" select="$Line2Text"/>
									<span style="float:left;padding-left:1mm;">
										<xsl:call-template name="SetFormLinkInline">
											<xsl:with-param name="TargetNode" select="$FormData/CreditReductionStateInd"/>
										</xsl:call-template>
									</span>
								</div>
							</span>
							<span style="float:right">
								<div class="styIRS940RightNumBox" style="float:left;padding-right:1.5mm;">2</div>
								<div style="float:left;width:3mm;padding-top:1mm;">
									<!-- Checkbox 2 Indicator alt Language Switch -->
									<xsl:choose>
										<xsl:when test="$Language='ENGLISH'">
											<input type="checkbox" class="styCkbox" alt="Credit Reduction">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/CreditReductionStateInd"/>
													<xsl:with-param name="BackupName">IRS940CreditReductionStateInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</xsl:when>
										<!-- Checkbox 2 Indicator Stop ENGLISH, Start SPANISH -->
										<xsl:otherwise>
											<input type="checkbox" class="styCkbox" alt="Reducción en el Crédito">
												<xsl:call-template name="PopulateCheckbox">
													<xsl:with-param name="TargetNode" select="$FormData/CreditReductionStateInd"/>
													<xsl:with-param name="BackupName">IRS940CreditReductionStateInd</xsl:with-param>
												</xsl:call-template>
											</input>
										</xsl:otherwise>
									</xsl:choose>
									<!-- End of Checkbox 2 Indicator alt Language Switch -->
									<label>
										<xsl:call-template name="PopulateLabel">
											<xsl:with-param name="TargetNode" select="$FormData/CreditReductionStateInd"/>
											<xsl:with-param name="BackupName">IRS940CreditReductionStateInd</xsl:with-param>
										</xsl:call-template>
									</label>
								</div>
								<!--<div style="width:34mm;float:left;font-size:7pt;">-->
								<div style="width:34mm;float:left;font-size:6.5pt;padding-top:.7mm;padding-left:1.8mm;">
									<xsl:value-of disable-output-escaping="yes" select="$Line2BoxText"/>
								</div>
							</span>
						</div>
						<div class="styBB" style="width:187mm;border-top-width:1px;">
							<div class="styPartName" style="width:{$PartNameWidth}mm;text-align:center;height:4mm;padding-top:0mm;">
								<xsl:value-of disable-output-escaping="yes" select="$PartText"/> 2:
							</div>
							<div class="styPartDesc" style="width:{$PartDescWidth}mm;text-align:left;height:4mm;padding-top:0mm;padding-left:2mm;background-color:white;">
								<xsl:value-of disable-output-escaping="yes" select="$Part2Text"/>
							</div>
						</div>
						<!--Line 3-->
						<div style="width:187mm;font-size:7pt;padding-top:2mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">3</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;font-weight:bold;">
									<xsl:value-of disable-output-escaping="yes" select="$Line3Text"/>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS940RightNumBox">3</div>
								<div class="styIRS940LNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/WagesAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 4-->
						<div style="width:187mm;font-size:7pt;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">4</div>
								<div class="styLNDesc" style="width:93mm;padding-left:1mm;font-weight:bold;">
									<xsl:value-of disable-output-escaping="yes" select="$Line4Text"/>
								</div>
							</span>
							<span style="float:left;">
								<div class="styIRS940RightNumBox">4</div>
								<div class="styIRS940LNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/ExemptWagesAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 4 Check Boxes-->
						<!-- Line 4 Checkboxes Indicator alt Language Switch -->
						<xsl:choose>
							<xsl:when test="$Language='ENGLISH'">
								<div style="width:187mm;font-size:7pt;">
									<span style="float:left;">
										<div class="styLNLeftNumBoxSD" style="width:8mm;"/>
										<div class="styGenericDiv" style="padding-left:1mm;padding-right:1mm;padding-top:1mm;">
											<xsl:value-of disable-output-escaping="yes" select="$Line4CheckText"/>
										</div>
									</span>
									<!--<span style="width:2mm;float:left;"/>-->
									<span style="float:left;clear:none;width:2mm;border-top-width:1px;padding-top:1mm;height:3mm;text-align:left;"/>
									<span style="float:left">
										<b>4a </b>
										<input type="checkbox" class="styCkbox" alt="Fringe benefits">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/FringeBenefitsInd"/>
												<xsl:with-param name="BackupName">IRS940FringeBenefitsInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/FringeBenefitsInd"/>
												<xsl:with-param name="BackupName">IRS940FringeBenefitsInd</xsl:with-param>
											</xsl:call-template>
										</label>
										<xsl:value-of disable-output-escaping="yes" select="$Line4aText"/>
										<br/>
										<b>4b </b>
										<input type="checkbox" class="styCkbox" alt="Group-term life insurance">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/GroupTermLifeInsuranceInd"/>
												<xsl:with-param name="BackupName">IRS940GroupTermLifeInsuranceInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/GroupTermLifeInsuranceInd"/>
												<xsl:with-param name="BackupName">IRS940GroupTermLifeInsuranceInd</xsl:with-param>
											</xsl:call-template>
										</label>
										<xsl:value-of disable-output-escaping="yes" select="$Line4bText"/>
									</span>
									<!--<span style="width:2mm;float:left;"/>-->
									<span style="float:left;clear:none;width:2mm;border-top-width:1px;padding-top:1mm;height:3mm;text-align:left;"/>
									<span style="float:left">
										<b>4c </b>
										<input type="checkbox" class="styCkbox" alt="Retirement / Pension">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/RetirementPensionInd"/>
												<xsl:with-param name="BackupName">IRS940RetirementPensionInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/RetirementPensionInd"/>
												<xsl:with-param name="BackupName">IRS940RetirementPensionInd</xsl:with-param>
											</xsl:call-template>
										</label>
										<xsl:value-of disable-output-escaping="yes" select="$Line4cText"/>
										<br/>
										<b>4d </b>
										<input type="checkbox" class="styCkbox" alt="Dependent care">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/DependentCareInd"/>
												<xsl:with-param name="BackupName">IRS940DependentCareInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/DependentCareInd"/>
												<xsl:with-param name="BackupName">IRS940DependentCareInd</xsl:with-param>
											</xsl:call-template>
										</label>
										<xsl:value-of disable-output-escaping="yes" select="$Line4dText"/>
									</span>
									<!--<span style="width:2mm;float:left;"/>-->
									<span style="float:left;clear:none;width:2mm;border-top-width:1px;padding-top:1mm;height:3mm;text-align:left;"/>
									<span style="float:left">
										<b>4e </b>
										<input type="checkbox" class="styCkbox" alt="Other">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/OtherInd"/>
												<xsl:with-param name="BackupName">IRS940OtherInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/OtherInd"/>
												<xsl:with-param name="BackupName">IRS940OtherInd</xsl:with-param>
											</xsl:call-template>
										</label>
										<xsl:value-of disable-output-escaping="yes" select="$Line4eText"/>
										<br/>
									</span>
								</div>
							</xsl:when>
							<!-- Line 4 Checkboxes Stop ENGLISH, Start SPANISH -->
							<xsl:otherwise>
								<div style="width:187mm;font-size:7pt;">
									<span style="float:left;">
										<div class="styLNLeftNumBoxSD" style="width:8mm;"/>
										<div class="styGenericDiv" style="padding-left:1mm;padding-right:1mm;padding-top:1mm;">
											<xsl:value-of disable-output-escaping="yes" select="$Line4CheckText"/>
										</div>
									</span>
									<!--<span style="width:2mm;float:left;"/>-->
									<span style="float:left;clear:none;width:2mm;border-top-width:1px;padding-top:1mm;height:3mm;text-align:left;"/>
									<span style="float:left">
										<b>4a </b>
										<input type="checkbox" class="styCkbox" alt="Beneficios marginales">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/FringeBenefitsInd"/>
												<xsl:with-param name="BackupName">IRS940FringeBenefitsInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/FringeBenefitsInd"/>
												<xsl:with-param name="BackupName">IRS940FringeBenefitsInd</xsl:with-param>
											</xsl:call-template>
										</label>
										<xsl:value-of disable-output-escaping="yes" select="$Line4aText"/>
										<br/>
										<b>4b </b>
										<input type="checkbox" class="styCkbox" alt="Seguro de vida colectivo a término">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/GroupTermLifeInsuranceInd"/>
												<xsl:with-param name="BackupName">IRS940GroupTermLifeInsuranceInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/GroupTermLifeInsuranceInd"/>
												<xsl:with-param name="BackupName">IRS940GroupTermLifeInsuranceInd</xsl:with-param>
											</xsl:call-template>
										</label>
										<xsl:value-of disable-output-escaping="yes" select="$Line4bText"/>
									</span>
									<!--<span style="width:2mm;float:left;"/>-->
									<span style="float:left;clear:none;width:2mm;border-top-width:1px;padding-top:1mm;height:3mm;text-align:left;"/>
									<span style="float:left">
										<b>4c </b>
										<input type="checkbox" class="styCkbox" alt="Retiro/Pensión">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/RetirementPensionInd"/>
												<xsl:with-param name="BackupName">IRS940RetirementPensionInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/RetirementPensionInd"/>
												<xsl:with-param name="BackupName">IRS940RetirementPensionInd</xsl:with-param>
											</xsl:call-template>
										</label>
										<xsl:value-of disable-output-escaping="yes" select="$Line4cText"/>
										<br/>
										<b>4d </b>
										<input type="checkbox" class="styCkbox" alt="Cuidado para dependientes">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/DependentCareInd"/>
												<xsl:with-param name="BackupName">IRS940DependentCareInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/DependentCareInd"/>
												<xsl:with-param name="BackupName">IRS940DependentCareInd</xsl:with-param>
											</xsl:call-template>
										</label>
										<xsl:value-of disable-output-escaping="yes" select="$Line4dText"/>
									</span>
									<!--<span style="width:2mm;float:left;"/>-->
									<span style="float:left;clear:none;width:2mm;border-top-width:1px;padding-top:1mm;height:3mm;text-align:left;"/>
									<span style="float:left">
										<b>4e </b>
										<input type="checkbox" class="styCkbox" alt="Otro">
											<xsl:call-template name="PopulateCheckbox">
												<xsl:with-param name="TargetNode" select="$FormData/OtherInd"/>
												<xsl:with-param name="BackupName">IRS940OtherInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabel">
												<xsl:with-param name="TargetNode" select="$FormData/OtherInd"/>
												<xsl:with-param name="BackupName">IRS940OtherInd</xsl:with-param>
											</xsl:call-template>
										</label>
										<xsl:value-of disable-output-escaping="yes" select="$Line4eText"/>
										<br/>
									</span>
								</div>
							</xsl:otherwise>
						</xsl:choose>
						<!-- End of Line 4 Checkboxes Indicator alt Language Switch -->
						<!--Line 5-->
						<div style="width:187mm;font-size:7pt;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">5</div>
								<div class="styLNDesc" style="width:93mm;padding-left:1mm;font-weight:bold;">
									<xsl:value-of disable-output-escaping="yes" select="$Line5Text"/>
								</div>
							</span>
							<span style="float:left;">
								<div class="styIRS940RightNumBox">5</div>
								<div class="styIRS940LNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/WagesOverLimitAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 6-->
						<div style="width:187mm;font-size:7pt;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">6</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;">
									<xsl:value-of disable-output-escaping="yes" select="$Line6Text"/>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS940RightNumBox">6</div>
								<div class="styIRS940LNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalExemptWagesAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 7-->
						<div style="width:187mm;font-size:7pt;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">7</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;">
									<xsl:value-of disable-output-escaping="yes" select="$Line7Text"/>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS940RightNumBox">7</div>
								<div class="styIRS940LNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxableWagesAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 8-->
						<div style="width:187mm;font-size:7pt;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">8</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;">
									<xsl:value-of disable-output-escaping="yes" select="$Line8Text"/>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS940RightNumBox">8</div>
								<div class="styIRS940LNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FUTATaxBeforeAdjustmentAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<div class="styBB" style="width:187mm;border-top-width:1px;">
							<div class="styPartName" style="width:{$PartNameWidth}mm;text-align:center;height:4mm;padding-top:0mm;">
								<xsl:value-of disable-output-escaping="yes" select="$PartText"/> 3:
							</div>
							<div class="styPartDesc" style="width:{$PartDescWidth}mm;text-align:left;height:4mm;padding-top:0mm;padding-left:2mm;background-color:white;">
								<xsl:value-of disable-output-escaping="yes" select="$Part3Text"/>
							</div>
						</div>
						<!--Line 9-->
						<div style="width:187mm;font-size:7pt;">
							<span style="float:left;">
								<div class="styLNLeftNumBoxSD" style="width:8mm;">9</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;">
									<xsl:value-of disable-output-escaping="yes" select="$Line9Text"/>
								</div>
							</span>
							<span style="float:right;padding-top:2.4mm;">
								<div class="styIRS940RightNumBox">9</div>
								<div class="styIRS940LNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/MaximumCreditAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 10-->
						<div style="width:187mm;font-size:7pt;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;">10</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;">
									<xsl:value-of disable-output-escaping="yes" select="$Line10Text"/>
								</div>
							</span>
							<span style="float:right;padding-top:{$Line10BoxPadding}mm;">
								<div class="styIRS940RightNumBox">10</div>
								<div class="styIRS940LNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FUTAAdjustmentAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 11-->
						<div style="width:187mm;font-size:7pt;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;">11</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;">
									<xsl:value-of disable-output-escaping="yes" select="$Line11Text"/>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS940RightNumBox">11</div>
								<div class="styIRS940LNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalCreditReductionAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<div class="styBB" style="width:187mm;border-top-width:1px;">
							<div class="styPartName" style="width:{$PartNameWidth}mm;text-align:center;height:{$Part145Height}mm;padding-top:0mm;">
								<xsl:value-of disable-output-escaping="yes" select="$PartText"/> 4:
							</div>
							<div class="styPartDesc" style="width:{$PartDescWidth}mm;text-align:left;height:{$Part145Height}mm;padding-top:0mm;padding-left:2mm;font-size:7.5pt;">
								<xsl:value-of disable-output-escaping="yes" select="$Part4Text"/>
							</div>
						</div>
						<!--Line 12-->
						<div style="width:187mm;font-size:7pt;padding-top:1mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;">12</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;">
									<xsl:value-of disable-output-escaping="yes" select="$Line12Text"/>
								</div>
							</span>
							<span style="float:right;">
								<div class="styIRS940RightNumBox">12</div>
								<div class="styIRS940LNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/FUTATaxAfterAdjustmentAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 13-->
						<div style="width:187mm;font-size:7pt;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;">13</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;font-weight:bold;">
									<xsl:value-of disable-output-escaping="yes" select="$Line13Text"/>
								</div>
							</span>
							<span style="float:right;padding-top:{$Line13Padding}mm;">
								<div class="styIRS940RightNumBox">13</div>
								<div class="styIRS940LNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/TotalTaxDepositAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 14-->
						<div style="width:187mm;font-size:7pt;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;">14</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;">
									<xsl:value-of disable-output-escaping="yes" select="$Line14Text"/>
									<br/>
									• <xsl:value-of disable-output-escaping="yes" select="$Line14MoreText"/>
									<br/>
									<span style="float:left;padding-right:3px;">•</span>
									<xsl:value-of disable-output-escaping="yes" select="$Line14LessText"/>
								</div>
							</span>
							<span style="float:right;padding-top:6mm;">
								<div class="styIRS940RightNumBox">14</div>
								<div class="styIRS940LNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/BalanceDueAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<!--Line 15-->
						<div style="width:187mm;font-size:7pt;">
							<span style="float:left;">
								<div class="styLNLeftNumBox" style="width:8mm;">15</div>
								<div class="styLNDesc" style="width:136mm;padding-left:1mm;">
									<xsl:value-of disable-output-escaping="yes" select="$Line15Text"/>
								</div>
							</span>
							<span style="float:right;padding-top:{$Line15Padding}mm;">
								<div class="styIRS940RightNumBox">15</div>
								<div class="styIRS940LNAmountBox">
									<xsl:call-template name="PopulateAmount">
										<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/OverpaidAmt"/>
									</xsl:call-template>
								</div>
							</span>
						</div>
						<div style="width:187mm;">
							<span style="float:left;">
								<div class="styLNLeftNumBox"/>
								<div class="styLNDesc" style="width:auto;padding-left:1mm;">
									<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
									<img src="{$ImagePath}/1040PR_Bullet_Sm.gif" alt="Bullet Image"/>
									<xsl:value-of disable-output-escaping="yes" select="$MustCompleteText"/>
								</div>
							</span>
							<!-- Line15 Checkboxes Indicator alt Language Switch -->
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span style="float:right;">
										<div style="float:right;">
											<span style="float:right;padding-left:2mm;padding-right:3mm;">
												<input type="checkbox" class="styCkbox" alt="Apply Overpayment to next return">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
														<xsl:with-param name="BackupName">IRS940ApplyOverpaymentNextReturnInd</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
														<xsl:with-param name="BackupName">IRS940ApplyOverpaymentNextReturnInd</xsl:with-param>
													</xsl:call-template>
													<xsl:value-of disable-output-escaping="yes" select="$ApplyNextReturnText"/>
												</label>
												<span style="width:2mm;"/>
												<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
												<input type="checkbox" class="styCkbox" alt="Send a Refund">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
														<xsl:with-param name="BackupName">IRS940RefundOverpaymentInd</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
														<xsl:with-param name="BackupName">IRS940RefundOverpaymentInd</xsl:with-param>
													</xsl:call-template>
													<xsl:value-of disable-output-escaping="yes" select="$SendRefundText"/>
												</label>
											</span>
											<span style="float:right;padding-top:1mm;">
												<xsl:value-of disable-output-escaping="yes" select="$CheckOneText"/>
											</span>
										</div>
									</span>
								</xsl:when>
								<!-- Line 15 Checkboxes alt Stop ENGLISH, Start SPANISH -->
								<xsl:otherwise>
									<span style="float:right;">
										<div style="float:right;">
											<span style="float:right;padding-left:2mm;padding-right:3mm;">
												<input type="checkbox" class="styCkbox" alt="Aplicar pago excesivo a la próxima planilla">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
														<xsl:with-param name="BackupName">IRS940ApplyOverpaymentNextReturnInd</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/ApplyOverpaymentNextReturnInd"/>
														<xsl:with-param name="BackupName">IRS940ApplyOverpaymentNextReturnInd</xsl:with-param>
													</xsl:call-template>
													<xsl:value-of disable-output-escaping="yes" select="$ApplyNextReturnText"/>
												</label>
												<span style="width:2mm;"/>
												<xsl:value-of disable-output-escaping="yes" select="$SpanishBreak"/>
												<input type="checkbox" class="styCkbox" alt="Envíe un reembolso">
													<xsl:call-template name="PopulateCheckbox">
														<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
														<xsl:with-param name="BackupName">IRS940RefundOverpaymentInd</xsl:with-param>
													</xsl:call-template>
												</input>
												<label>
													<xsl:call-template name="PopulateLabel">
														<xsl:with-param name="TargetNode" select="$FormData/OverpaymentGrp/RefundOverpaymentInd"/>
														<xsl:with-param name="BackupName">IRS940RefundOverpaymentInd</xsl:with-param>
													</xsl:call-template>
													<xsl:value-of disable-output-escaping="yes" select="$SendRefundText"/>
												</label>
											</span>
											<span style="float:right;padding-top:1mm;">
												<xsl:value-of disable-output-escaping="yes" select="$CheckOneText"/>
											</span>
										</div>
									</span>
								</xsl:otherwise>
							</xsl:choose>
							<!-- End of Line15 Checkboxes Indicator alt Language Switch -->
						</div>
						<div style="width:187mm;">
							<!-- New added choice for spanish image 4/24/14_AM -->
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<div style="width:30mm;text-align:right;padding-bottom:0mm;float:right;">
										<img src="{$ImagePath}/940SSPR_Next.png" alt="Next Page Arrow Image"/>
									</div>
								</xsl:when>
								<xsl:otherwise>
									<div style="width:30mm;text-align:right;padding-bottom:0mm;float:right;">
										<img src="{$ImagePath}/940SSPR_NextES.png" alt="Página siguiente Flecha imagen"/>
									</div>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- Page boundary -->
					<div class="pageEnd" style="width:187mm;border-top-width:1px;border-bottom:0px solid black;">
						<span style="float:left;clear:none;font-weight:bold;font-size:6pt;">
							<xsl:value-of disable-output-escaping="yes" select="$ForPrivacyText"/>
						</span>
						<span style="float:left;clear:none;margin-left:5mm;font-size:6pt;padding-top:2px;">
							<xsl:value-of disable-output-escaping="yes" select="$CatNoText"/>
						</span>
						<span style="float:right;clear:none;font-size:6pt;">
							<xsl:value-of disable-output-escaping="yes" select="$FormText"/>
							<span class="styBoldText" style="font-size:6pt;">
								<xsl:value-of disable-output-escaping="yes" select="$FormNoText"/>
							</span> (2017)
						</span>
					</div>
					<!--Begin Page 2-->
					<div style="width:187mm;">
						<div style="font-size:12pt;font-family:Courier New;font-weight:bold;text-align:right;float:right">
							<xsl:value-of disable-output-escaping="yes" select="$FormUpperRightNumber2"/>
						</div>
						<!--Name Shown on return-->
						<div class="styBB" style="width:187mm;font-size:7pt;border-top-width:2px;">
							<div class="styFNBox" style="width:126mm;">
								<xsl:value-of disable-output-escaping="yes" select="$NameText"/>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
								<div style="line-height:100%; font-family:verdana;font-size:7pt"/>
							</div>
							<b style="padding-left:1mm;">
								<xsl:value-of disable-output-escaping="yes" select="$EIN2Text"/>
							</b>
							<br/>
							<div style="text-align:left;padding-top:3mm;padding-left:1mm;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!--Part 5-->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:{$PartNameWidth}mm;text-align:center;height:{$Part145Height}mm;padding-top:{$Part5Padding}mm;">
							<xsl:value-of disable-output-escaping="yes" select="$PartText"/> 5:
						</div>
						<div class="styPartDesc" style="width:{$PartDescWidth}mm;text-align:left;height:{$Part145Height}mm;padding-top:0mm;padding-left:2mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Part5Text"/>
						</div>
					</div>
					<!--Line 16-->
					<div style="width:187mm;font-size:7pt;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="width:8mm;">16</div>
							<div class="styLNDesc" style="width:175mm;height:auto;padding-left:1mm;font-weight:bold;">
								<xsl:value-of disable-output-escaping="yes" select="$Line16Text"/>
							</div>
						</span>
					</div>
					<!--Line 16a-->
					<div style="width:187mm;font-size:7pt;padding-top:2mm;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="width:16mm;padding-left:9mm;">16a</div>
							<div class="styLNDesc" style="width:93mm;padding-left:1mm;">
								<xsl:value-of disable-output-escaping="yes" select="$Line16aText"/>
							</div>
						</span>
						<span style="float:left;">
							<div class="styIRS940RightNumBox">16a</div>
							<div class="styIRS940LNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FirstQuarterTaxLiabilityAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 16b-->
					<div style="width:187mm;font-size:7pt;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="width:16mm;padding-left:9mm;">16b</div>
							<div class="styLNDesc" style="width:93mm;padding-left:1mm;">
								<xsl:value-of disable-output-escaping="yes" select="$Line16bText"/>
							</div>
						</span>
						<span style="float:left;">
							<div class="styIRS940RightNumBox">16b</div>
							<div class="styIRS940LNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/SecondQuarterTaxLiabilityAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 16c-->
					<div style="width:187mm;font-size:7pt;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:16mm;padding-left:9mm;">16c</div>
							<div class="styLNDesc" style="width:93mm;padding-left:1mm;">
								<xsl:value-of disable-output-escaping="yes" select="$Line16cText"/>
							</div>
						</span>
						<span style="float:left;">
							<div class="styIRS940RightNumBox">16c</div>
							<div class="styIRS940LNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/ThirdQuarterTaxLiabilityAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 16d-->
					<div style="width:187mm;font-size:7pt;">
						<span style="float:left;">
							<div class="styLNLeftNumBoxSD" style="width:16mm;padding-left:9mm;">16d</div>
							<div class="styLNDesc" style="width:93mm;padding-left:1mm;">
								<xsl:value-of disable-output-escaping="yes" select="$Line16dText"/>
							</div>
						</span>
						<span style="float:left;">
							<div class="styIRS940RightNumBox">16d</div>
							<div class="styIRS940LNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/FourthQuarterTaxLiabilityAmt"/>
								</xsl:call-template>
							</div>
						</span>
					</div>
					<!--Line 17-->
					<div style="width:187mm;font-size:7pt;">
						<span style="float:left;">
							<div class="styLNLeftNumBox" style="width:8mm;">17</div>
							<div class="styLNDesc" style="width:100.8mm;padding-left:1mm;">
								<xsl:value-of disable-output-escaping="yes" select="$Line17Text"/>
							</div>
						</span>
						<span style="float:left;padding-top:{$Line17BoxPadding}mm;">
							<div class="styIRS940RightNumBox">17</div>
							<div class="styIRS940LNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$FormData/TotalTaxLiabilityAmt"/>
								</xsl:call-template>
							</div>
						</span>
						<div class="styGenericDiv" style="padding-left:1mm;font-weight:bold;font-size:6.5pt;padding-top:{$Line17EqualLine12Padding}mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Line17TotalText"/>
						</div>
					</div>
					<!--Part 6-->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:{$PartNameWidth}mm;text-align:center;height:4mm;padding-top:0mm;">
							<xsl:value-of disable-output-escaping="yes" select="$PartText"/> 6:
						</div>
						<div class="styPartDesc" style="width:{$PartDescWidth}mm;text-align:left;height:4mm;padding-top:0mm;padding-left:2mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Part6Text"/>
						</div>
					</div>
					<div class="styLNDesc" style="width:187mm;padding-left:9mm;padding-bottom:2mm;height:auto;">
						<xsl:value-of disable-output-escaping="yes" select="$Part6QuestionText"/>
					</div>
					<div style="width:187mm;float:none;clear:both;padding-bottom:2mm;">
						<div style="width:21mm;padding-left:9mm;float:left;">
							<!-- Discuss with 3rd party indicator alt Language Switch -->
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox" alt="Yes, you may discuss the return with a third party">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
												<xsl:with-param name="BackupName">941DiscussWithThirdPartyYesInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
												<xsl:with-param name="BackupName">941DiscussWithThirdPartyYesInd</xsl:with-param>
											</xsl:call-template>
											<b>
												<xsl:value-of disable-output-escaping="yes" select="$YesText"/>
											</b>
										</label>
									</span>
									<br/>
									<br/>
									<br/>
									<br/>
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox" alt="No, do not discuss the return with a third party">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
												<xsl:with-param name="BackupName">941DiscussWithThirdPartyNoInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
												<xsl:with-param name="BackupName">941DiscussWithThirdPartyNoInd</xsl:with-param>
											</xsl:call-template>
											<b>No.</b>
										</label>
									</span>
								</xsl:when>
								<!-- Discuss with 3rd party checkbox Stop ENGLISH, Start SPANISH -->
								<xsl:otherwise>
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox" alt="Sí, es posible discutir el regreso con un tercero">
											<xsl:call-template name="PopulateYesCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
												<xsl:with-param name="BackupName">941DiscussWithThirdPartyYesInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabelYes">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/DiscussWithThirdPartyYesInd"/>
												<xsl:with-param name="BackupName">941DiscussWithThirdPartyYesInd</xsl:with-param>
											</xsl:call-template>
											<b>
												<xsl:value-of disable-output-escaping="yes" select="$YesText"/>
											</b>
										</label>
									</span>
									<br/>
									<br/>
									<br/>
									<br/>
									<span>
										<xsl:call-template name="PopulateSpan">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
										</xsl:call-template>
										<input type="checkbox" class="styCkbox" alt="No, no discutir el regreso con un tercero">
											<xsl:call-template name="PopulateNoCheckbox">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
												<xsl:with-param name="BackupName">941DiscussWithThirdPartyNoInd</xsl:with-param>
											</xsl:call-template>
										</input>
										<label>
											<xsl:call-template name="PopulateLabelNo">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyNoInd"/>
												<xsl:with-param name="BackupName">941DiscussWithThirdPartyNoInd</xsl:with-param>
											</xsl:call-template>
											<b>No.</b>
										</label>
									</span>
								</xsl:otherwise>
							</xsl:choose>
							<!-- End of Discuss with 3rd party indicator alt Language Switch -->
						</div>
						<div style="width:165mm;float:right;">
							<div style="width:165mm;height:7mm;">
								<div class="styLNDesc" style="width:53mm;float:left;padding-top:1mm;padding-right:1mm;">
									<xsl:value-of disable-output-escaping="yes" select="$DesigneeNameText"/>
								</div>
								<div class="styLNCtrNumBox" style="width:68mm;border-top-width:1px;height:5mm;background-color:white;float:left;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeNm"/>
									</xsl:call-template>
								</div>
								<!--<span style="width:10mm;float:left;"/>-->
								<span style="float:left;clear:none;width:3mm;border-top-width:1px;padding-top:1mm;height:3mm;text-align:left;"/>
								<div class="styLNCtrNumBox" style="width:40mm;border-top-width:1px;height:7mm;word-wrap:break-word">
									<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum">
										<xsl:call-template name="PopulatePhoneNumber">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePhoneNum"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneeFrgnPhoneNum"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
							<div style="width:165mm;height:6mm;">
								<br/>
								<div class="styLNDesc" style="width:auto;padding-top:1mm;padding-right:1mm;">
									<xsl:value-of disable-output-escaping="yes" select="$DesigneePINText"/>
								</div>
								<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:5mm;background-color:white;">
									<xsl:call-template name="PopulatePin">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/DiscussWithThirdPartyYesGrp/ThirdPartyDesigneePIN"/>
									</xsl:call-template>
								</div>
							</div>
						</div>
					</div>
					<!--Part 7-->
					<div class="styBB" style="width:187mm;border-top-width:1px;">
						<div class="styPartName" style="width:{$PartNameWidth}mm;text-align:center;height:4mm;padding-top:0mm;">
							<xsl:value-of disable-output-escaping="yes" select="$PartText"/> 7:
						</div>
						<div class="styPartDesc" style="width:{$PartDescWidth}mm;text-align:left;height:4mm;padding-top:0mm;padding-left:2mm;">
							<xsl:value-of disable-output-escaping="yes" select="$Part7Text"/>
						</div>
					</div>
					<div class="styLNDesc" style="width:187mm;height:auto;padding-left:2mm;font-size:7pt;padding-bottom:2mm;">
						<xsl:value-of disable-output-escaping="yes" select="$PenaltiesText"/>
					</div>
					<div style="width:187mm;float:none;clear:both;">
						<div style="padding-right:5mm;float:left;padding-bottom:2mm;padding-top:2mm;">
							<img src="{$ImagePath}/941_Signature.GIF" width="30" alt="Signature Image"/>
						</div>
						<div style="width:22mm;height:15mm;padding-top:3mm;font-weight:bold;font-size:9pt;float:left;">
							<xsl:value-of disable-output-escaping="yes" select="$SignText"/>
						</div>
						<div class="styLNCtrNumBox" style="width:75mm;border-top-width:1px;height:15mm;float:left;word-wrap:break-word;text-align:left;padding-left:1mm;padding-right:1mm;padding-top:3mm;">
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
						<div style="width:74.8mm;float:left;padding-left:6mm;padding-top:0mm;">
							<div style="width:71mm;float:left;">
								<div style="width:{$PrintTextWidth}mm;height:8mm;float:left;">
									<xsl:value-of disable-output-escaping="yes" select="$PrintNameText"/>
								</div>
								<div style="height:8mm;float:right;">
									<div class="styLNCtrNumBox" style="width:{$PrintBoxWidth}mm;border-top-width:1px;height:8mm;text-align:left;padding-left:1mm;">
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/PersonNm">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/PersonNm"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/TaxpayerNm"/>
										</xsl:call-template>
									</div>
								</div>
							</div>
							<div style="width:71mm;float:left;">
								<div style="width:{$PrintTextWidth}mm;height:7mm;float:left;">
									<xsl:value-of disable-output-escaping="yes" select="$PrintTitleText"/>
								</div>
								<div style="height:7mm;padding-top:1mm;float:right;float:right;">
									<div class="styLNCtrNumBox" style="width:{$PrintBoxWidth}mm;border-top-width:1px;height:7mm;text-align:left;padding-left:1mm;">
										<xsl:if test="$RtnHdrData/SignatureDocumentGrp/Title">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/Title"/>
											</xsl:call-template>
										</xsl:if>
										<xsl:if test="$RtnHdrData/PractitionerPINGrp/Title">
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PractitionerPINGrp/Title"/>
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
								</div>
							</div>
						</div>
					</div>
					<div class="styBB" style="width:187mm;padding-bottom:2mm;padding-top:2.5mm;padding-right:.2mm;">
						<div class="styLNDesc" style="width:35mm;text-align:right;padding-right:4mm;padding-top:3mm;">
							<xsl:value-of disable-output-escaping="yes" select="$DateText"/>
						</div>
						<div class="styLNCtrNumBox" style="width:40mm;border-top-width:1px;height:6mm;padding-top:1mm;">
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
						<div class="styLNDesc" style="width:{$BestNumberTextWidth}mm;padding-left:41mm;">
							<xsl:value-of disable-output-escaping="yes" select="$BestNumberText"/>
						</div>
						<div class="styLNCtrNumBox" style="width:{$BestNumberBoxWidth}mm;border-top-width:.1px;height:7mm;word-wrap:break-word;">
							<xsl:choose>
								<xsl:when test="$RtnHdrData/SignatureDocumentGrp/DaytimePhoneNum != ''">
									<xsl:if test="$RtnHdrData/SignatureDocumentGrp/DaytimePhoneNum">
										<xsl:call-template name="PopulatePhoneNumber">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/DaytimePhoneNum"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/SignatureDocumentGrp/DaytimeForeignPhoneNum"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!-- BEGIN PAID PREPARER USE ONLY SECTION -->
					<div style="width:187mm;padding-bottom:2mm;">
						<div class="styLNDesc" style="width:100mm;font-size:9pt;font-weight:bold;float:left;padding-left:2mm;">
							<xsl:value-of disable-output-escaping="yes" select="$PaidPreparerText"/>
						</div>
						<div class="styLNDesc" style="width:{$SelfEmployedTextWidth}mm;float:right;">
							<xsl:value-of disable-output-escaping="yes" select="$SelfEmployedText"/>
							<span style="width:2px;"/>
							<!-- Self-Employment Indicator alt Language Switch -->
							<xsl:choose>
								<xsl:when test="$Language='ENGLISH'">
									<input type="checkbox" class="styCkbox" alt="Self-employment Indicator">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">941SelfEmployedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</xsl:when>
								<!-- Self-Employment Indicator checkbox alt Stop ENGLISH, Start SPANISH -->
								<xsl:otherwise>
									<input type="checkbox" class="styCkbox" alt="Indicador Autoempleo">
										<xsl:call-template name="PopulateCheckbox">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
											<xsl:with-param name="BackupName">941SelfEmployedInd</xsl:with-param>
										</xsl:call-template>
									</input>
								</xsl:otherwise>
							</xsl:choose>
							<!-- End of Self-Employment Indicator alt Language Switch -->
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SelfEmployedInd"/>
									<xsl:with-param name="BackupName">941SelfEmployedInd</xsl:with-param>
								</xsl:call-template>
							</label>
						</div>
					</div>
					<div style="width:187mm;padding-bottom:3mm;">
						<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;">
							<xsl:value-of disable-output-escaping="yes" select="$PreparerNameText"/>
						</div>
						<div class="styLNCtrNumBox" style="width:90mm;border-top-width:1px;height:5mm;background-color:white;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerPersonNm"/>
							</xsl:call-template>
						</div>
						<div style="float:left;">
							<div class="styLNDesc" style="width:19.8mm;padding-left:5mm;">
								<xsl:value-of disable-output-escaping="yes" select="$PPSPTINText"/>
							</div>
							<div class="styLNCtrNumBox" style="width:44.8mm;border-top-width:1px;height:5mm;float:right;">
								<xsl:choose>
									<xsl:when test="$RtnHdrData/PaidPreparerInformationGrp/PTIN">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PTIN"/>
										</xsl:call-template>
									</xsl:when>
									<xsl:otherwise>
										<xsl:call-template name="PopulateSSN">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerSSN"/>
										</xsl:call-template>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
					</div>
					<div style="width:187mm;padding-bottom:3mm;">
						<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;">
							<xsl:value-of disable-output-escaping="yes" select="$PreparerSignatureText"/>
						</div>
						<div class="styLNCtrNumBox" style="width:90mm;border-top-width:1px;height:5mm;word-wrap:break-word;text-align:left;padding-right:1mm;padding-left:1mm;">
						</div>
						<div>
							<div style="float:left;">
								<div class="styLNDesc" style="width:19.8mm;padding-left:5mm;">
									<xsl:value-of disable-output-escaping="yes" select="$DateText"/>
								</div>
								<xsl:choose>
									<xsl:when test="$Language='ENGLISH'">
										<div class="styLNCtrNumBox" style="width:30mm;border-top-width:1px;height:5mm;background-color:white;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SignatureDt"/>
											</xsl:call-template>
										</div>
									</xsl:when>
									<xsl:otherwise>
										<div class="styLNCtrNumBox" style="width:44.8mm;border-top-width:1px;height:5mm;background-color:white;float:right;">
											<xsl:call-template name="PopulateMonthDayYear">
												<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/SignatureDt"/>
											</xsl:call-template>
										</div>
									</xsl:otherwise>
								</xsl:choose>
							</div>
						</div>
					</div>
					<div style="width:187mm;padding-bottom:1.8mm;">
						<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;padding-top:0mm;padding-bottom:0mm;">
							<xsl:value-of disable-output-escaping="yes" select="$FirmNameText"/>
						</div>
						<div class="styLNCtrNumBox" style="width:90mm;border-top-width:1px;height:auto;text-align:left;padding-left:1mm;;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine1Txt">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine1Txt"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2Txt">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerFirmName/BusinessNameLine2Txt"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div style="float:left;">
							<div class="styLNDesc" style="width:20mm;padding-left:5mm;float:left;">
								<xsl:value-of disable-output-escaping="yes" select="$PPSEINText"/>
							</div>
							<div style="float:right;">
								<div class="styLNCtrNumBox" style="width:44.8mm;border-top-width:1px;height:5mm;background-color:white;">
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
						</div>
					</div>
					<div style="width:187mm;padding-bottom:3mm;">
						<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;">
							<xsl:value-of disable-output-escaping="yes" select="$AddressText"/>
						</div>
						<div class="styLNCtrNumBox" style="width:90mm;border-top-width:1px;height:auto;text-align:left;padding-left:1mm;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
								<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine1Txt">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine1Txt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine2Txt">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/AddressLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
								<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine1Txt">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine1Txt"/>
									</xsl:call-template>
								</xsl:if>
								<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine2Txt">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/AddressLine2Txt"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:if>
						</div>
						<div style="float:left;">
							<div class="styLNDesc" style="width:20mm;padding-left:5mm;">
								<xsl:value-of disable-output-escaping="yes" select="$PreparerPhoneText"/>
							</div>
							<div style="float:right;">
								<div class="styLNCtrNumBox" style="width:44.8mm;border-top-width:1px;height:7mm;word-wrap:break-word;background-color:white;">
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
					<div class="styBB" style="width:187mm;padding-bottom:6mm;border-bottom-width:2px;">
						<div class="styLNDesc" style="width:32mm;padding-left:2mm;padding-right:1mm;">
							<xsl:value-of disable-output-escaping="yes" select="$CityText"/>
						</div>
						<div class="styLNCtrNumBox" style="width:65mm;border-top-width:1px;height:auto;text-align:left;padding-left:1mm;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/CityNm"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CityNm"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div class="styLNDesc" style="width:13mm;padding-left:3mm;">
							<xsl:value-of disable-output-escaping="yes" select="$StateText"/>
						</div>
						<div class="styLNCtrNumBox" style="width:12mm;border-top-width:1px;height:auto;background-color:white;">
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/StateAbbreviationCd"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ProvinceOrStateNm"/>
								</xsl:call-template>
							</xsl:if>
						</div>
						<div style="float:left;">
							<div class="styLNDesc" style="width:20mm;padding-left:5mm;font-size:6pt;float:left;">
								<xsl:value-of disable-output-escaping="yes" select="$PPZipText"/>
							</div>
							<div style="float:right;">
								<div class="styLNCtrNumBox" style="width:44.8mm;border-top-width:1px;height:5mm;background-color:white;">
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerUSAddress/ZIPCd"/>
										</xsl:call-template>
									</xsl:if>
									<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/ForeignPostalCd"/>
										</xsl:call-template>
										<xsl:call-template name="LinkToLeftoverDataTableInline">
											<xsl:with-param name="Desc">Part 7: Paid Preparer - Country</xsl:with-param>
											<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CountryCd"/>
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
						</div>
					</div>
					<!-- END PAID PREPARER USE ONLY SECTION -->
					<!--Page Footer-->
					<div class="pageEnd" style="width:187mm;border-top-width:1px;border-bottom-width:0px;">
						<span style="float:left;clear:none;">
							<xsl:value-of disable-output-escaping="yes" select="$PageText"/>
							<span class="styBoldText" style="font-size:8pt;"> 2</span>
						</span>
						<span style="float:right;clear:none;">
							<xsl:value-of disable-output-escaping="yes" select="$FormText"/>
							<span class="styBoldText" style="font-size:8pt;">
								<xsl:value-of disable-output-escaping="yes" select="$FormNoText"/>
							</span> (2017)
						</span>
					</div>
					<!--END Page Footer-->
					<!-- Additonal Data Title Bar and Button -->
					<div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;">
						<div class="styLeftOverTitle"> Additional Data </div>
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
						<xsl:if test="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress">
							<xsl:call-template name="PopulateLeftoverRow">
								<xsl:with-param name="Desc">Part 7: Paid Preparer - Country</xsl:with-param>
								<xsl:with-param name="TargetNode" select="$RtnHdrData/PaidPreparerInformationGrp/PreparerForeignAddress/CountryCd"/>
								<xsl:with-param name="DescWidth" select="$TableWidth"/>
							</xsl:call-template>
						</xsl:if>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
