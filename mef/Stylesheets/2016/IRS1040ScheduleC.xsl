<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS1040ScheduleCStyle.xsl"/>
<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>
<xsl:param name="Form1040ScheduleCData" select="$RtnDoc/IRS1040ScheduleC"/>
<xsl:template match="/">
<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
<html lang="EN-US">
<head>
	    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <title>
  <xsl:call-template name="FormTitle">
  <xsl:with-param name="RootElement" select="local-name($Form1040ScheduleCData)">
  </xsl:with-param></xsl:call-template>
  </title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private"/>
  <!-- Define Character Set -->
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
  <meta name="Description" content="IRS Form 1040ScheduleC"/>
    <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
    <xsl:call-template name="InitJS">
    </xsl:call-template>
 <style type="text/css"> 
 <xsl:if test="not($Print) or $Print=''">
        <xsl:call-template name="IRS1040ScheduleCStyle"/>
        <xsl:call-template name="AddOnStyle"/>
 </xsl:if>
  </style>  
  <xsl:call-template name="GlobalStylesForm"/>
</head>
<body class="styBodyClass" style="width:187mm;">
  <form name="Form1040ScheduleC">
    <!-- WARNING LINE -->
    <xsl:call-template name="DocumentHeader"/>
    <!-- Begin Form Number and Name -->
     <!-- put comment here -->
    <div class="styBB" style="width:187mm;height:auto;float:none;clear:both;">
	<div class="styFNBox" style="width:29mm;height:21mm;">
		<div style="padding-top:1mm;line-height:150%;">                  
			<span class="styFormNumber" style="font-size:9pt;">SCHEDULE C</span>
			<br/>
			<span class="styFormNumber" style="font-size:9pt;padding-top:2mm;">(Form 1040)</span>
			<br/>
		</div>
		<xsl:call-template name="SetFormLinkInline">
			<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData"/>
		</xsl:call-template>
		<div style="padding-top:0mm;">
			<span class="styAgency"><br/>Department of the Treasury</span><br/>
			<span class="styAgency">Internal Revenue Service <span style="width:1mm"/> (99)</span>  
		</div>
	</div>	
	<div class="styFTBox" style="width:127mm;height:20mm;">
		<div class="styMainTitle" style="height:auto;margin-top:2mm;">Profit or Loss From Business    
		</div> 
		<div class="styFBT" style="height:auto;font-size:7pt;margin-top:1mm;width:127mm;">
				<b>(Sole Proprietorship)</b>
		</div>   
		<div class="styFBT" style="height:3mm;margin-top:1mm;font:size:6pt;width:127mm;">
			 <img src="{$ImagePath}/1040SchC_Bullet_Sm.gif" alt="Bullet Image"/>Information about Schedule C and its separate instructions is at <i><a href="http://www.irs.gov/schedulec">www.irs.gov/schedulec</a>.</i><br/>
			  <img src="{$ImagePath}/1040SchC_Bullet_Sm.gif" alt="Bullet Image"/> Attach to Form 1040, 1040NR, or 1041; partnerships generally must file Form 1065.        
		</div>
	</div>	
	<div class="styTYBox" style="width:30mm;height:21mm;">
		<div class="styOMB" style="height:4mm;">
			<!--<span style="font-size:6pt;text-align:right;">Version A, Cycle 1</span>-->
			OMB No. 1545-0074
		</div>
		<div class="styTaxYear" style="padding-bottom:0mm;">
			20<span class="styTYColor">16</span>
		</div>
		<div style="margin-left:2mm; text-align:left;padding-top:0mm;">
			Attachment<br/>Sequence No. <span class="styBoldText">09</span>
		</div>
	</div>
</div>

<!-- End Form Number and Name section -->
<div class="styBB" style="width:187mm;float:none;clear:both;height:auto;">
	<div class="styNameBox" style="width:139mm;height:auto;font-size:7pt;">
		Name of proprietor<br/>  <br/>
		 <xsl:choose>
					<!-- Name from 1041 Return Header-->
						<xsl:when test="$RtnHdrData/ReturnTypeCd='1041'">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine1Txt" />
									</xsl:call-template><br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/EstateOrTrustName/BusinessNameLine2Txt" />
									</xsl:call-template>
								</xsl:when>
								<xsl:when test="normalize-space($Form1040ScheduleCData/ProprietorNm) != ''">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/ProprietorNm"/>
							</xsl:call-template>
							</xsl:when>
					    <xsl:when test="$RtnHdrData/Filer/NameLine1Txt">
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">NameLine1Txt</xsl:with-param>
							</xsl:call-template>
					   </xsl:when>		
								</xsl:choose>			
	</div>        
	<div class="styEINBox" style="width:46mm;height:auto;font-size:7pt;padding-left:2mm;">
		Social security number (SSN)<br/><br/>
		<span class="styEINFld" style="width:30mm; text-align:left;font-weight:normal;">
			<xsl:choose>
				<xsl:when test="$RtnHdrData/Filer/EIN">
					<xsl:call-template name="PopulateReturnHeaderFiler"> 
						  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
				   </xsl:call-template>
				 </xsl:when>
				 <xsl:when test="normalize-space($Form1040ScheduleCData/SSN) != ''">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/SSN"/>
							</xsl:call-template>
							</xsl:when>
				<xsl:when test="$RtnHdrData/Filer/PrimarySSN">
					<xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
					  </xsl:call-template>
			   </xsl:when>
      </xsl:choose>
		</span>  
	</div>
</div>
<!-- Item A-->
<div class="styBB" style="width:187mm;float:none;clear:both;">
	<div class="styLNLeftNumBox" style="width:3mm; height:8.5mm;padding-left: 0mm;padding-top:1mm;">A</div>
	<div class="styNameBox" style="width:134mm;height:8mm;padding-top:1mm;font-size:7pt;border-right-width: 0px;">
		Principal business or profession, including product or service (see instructions)<br/>
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/PrincipalBusinessActivityDesc"/>
		</xsl:call-template>          
	</div>
	<!-- Item B-->
	<div class="styForm1040ScheduleCEINFullBox" style="width:48.5mm;height:10.5mm;float:right;">
		<div class="styLNLeftNumBox" style="width:3.6mm;padding-top:1mm; height:4.5mm;">B</div>
		<div style="padding-top:1mm;width:43mm;">Enter code from instructions</div>
		<br/>
		<span style="padding-left:5.5mm;"><img src="{$ImagePath}/1040SchC_Bullet_Lg.gif" alt="Bullet Image"/></span>
		<span class="styEINFld" style="width:30mm;font-size:6pt; text-align:center;">
			<xsl:if test="$Form1040ScheduleCData/PrincipalBusinessActivityCd">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/PrincipalBusinessActivityCd"/>
				</xsl:call-template> 
			</xsl:if>  
			<xsl:if test="$Form1040ScheduleCData/UnclassifiedEstablishmentCd">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/UnclassifiedEstablishmentCd"/>
				</xsl:call-template> 
			</xsl:if>         
		</span>  
	</div>
</div>
<!-- Item C-->
<div class="styBB" style="width:187mm;float:none;clear:both;">        
	<div class="styLNLeftNumBox" style="width:3mm; height:4.5mm;padding-top:1mm;padding-left: 0px;">C</div>   
	<div class="styLNDesc" style="width:135.5mm;height:7.5mm;padding-top:1mm;">
		Business name. If no separate business name, leave blank. 
		<br/>         
		<xsl:call-template name="PopulateText">
			<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessNameLine1Txt"/>
		</xsl:call-template>            
	</div>     
	<!-- Item D-->
	<div class="styOMB" style="width:48.5mm;height:auto;border-left-width:1px;float:right; border-bottom-width:0px;">
		<div class="styLNLeftNumBox" style="width:3.6mm; height:8.5mm; font-size:6pt;font-weight:bold;padding-top:0px;">D</div>
			<span style="width:33.5mm;font-size:6pt;font-weight:bold;">Employer ID number (EIN),<span style="font-weight:normal">(see instr.)</span></span>
			<br/>     
			<span class="styEINFld" style="width:30mm; text-align:left;">                   
				<xsl:choose>
					<xsl:when test="$Form1040ScheduleCData/EIN">
						<xsl:call-template name="PopulateEIN"> 
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/EIN"/>
						</xsl:call-template>          
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateReturnHeaderFiler"> 
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/EIN"/>
						</xsl:call-template>          
					</xsl:otherwise>
				</xsl:choose>                 
			</span>  
	</div>
	<br/>
</div>      
<!--Item E-->     
<div class="styBB" style="width:187mm;float:none;clear:both;height:auto;">        
	<div class="styLNLeftNumBox" style="height:4mm;width:3mm;padding-top:1mm;padding-left: 0px">E</div>
	<div class="styLNDesc" style="width:65mm;height:auto;padding-top:1mm;">
		Business address (including suite or room no.) 
		<img src="{$ImagePath}/1040SchC_Bullet_Sm.gif" alt="Bullet Image"/>   
		<br/>City, town or post office, state, and ZIP code
	</div>
	<div class="styLNDesc" style="width:119mm;height:auto;padding-top:1mm;">
	    <span style="width:119mm;border-bottom:1px dashed black;">					
			<xsl:if test="$Form1040ScheduleCData/BusinessUSAddress/AddressLine1Txt">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessUSAddress/AddressLine1Txt"/>
				</xsl:call-template> 
			</xsl:if>  
			<xsl:if test="$Form1040ScheduleCData/BusinessForeignAddress/AddressLine1Txt">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessForeignAddress/AddressLine1Txt"/>
				</xsl:call-template> 
			</xsl:if>  
			<br/>
			<xsl:if test="$Form1040ScheduleCData/BusinessUSAddress/AddressLine2Txt">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessUSAddress/AddressLine2Txt"/>
				</xsl:call-template> 
			</xsl:if>      
			<xsl:if test="$Form1040ScheduleCData/BusinessForeignAddress/AddressLine2Txt">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessForeignAddress/AddressLine2Txt"/>
				</xsl:call-template> 
			</xsl:if>  
		</span>    
		<br/>
		<xsl:if test="$Form1040ScheduleCData/BusinessUSAddress/CityNm">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessUSAddress/CityNm"/>
			</xsl:call-template> 
		</xsl:if>    
		<xsl:if test="$Form1040ScheduleCData/BusinessForeignAddress/CityNm">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessForeignAddress/CityNm"/>
			</xsl:call-template> 
		</xsl:if>    
		<xsl:if test="$Form1040ScheduleCData/BusinessUSAddress/StateAbbreviationCd">,
			<span style="width:3mm;"/>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessUSAddress/StateAbbreviationCd"/>
			</xsl:call-template> 
		</xsl:if>   
		<xsl:if test="$Form1040ScheduleCData/BusinessForeignAddress/ProvinceOrStateNm">,
			<span style="width:3mm;"/>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessForeignAddress/ProvinceOrStateNm"/>
			</xsl:call-template> 
		</xsl:if>   
		<xsl:if test="$Form1040ScheduleCData/BusinessUSAddress/ZIPCd">
			<span style="width:3mm;"/>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessUSAddress/ZIPCd"/>
			</xsl:call-template> 
		</xsl:if>   
		<xsl:if test="$Form1040ScheduleCData/BusinessForeignAddress/ForeignPostalCd">
			<span style="width:3mm;"/>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessForeignAddress/ForeignPostalCd"/>
			</xsl:call-template> 
		</xsl:if>   
		<xsl:if test="$Form1040ScheduleCData/BusinessForeignAddress/CountryCd">
			<span style="width:3mm;"/>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BusinessForeignAddress/CountryCd"/>
			</xsl:call-template> 
		</xsl:if>   
	</div>
</div>
<!-- Item F-->
<div class="styBB" style="width:187mm;float:none;clear:both;height:auto;">        
	<div class="styLNLeftNumBox" style="height:auto;width:3mm;padding-top:1.8mm;padding-left: 0px">F</div>
	<div class="styLNDesc" style="width:152mm;height:auto;">
		Accounting method:   <span style="width:2px;"/> 
		<span class="styBoldText">(1)<span style="width: 2mm;"/></span>
		<input type="checkbox" class="styCkbox">
			<xsl:call-template name="PopulateCheckbox">
				<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MethodOfAccountingCashInd"/>
				<xsl:with-param name="BackupName">IRS1040ScheduleCAccountingMethodCash</xsl:with-param>
			</xsl:call-template>
		</input> 
		<label>
			<xsl:call-template name="PopulateLabel">
				<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MethodOfAccountingCashInd"/>
				<xsl:with-param name="BackupName">IRS1040ScheduleCAccountingMethodCash</xsl:with-param>
			</xsl:call-template>
			Cash
		</label>
		<span style="width:20px;"/>
		<span class="styBoldText">(2)<span style="width: 2mm;"/></span>
		<input type="checkbox" class="styCkbox">
			<xsl:call-template name="PopulateCheckbox">
				<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MethodOfAccountingAccrualInd"/>
				<xsl:with-param name="BackupName">IRS1040ScheduleCAccountingMethodAccrual</xsl:with-param>
			</xsl:call-template>
		</input> 
		<label>
			<xsl:call-template name="PopulateLabel">
				<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MethodOfAccountingAccrualInd"/>
				<xsl:with-param name="BackupName">IRS1040ScheduleCAccountingMethodAccrual</xsl:with-param>
			</xsl:call-template>
			Accrual
		</label>   
		<span style="width:20px;"/>
		<span class="styBoldText">(3)<span style="width: 2mm;"/></span>
		<input type="checkbox" class="styCkbox">
			<xsl:call-template name="PopulateCheckbox">
				<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MethodOfAccountingOtherInd"/>
				<xsl:with-param name="BackupName">IRS1040ScheduleCAccountingMethodOther</xsl:with-param>
			</xsl:call-template>
		</input> 
		<label>
			<xsl:call-template name="PopulateLabel">
				<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MethodOfAccountingOtherInd"/>
				<xsl:with-param name="BackupName">IRS1040ScheduleCAccountingMethodOther</xsl:with-param>
			</xsl:call-template>
			Other (specify)
		</label>   
		<span style="width:10mm;"/>
		<img src="{$ImagePath}/1040SchC_Bullet_Sm.gif" alt="Bullet Image"/>
		<span style="width:25mm;border-bottom:1px solid black;">
			<xsl:if test="$Form1040ScheduleCData/MethodOfAccountingOtherInd">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MethodOfAccountingOtherInd/@methodOfAccountingOtherDesc"/>
				</xsl:call-template> 
			</xsl:if>  
		</span>
	</div>
	<!--Item G-->     
	<div class="styBB" style="width:187mm;border-bottom-width: 0px;float:none;clear:both;height:auto;">        
		<div class="styLNLeftNumBox" style="width:3mm;padding-top:0mm;padding-left: 0px">G</div>
		<div class="styLNDesc" style="width:160mm;padding-top:0mm;height:auto;">
			Did you "materially participate" in the operation of this business during 2016? If "No," see instructions for limit on losses    
			<span class="styBoldText">
			<span style="width:16px;"></span>.
			</span>            
		</div>
		<div class="styGenericDiv" style="width:24mm;height:4mm;float:right;">
		   <span style="width:100%;">
					<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MaterialParticipationInCYInd"/>
							<xsl:with-param name="BackupName">IRS1040ScheduleCMaterialParticipationInCYInd"</xsl:with-param>
					</xsl:call-template>
					<input type="checkbox" class="styCkbox" name="Checkbox">
						<xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MaterialParticipationInCYInd"/>
							<xsl:with-param name="BackupName">IRS1040ScheduleCMaterialParticipationInCYInd"</xsl:with-param>
						</xsl:call-template>
					</input>				
				<label>
					<xsl:call-template name="PopulateLabelYes">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MaterialParticipationInCYInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCMaterialParticipationInCYInd"</xsl:with-param>
					</xsl:call-template>
					<b>Yes</b> 
				</label>			                    
				<input type="checkbox" class="styCkbox" name="Checkbox">
					<xsl:call-template name="PopulateNoCheckbox">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MaterialParticipationInCYInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCMaterialParticipationInCYInd"</xsl:with-param>
					</xsl:call-template>
				</input> 
				<label>
					<xsl:call-template name="PopulateLabelNo">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MaterialParticipationInCYInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCMaterialParticipationInCYInd"</xsl:with-param>
					</xsl:call-template>
					<b> No</b> 
				</label>  
			</span>                      
		</div>        
		<!--Item H-->
		<div class="styGenericDiv" style="width:187mm;height:auto;">        
			<div class="styLNLeftNumBox" style="width:3mm;padding-top:0mm;padding-left: 0px;border-bottom-width:0">H</div>
			<div class="styLNDesc" style="width:155mm;padding-top:0mm;border-bottom-width:0;">
			<div style="float:left;">
			  <span style="float:left;">
			            <label>								
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/NewBusinessInCurrentYearInd"/>
								<xsl:with-param name="BackupName">IRS1040ScheduleCNewBusinessInCurrentYearInd</xsl:with-param>
							</xsl:call-template>
				        </label>
						If you started or acquired this business during 2016, check here
					</span> 

					<!--Dotted Line-->                 
					<div class="styDotLn" style="float:right;">..................</div>	
				</div>
				<div style="float:right;">
	              <img src="{$ImagePath}/1040SchC_Bullet_Sm.gif" alt="Bullet Image"/>
				</div>				
			</div>
			<div class="styGenericDiv" style="width:24mm;height:4mm;float:right;">
				<input type="checkbox" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/NewBusinessInCurrentYearInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCNewBusinessInCurrentYearInd</xsl:with-param>
					</xsl:call-template>
				</input>
			</div>
		</div>
    
		<!-- ///////////// Item I //////////////// -->
		<div class="styGenericDiv" style="width:187mm;border-bottom-width: 0px;">        
			<div class="styLNLeftNumBox" style="width:3mm;padding-top:0mm;padding-left: 0px">I</div>
			<div class="styGenericDiv" style="width:159mm;padding-top:0mm;">
				<span style="float:left;">Did you make any payments in 2016 that would require you to file Form(s) 1099? (see instructions)</span>
                <span class="styDotLn" style="float:right;padding-right:1mm;">......</span>
			</div>
			<div class="styGenericDiv" style="width:24mm;height:4mm;float:right;">
			   <span style="width:100%;">
					<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/PaymentRqrFilingForm1099Ind"/>
							<xsl:with-param name="BackupName">IRS1040ScheduleCPaymentRqrFilingForm1099Ind</xsl:with-param>
					</xsl:call-template>
					<input type="checkbox" class="styCkbox" name="Checkbox">
						<xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/PaymentRqrFilingForm1099Ind"/>
							<xsl:with-param name="BackupName">IRS1040ScheduleCPaymentRqrFilingForm1099Ind</xsl:with-param>
						</xsl:call-template>
					</input> 			
				<label>
					<xsl:call-template name="PopulateLabelYes">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/PaymentRqrFilingForm1099Ind"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCPaymentRqrFilingForm1099Ind</xsl:with-param>
					</xsl:call-template>
					<b>Yes</b> 
				</label>                    
				<input type="checkbox" class="styCkbox" name="Checkbox">
					<xsl:call-template name="PopulateNoCheckbox">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/PaymentRqrFilingForm1099Ind"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCPaymentRqrFilingForm1099Ind</xsl:with-param>
					</xsl:call-template>
				</input> 
				<label>
					<xsl:call-template name="PopulateLabelNo">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/PaymentRqrFilingForm1099Ind"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCPaymentRqrFilingForm1099Ind</xsl:with-param>
					</xsl:call-template>
					<b> No</b> 
				</label> 
				</span>                       
			</div>      
      
			<!-- /////////////////////  Item J //////////////////  -->
			<div class="styBB" style="width:187mm;border-bottom-width: 0px;">        
				<div class="styLNLeftNumBox" style="width:3mm;padding-top:0mm;padding-left: 0px">J</div>
				<div class="styLNDesc" style="width:159mm;padding-top:0mm;">
					<span style="float:left;">If "Yes," did you or will you file required Forms 1099?</span>
					<!--Dotted Line-->
                    <span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>
				</div>
				<div class="styGenericDiv" style="width:24mm;height:4mm;float:right;">
				   <span style="width:100%;">
					   <xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/RequiredForm1099FiledInd" />
							<xsl:with-param name="BackupName">IRS1040ScheduleCRequiredForm1099FiledInd</xsl:with-param>
						</xsl:call-template>				
						<input type="checkbox" class="styCkbox" name="Checkbox">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/RequiredForm1099FiledInd"/>
								<xsl:with-param name="BackupName">IRS1040ScheduleCRequiredForm1099FiledInd</xsl:with-param>
							</xsl:call-template>
						</input> 				
						<label>
							<xsl:call-template name="PopulateLabelYes">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/RequiredForm1099FiledInd"/>
								<xsl:with-param name="BackupName">IRS1040ScheduleCRequiredForm1099FiledInd</xsl:with-param>
							</xsl:call-template>
							<b>Yes</b> 
						</label>                    
						<input type="checkbox" class="styCkbox" name="Checkbox">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/RequiredForm1099FiledInd"/>
								<xsl:with-param name="BackupName">IRS1040ScheduleCRequiredForm1099FiledInd</xsl:with-param>
							</xsl:call-template>
						</input> 
						<label>
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/RequiredForm1099FiledInd"/>
								<xsl:with-param name="BackupName">IRS1040ScheduleCRequiredForm1099FiledInd</xsl:with-param>
							</xsl:call-template>
							<b> No</b> 
						</label>
				    </span>
				</div>    
			</div>
		</div>
	</div>
</div>
<!-- BEGIN Part I Title -->
<div class="styBB" style="width:187mm;float:none;clear:both;height:auto;">
	<div class="styPartName" style="height:auto;">Part I</div>
	<div class="styPartDesc"  style="height:auto;"> <b>Income </b>             
	</div>
</div>    
<!-- END Part I Title --> 
<!--Line 1-->
<div style="width:187mm;font-size:7pt;float:none;clear:both;height:auto;">
	<div class="styLNLeftNumBoxSD" style="height:100%;">1</div>
	<div class="styLNDesc" style="width:139.5mm;padding-top:0mm;padding-bottom:0mm;">
		<span style="width:130mm">		
				<span>Gross receipts or sales.  See instructions for line 1 and check the box if this income was reported</span>
				<span style="width:120mm;">
					<span style="float:left;">to you on Form W-2 and the "Statutory employee" box on that form was checked</span>
					<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>
                </span>
			<img src="{$ImagePath}/1040SchC_Bullet_Sm.gif" alt="Bullet Image"/>
		</span>
		<span style="width:8mm;padding-top:2mm;">
			<input type="checkbox" class="styCkbox" name="Checkbox">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/StatutoryEmployeeFromW2Ind"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCRequiredForm1099FiledInd</xsl:with-param>
				</xsl:call-template>
			</input>
			<label>
				<xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/StatutoryEmployeeFromW2Ind"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCRequiredForm1099FiledInd</xsl:with-param>
				</xsl:call-template>
			</label>
		</span>
	</div>
	<div class="styLNRightNumBox" style="height:100%;width:8mm;padding-top:2mm;">1</div>
	<div class="styLNAmountBox" style="border-bottom-width:1px;height:100%;padding-top:2mm;width:31.5mm; ">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/TotalGrossReceiptsAmt"/>
		</xsl:call-template>     
	</div>
</div>

<!-- Line 2  -->
<div style="width:187mm;font-size:7pt;float:none;clear:both;">
	<div class="styLNLeftNumBoxSD" style="height:4mm;">2</div>
	<div class="styLNDesc" style="width:139.5mm;height:4mm;">
		<span style="float:left;">Returns and allowances</span>
		<!--Dotted Line-->
        <span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>
	</div>
	<div class="styLNRightNumBox" style="height:4mm;width:8mm; ">2</div>
	<div class="styLNAmountBox" style="border-bottom-width:1px;height:4mm;width:31.5mm; ">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/ReturnsAndAllowancesAmt"/>
		</xsl:call-template>     
	</div>
</div>
<!-- Line 3  -->
<div style="width:187mm;font-size:7pt;float:none;clear:both;">
	<div class="styLNLeftNumBoxSD" style="height:4mm;">3</div>
	<div class="styLNDesc" style="width:139.5mm;height:4mm;">
		<span style="float:left;">Subtract line 2 from line 1</span>
		<!--Dotted Line-->
        <span class="styDotLn" style="float:right;padding-right:1mm;">.........................</span>
	</div>
	<div class="styLNRightNumBox" style="height:4.2mm;width:8mm;padding-bottom:0 ">3</div>
	<div class="styLNAmountBox" style="border-bottom-width:1px;padding-bottom:0;height:4.2mm;width:31.5mm; ">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/NetGrossReceiptsAmt"/>
		</xsl:call-template>     
	</div>
</div>
<!--Line 4-->
<div style="width:187mm;font-size:7pt;float:none;clear:both;">
	<div class="styLNLeftNumBoxSD" style="height:4mm;">4</div>
	<div class="styLNDesc" style="width:139.5mm;height:4mm;">
	   <span style="float:left;">Cost of goods sold (from line 42)</span>
		<!--Dotted Line-->
        <span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>     
	</div>
	<div class="styLNRightNumBox" style="height:4mm;width:8mm; ">4</div>
	<div class="styLNAmountBox" style="height:4mm;width:31.5mm; ">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/CostOfGoodsSoldAmt"/>
		</xsl:call-template>
	</div>    
</div>

<!--Line 5-->
<div style="width:187mm;font-size:7pt;float:none;clear:both;">
	<div class="styLNLeftNumBoxSD" style="height:4mm;">5</div>
	<div class="styLNDesc" style="width:139.5mm;height:4mm;">
	    <span style="float:left;"><b>Gross profit.</b> Subtract line 4 from line 3</span>
		<!--Dotted Line-->
        <span class="styDotLn" style="float:right;padding-right:1mm;">....................</span>       
	</div>  
	<div class="styLNRightNumBox" style="height:4mm;width:8mm; ">5</div>
	<div class="styLNAmountBox" style="height:4mm;width:31.5mm; ">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/GrossProfitAmt"/>
		</xsl:call-template>
	</div>  
</div>

<!--Line 6-->
<div style="width:187mm;font-size:7pt;float:none;clear:both;">
	<div class="styLNLeftNumBoxSD" style="height:4mm;">6</div>
	<div class="styLNDesc" style="width:139.5mm;height:4mm;">
	    <span style="float:left;">Other income, including federal and state gasoline or fuel tax credit or refund (see instructions)</span>
		<!--Dotted Line-->
        <span class="styDotLn" style="float:right;padding-right:1mm;">...</span>     
	</div>      
	<div class="styLNRightNumBox" style="height:4mm;width:8mm; ">6</div>
	<div class="styLNAmountBox" style="height:4mm;width:31.5mm; ">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherIncomeAmt"/>
		</xsl:call-template>
	</div>  
</div>

<!--Line 7-->   
<div class="styBB" style="width:187mm;font-size:7pt;float:none;clear:both;">
	<div class="styLNLeftNumBoxSD" style="height:4mm;">7</div>
	<div class="styLNDesc" style="width:139.5mm;height:4mm;">
        <span style="width:135mm;">    
	    <span style="float:left;"><b>Gross income.</b> Add lines 5 and 6</span>
		<!--Dotted Line-->
        <span class="styDotLn" style="float:right;padding-right:1mm;">......................</span>      
         </span>	 
		<img src="{$ImagePath}/1040SchC_Bullet_Sm.gif" alt="Bullet Image"/>
	</div>      
	<div class="styLNRightNumBox" style="height:4mm;border-bottom-width: 0px;width:8mm; ">7</div>
	<div class="styLNAmountBox" style="height:4mm;border-bottom-width: 0px; width:31.5mm;">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/GrossIncomeAmt"/>
		</xsl:call-template>
	</div>  
</div>     
<!-- BEGIN Part II Title -->
<div class="styBB" style="width:187mm;float:none;clear:both;height:auto;">
	<div class="styPartName" style="height:auto;">Part II</div>
	<div class="styPartDesc" style="height:auto;" >Expenses.<span class="styNormalText">
Enter expenses for business use of your home 
	<b>only</b> on line 30.
	</span>
	</div>
</div>
<!-- END Part II Title -->    

<!-- BEGIN Part II Line Items -->
<div class="styBB" style="width:187mm;float:none;clear:both;">      
	<!-- BEGIN Left Side Table of Part II-->
	<table class="styTable" style="width:94mm;float:left;font-size:7pt;" cellspacing="0">
		<thead/>
		<tfoot/>
		<tbody>
			<!--Line 8-->
			<tr style="width:94mm;">
				<td class="styLNLeftNumBoxSD" style="height:100%;vertical-align:top;width:5mm;">8</td>
				<td  class="styGenericDiv" style="width:46mm;padding-top:0.5mm;">
					<span style="float:left;">Advertising</span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">......</span>                              
					<td class="styLNRightNumBox" style="width:7.25mm;">
						8
					</td>
					<td class="styLNAmountBox" style="border-right-width:1px;width:31.5mm;">     
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/AdvertisingAmt"/>
						</xsl:call-template>
					</td>
				</td>          
			</tr>
			<!--Line 9-->
			<tr>
				<td class="styLNLeftNumBoxSD" style="vertical-align:top;width:5mm;height:100%;">9</td>
				<td class="styGenericDiv" style="width:46mm;font-size:7pt;padding-top:0.5mm;" colspan="1">
				    Car and truck expenses (see 
				   <span style="float:left;">
					   instructions)
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/CarAndTruckExpensesAmt"/>
						</xsl:call-template>
					</span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>   
				</td>
				<td class="styLNRightNumBox" style="width:7.25mm;height:7mm;padding-top:3mm;">
					9
				</td>
				<td class="styLNAmountBox" style="border-right-width:1px;width:31.5mm;height:7mm;padding-top:3mm;vertical-align:bottom;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/CarAndTruckExpensesAmt"/>
					</xsl:call-template>
				</td>
			</tr>
			<!--Line 10-->
			<tr >
				<td class="styLNLeftNumBox" style="vertical-align:top;width:5mm;height:100%;">10</td>
				<td class="styGenericDiv" style="width:46mm;font-size:7pt;height:100%;padding-top:0.5mm;">
					<span style="float:left;">Commissions and fees</span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">...</span> 
				</td>
				<td class="styLNRightNumBox" style="width:7.25mm;height:100%;">
					10
				</td>
				<td class="styLNAmountBox" style="border-right-width:1px;width:31.5mm;height:100%;"> 
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/CommissionsAndFeesAmt"/>
					</xsl:call-template>
				</td>
			</tr>
			<!--Line 11-->  
			<tr>
				<td class="styLNLeftNumBox" style="vertical-align:top;height:5mm;width:5mm;">11</td>
				<td class="styGenericDiv" style="width:46mm;height:5mm;">Contract labor (see instructions)
				</td>
				<td class="styLNRightNumBox" style="width:7.25mm;height:5mm;">
					11
				</td>
				<td class="styLNAmountBox" style="vertical-align:top;height:5mm;border-right-width:1px;width:31.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/ContractLaborAmt"/>
					</xsl:call-template>
				</td>
			</tr>
			<!--Line 12-->  
			<tr>
				<td class="styLNLeftNumBox" style="height:100%;vertical-align:top;width:5mm;">12</td>
				<td class="styGenericDiv" style="width:46mm;height:auto;">
				    <span style="float:left;">Depletion
				    	<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/DepletionAmt"/>
						</xsl:call-template>
					</span>	
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">......</span> 
				</td>
				<td class="styLNRightNumBox" style="height:100%;width:7.25mm;">
					12
				</td>
				<td class="styLNAmountBox" style="height:100%;border-right-width:1px;width:31.5mm;">      
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/DepletionAmt"/>
					</xsl:call-template>
				</td>
			</tr>
			<!--Line 13-->  
			<tr>
				<td class="styLNLeftNumBox" style="padding-top:0mm;vertical-align:top;width:5mm;">13</td>
				<td class="styGenericDiv" style="width:46mm;padding-top:0.1mm;">Depreciation and section 179<br/>
				 expense deduction (not <br/> included in Part III) (see
				  <span style="width:35mm;">
					   <span style="float:left;"> instructions)</span>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:right;padding-right:1mm;">...</span> 
					</span>
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/DeprecAndSect179ExpnsDedAmt"/>
					</xsl:call-template>
				</td>
				<td class="styLNRightNumBox" style="width:7.25mm;height:14mm;padding-top:10mm;" valign="bottom;">
					13
				</td>
				<td class="styLNAmountBox"  style="width:31.5mm;border-right-width:1px;height:14mm;vertical-align:bottom;padding-top:10mm;" >     
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/DeprecAndSect179ExpnsDedAmt"/>
					</xsl:call-template>
				</td>
			</tr>  
			<!--Line 14-->  
			<tr>
				<td class="styLNLeftNumBox" style="height:100%;vertical-align:top;padding-top:0mm;width:5mm;">14</td>
				<td class="styGenericDiv" style="width:46mm;padding-top:0.1mm;">Employee benefit programs
				        <span style="float:left;">(other than on line 19)</span>
						<!--Dotted Line-->
						<span class="styDotLn" style="float:right;padding-right:1mm;">..</span> 
				</td>
				<td class="styLNRightNumBox" style="height:6.5mm;width:7.25mm;padding-top:2mm;">
					14
				</td>
				<td class="styLNAmountBox"   style="height:6.5mm;border-right-width:1px;width:31.5mm;vertical-align:bottom;padding-top:2mm;">     
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/EmployeeBenefitProgramAmt"/>
					</xsl:call-template>
				</td>
			</tr>   
			<!--Line 15-->
			<tr>
				<td class="styLNLeftNumBox" style="vertical-align:top;width:5mm;height:100%;">15</td>
				<td class="styGenericDiv" style="width:46mm;height:100%;padding-top:0.4mm;">
					<span style="float:left;">Insurance (other than health)</span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;"/>
				</td>
				<td class="styLNRightNumBox" style="width:7.25mm;height:100%;">
					15
				</td>
				<td class="styLNAmountBox" style="border-right-width:1px;width:31.5mm;height:100%;"> 
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/InsuranceAmt"/>
					</xsl:call-template>
				</td>
			</tr>
			<!--Line 16-->
			<tr>
				<td class="styLNLeftNumBox" style="height:100%;width:5mm;">16</td>
				<td class="styGenericDiv" style="width:46mm;height:100%;padding-top:0.5mm;">Interest:</td>        
				<td class="styLNRightNumBox" style="height:100%;width:7.25mm;border-bottom-width:0px;background-color:lightgrey;">
					<span style="width:1px;"/>  
				</td>     
				<td class="styLNRightNumBoxNBB" style="width:31.5mm;border-right-width:1px;">
					<span style="width:7.25mm;"/> 
				</td>            
			</tr>          
			<tr>
				<td class="styLNLeftNumBoxSD" style="width:6mm;padding-top:0mm;">
				     a
				</td>
				<td class="styGenericDiv" style="width:45mm;height:100%;">Mortgage (paid to banks, etc.)
					<xsl:call-template name="SetFormLinkInline">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MortgageInterestPaidBanksAmt"/>
					</xsl:call-template>
					<!--Dotted Line-->
					<span class="styBoldText"/>
				</td>
				<td class="styLNRightNumBox" style="height:100%;width:7.25mm;">
					16a
				</td>
				<td class="styLNAmountBox" style="height:100%;width:31.5mm;border-right-width:1px;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MortgageInterestPaidBanksAmt"/>
					</xsl:call-template>
				</td>
			</tr>         
			<tr>
				<td class="styLNLeftNumBoxSD" style="height:100%;width:6mm;">
					b
				</td>
				<td class="styGenericDiv" style="width:45mm;height:100%;">
				    <span style="float:left;">Other
						<xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MortgageInterestPaidOtherAmt"/>
						</xsl:call-template>
					</span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>      
				</td>
				<td class="styLNRightNumBox" style="height:100%;width:7.25mm;">
					16b
				</td>
				<td class="styLNAmountBox" style="height:100%;width:31.5mm;border-right-width:1px;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MortgageInterestPaidOtherAmt"/>
					</xsl:call-template>					
				</td>
			</tr>  
			<!--Line 17-->
			<tr>
				<td class="styLNLeftNumBox" style="width:5mm;padding-bottom:0mm;"><div style="height:5.2mm;">17</div></td>
				<td class="styGenericDiv" style="width:46mm;height:5.2mm;">Legal and professional services</td>
				<td class="styLNRightNumBox" style="width:7.25mm;height:5.2mm;border-bottom:0mm;">
					17
				</td>
				<td class="styLNAmountBox" style="border-right-width:1px;width:31.5mm;height:5.2mm;border-bottom-width: 0px;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/LegalAndProfessionalServiceAmt"/>
					</xsl:call-template>
				</td>
			</tr>
		</tbody>
	</table>
	<!-- END Left Side table of Part II-->
	<!-- BEGIN Right Side table of Part II-->
	<table class="styTable" style="width:93mm;float:left;font-size:7pt;heght:auto;" cellspacing="0">
		<thead/>
		<tfoot/>
		<tbody>
			<!--Line 18-->
			<tr>        
				<td class="styLNLeftNumBox" style="height:100%;vertical-align:top;width:4mm;padding-left:0mm;height:4mm;">18</td>
				<td class="styGenericDiv" style="width:50mm;padding-top:0.5mm;">
					Office expense (see instructions)
				</td>
				<td class="styLNRightNumBox" style="height:100%;width:7.25mm;padding-top:0mm;">
					18
				</td>
				<td class="styLNAmountBox" style="height:100%;width:31.5mm;padding-top:0mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OfficeExpensesAmt"/>
					</xsl:call-template>
				</td>
			</tr>
			<!--Line 19-->
			<tr>
				<td class="styLNLeftNumBox" style="height:100%;vertical-align:top;width:4mm;padding-left:0mm;height:4mm;">19</td>
				<td class="styGenericDiv" style="width:50mm;padding-top:0.5mm;">Pension and profit-sharing plans</td>         
				<td class="styLNRightNumBox" style="height:100%;width:7.25mm;">
					19
				</td>
				<td class="styLNAmountBox" style="height:100%;width:31.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/PensionProfitSharingPlansAmt"/>
					</xsl:call-template>
				</td>         
			</tr>         
			<!--Line 20-->      
			<tr>
				<td class="styLNLeftNumBox" style="height:100%;width:4mm;padding-left:0mm;height:4mm;">20</td>
				<td class="styGenericDiv" style="width:50mm;padding-top:0.5mm;">Rent or lease (see instructions):</td>        
				<td class="styLNRightNumBox" style="height:100%;width:7.25mm;border-bottom-width:0px;background-color:lightgrey;">
					<span style="width:1px;"/>  
				</td>     
				<td class="styLNRightNumBoxNBB" style="width:7.25mm;height:100%;"><span style="width:1px;"/></td>
			</tr>          
			<tr>
				<td class="styLNLeftNumBoxSD" style="height:100%;vertical-align:top;width:5mm;padding-left:2mm;padding-top:0mm;">
					a
				</td>
				<td class="styGenericDiv" style="width:49mm;font-size:6pt;padding-top:0mm;padding-bottom:0mm;">
				    <span style="float:left;">Vehicles, machinery, and equipment</span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>   
				</td>
				<td class="styLNRightNumBox" style="height:100%;width:7.25mm;">
					20a
				</td>
				<td class="styLNAmountBox" style="height:100%;width:31.5mm;vertical-align:bottom;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MachineryAndEquipmentRentAmt"/>
					</xsl:call-template>
				</td>
			</tr>         
			<tr>
				<td class="styLNLeftNumBoxSD" style="height:100%;width:5mm;padding-left:2mm;height:4mm;">
					 b
				</td>
				<td class="styGenericDiv" style="width:49mm;padding-top:0mm;padding-bottom:0mm;">
				    <span style="float:left;">Other business property </span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>    
				</td>
				<td class="styLNRightNumBox" style="height:100%;width:7.25mm;">
					20b
				</td>
				<td class="styLNAmountBox" style="height:100%;width:31.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherBusinessPropertyRentAmt"/>
					</xsl:call-template>
				</td>
			</tr>  
			<!--Line 21-->   
			<tr>
				<td class="styLNLeftNumBox" style="height:100%;vertical-align:top;width:4mm;padding-left:0mm;">21</td>
				<td class="styGenericDiv" style="width:50mm;padding-top:0.5mm;">
				    <span style="float:left;">Repairs and maintenance</span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">...</span>    
				</td>
				<td class="styLNRightNumBox" style="height:100%;width:7.25mm;">
					21
				</td>
				<td class="styLNAmountBox" style="height:100%;width:31.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/RepairsAndMaintenanceAmt"/>
					</xsl:call-template>
				</td>
			</tr>
			<!--Line 22-->   
			<tr>
				<td class="styLNLeftNumBox" style="height:100%;vertical-align:top;width:4mm;padding-left:0mm;">22</td>
				<td class="styGenericDiv" style="width:50mm;padding-top:0.5mm;">Supplies  (not included in Part III)
					<!--Dotted Line-->
					<span class="styBoldText"/>
				</td>
				<td class="styLNRightNumBox" style="height:100%;width:7.25mm;">
					22
				</td>
				<td class="styLNAmountBox" style="height:100%;width:31.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/SuppliesAmt"/>
					</xsl:call-template>
				</td>
			</tr>
			<tr>
				<!--Line 23-->   
				<td class="styLNLeftNumBox" style="height:100%;vertical-align:top;width:4mm;padding-left:0mm;">23</td>
				<td class="styGenericDiv" style="width:50mm;padding-top:0mm;padding-bottom:0mm;">
				    <span style="float:left;">Taxes and licenses</span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>   
				</td>
				<td class="styLNRightNumBox" style="height:100%;width:7.25mm;">
					23
				</td>
				<td class="styLNAmountBox" style="height:100%;width:31.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/TaxesAndLicensesAmt"/>
					</xsl:call-template>
				</td>
			</tr>
			<!--Line 24-->   
			<tr>
				<td class="styLNLeftNumBox" style="height:100%;width:4mm;padding-left:0mm;">24</td>
				<td class="styGenericDiv" style="width:50mm;padding-bottom:0.5mm;">Travel, meals, and entertainment:</td>
				<td class="styLNRightNumBox" style="height:100%;width:7.25mm;border-bottom-width:0px;background-color:lightgrey;">
					<span style="width:1px;"/>  
				</td>     
				<td class="styLNRightNumBoxNBB" style="width:7.25mm;height:100%;"><span style="width:1px;"/></td>            
			</tr>          
			<tr>
				<td class="styLNLeftNumBoxSD" style="height:100%;vertical-align:top;width:5mm;padding-left:2mm;">
					 a
				</td>
				<td class="styGenericDiv" style="width:49mm;padding-top:0mm;padding-bottom:0mm;">
				    <span style="float:left;">Travel</span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>   
				</td>
				<td class="styLNRightNumBox" style="height:100%;width:7.25mm;">
					24a
				</td>
				<td class="styLNAmountBox" style="height:100%;width:31.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/TravelAmt"/>
					</xsl:call-template>
				</td>
			</tr>         
			<tr>
				<td class="styLNLeftNumBoxSD" style="height:100%;width:5mm;vertical-align:top;padding-left:2mm;">
					b
				</td>
				<td class="styGenericDiv" style="width:49mm;padding-top:0mm;padding-bottom:0mm;">Deductible meals and <br/>entertainment (see instructions)   
					<!--Dotted Line-->
					<span class="styBoldText"/>  
				</td>
				<td class="styLNRightNumBox" style="height:6mm;width:7.25mm;padding-top:2.5mm;">
					24b
				</td>
				<td class="styLNAmountBox" style="height:6mm;width:31.5mm;padding-top:2.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MealsAndEntertainmentAmt"/>
					</xsl:call-template>
				</td>
			</tr>  
			<!--Line 25-->   
			<tr>
				<td class="styLNLeftNumBox" style="height:100%;vertical-align:top;width:4mm;padding-left:0mm;">25</td>
				<td class="styGenericDiv" style="width:50mm;padding-top:0.5mm;">
				    <span style="float:left;">Utilities</span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">.........</span>   
				</td>
				<td class="styLNRightNumBox" style="height:100%;width:7.25mm;">
					25
				</td>
				<td class="styLNAmountBox" style="height:100%;width:31.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/UtilitiesAmt"/>
					</xsl:call-template>
				</td>
			</tr>
			<!--Line 26-->   
			<tr>
				<td class="styLNLeftNumBox" style="height:100%;vertical-align:top;width:4mm;padding-left:0mm;">26</td>
				<td class="styGenericDiv" style="width:50mm;padding-top:0mm;padding-bottom:0mm;">Wages (less employment credits)
					<!--Dotted Line-->
					<span class="styBoldText"/>
				</td>
				<td class="styLNRightNumBox" style="height:100%;width:7.25mm;">
					26
				</td>
				<td class="styLNAmountBox" style="height:100%;width:31.5mm;">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/WagesLessEmploymentCreditsAmt"/>
					</xsl:call-template>
				</td>
			</tr>          
			<!--Line 27a-->
			<tr>
				<td class="styLNLeftNumBox" style="height:100%;vertical-align:top;width:4mm;padding-left:0mm;">27a</td>
				<td class="styGenericDiv" style="width:50mm;padding-top:0.5mm;padding-left:1mm;">
				    <span style="float:left;padding-left:1mm;">Other expenses (from line 48)</span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">.</span>   
				</td>
				<td class="styLNRightNumBox" style="height:100%;width:7.25mm;">
					27a
				</td>
				<td class="styLNAmountBox" style="height:100%;width:31.5mm;">     
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/TotalOtherExpensesAmt"/>
					</xsl:call-template>
				</td>
			</tr>  
			<!--Blank Line-->
			<tr>
				<td class="styLNLeftNumBoxSD" style="height:6.5mm;width:5mm;padding-left:3.5mm;">
					 b
				</td>
				<td class="styGenericDiv" style="width:49mm;padding-top:0.5mm;"> 
				    <span style="float:left;padding-left:1mm;"><b>Reserved for future use</b></span>
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">...</span> 
				</td>
				<td class="styLNRightNumBox" style="height:6.5mm;width:7.25mm;border-bottom-width:0px;">
					27b
				</td>
				<td class="styLNAmountBox" style="height:6.5mm;width:31.5mm;border-bottom-width:0px;"> &#160;    
<!--					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/TotalExpensesAmt" />
					</xsl:call-template>-->
				</td>      
			</tr>          
		</tbody>
	</table>
	<!-- END Right Side Table of Part II-->
</div>
<!--Line 28--> 
<div style="width:187mm;float:none;clear:both;height:auto;">      
	<div class="styLNLeftNumBox" style="height:100%;padding-top:0mm;">28</div>      
	<div class="styGenericDiv" style="width:139.8mm; padding-top:0mm;padding-bottom:0mm;border-right:0px;">   
	<span style="float:left;width:135mm;">  
		<span style="float:left;">
			<span class="styBoldText">Total expenses </span>
			before expenses for business use of home. Add lines 8 through 27a
		</span>
			<!--Dotted Line-->
			<span  class="styDotLn" style="float:right;padding-right:1mm;">.....</span>
		</span>     
		<img src="{$ImagePath}/1040SchC_Bullet_Sm.gif" alt="Bullet Image"/> 
	</div>
	<div class="styLNRightNumBox" style="height:100%;padding-top:0mm;width:7.5mm;">      
		28
	</div>
	<div class="styLNAmountBox" style="height:100%;padding-top:0mm;width:31.5mm;">        
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/TotalExpensesAmt"/>
		</xsl:call-template>        
	</div>
</div>
  
<!--Line 29-->
<div style="width:187mm;float:none;clear:both;height:auto;">
	<div class="styLNLeftNumBox" style="height:100%; padding-top:0mm;">29</div>
	<div class="styLNDesc" style="width:139.8mm;padding-top:0mm;padding-bottom:0mm;">
		<span style="float:left;">Tentative profit or (loss). Subtract line 28 from line 7</span>               
		<!--Dotted Line-->
		<span  class="styDotLn" style="float:right;padding-right:1mm;">...............</span>   
	</div>
	<div class="styLNRightNumBox" style="width:7.5mm;height:100%;">
		29
	</div>
	<div class="styLNAmountBox" style="height:100%;width:31.5mm;">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/TentativeProfitOrLossAmt"/>
		</xsl:call-template>
	</div>       
</div>

<!--Line 30-->
<div style="width:187mm;float:none;clear:both;height:auto;">
	<div class="styLNLeftNumBox" style="height:100%;padding-top:0mm;">30</div>
	<div class="styLNDesc" style="width:139.8mm;padding-top:0mm;padding-bottom:0mm;height:auto;">
		Expenses for business use of your home. Do not report these expenses elsewhere. Attach Form 8829 unless using the simplified method (see instructions).
		<!--Dotted Line-->
		<xsl:call-template name="SetFormLinkInline">
			<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/HomeBusinessExpenseAmt"/>
		</xsl:call-template><br/>
		<b>Simplified method filers only: </b>enter the total square footage of: (a) your home: 
		<span style="border:0px solid black; border-bottom-width:1px; width:20mm; text-align:center;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/TotalAreaOfHomeCnt"/>
			</xsl:call-template>
		</span> 
		and (b) the part of your home used for business: 
		<span style="border:0px solid black; border-bottom-width:1px; width:20mm; text-align:center;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/HomeBusinessUseSquareFeetCnt"/>
			</xsl:call-template>
		</span>. 
		Use the Simplified Method Worksheet in the instructions to figure the amount to enter on line 30.
	</div>
	<div class="styLNRightNumBox" style="width:7.5mm;height:15.9mm;padding-top:12mm;">
		30
	</div>
	<div class="styLNAmountBox" style="height:15.9mm;width:31.5mm;padding-top:12mm;">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/HomeBusinessExpenseAmt"/>
		</xsl:call-template>
	</div>
</div>

<!--Line 31-->
<div style="width:187mm;float:none;clear:both;height:6mm;height:auto;">
	<div class="styLNLeftNumBox" style="height:100%; padding-top:0mm;">31</div>
	<div class="styLNDesc" style="width:135.8mm;padding-top:0mm;padding-bottom:0mm;height:auto;">
		<span class="styBoldText">Net profit or (loss). </span>Subtract line 30 from line 29.
		<li>If a profit, enter on both <b>Form 1040, line 12,</b> (or <b>Form 1040NR, line 13</b>) and on <b> Schedule SE, line<br/>2.</b> (If you checked the box on line 1, see instructions). Estates and trusts, enter on <b>Form 1041, line 3.</b>
		<xsl:call-template name="LinkToLeftoverDataTableInline">
			<xsl:with-param name="Desc">Line 31 - Passive Activity Loss Literal </xsl:with-param>
			<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/NetProfitOrLossAmt/@passiveActivityLossLiteralCd"/>
		</xsl:call-template> 
		<xsl:call-template name="LinkToLeftoverDataTableInline">
			<xsl:with-param name="Desc">Line 31 - Passive Activity Loss Amount</xsl:with-param>
			<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/NetProfitOrLossAmt/@passiveActivityLossAmt"/>      
		</xsl:call-template>
		<br/>   </li>   
		<li>If a loss, you <span class="styBoldText">must</span> go to line 32.</li>             
	</div>
	<div class="styLNDesc" style="width:4mm; height:3.65mm;padding-top:1.65mm;">
		<img src="{$ImagePath}/1040SchC_Bracket.gif" height="40mm" alt="Curly Bracket Image"/>        
	</div>       
	<div class="styLNRightNumBox" style="width:7.5mm;height:100%;padding-top:11mm;">
		31
	</div>    
	<div class="styLNAmountBox" style="height:100%;width:31.5mm;padding-top:11mm;">
		<xsl:call-template name="PopulateAmount">
			<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/NetProfitOrLossAmt"/>
		</xsl:call-template>
	</div>       
</div>

<!--Line 32-->  
<div class="styBB" style="width:187mm;float:none;clear:both;height:18mm;">
	<div class="styLNLeftNumBox" style="height:100%; padding-top:0mm;">32</div>
	<div class="styLNDesc" style="width:131mm;padding-top:0mm;padding-bottom:0mm;">
		If you have a loss, check the box that describes your investment in this activity (see instructions).                 
		<li>If you checked 32a, enter the loss on both <span class="styBoldText">Form 1040, line 12,</span> (or <b>Form 1040NR, line 13</b>) and on <span class="styBoldText   ">Schedule SE, line 2</span>. (If you checked the box on line 1, see the line 31 instructions). Estates and trusts, enter on <b>Form 1041, line 3.</b>
		</li>
		<li>If you checked 32b, you <span class="styBoldText">must</span> attach <span class="styBoldText">Form 6198.</span> Your loss may be limited.</li>
	</div>      
	<div class="styLNDesc" style="width:4mm; height:100%;padding-top:3mm;">
		<img src="{$ImagePath}/1040SchC_Bracket.gif" align="bottom" height="42mm" alt="Curly Bracket Image"/>              
	</div>
	<div style="height:12mm;float:right;width:44mm;">
		<!--Line 32a-->  
		<div class="styLNDesc" style="width:44mm;height:auto;padding-top:2mm;">
			<span style="width:.5mm;"/>
			<span class="styBoldText">32a</span>
			<span style="width:1px"/>
			<span>
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/AllInvestmentIsAtRiskInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCAllInvestmentIsAtRiskInd</xsl:with-param>
				</xsl:call-template>		
				<input type="checkbox" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/AllInvestmentIsAtRiskInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCAllInvestmentIsAtRiskInd</xsl:with-param>
					</xsl:call-template>
				</input>        
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/AllInvestmentIsAtRiskInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCAllInvestmentIsAtRiskInd</xsl:with-param>
					</xsl:call-template>
					<span style="font-family:Arial;font-size: 7pt;">All investment is at risk. </span>
				</label>
		   </span>
		</div>
		<!--Line 32b-->
		<div class="styLNDesc" style="width:44mm;height:auto;padding-top:2mm;">
			<span style="width:.5mm;"/>
			<span class="styBoldText">32b</span>
			<span style="width:1px"/>
			<input type="checkbox" class="styCkbox">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/SomeInvestmentIsNotAtRiskInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCSomeInvestmentIsNotAtRiskInd</xsl:with-param>
				</xsl:call-template>
			</input>      
			<label>
				<xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/SomeInvestmentIsNotAtRiskInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCSomeInvestmentIsNotAtRiskInd</xsl:with-param>
				</xsl:call-template>
				<span style="font-family:Arial;font-size: 6pt;">Some investment is not at risk.</span>
			</label>
			<xsl:call-template name="SetFormLinkInline">
				<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/SomeInvestmentIsNotAtRiskInd"/>
			</xsl:call-template>
		</div>
	</div>
</div>
<!-- Page Break-->
<!-- Footer-->   
<div style="width:187mm;float:none;clear:both; ">  
	<div class="styGenericDiv" style="font-weight:bold">For Paperwork Reduction Act Notice, see your tax return instructions. </div>   
	<div class="styGenericDiv" style="padding-left:15mm">Cat. No. 11334P</div>                        
	<div class="styGenericDiv" style="font-weight:bold;float:right">Schedule C (Form 1040) 2016 </div>
</div> 
<!--</div> --> 
 <!--Begin Page 2 -->
<!-- <div style="width:187mm;" >-->
<p style="page-break-before: always"/>
    <!-- Header -->    
    <div class="styBB" style="width:187mm;float:left;clear:all;">  
      <div style="float:left;">Schedule C (Form 1040) 2016 <span style="width:130mm;"/></div>
      <div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>  
    </div>  
    <!-- BEGIN Part III Title -->
    <div class="styBB" style="width:187mm;height:auto;">
      <div class="styPartName" style="height:auto;">Part III</div>
      <div class="styPartDesc" style="font-weight: normal;height:auto;"><b>Cost of Goods Sold </b>(see instructions)<span class="styNormalText"/>             
      </div>
    </div>
    <!-- END Part III Title -->
 <!--Line 33--> 
    <div style="width:187mm;font-size:7pt;clear:all;height:auto;">      
      <div class="styLNLeftNumBox" style="height:8mm;padding-top:5mm;height:auto;">33</div>      
      <div class="styLNDesc" style="width: 50mm; height:8mm;padding-top:5mm;height:auto;">        
   Method(s) used to<br/> value closing inventory:        
      </div>
       <div class="styLNDesc" style="width: 28mm; height:8mm;padding-top:9mm;"><b> a </b>       
       <span>
			<xsl:call-template name="PopulateSpan">
				<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/ClosingInventoryCostMethodInd"/>
				<xsl:with-param name="BackupName">IRS1040ScheduleCClosingInventoryCostMethodInd</xsl:with-param>
			</xsl:call-template>							
			<input type="checkbox" class="styCkbox">
			  <xsl:call-template name="PopulateCheckbox">
				<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/ClosingInventoryCostMethodInd"/>
				<xsl:with-param name="BackupName">IRS1040ScheduleCClosingInventoryCostMethodInd</xsl:with-param>
			  </xsl:call-template>
			</input> 
			<label>
			  <xsl:call-template name="PopulateLabel">
				<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/ClosingInventoryCostMethodInd"/>
				<xsl:with-param name="BackupName">IRS1040ScheduleCClosingInventoryCostMethodInd</xsl:with-param>
			  </xsl:call-template>
			  Cost
			</label>
        </span>
      </div>
      <div class="styLNDesc" style="width: 50mm; height:8mm;padding-top:9mm;height:auto;"><b> b </b>         
        <input type="checkbox" class="styCkbox">
          <xsl:call-template name="PopulateCheckbox">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/LowerOfCostOrMarketMethodInd"/>
            <xsl:with-param name="BackupName">IRS1040ScheduleCLowerOfCostOrMarketMethodInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/LowerOfCostOrMarketMethodInd"/>
            <xsl:with-param name="BackupName">IRS1040ScheduleCLowerOfCostOrMarketMethodInd</xsl:with-param>
          </xsl:call-template>
          Lower of cost or market
        </label>
      </div>
      <div class="styLNDesc" style="width: 48mm; height:8mm;padding-top:9mm;height:auto;"><b> c </b>          
        <input type="checkbox" class="styCkbox">
          <xsl:call-template name="PopulateCheckbox">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherClosingInventoryMethodInd"/>
            <xsl:with-param name="BackupName">IRS1040ScheduleCOtherClosingInventoryMethodInd</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherClosingInventoryMethodInd"/>
            <xsl:with-param name="BackupName">IRS1040ScheduleCOtherClosingInventoryMethodInd</xsl:with-param>
          </xsl:call-template>
          Other (attach explanation)
          <xsl:call-template name="SetFormLinkInline">
           <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherClosingInventoryMethodInd"/>
              </xsl:call-template>  
        </label>
      </div>
    </div>
    <!--Line 34-->
     <div style="width:187mm;font-size:7pt;height:auto;">      
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;height:auto;">34</div>
      <div class="styLNDesc" style="width:174mm;padding-top:1mm;height:auto;">
           Was there any change in determining quantities, costs, or valuations between opening and closing inventory?
		<span style="float:left;">
		   <span style="float:left;">If "Yes," attach explanation</span>
			<!--Dotted Line-->
			<span  class="styDotLn" style="padding-right:1mm;">.........................</span>  
	    </span>
	    <span style="float:right;height:auto;">
			<span style="width: 2mm;"/>			        
			 <xsl:call-template name="SetFormLinkInline">
			  <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/ChangeInValuationsInd"/>
			</xsl:call-template> 
			   <span style="width: 5mm;"/>        
			<span>
				<xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/ChangeInValuationsInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCChangeInValuationsInd</xsl:with-param>
				</xsl:call-template>			   
				<input type="checkbox" class="styCkbox" name="Checkbox">
				 <xsl:call-template name="PopulateYesCheckbox">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/ChangeInValuationsInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCChangeInValuationsInd</xsl:with-param>
				  </xsl:call-template>
				</input> 
			</span>  
			<label>
			  <xsl:call-template name="PopulateLabelYes">
				<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/ChangeInValuationsInd"/>
				<xsl:with-param name="BackupName">IRS1040ScheduleCChangeInValuationsInd</xsl:with-param>
			  </xsl:call-template>
			  <b>Yes</b>
			</label>                    
				 <span style="width: 4mm;"/>
			 <input type="checkbox" class="styCkbox" name="Checkbox">
				<xsl:call-template name="PopulateNoCheckbox">
				<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/ChangeInValuationsInd"/>
				<xsl:with-param name="BackupName">IRS1040ScheduleCChangeInValuationsInd</xsl:with-param>
			  </xsl:call-template>
			</input> 
			<label>
			   <xsl:call-template name="PopulateLabelNo">
				<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/ChangeInValuationsInd"/>
				<xsl:with-param name="BackupName">IRS1040ScheduleCChangeInValuationsInd</xsl:with-param>
			  </xsl:call-template>
			 <b>No</b> 
			</label> 
         </span>                      
      </div>        
    </div>
    <!--Line 35-->
    <div style="width:187mm;">      
      <div class="styLNLeftNumBox"/>     
      <div class="styLNDesc" style="width: 139mm;"/>        
      <div class="styLNRightNumBox" style="border:none"/>      
      <div class="styLNAmountBox" style="border:none"/>        
    </div>
    <div style="width:187mm;font-size:7pt;">      
      <div class="styLNLeftNumBox" style="height:5mm;padding-top:1mm;">35</div>      
      <div class="styLNDesc" style="width: 139mm; height:4mm;padding-top:1mm;">        
            <span style="float:left;">Inventory at beginning of year. If different from last year's closing inventory, attach explanation</span>           
             <!--Dotted Line-->
			<span  class="styDotLn" style="float:right;padding-right:1mm;">.</span>      
           <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BeginningOfYearInventoryAmt"/>
        </xsl:call-template>    
      </div>
      <div class="styLNRightNumBox" style="height:5mm;padding-top:2mm;">      
        35
      </div>
      <div class="styLNAmountBox" style="height:5mm;padding-top:2mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/BeginningOfYearInventoryAmt"/>
        </xsl:call-template>        
      </div>
    </div>
   <!--Line 36-->
    <div style="width:187mm;font-size:7pt;">      
      <div class="styLNLeftNumBox" style="height:8mm;padding-top:5mm;">36</div>      
      <div class="styLNDesc" style="width:139mm; height:8mm;padding-top:5mm;">        
            <span style="float:left;">Purchases less cost of items withdrawn for personal use </span>    
			<!--Dotted Line-->
			<span  class="styDotLn" style="float:right;padding-right:1mm;">................</span>                
      </div>
      <div class="styLNRightNumBox" style="height:8mm;padding-top:5mm;">      
        36
      </div>
      <div class="styLNAmountBox" style="height:8mm;padding-top:5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/PurchasesLessPersonalItemsAmt"/>
        </xsl:call-template>        
      </div>
    </div>
  <!--Line 37-->  
    <div style="width:187mm;font-size:7pt;">      
      <div class="styLNLeftNumBox" style="height:8mm;padding-top:5mm;">37</div>      
      <div class="styLNDesc" style="width: 139mm; height:8mm;padding-top:5mm;">        
            <span style="float:left;">Cost of labor. Do not include any amounts paid to yourself</span>
			<!--Dotted Line-->
			<span  class="styDotLn" style="float:right;padding-right:1mm;">...............</span>                 
      </div>
      <div class="styLNRightNumBox" style="height:8mm;padding-top:5mm;">      
        37
      </div>
      <div class="styLNAmountBox" style="height:8mm;padding-top:5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/CostOfLaborAmt"/>
        </xsl:call-template>        
      </div>
    </div>  
   <!--Line 38-->
    <div style="width:187mm;font-size:7pt;">      
      <div class="styLNLeftNumBox" style="height:8mm;padding-top:5mm;">38</div>      
      <div class="styLNDesc" style="width: 139mm; height:8mm;padding-top:5mm;">        
            <span style="float:left;">Materials and supplies</span>
			<!--Dotted Line-->
			<span  class="styDotLn" style="float:right;padding-right:1mm;">...........................</span>                 
      </div>
      <div class="styLNRightNumBox" style="height:8mm;padding-top:5mm;">      
        38
      </div>
      <div class="styLNAmountBox" style="height:8mm;padding-top:5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/MaterialsAndSuppliesAmt"/>
        </xsl:call-template>        
      </div>
    </div>
   <!--Line 39--> 
    <div style="width:187mm;font-size:7pt;">      
      <div class="styLNLeftNumBox" style="height:8mm;padding-top:5mm;">39</div>      
      <div class="styLNDesc" style="width: 139mm;height:8mm;padding-top:5mm;">        
           <span style="float:left;">Other costs</span>
			<!--Dotted Line-->
			<span  class="styDotLn" style="float:right;padding-right:1mm;">.............................</span>                  
      </div>
      <div class="styLNRightNumBox" style="height:8mm;padding-top:5mm;">      
        39
      </div>
      <div class="styLNAmountBox" style="height:8mm;padding-top:5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherCostsAmt"/>
        </xsl:call-template>        
      </div>
    </div>
    <!--Line 40-->
     <div style="width:187mm;font-size:7pt;">      
      <div class="styLNLeftNumBox" style="height:8mm;padding-top:5mm;">40</div>      
      <div class="styLNDesc" style="width: 139mm;height:8mm;padding-top:5mm;">        
            <span style="float:left;">Add lines 35 through 39</span>
			<!--Dotted Line-->
			<span  class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>             
      </div>
      <div class="styLNRightNumBox" style="height:8mm;padding-top:5mm;">      
        40
      </div>
      <div class="styLNAmountBox" style="height:8mm;padding-top:5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/TotalCostsAmt"/>
        </xsl:call-template>        
      </div>
    </div>   
 <!--Line 41-->   
    <div style="width:187mm;font-size:7pt;">      
      <div class="styLNLeftNumBox" style="height:8mm;padding-top:5mm;">41</div>      
      <div class="styLNDesc" style="width: 139mm; height:8mm;padding-top:5mm;">        
            <span style="float:left;">Inventory at end of year</span>
			<!--Dotted Line-->
			<span  class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>               
      </div>
      <div class="styLNRightNumBox" style="height:8mm;padding-top:5mm;">      
        41
      </div>
      <div class="styLNAmountBox" style="height:8mm;padding-top:5mm;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/EndOfYearInventoryAmt"/>
        </xsl:call-template>        
      </div>
    </div>   
      <!--Line 42-->
      <div class="styBB" style="width:187mm;border-bottom-width: 1px;font-size:7pt;">      
      <div class="styLNLeftNumBox" style="height:8mm;padding-top:5mm;">42</div>      
      <div class="styLNDesc" style="width: 139mm; height:8mm;padding-top:5mm;">        
            <span style="float:left;"><b>Cost of goods sold.</b> Subtract line 41 from line 40. Enter the result here and on line 4</span>
			<!--Dotted Line-->
			<span  class="styDotLn" style="float:right;padding-right:1mm;">......</span>              
      </div>
      <div class="styLNRightNumBox" style="height:8mm;padding-top:5mm;border-bottom-width: 0px;">      
        42
      </div>
      <div class="styLNAmountBox" style="height:8mm;padding-top:5mm;border-bottom-width: 0px;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/CostOfGoodsSoldAmt"/>
        </xsl:call-template>        
      </div>
    </div>
    <!-- BEGIN Part IV Title -->
	<!--Table-->
	<!-- Table expand/collapse toggle button -->
	<xsl:choose>
		<xsl:when test="($Print != $Separated)  and  (count($Form1040ScheduleCData/AdditionalVehicleInfoGrp) &gt; 5) ">
				 <div class="styBB" style="width:187mm;border-bottom-width: 1px;">  
						<div style="width:5mm;float:right;">
											<xsl:call-template name="SetDynamicTableToggleButton">
												<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/AdditionalVehicleInfoGrp"/>
												<xsl:with-param name="containerHeight" select="5"/>
											<xsl:with-param name="headerHeight" select="1"/>
												<xsl:with-param name="containerID" select=" 'AVInfo' "/>
											</xsl:call-template>	
						</div>	
			</div>
		</xsl:when>
		<xsl:when test="($Print != $Separated) and (count($Form1040ScheduleCData/AdditionalVehicleInfoGrp) &lt;= 5) ">
		</xsl:when>	
	</xsl:choose>
	<div class="styTableContainer" style="height:auto;" id="AVInfo">
	<xsl:call-template name="SetInitialState"/>
	<table class="styTable" cellspacing="0" style="font-size:7pt;height:auto;" summary="Additional Vehicle Information " name="AVtable" id="AVtable">
			<thead class="styTableThead">
			<tr>
		</tr>
		</thead>
		<tfoot/>
		<tbody>				  	
		<xsl:for-each select="$Form1040ScheduleCData/AdditionalVehicleInfoGrp">
		<xsl:if test="($Print != $Separated) or (count($Form1040ScheduleCData/AdditionalVehicleInfoGrp) &lt;= 1) ">
	  <!-- BEGIN Part IV Title -->
	  <tr>
		<td class="styBB" style="width:182mm;height:11mm;">
		<div style="width:182mm;height:11mm;">
			<span class="styPartName" style="height:4mm;width:13mm;margin-top:-0.2mm;">Part IV</span>
			<span style="width:169mm;font-weight:normal;padding-left:5mm;" class="styPartDesc">
				<b> Information on Your Vehicle.</b> Complete this part <b>only</b> if you are claiming car or truck expenses on line 9,<br/>
				 and are not required to file Form 4562	for this business. See the instructions for line 13 to find out if you must file Form 4562.
		  </span>                
		</div>		
		</td>
		</tr>
		<tr>				
	  <!--Line 43-->  
		<td style="width:182mm;">      
		  <div class="styLNLeftNumBox" style="height:8mm;padding-top:5mm;">43</div>      
		  <div class="styGenericDiv" style="width:120mm; height:8mm;padding-top:5mm;">          
			When did you place your vehicle in service for business purposes? (month, day, year)     
			<img src="{$ImagePath}/1040SchC_Bullet_Sm.gif" alt="Bullet Image"/> 
		  </div>
		  <div class="styLNAmountBox" style="height:auto;padding-top:5mm;width:31.5mm; border-bottom-width: 1px; border-left-width: 0px;text-align:left;">   
			<xsl:call-template name="PopulateMonthDayYear">
			  <xsl:with-param name="TargetNode" select="VehiclePlacedInServiceDt"/>
			</xsl:call-template>        
		  </div>
		</td>    
		</tr>
		<tr>			
		<!--Line 44-->
		 <td style="width:182mm;">    
			<div style="width:182mm;">      
		  <div class="styLNLeftNumBox" style="height:8mm;padding-top:5mm;">44</div>      
		  <div class="styLNDesc" style="width: 165mm; height:8mm;padding-top:5mm;padding-bottom:2mm;">        
		   Of the total number of miles you drove your vehicle during 2016, enter the number of miles you used your vehicle for:
		  </div>
		   </div>         
		  <div class="styLNLeftNumBox" style="height:8mm;padding-top:5mm;">
		  <span style="width: 3mm;"/>a</div>      
		   <div class="styLNDesc" style="width: 15mm; height:8.5mm;padding-top:6mm;">        
			Business 
		  </div>
		  <div class="styLNAmountBox" style="height:8mm;padding-top:5mm;width:30mm; border-bottom-width: 1px; border-left-width: 0px;">  
			<xsl:call-template name="PopulateAmount">
			  <xsl:with-param name="TargetNode" select="BusinessMilesCnt"/>
			</xsl:call-template>        
		  </div>
		  <div class="styLNLeftNumBox" style="height:8mm;padding-top:5mm;">
		  <span style="width: 3mm;"/>b</div>   
		   <div class="styLNDesc" style="width: 43mm;height:8.5mm;padding-top:6mm;">  Commuting (see instructions)         
		  </div>
		  <div class="styLNAmountBox" style="height:8mm;padding-top:5mm;width:30mm; border-bottom-width: 1px; border-left-width: 0px;">   
			<xsl:call-template name="PopulateAmount">
			  <xsl:with-param name="TargetNode" select="CommutingMilesCnt"/>
			</xsl:call-template>        
		  </div>
	  <div class="styLNLeftNumBox" style="height:8mm;padding-top:5mm;"><span style="width: 3mm;"/>c</div>   
		   <div class="styLNDesc" style="width: 10mm; height:8.5mm;padding-top:6mm;">Other        
		  </div>
		  <div class="styLNAmountBox" style="height:8mm;padding-top:5mm;width:30mm; border-bottom-width: 1px; border-left-width: 0px;">        
			<xsl:call-template name="PopulateAmount">
			  <xsl:with-param name="TargetNode" select="OtherMilesCnt"/>
			</xsl:call-template>        
		  </div>
		  </td>
		</tr>
		<tr>
	   <!--Line 45-->
	   <td style="width:182mm;">    
	   <div style="width:182mm;">      
		  <div class="styLNLeftNumBox" style="height:8mm;padding-top:5mm;">45</div>
		  <div class="styLNDesc" style="width:140mm;height:8mm;padding-top:5mm;">
				<span style="float:left;">Was your vehicle available for personal use during off-duty hours?</span>
				<!--Dotted Line-->
				<span  class="styDotLn" style="float:right;padding-right:1mm;">............</span>            
			  </div>
			  <div class=".styGenericDiv " style="width:28mm;height:8mm;padding-top:5mm;">
			   <span style="width: 0mm;"/>  
				<span>
					   <xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
							<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>AvailableForOffDutyHoursInd</xsl:with-param>
						</xsl:call-template>           
						<input type="checkbox" class="styCkbox" name="Checkbox">
						 <xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
							<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>AvailableForOffDutyHoursInd</xsl:with-param>
						  </xsl:call-template>
						</input> 
				</span>
			<label>
			  <xsl:call-template name="PopulateLabelYes">
				<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
				<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>AvailableForOffDutyHoursInd</xsl:with-param>
			  </xsl:call-template>
			 <span class="styBoldText"> Yes</span>
			</label>                    
				 <span style="width: 5mm;"/>
			 <input type="checkbox" class="styCkbox" name="Checkbox">
				<xsl:call-template name="PopulateNoCheckbox">
				<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
				<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>AvailableForOffDutyHoursInd</xsl:with-param>
			  </xsl:call-template>
			</input> 
			<label>
			   <xsl:call-template name="PopulateLabelNo">
				<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
				<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>AvailableForOffDutyHoursInd</xsl:with-param>
			  </xsl:call-template>
			  <span class="styBoldText"> No</span>
			</label>                        
		  </div>        
		</div>
		</td>
		</tr>
		<tr>		
		  <!--Line 46-->
		   <td style="width:182mm;">      
			<div style="width:182mm;">      
		  <div class="styLNLeftNumBox" style="height:4mm;height:8mm;padding-top:5mm;">46</div>
		  <div class="styLNDesc" style="width:140mm;height:8mm;padding-top:5mm;">
					 <span style="float:left;">Do you (or your spouse) have another vehicle available for personal use?</span>
					 <!--Dotted Line-->
					 <span  class="styDotLn" style="float:right;padding-right:1mm;">...........</span>            
				 </div>
				  <div class=".styGenericDiv " style="width:28mm;height:8mm;padding-top:5mm;">
			   <span style="width:0mm;"> </span> 
			   <span>
					<xsl:call-template name="PopulateSpan">
						<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>AnotherVehicleInd</xsl:with-param>
					</xsl:call-template>
					<input type="checkbox" class="styCkbox" name="Checkbox">
					 <xsl:call-template name="PopulateYesCheckbox">
						<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>AnotherVehicleInd</xsl:with-param>
					  </xsl:call-template>
					</input> 
				</span>
				<label>
				  <xsl:call-template name="PopulateLabelYes">
					<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>AnotherVehicleInd</xsl:with-param>
				  </xsl:call-template>
				  <span class="styBoldText"> Yes</span>
				</label>                    
				 <span style="width: 5mm;"/>
			 <input type="checkbox" class="styCkbox" name="Checkbox">
				<xsl:call-template name="PopulateNoCheckbox">
				<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
				<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>AnotherVehicleInd</xsl:with-param>
			  </xsl:call-template>
			</input> 
			<label>
			   <xsl:call-template name="PopulateLabelNo">
				<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
				<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>AnotherVehicleInd</xsl:with-param>
			  </xsl:call-template>
			   <span class="styBoldText"> No</span>
			</label>                        
		  </div>        
		</div>
		</td>
		</tr>
		<tr>
			 <td class="styBB" style="width:182mm;">      	
		   <!--Line 47a--> 
			<div class="styBB" style="width:182mm;">      
		    <div class="styLNLeftNumBox" style="height:8mm;padding-top:5mm;">47a</div>
		   <div class="styLNDesc" style="width:140mm;height:8mm;padding-top:5mm;">
				<span style="float:left;">Do you have evidence to support your deduction?</span>
				<!--Dotted Line-->
				<span  class="styDotLn" style="float:right;padding-right:1mm;">.................</span>   
				 </div>
					<div class=".styGenericDiv " style="width:28mm;height:8mm;padding-top:5mm;">
			       <span style="width:0mm;"> </span> 
					 <span>
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
							<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>EvidenceToSupportDeductionInd</xsl:with-param>
						</xsl:call-template>     
						<input type="checkbox" class="styCkbox" name="Checkbox">
						 <xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
							<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>EvidenceToSupportDeductionInd</xsl:with-param>
						  </xsl:call-template>
						</input> 		    
						<label>
						  <xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
							<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>EvidenceToSupportDeductionInd</xsl:with-param>
						  </xsl:call-template>
						   <span class="styBoldText"> Yes</span>
						</label>                    
							 <span style="width: 5mm;"/>
						 <input type="checkbox" class="styCkbox" name="Checkbox">
							<xsl:call-template name="PopulateNoCheckbox">
							<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
							<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>EvidenceToSupportDeductionInd</xsl:with-param>
						  </xsl:call-template>
						</input> 
						<label>
						   <xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
							<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>EvidenceToSupportDeductionInd</xsl:with-param>
						  </xsl:call-template>
						   <span class="styBoldText"> No</span>
						</label> 
					</span>                       
		  </div> 
		  <!--Line 47b-->     
			<div class="styBB" style="width:182mm;height:10mm;">  
		   <div class="styLNLeftNumBox" style="height:8mm;padding-top:5mm;">
			<span style="width:3.4mm;"/>b</div>
		  <div class="styLNDesc" style="width:170mm;height:8mm;padding-top:5mm;">
				<span style="float:left;">If "Yes," is the evidence written?</span>
				<!--Dotted Line-->
				<span  class="styDotLn" style="padding-left:3mm;padding-right:9mm;">......................</span>   
			    <span style="width:0mm;float:right;"> </span>
				<span>   
						<xsl:call-template name="PopulateSpan">
							  <xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
							  <xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>EvidenceWrittenInd</xsl:with-param>
						</xsl:call-template>
					<input type="checkbox" class="styCkbox" name="Checkbox">
					 <xsl:call-template name="PopulateYesCheckbox">
						<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>EvidenceWrittenInd</xsl:with-param>
					  </xsl:call-template>
					</input> 			
					<label>
					  <xsl:call-template name="PopulateLabelYes">
						<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>EvidenceWrittenInd</xsl:with-param>
					  </xsl:call-template>
					   <span class="styBoldText"> Yes</span>
					</label>                    
						 <span style="width: 5mm;"/>
					 <input type="checkbox" class="styCkbox" name="Checkbox">
						<xsl:call-template name="PopulateNoCheckbox">
						<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>EvidenceWrittenInd</xsl:with-param>
					  </xsl:call-template>
					</input> 
					<label>
					   <xsl:call-template name="PopulateLabelNo">
						<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>EvidenceWrittenInd</xsl:with-param>
					  </xsl:call-template>
					   <span class="styBoldText"> No</span>			   
					</label>
			</span>                        
		  </div>        
		</div>
		</div>
		</td>
		</tr>
		</xsl:if> 
			</xsl:for-each>
		<!--Blank table-->
	    <xsl:if test="count($Form1040ScheduleCData/AdditionalVehicleInfoGrp)&lt; 1 or ((count($Form1040ScheduleCData/AdditionalVehicleInfoGrp) &gt;1) and ($Print = $Separated))">
		<!-- BEGIN Part IV Title -->
	  <tr>
		<td class="styTableCellText" style="width:187mm;height:auto;border-right-width: 0px;border-color: black;padding-top:0mm;">
		  <div class="styPartName" style="width:13mm;height:auto;">Part IV</div>
		  <div class="styPartDesc"  style="height:auto;">
			  Information on Your Vehicle. <span style="font-weight:normal;">Complete this part <b>only</b> if you are claiming car or truck expenses on line 9
			  and are not required to file Form 4562 for this business. See the instructions for line 13 to find out if you must
			  file Form 4562.</span>
		  </div>
		</td>
		</tr>
		<tr>				
	  <!--Line 43-->  
		<td class="styTableCellText" style="width:187mm;height:3mm;border-right-width: 0px;border-color: black;padding_top:0mm;border-bottom-width: 0px; ">      
		  <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">43</div>      
		  <div class="styGenericDiv" style="width:120mm; height:4mm;padding-top:1mm;">          
			When did you place your vehicle in service for business purposes? (month, day, year)     
			<img src="{$ImagePath}/1040SchC_Bullet_Sm.gif" alt="Bullet Image"/> 
		  </div>
		  <div class="styLNAmountBox" style="height:4mm;width:37.5mm; border-bottom-width: 1px; border-left-width: 0px;text-align:left;">        
			<xsl:call-template name="PopulateAdditionalDataTableMessage">
			  <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/AdditionalVehicleInfoGrp"/>
			</xsl:call-template>        
		  </div>
		</td>    
		</tr>
		<tr>			
		<!--Line 44-->
		<td class="styTableCellText" style="width:187mm;height:auto;border-right-width: 0px;border-color: black;padding_top:0mm;border-bottom-width: 0px; ">      
		  <span style="width:182mm;">      
			  <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">44</div>      
			  <div class="styLNDesc" style="width: 165mm; height:4mm;padding-top:1mm;">        
				Of the total number of miles you drove your vehicle during 2016, enter the number of miles you used your vehicle for:
			  </div>
			   </span>         
			  <div class="styLNLeftNumBox" style="height:4mm;">
			  <span style="width: 3mm;"/>a</div>      
			   <div class="styLNDesc" style="width: 15mm; height:5mm;">        
				Business 
			  </div>
			  <div class="styLNAmountBox" style="height:4mm;width:30mm; border-bottom-width: 1px; border-left-width: 0px;">        
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="BusinessMilesCnt"/>
				</xsl:call-template>        
			  </div>
			  <div class="styLNLeftNumBox" style="height:4mm;">
			  <span style="width: 3mm;"/>b</div>   
			   <div class="styLNDesc" style="width: 43mm; height:5mm;">  Commuting (see instructions)         
			  </div>
			  <div class="styLNAmountBox" style="height:4mm;width:30mm; border-bottom-width: 1px; border-left-width: 0px;">        
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="CommutingMilesCnt"/>
				</xsl:call-template>        
			  </div>
		  <div class="styLNLeftNumBox" style="height:4mm;"><span style="width: 3mm;"/>c</div>   
			   <div class="styLNDesc" style="width: 10mm; height:5mm;">Other        
			  </div>
			  <div class="styLNAmountBox" style="height:4mm;width:30mm; border-bottom-width: 1px; border-left-width: 0px;">        
				<xsl:call-template name="PopulateAmount">
				  <xsl:with-param name="TargetNode" select="OtherMilesCnt"/>
				</xsl:call-template>        
			  </div>
			  </td>
			  </tr>
			  <tr>
		   <!--Line 45-->
		   <td class="styTableCellText" style="width:187mm;height:auto;border-right-width: 0px;border-color: black;padding_top:0mm;border-bottom-width: 0px; ">      
		   <span style="width:182mm;">      
			  <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">45</div>
			  <div class="styLNDesc" style="width:140mm;padding-top:1mm;">
					<span style="float:left;">Was your vehicle available for personal use during off-duty hours?</span>
					<!--Dotted Line-->
					<span  class="styDotLn" style="float:right;padding-right:1mm;">.........</span>       
				  </div>
				  <div class=".styGenericDiv " style="width:28mm;">
				   <span style="width: 0mm;"/>   
				<span>      
					<xsl:call-template name="PopulateSpan">
						<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCAvailableForOffDutyHoursInd</xsl:with-param>
					</xsl:call-template>
					<input type="checkbox" class="styCkbox" name="Checkbox">
					 <xsl:call-template name="PopulateYesCheckbox">
						<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCAvailableForOffDutyHoursInd</xsl:with-param>
					  </xsl:call-template>
					</input> 
				</span>
				<label>
				  <xsl:call-template name="PopulateLabelYes">
					<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCAvailableForOffDutyHoursInd</xsl:with-param>
				  </xsl:call-template>
				 <span class="styBoldText"> Yes</span>
				</label>                    
					 <span style="width: 5mm;"/>
				 <input type="checkbox" class="styCkbox" name="Checkbox">
					<xsl:call-template name="PopulateNoCheckbox">
					<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCAvailableForOffDutyHoursInd</xsl:with-param>
				  </xsl:call-template>
				</input> 
				<label>
				   <xsl:call-template name="PopulateLabelNo">
					<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCAvailableForOffDutyHoursInd</xsl:with-param>
				  </xsl:call-template>
				  <span class="styBoldText"> No</span>
				</label>                        
			  </div>        
		</span>
		</td>
		</tr>
		<tr>		
		  <!--Line 46-->
		   <td class="styTableCellText" style="width:187mm;height:auto;border-right-width: 0px;border-color: black;padding-top:0mm;border-bottom-width: 0px; ">        
			<span style="width:182mm;">      
		  <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">46</div>
		  <div class="styLNDesc" style="width:140mm;padding-top:1mm;">
				<span style="float:left;">Do you (or your spouse) have another vehicle available for personal use?</span>
				<!--Dotted Line-->
				<span  class="styDotLn" style="float:right;padding-right:1mm;">........</span>    
				 </div>
				  <div class=".styGenericDiv " style="width:28mm;">
			   <span style="width:0mm;"> </span> 
			   <span>
					<xsl:call-template name="PopulateSpan">
						<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCAnotherVehicleInd</xsl:with-param>
					</xsl:call-template>
					<input type="checkbox" class="styCkbox" name="Checkbox">
					 <xsl:call-template name="PopulateYesCheckbox">
						<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCAnotherVehicleInd</xsl:with-param>
					  </xsl:call-template>
					</input> 
			   </span>
			<label>
			  <xsl:call-template name="PopulateLabelYes">
				<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
				<xsl:with-param name="BackupName">IRS1040ScheduleCAnotherVehicleInd</xsl:with-param>
			  </xsl:call-template>
			  <span class="styBoldText"> Yes</span>
			</label>                    
				 <span style="width: 5mm;"/>
			 <input type="checkbox" class="styCkbox" name="Checkbox">
				<xsl:call-template name="PopulateNoCheckbox">
				<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
				<xsl:with-param name="BackupName">IRS1040ScheduleCAnotherVehicleInd</xsl:with-param>
			  </xsl:call-template>
			</input> 
			<label>
			   <xsl:call-template name="PopulateLabelNo">
				<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
				<xsl:with-param name="BackupName">IRS1040ScheduleCAnotherVehicleInd</xsl:with-param>
			  </xsl:call-template>
			   <span class="styBoldText"> No</span>
			</label>                        
		  </div>        
		</span>
		</td>
		</tr>
		<tr>
			<td class="styTableCellText" style="width:187mm;height:auto;border-right-width: 0px;border-color: black;padding_top:0mm;border-bottom-width: 0px; ">      
		   <!--Line 47a--> 
		   <span style="width:182mm;height:auto;">      
			  <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">47a</div>
			  <div class="styLNDesc" style="width:140mm;padding-top:1mm;">
					<span style="float:left;">Do you have evidence to support your deduction?</span>
					<!--Dotted Line-->
					<span  class="styDotLn" style="float:right;padding-right:1mm;">................</span>    
					 </div>
						<div class=".styGenericDiv " style="width:28mm;">
						   <span style="width:0mm;"> </span>     
						   <span>		
								<xsl:call-template name="PopulateSpan">
									<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceToSupportDeductionInd</xsl:with-param>
								</xsl:call-template>					  
								<input type="checkbox" class="styCkbox" name="Checkbox">
								 <xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceToSupportDeductionInd</xsl:with-param>
								  </xsl:call-template>
								</input> 				  
								<label>
								  <xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceToSupportDeductionInd</xsl:with-param>
								  </xsl:call-template>
								   <span class="styBoldText"> Yes</span>
								</label>                    
									 <span style="width: 5mm;"/>
								 <input type="checkbox" class="styCkbox" name="Checkbox">
									<xsl:call-template name="PopulateNoCheckbox">
									<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceToSupportDeductionInd</xsl:with-param>
								  </xsl:call-template>
								</input> 
								<label>
								   <xsl:call-template name="PopulateLabelNo">
									<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
									<xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceToSupportDeductionInd</xsl:with-param>
								  </xsl:call-template>
								   <span class="styBoldText"> No</span>
								</label>
						</span>                        
			  </div> 
			  <!--Line 47b-->     
			  <div class="styBB" style="width:187mm;height:auto;">  
			   <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;">
				<span style="width:3.4mm;"/>b</div>
					<div class="styLNDesc" style="width:140mm;padding-top:1mm;">
						<span style="float:left;">If "Yes," is the evidence written?</span>
						<!--Dotted Line-->
						<span  class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>    
					</div>
					<div class=".styGenericDiv " style="width:25mm;">
				   <span style="width:0mm;"> </span>
					<span>
						<xsl:call-template name="PopulateSpan">
							<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
							<xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceWrittenInd</xsl:with-param>
						</xsl:call-template>
						<input type="checkbox" class="styCkbox" name="Checkbox">
						 <xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
							<xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceWrittenInd</xsl:with-param>
						  </xsl:call-template>
						</input>		
						<label>
						  <xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
							<xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceWrittenInd</xsl:with-param>
						  </xsl:call-template>
						   <span class="styBoldText"> Yes</span>
						</label>                    
							 <span style="width: 5mm;"/>
						 <input type="checkbox" class="styCkbox" name="Checkbox">
							<xsl:call-template name="PopulateNoCheckbox">
							<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
							<xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceWrittenInd</xsl:with-param>
						  </xsl:call-template>
						</input> 
						<label>
						   <xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
							<xsl:with-param name="BackupName">IRS1040ScheduleCEvidenceWrittenInd</xsl:with-param>
						  </xsl:call-template>
						   <span class="styBoldText"> No</span>
						</label>
					</span>                        
		  </div>        
		</div>
		</span>
		</td>
		</tr>	 
		   </xsl:if> 
			</tbody>
		</table>
	</div>
	<xsl:call-template name="SetInitialDynamicTableHeight">
		<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/AdditionalVehicleInfoGrp"/>
			<xsl:with-param name="containerHeight" select="6"/>
			<xsl:with-param name="headerHeight" select="1"/>
		<xsl:with-param name="containerID" select=" 'AVInfo' "/>
	</xsl:call-template>		

	 <!-- END Part IV Title -->		
	 	
    <!-- BEGIN Part V Title -->
	<div style="height:auto;">	  
		<div class="styBB" style="width:187mm;height:auto;">
			<div class="styPartName" style="width:12mm;height:auto;">Part V</div>
			<div class="styPartDesc" style="width:169mm;height:4mm;"><b>Other Expenses. </b>
			<span class="styNormalText"> List below business expenses not included on lines 8-26 or line 30.
			</span> 
		</div>	
		<!--Table-->
		<!-- Table expand/collapse toggle button -->
		<div style="width:5mm;float:right;">
			<xsl:call-template name="SetDynamicTableToggleButton">
				<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherExpenseDetail"/>
					<xsl:with-param name="containerHeight" select="9"/>
					<xsl:with-param name="headerHeight" select="1"/>
					<xsl:with-param name="containerID" select=" 'OtherExpenseDetail' "/>
				</xsl:call-template>	
			</div>		
		</div>	
		<!--Part V table Header -->
	    <div class="styTableContainer" style="height:auto;" id="OtherExpenseDetail">
			<xsl:call-template name="SetInitialState"/>
			<table class="styTable" cellspacing="0" style="font-size:7pt;" summary="Table displaying Other Expenses information " name="OEtable" id="OEtable">
					<thead class="styTableThead">
					<tr>
					</tr>
					</thead>
					<tfoot/>
					<tbody>
					<!-- print logic -->
					<xsl:for-each select="$Form1040ScheduleCData/OtherExpenseDetail">					
							<xsl:if test="($Print != $Separated) or (count($Form1040ScheduleCData/OtherExpenseDetail) &lt;8) ">
								<tr>
									<td class="styTableCellText" style="width:155.3mm;border-bottom:1px dashed black;">
										<!--Description-->
										<xsl:if test="$Form1040ScheduleCData/OtherExpenseDetail/Desc"> 
											<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="Desc"/>
											</xsl:call-template>
											<span style="width:9mm;"/>
											 <xsl:call-template name="SetFormLinkInline">
										 <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherExpenseDetail"/>
											 </xsl:call-template>  
											</xsl:if>
										   <span style="width:1mm;"/>
									</td>
									<td class="styTableCell" style="border-right-width: 0px;border-bottom:1px solid black;width:31.5mm;">
									<!--Expenses-->
										<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Amt"/>
										</xsl:call-template>																								
									</td>
								</tr>
								</xsl:if>
								<xsl:if test="($Print != $Separated) and (count($Form1040ScheduleCData/OtherExpenseDetail) =9) and (position()=9)">
								<tr>
									<td class="styTableCellText" style="width:155.3mm;border-bottom:0px dashed black;">
										<!--Description-->
										<xsl:if test="$Form1040ScheduleCData/OtherExpenseDetail/Desc"> 
											<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="Desc"/>
											</xsl:call-template>
											<span style="width:9mm;"/>
											 <xsl:call-template name="SetFormLinkInline">
										 <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherExpenseDetail"/>
											 </xsl:call-template>  
											</xsl:if>
										   <span style="width:1mm;"/>
									</td>
									<td class="styTableCell" style="border-right-width: 0px;border-bottom:0px solid black;width:31.5mm;">
									    <!--Expenses-->
										<xsl:call-template name="PopulateAmount">
												<xsl:with-param name="TargetNode" select="Amt"/>
										</xsl:call-template>																								
									</td>
								</tr>
							</xsl:if>							
						</xsl:for-each>
						<xsl:if test="count($Form1040ScheduleCData/OtherExpenseDetail)&lt; 1 or ((count($Form1040ScheduleCData/OtherExpenseDetail) &gt; 8) and ($Print = $Separated))">
							<tr>
								<td class="styTableCell" style="width:155.3mm;text-align:left;border-bottom:1px dashed black;">
									<span class="styBoldText"> </span>
										<xsl:call-template name="PopulateAdditionalDataTableMessage">
											<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherExpenseDetail"/>
										</xsl:call-template>
									<span class="styTableCellPad"/>
								</td>											
								<td class="styTableCellText" style="width:31.5mm; border-right-width: 0px;border-bottom:1px solid black;">
									<span class="styTableCellPad"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="count($Form1040ScheduleCData/OtherExpenseDetail)&lt; 2 or ((count($Form1040ScheduleCData/OtherExpenseDetail) &gt; 8) and ($Print = $Separated))">
							<tr>
								<td class="styTableCell" style="width:155.3mm;text-align:left;border-bottom:1px dashed black;">
									<span class="styBoldText"> </span>
									<span class="styTableCellPad"/>
								</td>											
								<td class="styTableCellText" style="width:31.5mm; border-right-width: 0px;border-bottom:1px solid black;">
									<span class="styTableCellPad"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="count($Form1040ScheduleCData/OtherExpenseDetail)&lt; 3 or ((count($Form1040ScheduleCData/OtherExpenseDetail) &gt; 8) and ($Print = $Separated))">
							<tr>
								<td class="styTableCell" style="width:155.3mm;text-align:left;border-bottom:1px dashed black;">
									<span class="styBoldText"> </span>
									<span class="styTableCellPad"/>
								</td>											
								<td class="styTableCellText" style="width:31.5mm; border-right-width: 0px;border-bottom:1px solid black;">
									<span class="styTableCellPad"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="count($Form1040ScheduleCData/OtherExpenseDetail)&lt; 4 or ((count($Form1040ScheduleCData/OtherExpenseDetail) &gt; 8) and ($Print = $Separated))">
							<tr>
								<td class="styTableCell" style="width:155.3mm;text-align:left;border-bottom:1px dashed black;">
									<span class="styBoldText"> </span>
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellText" style="width:31.5mm; border-right-width: 0px;border-bottom:1px solid black;">
									<span class="styTableCellPad"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="count($Form1040ScheduleCData/OtherExpenseDetail)&lt; 5 or ((count($Form1040ScheduleCData/OtherExpenseDetail) &gt; 8) and ($Print = $Separated))">
							<tr>
								<td class="styTableCell" style="width:155.3mm;text-align:left;border-bottom:1px dashed black;">
									<span class="styBoldText"> </span>
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellText" style="width:31.5mm; border-right-width: 0px;border-bottom:1px solid black;">
									<span class="styTableCellPad"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="count($Form1040ScheduleCData/OtherExpenseDetail)&lt; 6 or ((count($Form1040ScheduleCData/OtherExpenseDetail) &gt; 8) and ($Print = $Separated))">
							<tr>
								<td class="styTableCell" style="width:155.3mm;text-align:left;border-bottom:1px dashed black;">
									<span class="styBoldText"> </span>
									<span class="styTableCellPad"/>
								</td>											
								<td class="styTableCellText" style="width:31.5mm; border-right-width: 0px;border-bottom:1px solid black;">
									<span class="styTableCellPad"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="count($Form1040ScheduleCData/OtherExpenseDetail)&lt; 7 or ((count($Form1040ScheduleCData/OtherExpenseDetail) &gt; 8) and ($Print = $Separated))">
							<tr>
								<td class="styTableCell" style="width:155.3mm;text-align:left;border-bottom:1px dashed black;">
									<span class="styBoldText"> </span>
									<span class="styTableCellPad"/>
								</td>											
								<td class="styTableCellText" style="width:31.5mm; border-right-width: 0px;border-bottom:1px solid black;">
									<span class="styTableCellPad"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="count($Form1040ScheduleCData/OtherExpenseDetail)&lt; 8 or ((count($Form1040ScheduleCData/OtherExpenseDetail) &gt;8) and ($Print = $Separated))">
							<tr>
								<td class="styTableCell" style="width:155.3mm;text-align:left;border-bottom:1px dashed black;">
									<span class="styBoldText"> </span>
									<span class="styTableCellPad"/>
								</td>											
								<td class="styTableCellText" style="width:31.5mm; border-right-width: 0px;border-bottom:1px solid black;">
									<span class="styTableCellPad"/>
								</td>
							</tr>
						</xsl:if>
						<xsl:if test="count($Form1040ScheduleCData/OtherExpenseDetail)&lt; 9 or ((count($Form1040ScheduleCData/OtherExpenseDetail) &gt; 8) and ($Print = $Separated))">
							<tr style="height:auto;border-bottom:0px;">
								<td class="styTableCell" style="width:155.3mm;text-align:left;border-right:0px;border-bottom:0px;">
									<span class="styBoldText"> </span>
									<span class="styTableCellPad"/>
								</td>
								<td class="styTableCellText" style="width:31.5mm; border-right-width: 0px;border-bottom:0px;">
									<span class="styTableCellPad"/>
								</td>
							</tr>
						</xsl:if>
					</tbody>
				</table>
				<xsl:call-template name="SetInitialDynamicTableHeight">
					<xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherExpenseDetail"/>
					<xsl:with-param name="containerHeight" select="9"/>
					<xsl:with-param name="headerHeight" select="1"/>
					<xsl:with-param name="containerID" select=" 'OtherExpenseDetail' "/>
				</xsl:call-template>
		    </div>
		</div>
  <!-- End Part V Table-->
  <!--Line 48-->
      <div class="styBB" style="width:187mm;border-bottom-width: 1px;">      
      <div class="styLNLeftNumBox" style="height:4mm;">48</div>      
      <div class="styLNDesc" style="width: 139mm; height:4mm;">        
            <span style="float:left;"><b>Total other expenses.</b> Enter here and on line 27a
                <xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="Desc">Part V, Line 48 - Other Expenses</xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/TotalOtherExpensesAmt/@otherExpenseCd"/>
                </xsl:call-template>
            </span>
			<!--Dotted Line-->
			<span  class="styDotLn" style="float:right;padding-right:1mm;">................</span>               
      </div>
      <div class="styLNRightNumBox" style="height:4.5mm;border-bottom:0px;">      
        48
      </div>
      <div class="styLNAmountBox" style="height:4.5mm;border-bottom:0px;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/TotalOtherExpensesAmt"/>
        </xsl:call-template>        
      </div>
    </div>    
     <!--Footer -->
    <div style="width:187mm;clear:all;">    
      <div class="stySmallText" style="width:141mm;text-align:center;padding-top:1mm;">
      <span style="width:156px"/></div>
      <div class="stySmallText" style="width:46mm;text-align:right;"><span class="styBoldText" style="font-weight:bold;">Schedule C (Form 1040) 2016</span> </div>
    </div>
    <!--    </div> -->      
    <p class="pageEnd"  style="page-break-after:always;display:block;"/>
    <!-- BEGIN Left Over Table -->  
    <!-- Additonal Data Title Bar and Button -->
    <div class="styLeftOverTitleLine" id="LeftoverData">
          <div class="styLeftOverTitle">
            Additional Data        
          </div>
          <div class="styLeftOverButtonContainer">
            <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
          </div>      
    </div>
    <!-- Additional Data Table -->
        <table class="styLeftOverTbl">
          <xsl:call-template name="PopulateCommonLeftover">
            <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData"/>
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>     
        <xsl:call-template name="PopulateLeftoverRow">
        <xsl:with-param name="Desc">Part II, Line 31 - Passive Activity Loss Literal
        </xsl:with-param>
        <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/NetProfitOrLossAmt/@passiveActivityLossLiteralCd"/>
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>
      <xsl:call-template name="PopulateLeftoverRow">
        <xsl:with-param name="Desc">Part II, Line 31 - Passive Activity Loss Amount
        </xsl:with-param>
        <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/NetProfitOrLossAmt/@passiveActivityLossAmt"/>
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>
       <xsl:call-template name="PopulateLeftoverRow">
        <xsl:with-param name="Desc">Part V, Line 48 - Other Expenses
        </xsl:with-param>
        <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/TotalOtherExpensesAmt/@otherExpenseCd"/>
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>
        </table>
      <!-- END Left Over Table -->
      <p class="pageEnd"  style="page-break-after:always;display:block;"/> 
      <!-- Begin separated repeating data table Part IV-->
  <xsl:if test="($Print = $Separated) and (count($Form1040ScheduleCData/AdditionalVehicleInfoGrp) &gt; 1)">
      <span class="styRepeatingDataTitle">Form 1040 Schedule C, Part IV, Information on Your Vehicle:</span>
   <table class="styDepTbl" cellspacing="0" style="font-size:7pt;" summary="Additional Vehicle Information " name="AVtable" id="AVtable">	
	<thead class="styTableThead">
		<tr class="styDepTblHdr">
		 <th scope="col" class="styDepTblCell" style="width:187mm; vertical-align:top">
      <div class="styPartName" style="width:13mm;">Part IV  </div> 
      <div style="width:174mm;float:left;text-align:left;padding-left:1mm;">						
		 <b>Information on Your Vehicle. </b><span class="styNormalText" style="font-size:8pt;">Complete this part <b>only</b> if you are claiming car or truck expenses on line 9,
	   and are not required to file Form 4562 for this business. See the instructions for line 13 to find 
		out if you must file Form 4562.</span> 
    </div>   
    </th>
	</tr>
	</thead>
	  <tfoot/>
	<tbody>				  	
    <xsl:for-each select="$Form1040ScheduleCData/AdditionalVehicleInfoGrp">
  <!-- BEGIN Part IV Title -->
  <tr>			
		<xsl:attribute name="class">
						<xsl:choose>
						<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
						<xsl:otherwise>styDepTblRow2</xsl:otherwise>
						</xsl:choose>
						</xsl:attribute>
  <!--Line 43-->  
    <td class="styDepTblCell" style="height:5mm;vertical-align:top">      
    <div style="width:187mm;float:left;clear:none">
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;text-align:left">43</div>      
      <div class="styLNDesc" style="width:145mm; height:4mm;padding-top:1mm;text-align:left">          
        When did you place your vehicle in service for business purposes? (month, day, year)     
        <img src="{$ImagePath}/1040SchC_Bullet_Sm.gif" alt="Bullet Image"/> 
      </div>
      <div class="styLNAmountBox" style="height:4mm;width:31.5mm; border-bottom-width: 1px; border-left-width: 0px;">        
        <xsl:call-template name="PopulateMonthDayYear">
          <xsl:with-param name="TargetNode" select="VehiclePlacedInServiceDt"/>
        </xsl:call-template>        
      </div>
      <br/>    
      </div>
    </td>   
      </tr>	
        <tr>	
        <xsl:attribute name="class">
						<xsl:choose>
						<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
						<xsl:otherwise>styDepTblRow2</xsl:otherwise>
						</xsl:choose>
						</xsl:attribute>
    <!--Line 44-->
        <td class="styDepTblCell">   
              <div style="width:187mm;float:left;clear:none">
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;text-align:left">44</div>      
      <div class="styLNDesc" style="width: 155mm; height:4.5mm;padding-top:1mm;text-align:left">        
        Of the total number of miles you drove your vehicle during 2016, enter the number of miles you used your vehicle for:
      </div>      
        </div>
            <div style="width:187mm">
      <div class="styLNLeftNumBox" style="height:4mm;text-align:left">
      <span style="width: 3mm;"/>a</div>      
       <div class="styLNDesc" style="width: 15mm; height:4mm;">        
        Business 
      </div>
      <div class="styLNAmountBox" style="height:4mm;width:30mm; border-bottom-width: 1px; border-left-width: 0px;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="BusinessMilesCnt"/>
        </xsl:call-template>        
      </div>
      <div class="styLNLeftNumBox" style="height:4mm;">
      <span style="width: 3mm;"/>b</div>   
       <div class="styLNDesc" style="width: 43mm; height:4mm;">  Commuting (see instructions)         
      </div>
      <div class="styLNAmountBox" style="height:4mm;width:30mm; border-bottom-width: 1px; border-left-width: 0px;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="CommutingMilesCnt"/>
        </xsl:call-template>        
      </div>
  <div class="styLNLeftNumBox" style="height:4mm;"><span style="width: 3mm;"/>c</div>   
       <div class="styLNDesc" style="width: 10mm; height:4mm;">Other        
      </div>
      <div class="styLNAmountBox" style="height:4mm;width:30mm; border-bottom-width: 1px; border-left-width: 0px;">        
        <xsl:call-template name="PopulateAmount">
          <xsl:with-param name="TargetNode" select="OtherMilesCnt"/>
        </xsl:call-template>        
      </div>
       <br/>    
           </div>
       </td>     
       </tr>
       <tr>					
	 <xsl:attribute name="class">
						<xsl:choose>
						<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
						<xsl:otherwise>styDepTblRow2</xsl:otherwise>
						</xsl:choose>
						</xsl:attribute>						
   <!--Line 45-->
   <td class="styDepTblCell">      
    <div style="width:187mm;float:left;clear:none">
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;text-align:left">45</div>
      <div class="styLNDesc" style="width:140mm;padding-top:1mm;text-align:left">
            <span style="float:left;">Was your vehicle available for personal use during off-duty hours?</span>
			<!--Dotted Line-->
			<span  class="styDotLn" style="float:right;padding-right:1mm;">............</span>       
      </div>
     <div class="styLNDesc" style="width:28mm;">
           <span style="width: 0mm;"/>   
           <span >
			   <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>AvailableForOffDutyHoursInd</xsl:with-param>
				</xsl:call-template>    
				<input type="checkbox" class="styCkbox" name="Checkbox">
				 <xsl:call-template name="PopulateYesCheckbox">
					<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>AvailableForOffDutyHoursInd</xsl:with-param>
				  </xsl:call-template>
				</input> 			
				<label>
				  <xsl:call-template name="PopulateLabelYes">
					<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>AvailableForOffDutyHoursInd</xsl:with-param>
				  </xsl:call-template>
				 <span class="styBoldText"> Yes</span>
				</label>                    
					 <span style="width: 5mm;"/>
				 <input type="checkbox" class="styCkbox" name="Checkbox">
					<xsl:call-template name="PopulateNoCheckbox">
					<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>AvailableForOffDutyHoursInd</xsl:with-param>
				  </xsl:call-template>
				</input> 
				<label>
				   <xsl:call-template name="PopulateLabelNo">
					<xsl:with-param name="TargetNode" select="VehicleAvailableOffDutyHrsInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>AvailableForOffDutyHoursInd</xsl:with-param>
				  </xsl:call-template>
				  <span class="styBoldText"> No</span>
				</label> 
        </span>                       
      </div>  
       <br/>    
            </div>     
    </td>
    </tr>
    
 <tr>					
	 <xsl:attribute name="class">
						<xsl:choose>
						<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
						<xsl:otherwise>styDepTblRow2</xsl:otherwise>
						</xsl:choose>
						</xsl:attribute>				
      <!--Line 46-->
        <td class="styDepTblCell" style="width:187mm;">      
          <div style="width:187mm;float:left;clear:none">
      <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;text-align:left">46</div>
      <div class="styLNDesc" style="width:140mm;padding-top:1mm;text-align:left">
            <span style="float:left;">Do you (or your spouse) have another vehicle available for personal use?</span>
			<!--Dotted Line-->
			<span  class="styDotLn" style="float:right;padding-right:1mm;">..........</span>    
             </div>
              <div class="styLNDesc" style="width:28mm;text-align:left">
           <span style="width:0mm;"> </span>   
           <span>
			   <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>AnotherVehicleInd</xsl:with-param>
				</xsl:call-template>
				<input type="checkbox" class="styCkbox" name="Checkbox">
				 <xsl:call-template name="PopulateYesCheckbox">
					<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>AnotherVehicleInd</xsl:with-param>
				  </xsl:call-template>
				</input>         
				<label>
				  <xsl:call-template name="PopulateLabelYes">
					<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>AnotherVehicleInd</xsl:with-param>
				  </xsl:call-template>
				  <span class="styBoldText"> Yes</span>
				</label>                    
					 <span style="width: 5mm;"/>
				 <input type="checkbox" class="styCkbox" name="Checkbox">
					<xsl:call-template name="PopulateNoCheckbox">
					<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>AnotherVehicleInd</xsl:with-param>
				  </xsl:call-template>
				</input> 
				<label>
				   <xsl:call-template name="PopulateLabelNo">
					<xsl:with-param name="TargetNode" select="AnotherVehicleForPrsnlUseInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>AnotherVehicleInd</xsl:with-param>
				  </xsl:call-template>
				   <span class="styBoldText"> No</span>
				</label> 
        </span>                       
      </div>    
 <br/>    
      </div>          
    </td>
    </tr>	
<tr>					
	 <xsl:attribute name="class">
						<xsl:choose>
						<xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
						<xsl:otherwise>styDepTblRow2</xsl:otherwise>
						</xsl:choose>
						</xsl:attribute>		
       <!--Line 47a--> 
      <td class="styDepTblCell" style="width:187mm;">      
		  <div style="width:187mm;float:left;clear:none">      
		  <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;text-align:left">47a</div>
		  <div class="styLNDesc" style="width:140mm;padding-top:1mm;text-align:left">
            <span style="float:left;">Do you have evidence to support your deduction?</span>
			<!--Dotted Line-->
			<span  class="styDotLn" style="float:right;padding-right:1mm;">..................</span>   
          </div>
          <div class="styLNDesc" style="width:28mm;text-align:left">
           <span style="width:0mm;"> </span>      
			   <span>
					<xsl:call-template name="PopulateSpan">
						<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>EvidenceToSupportDeductionInd</xsl:with-param>
				  </xsl:call-template>
					<input type="checkbox" class="styCkbox" name="Checkbox">
					 <xsl:call-template name="PopulateYesCheckbox">
						<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>EvidenceToSupportDeductionInd</xsl:with-param>
					  </xsl:call-template>
					</input>        
					<label>
					  <xsl:call-template name="PopulateLabelYes">
						<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>EvidenceToSupportDeductionInd</xsl:with-param>
					  </xsl:call-template>
					   <span class="styBoldText"> Yes</span>
					</label>                    
						 <span style="width: 5mm;"/>
					 <input type="checkbox" class="styCkbox" name="Checkbox">
						<xsl:call-template name="PopulateNoCheckbox">
						<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>EvidenceToSupportDeductionInd</xsl:with-param>
					  </xsl:call-template>
					</input> 
					<label>
					   <xsl:call-template name="PopulateLabelNo">
						<xsl:with-param name="TargetNode" select="EvidenceToSupportDeductionInd"/>
						<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>EvidenceToSupportDeductionInd</xsl:with-param>
					  </xsl:call-template>
					   <span class="styBoldText"> No</span>
					</label>   
			 </span>                           
      </div> 
      <!--Line 47b-->     
      <div style="width:187mm;float:left;clear:none;">  
       <div class="styLNLeftNumBox" style="height:4mm;padding-top:1mm;text-align:left">
        <span style="width:3.4mm;"/>b</div>
      <div class="styLNDesc" style="width:140mm;padding-top:1mm;text-align:left">
            <span style="float:left;">If "Yes," is the evidence written?</span>
			<!--Dotted Line-->
			<span  class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>   
              </div>
                <div class="styLNDesc" style="width:25mm;text-align:left">
           <span style="width:0mm;"> </span> 
           <span>
			   <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>EvidenceWrittenInd</xsl:with-param>
				</xsl:call-template>    
				<input type="checkbox" class="styCkbox" name="Checkbox">
				 <xsl:call-template name="PopulateYesCheckbox">
					<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>EvidenceWrittenInd</xsl:with-param>
				  </xsl:call-template>
				</input> 			
				<label>
				  <xsl:call-template name="PopulateLabelYes">
					<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>EvidenceWrittenInd</xsl:with-param>
				  </xsl:call-template>
				   <span class="styBoldText"> Yes</span>
				</label>                    
					 <span style="width: 5mm;"/>
				 <input type="checkbox" class="styCkbox" name="Checkbox">
					<xsl:call-template name="PopulateNoCheckbox">
					<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>EvidenceWrittenInd</xsl:with-param>
				  </xsl:call-template>
				</input> 
				<label>
				   <xsl:call-template name="PopulateLabelNo">
					<xsl:with-param name="TargetNode" select="EvidenceWrittenInd"/>
					<xsl:with-param name="BackupName">IRS1040ScheduleCAVI<xsl:number value="position()"/>EvidenceWrittenInd</xsl:with-param>
				  </xsl:call-template>
				   <span class="styBoldText"> No</span>
				</label> 
        </span>                       
      </div>        
    </div>
    <br/>    
      </div> 
    </td>   
    </tr>
    	</xsl:for-each>
    	</tbody>
	</table>
	 </xsl:if>
	 <!-- END Part IV Title -->	
      <!-- Begin separated repeating data table Part V-->
    <xsl:if test="($Print = $Separated) and (count($Form1040ScheduleCData/OtherExpenseDetail) &gt; 4)">
      <span class="styRepeatingDataTitle">Form 1040 Schedule C, Part V, Other expenses (specify):</span><br/>    
      <table class="styDepTbl" style="font-size:7pt;" cellspacing="0" summary="Table displaying Other Expenses information" name="OEtable" id="OEtable">
      <thead class="styTableThead">
        <tr class="styDepTblHdr">
          <th class="styDepTblCell" scope="col" colspan="1" style="width:155mm;">(a) Description</th>
          <th class="styDepTblCell" scope="col" colspan="1" style="width:32mm;">(b) Amount</th>
        </tr>
      </thead>
      <tfoot/>
      <tbody>
          <xsl:for-each select="$Form1040ScheduleCData/OtherExpenseDetail">
              <tr> 
                  <xsl:choose>
                    <xsl:when test="$Form1040ScheduleCData/OtherExpenseDetail">
                      <xsl:attribute name="class">
                        <xsl:choose>
                           <xsl:when test="position() mod 2 = 1">styDepTblRow2</xsl:when>
                           <xsl:otherwise>styDepTblRow1</xsl:otherwise>
                        </xsl:choose>
                      </xsl:attribute>
                    </xsl:when>
                    <xsl:otherwise>
                      <xsl:attribute name="class">
                        <xsl:choose>
                           <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                           <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                        </xsl:choose>
                      </xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
                <td class="styDepTblCell" style="width:155mm;height:4.5mm;text-align:left;border-left:1 solid 0px;">      
                  <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="Desc"/>
                  </xsl:call-template>
                  <span style="width:9mm;"/>
                  <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$Form1040ScheduleCData/OtherExpenseDetail"/>
                    </xsl:call-template>  
                </td>
                <td class="styDepTblCell" style="height:4.5mm;width:32mm;text-align:right;border-right-width: 0px;">
					<xsl:call-template name="PopulateAmount"><xsl:with-param name="TargetNode" select="Amt" /></xsl:call-template>
			    </td>
              </tr>
          </xsl:for-each>  
       </tbody>
    </table>
 </xsl:if>    
 
</form>
  </body>
</html>
</xsl:template>
<xsl:template name="AddPositionNumber">
  <xsl:if test="position()=1">1</xsl:if>
  <xsl:if test="position()=2">2</xsl:if>
  <xsl:if test="position()=3">3</xsl:if>
  <xsl:if test="position()=4">4</xsl:if>
  <xsl:if test="position()=5">5</xsl:if>    
</xsl:template>
</xsl:stylesheet>