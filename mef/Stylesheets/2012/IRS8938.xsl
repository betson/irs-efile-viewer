<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by Eugenia McDonald on 02/26/2013 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="IRS8938Style.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:output method="html" indent="yes" encoding="iso-8859-1"/>

<xsl:strip-space elements="*" />
<xsl:param name="FormData" select="$RtnDoc/IRS8938" />

<xsl:template match="/">
<html>
<head>  
  <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"></xsl:with-param></xsl:call-template></title>
  <!-- No Browser Caching -->
  <meta http-equiv="Pragma" content="no-cache"/>
  <meta http-equiv="Cache-Control" content="no-cache"/>
  <meta http-equiv="Expires" content="0"/>
  <!-- No Proxy Caching -->
  <meta http-equiv="Cache-Control" content="private"/>  
  <meta name="Description" content="Form IRS 8938"/>
  <meta name="GENERATOR" content="IBM WebSphere Studio"/>
  <link rel="stylesheet" type="text/css" href="{$CSSPath}/header.css"/>
  <link rel="stylesheet" type="text/css" href="{$CSSPath}/body.css"/>
  <link rel="stylesheet" type="text/css" href="{$CSSPath}/general.css"/>
  <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  <xsl:call-template name="InitJS"></xsl:call-template>  
  <style type="text/css">    
    <xsl:if test="not($Print) or $Print=''">
      <xsl:call-template name="IRS8938Style"></xsl:call-template>
      <xsl:call-template name="AddOnStyle"></xsl:call-template>  
    </xsl:if>
  </style>      
  
</head>

<body class="styBodyClass">
  <form name="Form8938">    
    <xsl:call-template name="DocumentHeader"></xsl:call-template>  
    
  <!--Title of Form -->    
  <div class="styBB" style="width:187mm;">
    <div  class="styFNBox" style="height:20mm;width:29mm;font-size: 7pt;">
		<div class="" style="height:13.5mm;" >
      Form <span class="styFormNumber">8938</span><br/>(November 2012)      
       <span>
        <xsl:call-template name="SetFormLinkInline">
          <xsl:with-param name="TargetNode" select="$FormData"/>
        </xsl:call-template>  
      </span> 
    </div> 
       <span class="styAgency">Department of the Treasury</span><br /><span class="styAgency">Internal Revenue Service</span>
    </div>
    <div class="styFTBox" style="width:127mm;padding-top:1mm;height:12mm">
      <div class="styMainTitle">Statement of Specified Foreign Financial Assets</div>
      <div class="styFST" style="font-size:7pt;float:left;font-weight:bold;height:4mm"><br/>
        <span>
			<span style="width:4mm;"/> <img src="{$ImagePath}/8938_Bullet.gif" alt="MediumBullet"/>  
			  Information about Form 8938 and its separate <span style="width:8mm;"/>
			<img src="{$ImagePath}/8938_Bullet.gif" alt="MediumBullet"/>  
			  Attach to your tax return
		</span><br/>
		<span style="float:left"><span style="width:8mm;"/>instructions is at <i>www.irs.gov/form8938.</i>
		</span>
      </div>
    </div>
    <div class="styTYBox" style="height:20mm;width:30mm;border-left-width: 1px;">
      <div class="styOMB" style="height:14mm;padding-top:6mm;">OMB No. 1545-2195</div>
      <div class="stySequence">Attachment<br/>Sequence No. <b>175</b></div>
    </div>
  </div>
  <!--  End title of Form  -->
    <div class="styBB" style="width:187mm">
		<div class="styLNDesc" style="height:8mm;width:187mm;padding-top:2mm;text-align:center;">
			<label>
				<xsl:call-template name="PopulateLabel">
					<xsl:with-param name="TargetNode" select="$FormData/DummyInd"/>
					<xsl:with-param name="BackupName">IRS8938DummyInd</xsl:with-param>
				</xsl:call-template>
				<b>If you have attached additional sheets, check here</b>
			</label>
			<span style="width:5px;"/>
			<input type="Checkbox" class="styCkbox">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$FormData/DummyInd"/>
					<xsl:with-param name="BackupName">IRS8938DummyInd</xsl:with-param>
				</xsl:call-template>
			</input>
		</div>
    </div>
  <!--  Name and Employer identification number  -->
  <div class="styBB" style="width:187mm">
    <div class="styNameBox" style="width:141mm;font-weight:normal;font-size:7pt;">
      Name(s) shown on return<br/><br/>
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param></xsl:call-template><br/>  
      <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param></xsl:call-template>      
    </div>
    <div class="styEINBox" style="padding-left:1mm;font-size:7pt;font-weight:normal">Identifying number</div>
      <br/><br/><br/>
      <span style="font-weight:normal;">  
        <xsl:call-template name="PopulateReturnHeaderFiler">
			<xsl:with-param name="TargetNode">EIN</xsl:with-param>
        </xsl:call-template>
         <xsl:call-template name="PopulateReturnHeaderFiler">
           <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
         </xsl:call-template> 
      </span>    
   </div>  
  <!--  End Name and Employer indentification number  -->
  <!--  Beginning of Address  -->
	<div class="styBB" style="width:187mm;">  
		<div class="styLNDesc"  style="height:9.75mm;">
			<div class="styArialText" style="font-size:7pt;">Number, street, and room or suite no. (if a P.O. box, see instructions)</div><br/>
			<div class="styLNDesc" >
				<xsl:if test="$RtnHdrData/Filer/USAddress">
					<xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
						<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine1</xsl:with-param>
					</xsl:call-template><br/>
					<xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
						<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressLine2</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
					<xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
						<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine1</xsl:with-param>
					</xsl:call-template><br/>
					<xsl:call-template name="PopulateReturnHeaderFiler">
						<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
						<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressLine2</xsl:with-param>
					</xsl:call-template>
				</xsl:if>
			</div>
		</div>
	</div>	 
 <!--  End of Address  -->
  <!--  Beginning of City or town, province or state, and country  -->
	<div class="styBB" style="width:187mm;">  
		<div class="styLNDesc"  style="height:9.75mm;">
			<div class="styArialText" style="font-size:7pt;">City or town, province or state, and country (including postal code)</div><br/>
				<div style="width:187mm;">
					<xsl:if test="$RtnHdrData/Filer/USAddress">
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">City</xsl:with-param>
							<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressCity</xsl:with-param>
						</xsl:call-template><br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">State</xsl:with-param>
							<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressState</xsl:with-param>
						</xsl:call-template>,
						<span style="width:2px;"/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">ZIPCode</xsl:with-param>
							<xsl:with-param name="BackupName">$RtnHdrDataFilerUSAddressZip</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$RtnHdrData/Filer/ForeignAddress">
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">City</xsl:with-param>
							<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressCity</xsl:with-param>
						</xsl:call-template><br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">ProvinceOrState</xsl:with-param>
							<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressProvinceOrState
							</xsl:with-param>
						</xsl:call-template>,
						<span style="width:2px;"/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">PostalCode</xsl:with-param>
							<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressZip</xsl:with-param>
						</xsl:call-template>,
						<span style="width:2px;"/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">Country</xsl:with-param>
							<xsl:with-param name="BackupName">$RtnHdrDataFilerForeignAddressCountry</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
				</div>
			</div>
	</div>	 
 <!--  End of City or town, province or state, and country  -->
	<div class="styBB" style="width:187mm;">
		<span class="styArialText" style="font-size:7pt;">For tax year beginning </span>
		<span style="width:5px;"/>
			<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate">
				<xsl:with-param name="TargetNode">TaxPeriodBeginDate</xsl:with-param>
				<xsl:with-param name="BackupName">$RtnHdrDataTaxPeriodBeginDate</xsl:with-param>
			</xsl:call-template>
			<span style="width:5px;"/>, and ending 
 			<span style="width:5px;"/>
				<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate">
					<xsl:with-param name="TargetNode">TaxPeriodEndDate</xsl:with-param>
					<xsl:with-param name="BackupName">$RtnHdrDataTaxPeriodEndDate</xsl:with-param>
				</xsl:call-template>
	</div> 
	<div class="styBB" style="width:187mm;">
		<div  class="styLNDesc" style="width:187mm;"><b>Note.</b> All information must be in English. Show all amounts in U.S. dollars. Show currency conversion rates in Part I, line 6(2), or Part II, line 6(2).</div>
	</div>
	<!--Start of Type Of Filer--> 
	<div class="styBB" style="width:187mm;">
		<div  class="styLNDesc" style="width:187mm;">Type of filer:</div>
		<div  style="width:187mm;">
			<!--Start of Specified Individual-->
			<div  class="styLNDesc" style="width:39mm;"><b>a</b><span style="width:3px;"/>
			  Specified individual</div>
			<!--Start of JointReturnInd-->
			<div  class="styLNDesc" style="width:47mm;"><b>(1)</b>
				<span style="width:3px;"/>
				<input type="Checkbox" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/JointReturnInd"/>
						<xsl:with-param name="BackupName">IRS8938JointReturnInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<span style="width:3px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$FormData/JointReturnInd"/>
						<xsl:with-param name="BackupName">IRS8938JointReturnInd</xsl:with-param>
					</xsl:call-template>
					Married filing a joint return
				</label>
			</div>
			<!--End of JointReturnInd-->
			<!--Start of SeparateReturnInd-->
			<div  class="styLNDesc" style="width:52mm;"><b>(2)</b>
				<span style="width:3px;"/>
				<input type="Checkbox" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/MarriedFilingSeparatelyInd"/>
						<xsl:with-param name="BackupName">IRS8938MarriedFilingSeparatelyInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<span style="width:3px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$FormData/MarriedFilingSeparatelyInd"/>
						<xsl:with-param name="BackupName">IRS8938MarriedFilingSeparatelyInd</xsl:with-param>
					</xsl:call-template>
					Married filing a separate return 
				</label>
			</div>
			<!--End of SeparateReturnInd-->
			<!--Start of OtherIndividualInd-->
			<div  class="styLNDesc" style="width:48mm;"><b>(3)</b>
				<span style="width:3px;"/>
				<input type="Checkbox" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/OtherIndividualInd"/>
						<xsl:with-param name="BackupName">IRS8938OtherIndividualInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<span style="width:3px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$FormData/OtherIndividualInd"/>
						<xsl:with-param name="BackupName">IRS8938OtherIndividualInd</xsl:with-param>
					</xsl:call-template>
					Other individual 
				</label>
			</div>
			<!--End of OtherIndividualInd-->
			<!--End of Specified Individual-->
		</div>
		<div  style="width:187mm;">
			<!--Start of Specified Domestic Entity-->
			<div  class="styLNDesc" style="width:39mm;"><b>b</b><span style="width:3px;"/>
			  Specified domestic entity</div>
			<!--Start of Partnership-->
			<div  class="styLNDesc" style="width:47mm;"><b>(1)</b>
				<span style="width:3px;"/>
				<input type="Checkbox" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/PartnershipInd"/>
						<xsl:with-param name="BackupName">IRS8938PartnershipInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<span style="width:3px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$FormData/PartnershipInd"/>
						<xsl:with-param name="BackupName">IRS8938PartnershipInd</xsl:with-param>
					</xsl:call-template>
					Partnership
				</label>
			</div>
			<!--End of Partnership-->
			<!--Start of Corporation Ind-->
			<div  class="styLNDesc" style="width:52mm;"><b>(2)</b>
				<span style="width:3px;"/>
				<input type="Checkbox" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/CorporationInd"/>
						<xsl:with-param name="BackupName">IRS8938CorporationInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<span style="width:3px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$FormData/CorporationInd"/>
						<xsl:with-param name="BackupName">IRS8938CorporationInd</xsl:with-param>
					</xsl:call-template>
					Corporation 
				</label>
			</div>
			<!--End of Corporation Ind-->
			<!--Start of Trust Ind-->
			<div  class="styLNDesc" style="width:48mm;"><b>(3)</b>
				<span style="width:3px;"/>
				<input type="Checkbox" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/TrustInd"/>
						<xsl:with-param name="BackupName">IRS8938TrustInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<span style="width:3px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$FormData/TrustInd"/>
						<xsl:with-param name="BackupName">IRS8938TrustInd</xsl:with-param>
					</xsl:call-template>
					Trust 
				</label>
			</div>
			<!--End of Trust Ind-->
			<!--Start of Estate Ind-->
			<!--<div  class="styLNDesc" style="width:20mm;"><b>(4)</b>
				<span style="width:5px;"/>
				<input type="Checkbox" class="styCkbox">
					<xsl:call-template name="PopulateCheckbox">
						<xsl:with-param name="TargetNode" select="$FormData/EstateInd"/>
						<xsl:with-param name="BackupName">IRS8938EstateInd</xsl:with-param>
					</xsl:call-template>
				</input>
				<span style="width:5px;"/>
				<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$FormData/EstateInd"/>
						<xsl:with-param name="BackupName">IRS8938EstateInd</xsl:with-param>
					</xsl:call-template>
					Estate 
				</label>
			</div>-->
			<!--End of Estate Ind-->
			<!--End of Specified Domestic Entity-->
		</div>
	</div>
	<div class="styBB" style="width:187mm;">
		<!--Start of Previously Filed Return Ind--> 
		<div  class="styLNDesc" style="width:187mm;">
			<label>
					<xsl:call-template name="PopulateLabel">
						<xsl:with-param name="TargetNode" select="$FormData/PreviouslyFiledReturnInd"/>
						<xsl:with-param name="BackupName">IRS8938PreviouslyFiledReturnInd</xsl:with-param>
					</xsl:call-template>
			Check this box if this is an amended or supplemental Form 8938 for the tax year
			<!--Dotted Line-->
			<span class="styDotLn" style="float:none;clear:none;padding-left:1mm;">...................</span>
			</label>
			<span style="width:2mm;"/>
			<input type="Checkbox" class="styCkbox">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="$FormData/PreviouslyFiledReturnInd"/>
					<xsl:with-param name="BackupName">IRS8938PreviouslyFiledReturnInd</xsl:with-param>
				</xsl:call-template>
			</input>
		</div>
	</div>
	<!--End of Type Of Filer--> 
	
    <!--<div style="width:187mm;">  James border-style:solid;border-color:black;border-width: 1px 1px 1px 1px;-->
		<!--PART I  Start of Foreign Deposit and Custodial Accounts-->
		<xsl:if test="(count($FormData/ForeignFinclAccountGrp) &lt;=1)">
			<!-- BEGIN PART I TITLE -->
			<div class="styBB" style="width:187mm;">
				<div class="styPartName" style="font-size:9pt;padding-bottom:.5mm;font-family:arial">Part I</div>
				<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;float:left;clear:none;">
				  Foreign Deposit and Custodial Accounts<span style="font-weight:normal;"> (see instructions)</span>
				  </div>
			</div>
			<!-- END PART I TITLE --> 
			<div class="styBB" style="width:187mm;">
				<div  class="styLNDesc" style="width:187mm;">
				  If you have more than one account to report, attach a continuation sheet with the same information for
				  each additional account (see instructions).</div>
			</div>
			<div class="styBB" style="width:187mm;">
				<!--PART I  Line 1  Start of Type Of Account-->
				<div style="width:45mm;float:left;clear:none;">
					<div class="styLNLeftNumBox" style="padding-left:2mm;">1</div>
					<div class="styLNDesc" style="width:30mm;padding-left:2mm;">
						Type of account
					</div>
				</div>
				<div style="width:65mm;float:left;clear:none;">
					<!--PART I  Start of Deposit Account Type Ind-->	
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode"
								  select="$FormData/ForeignFinclAccountGrp/DepositAccountTypeInd"/>
								<xsl:with-param name="BackupName">IRS8938FFADepositAccountTypeInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode"
								  select="$FormData/ForeignFinclAccountGrp/DepositAccountTypeInd"/>
								<xsl:with-param name="BackupName">IRS8938FFADepositAccountTypeInd</xsl:with-param>
							</xsl:call-template>
							Deposit 
						</label>
						<!--PART I  End of Deposit Account Type Ind-->	
						<span style="width:8mm;"/>
						<!--PART I  Start of Custodial Account Type Ind-->	
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode"
								  select="$FormData/ForeignFinclAccountGrp/CustodialAccountTypeInd"/>
								<xsl:with-param name="BackupName">IRS8938FFACustodialAccountTypeInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode"
								  select="$FormData/ForeignFinclAccountGrp/CustodialAccountTypeInd"/>
								<xsl:with-param name="BackupName">IRS8938FFACustodialAccountTypeInd</xsl:with-param>
							</xsl:call-template>
							Custodial
						</label>
						<!--PART I  End of Custodial Account Type Ind-->	
				</div>
				<!--PART I  Line 1  End of Type Of Account-->
				<!--PART I  Line 2  Start of Identifying Designation Number-->
				<div style="width:70mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 0px 0px 1px;">
					<div class="styLNLeftNumBox" style="width:5mm;text-align:center;float:left;padding-bottom:0mm;">
					  2</div>
					<div class="styLNDesc" style="width:64mm;padding-left:2mm;padding-bottom:0mm;">
							Account number or other designation
					</div>
					<div class="styLNDesc"  style="width:64mm;padding-left:5.5mm;padding-bottom:0mm;
					  padding-top:1mm;" valign="bottom">	
						<xsl:choose>
							<xsl:when test="$FormData/ForeignFinclAccountGrp/IdentifyingDesignationNumber">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" 
							  select="$FormData/ForeignFinclAccountGrp/IdentifyingDesignationNumber"/>
								</xsl:call-template>                        
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" 
							  select="$FormData/ForeignFinclAccountGrp/BankAccountNumber"/>
								</xsl:call-template>                        
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
				<!--PART I  Line 2  End of Identifying Designation Number-->
			</div> 
			<!--PART I  Line 3  Start of Check all that apply-->
			<div class="styBB" style="width:187mm;">
				<div  style="width:187mm;">
					<div style="width:40mm;float:left;clear: none;">
						<div class="styLNLeftNumBox" style="padding-left:2mm;">3</div>
						<div class="styLNDesc" style="width:30mm;padding-left:2mm;float:left;">
							Check all that apply
						</div>
					</div>
					<!--PART I  Start of Account Opened During Tax Year Ind-->	
					<div  class="styLNDesc" style="width:60mm;"><b>a</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" 
								  select="$FormData/ForeignFinclAccountGrp/AccountOpenedDuringTaxYearInd"/>
								<xsl:with-param name="BackupName">IRS8938FFAAccountOpenedDuringTaxYearInd
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" 
								  select="$FormData/ForeignFinclAccountGrp/AccountOpenedDuringTaxYearInd"/>
								<xsl:with-param name="BackupName">IRS8938FFAAccountOpenedDuringTaxYearInd
								</xsl:with-param>
							</xsl:call-template>
							Account opened during tax year
						</label>
					</div>
					<!--PART I  End of Account Opened During Tax Year Ind-->
					<!--PART I  Start of Account Closed During Tax Year Ind-->		
					<div  class="styLNDesc" style="width:85mm;"><b>b</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" 
								  select="$FormData/ForeignFinclAccountGrp/AccountClosedDuringTaxYearInd"/>
								<xsl:with-param name="BackupName">IRS8938FFAAccountClosedDuringTaxYearInd
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode"
								  select="$FormData/ForeignFinclAccountGrp/AccountClosedDuringTaxYearInd"/>
								<xsl:with-param name="BackupName">IRS8938FFAAccountClosedDuringTaxYearInd
								</xsl:with-param>
							</xsl:call-template>
							Account closed during tax year
						</label>
					</div>
					<!--PART I  End of Account Closed During Tax Year Ind-->
				</div>
				<div  style="width:187mm;">
					<div style="width:40mm;float:left;clear: none;"/>
					<!--PART I  Start of Jointly Owned With Spouse Ind-->
					<div  class="styLNDesc" style="width:60mm;"><b>c</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode"
								  select="$FormData/ForeignFinclAccountGrp/JointlyOwnedWithSpouseInd"/>
								<xsl:with-param name="BackupName">IRS8938FFAJointlyOwnedWithSpouseInd
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode"
								  select="$FormData/ForeignFinclAccountGrp/JointlyOwnedWithSpouseInd"/>
								<xsl:with-param name="BackupName">IRS8938FFAJointlyOwnedWithSpouseInd
								</xsl:with-param>
							</xsl:call-template>
							Account jointly owned with spouse
						</label>
					</div>
					<!--PART I  End of Jointly Owned With Spouse Ind-->
					<!--PART I  Start of No Tax Item Reported Ind-->
					<div  class="styLNDesc" style="width:87mm;"><b>d</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode"
								  select="$FormData/ForeignFinclAccountGrp/NoTaxItemReportedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFANoTaxItemReportedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode"
								  select="$FormData/ForeignFinclAccountGrp/NoTaxItemReportedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFANoTaxItemReportedInd</xsl:with-param>
							</xsl:call-template>
							No tax item reported in Part III with respect to this account
						</label>
					</div>
					<!--PART I  End of No Tax Item Reported Ind-->
				</div>
			</div>
			<!--PART I  Line 3  End of Check all that apply-->
			<!--PART I  Line 4  Start of Max. Account Value During TY Amount-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">4</div>
				<div  class="styLNDesc" style="height:5mm;width:146mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">Maximum value of account during tax year
					<!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-right:1mm;">....................</span>$
				</div>
				<div class="styLNAmountBoxNB"  style="height:2mm;padding-top:.7mm;padding-bottom:0mm;"
				   valign="bottom">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode"
						  select="$FormData/ForeignFinclAccountGrp/MaxAccountValueDurTYAmt"/>
					</xsl:call-template>                         
				</div>
			</div>
			<!--PART I  Line 4  End of Max. Account Value During TY Amount-->
			<!--PART I  Line 5  Start of Exchange Rate Used Ind-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">5</div>
				<div  class="styLNDesc" style="height:5mm;width:179mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">
				  Did you use a foreign currency exchange rate to convert the value of the account into U.S. dollars?
					<!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-right:1mm;">.....</span>
						<!--PART I  Start of Exchange Rate Used Ind "Yes"-->
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode"
								  select="$FormData/ForeignFinclAccountGrp/ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFAExchangeRateUsedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabelYes">
								<xsl:with-param name="TargetNode"
								  select="$FormData/ForeignFinclAccountGrp/ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFAExchangeRateUsedInd</xsl:with-param>
							</xsl:call-template>
							Yes
						</label>
						<!--PART I  End of Exchange Rate Used Ind "Yes"-->
						<span style="width:10px;"/>
						<!--PART I  Start of Exchange Rate Used Ind "No"-->
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode"
								  select="$FormData/ForeignFinclAccountGrp/ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFAExchangeRateUsedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode"
								  select="$FormData/ForeignFinclAccountGrp/ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFAExchangeRateUsedInd</xsl:with-param>
							</xsl:call-template>
							No
						</label>
						<!--PART I  End of Exchange Rate Used Ind "No"-->
				</div>
			</div>
			<!--PART I  Line 5  End of Exchange Rate Used Ind-->
			<!--PART I  Line 6  Start of If you answered "yes" to line 5 complete all that apply-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">6</div>
				<div  class="styLNDesc" style="height:5mm;width:179mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">If you answered “Yes” to line 5, complete all that apply.
				</div>
			</div>
			<div class="styBB" style="width:187mm;">
				<!--PART I  Start of Foreign Currency Description Text-->
				<div style="width:60mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 1px 0px 0px;">
					<div class="styLNDesc" style="width:55mm;padding-left:10mm;padding-bottom:2mm">
							<b>(1) </b> Foreign currency in which<br/> account is maintained
					</div>
					<div class="styLNDesc"  style="width:55mm;padding-top:1mm;padding-left:9mm;" valign="bottom">	
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode"
							  select="$FormData/ForeignFinclAccountGrp/ForeignCurrencyDescTxt"/>
							<xsl:with-param name="BackupName">IRS8938FFAForeignCurrencyDescTxt</xsl:with-param>
						</xsl:call-template>                         
					</div>
				</div>
				<!--PART I  End of Foreign Currency Description Text-->
				<!--PART I  Start of Exchange Rate Used-->
				<div style="width:63mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 0px 0px 0px;">
					<div class="styLNDesc" style="width:61mm;padding-left:2mm;padding-bottom:2mm;">
							<b>(2) </b> Foreign currency exchange rate used to convert to U.S. dollars
					</div>
					<div class="styLNDesc"  style="width:61mm;padding-top:1mm;text-align:right" valign="bottom">	
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode"
							  select="$FormData/ForeignFinclAccountGrp/ExchangeRateUsed"/>
							<xsl:with-param name="BackupName">IRS8938FFAExchangeRateUsed</xsl:with-param>
						</xsl:call-template>                         
					</div>
				</div>
				<!--PART I  End of Exchange Rate Used-->
				<!--PART I  Start of Source Of Exchange Rate Used Text-->
				<div style="width:64mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 0px 0px 1px;">
					<div class="styLNDesc" style="width:62mm;padding-left:2mm;padding-bottom:2mm">
							<b>(3) </b> Source of exchange rate used if not from U.S. Treasury Financial Management Service
					</div>
					<div class="styLNDesc"  style="width:62mm;padding-top:1mm;" valign="bottom">	
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode"
							  select="$FormData/ForeignFinclAccountGrp/SourceOfExchangeRateUsedTxt"/>
							<xsl:with-param name="BackupName">IRS8938FFASourceOfExchangeRateUsedTxt
							</xsl:with-param>
						</xsl:call-template>                         
					</div>
				</div>
				<!--PART I  End of Source Of Exchange Rate Used Text-->
			</div>
			<!--PART I  Line 6  End of If you answered "yes" to line 5 complete all that apply-->
			<!--PART I  Line 7  Start of Foreign Deposit and Custodial Accounts Business Name-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">7</div>
				<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">
					Name of financial institution in which account is maintained
				</div>
				<div class="styLNDesc"  style="width:186mm;padding-top:1mm;padding-left:10mm;" valign="bottom">	
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode"
						  select="$FormData/ForeignFinclAccountGrp/BusinessName/BusinessNameLine1"/>
					</xsl:call-template>
					<xsl:if test="$FormData/ForeignFinclAccountGrp/BusinessName/BusinessNameLine2">
						<br/>	
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode"
							  select="$FormData/ForeignFinclAccountGrp/BusinessName/BusinessNameLine2"/>
						</xsl:call-template>
					</xsl:if>
				</div>
			</div>
			<!--PART I  Line 7  End of Foreign Deposit and Custodial Accounts Business Name-->
			<!--PART I  Line 8  Start of Mailing Address-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">8</div>
				<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">
					Mailing address of financial institution in which account is maintained. Number, street, and room or
					suite no.
				</div>
				<div class="styLNDesc"  style="width:62mm;padding-top:1mm;padding-left:10mm;"  valign="bottom">
					<!--PART I  Start of Foreign Deposit and Custodial Accounts US Address-->	
						<xsl:if test="$FormData/ForeignFinclAccountGrp/USAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" 
								  select="$FormData/ForeignFinclAccountGrp/USAddress/AddressLine1"/>
								<xsl:with-param name="BackupName">IRS8938FFAUSAddressLine1</xsl:with-param>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" 
								 select="$FormData/ForeignFinclAccountGrp/USAddress/AddressLine2"/>
								<xsl:with-param name="BackupName">IRS8938FFAUSAddressLine2</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
					<!--PART I  End of Foreign Deposit and Custodial Accounts US Address-->
					<!--PART I  Start of Foreign Deposit and Custodial Accounts Foreign Address-->	
						<xsl:if test="$FormData/ForeignFinclAccountGrp/ForeignAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode"
								  select="$FormData/ForeignFinclAccountGrp/ForeignAddress/AddressLine1"/>
								<xsl:with-param name="BackupName">IRS8938FFAForeignAddressLine1</xsl:with-param>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode"
								  select="$FormData/ForeignFinclAccountGrp/ForeignAddress/AddressLine2"/>
								<xsl:with-param name="BackupName">IRS8938FFAForeignAddressLine2</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
					<!--PART I  End of Foreign Deposit and Custodial Accounts Foreign Address-->	
				</div>
			</div>
			<!--PART I  Line 8  End of Mailing Address-->
			<!--PART I  Line 9  Start of City, state and country-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">9</div>
				<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">
					City or town, province or state, and country (including postal code)
				</div>
				<div class="styLNDesc"  style="width:186mm;padding-top:1mm;padding-left:10mm;">
						<!--PART I  Start of Foreign Deposit and Custodial Accounts US Address City, State, and Zip Code-->
							<xsl:if test="$FormData/ForeignFinclAccountGrp/USAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode"
									  select="$FormData/ForeignFinclAccountGrp/USAddress/City"/>
									<xsl:with-param name="BackupName">IRS8938FFAUSAddressCity</xsl:with-param>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode"
									  select="$FormData/ForeignFinclAccountGrp/USAddress/State"/>
									<xsl:with-param name="BackupName">IRS8938FFAUSAddressState</xsl:with-param>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode"
									  select="$FormData/ForeignFinclAccountGrp/USAddress/ZIPCode"/>
									<xsl:with-param name="BackupName">IRS8938FFAUSAddressZip</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						<!--PART I  End of Foreign Deposit and Custodial Accounts US Address City, State, and 
							 Zip Code-->	
							<xsl:if test="$FormData/ForeignFinclAccountGrp/ForeignAddress">
						<!--PART I  Start of Foreign Deposit and Custodial Accounts Foreign Address City, ProvinceOrState,
                             PostalCode, and Country-->	
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode"
									  select="$FormData/ForeignFinclAccountGrp/ForeignAddress/City"/>
									<xsl:with-param name="BackupName">IRS8938FFAForeignAddressCity</xsl:with-param>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode"
									  select="$FormData/ForeignFinclAccountGrp/ForeignAddress/ProvinceOrState"/>
									<xsl:with-param name="BackupName">IRS8938FFAForeignAddressProvinceOrState
									</xsl:with-param>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode"
									  select="$FormData/ForeignFinclAccountGrp/ForeignAddress/PostalCode"/>
									<xsl:with-param name="BackupName">IRS8938FFAForeignAddressPostalCode
									</xsl:with-param>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode"
									  select="$FormData/ForeignFinclAccountGrp/ForeignAddress/Country"/>
									<xsl:with-param name="BackupName">IRS8938FFAForeignAddressCountry
									</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						<!--PART I  End of Foreign Deposit and Custodial Accounts Foreign Address City, ProvinceOrState,
                             PostalCode, and Country-->	
				</div>
			</div>
			<!--PART I  Line 9  End of City, state and country-->
	</xsl:if>
	
	<!--PART I REPEATING INFORMATION  Start of Foreign Deposit and Custodial Accounts--> 		
	<xsl:if test="(count($FormData/ForeignFinclAccountGrp) &gt;= 2) and ($Print != $Separated)">
		<xsl:for-each select="$FormData/ForeignFinclAccountGrp">
			<!-- PART I REPEATING INFORMATION  BEGIN TITLE -->
			<div class="styBB" style="width:187mm;">
				<div class="styPartName" style="font-size:9pt;padding-bottom:.5mm;font-family:arial">Part I</div>
				<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;float:left;clear:none;">
				  Foreign Deposit and Custodial Accounts<span style="font-weight:normal;"> (see instructions)</span>
				</div>
			</div>	
			<!-- PART I REPEATING INFORMATION  END TITLE --> 
			<div class="styBB" style="width:187mm;">
				<div  class="styLNDesc" style="width:187mm;">
				  If you have more than one account to report, attach a continuation sheet with the same information for
				  each additional account (see instructions).</div>
			</div>
			<div class="styBB" style="width:187mm;">
				<!--PART I REPEATING INFORMATION  Start of Type Of Account-->
				<div style="width:45mm;float:left;clear:none;">
					<div class="styLNLeftNumBox" style="padding-left:2mm;">1</div>
					<div class="styLNDesc" style="width:30mm;padding-left:2mm;">
						Type of account
					</div>
				</div>
				<div style="width:65mm;float:left;clear:none;">
					<!--PART I REPEATING INFORMATION  Start of Deposit Account Type Ind-->	
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="DepositAccountTypeInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-RDepositAccountTypeInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="DepositAccountTypeInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-RDepositAccountTypeInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Deposit 
						</label>
						<!--PART I REPEATING INFORMATION  End of Deposit Account Type Ind-->	
						<span style="width:8mm;"/>
						<!--PART I REPEATING INFORMATION  Start of Custodial Account Type Ind-->	
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="CustodialAccountTypeInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-RCustodialAccountTypeInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="CustodialAccountTypeInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-RCustodialAccountTypeInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Custodial
						</label>
						<!--PART I REPEATING INFORMATION  End of Custodial Account Type Ind-->	
				</div>
				<!--PART I REPEATING INFORMATION  End of Type Of Account-->
				<!--PART I REPEATING INFORMATION  Start of Identifying Designation Number-->
				<div style="width:70mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 0px 0px 1px;">
					<div class="styLNLeftNumBox" style="width:5mm;text-align:center;float:left;
					  padding-bottom:0mm;">2</div>
					<div class="styLNDesc" style="width:64mm;padding-left:2mm;padding-bottom:0mm;">
							Account number or other designation
					</div>
					<div class="styLNDesc"  style="width:64mm;padding-left:5.5mm;padding-bottom:0mm;
					  padding-top:1mm;" valign="bottom">	
						<xsl:choose>
							<xsl:when test="IdentifyingDesignationNumber">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="IdentifyingDesignationNumber"/>
								</xsl:call-template>                        
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BankAccountNumber"/>
								</xsl:call-template>                        
							</xsl:otherwise>
						</xsl:choose> 
					</div>
				</div>
				<!--PART I REPEATING INFORMATION  End of Identifying Designation Number-->
			</div> 
			<div class="styBB" style="width:187mm;">
				<div  style="width:187mm;">
					<div style="width:40mm;float:left;clear: none;">
						<div class="styLNLeftNumBox" style="padding-left:2mm;">3</div>
						<div class="styLNDesc" style="width:30mm;padding-left:2mm;float:left;">
							Check all that apply
						</div>
					</div>
					<!--PART I REPEATING INFORMATION  Start of Account Opened During Tax Year Ind-->	
					<div  class="styLNDesc" style="width:60mm;"><b>a</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="AccountOpenedDuringTaxYearInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-RAccountOpenedDuringTaxYearInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="AccountOpenedDuringTaxYearInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-RAccountOpenedDuringTaxYearInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Account opened during tax year
						</label>
					</div>
					<!--PART I REPEATING INFORMATION  End of Account Opened During Tax Year Ind-->
					<!--PART I REPEATING INFORMATION  Start of Account Closed During Tax Year Ind-->		
					<div  class="styLNDesc" style="width:85mm;"><b>b</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="AccountClosedDuringTaxYearInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-RAccountClosedDuringTaxYearInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="AccountClosedDuringTaxYearInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-RAccountClosedDuringTaxYearInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Account closed during tax year
						</label>
					</div>
					<!--PART I REPEATING INFORMATION  End of Account Closed During Tax Year Ind-->
				</div>
				<div  style="width:187mm;">
					<div style="width:40mm;float:left;clear: none;"/>
					<!--PART I REPEATING INFORMATION  Start of Jointly Owned With Spouse Ind-->
					<div  class="styLNDesc" style="width:60mm;"><b>c</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-RJointlyOwnedWithSpouseInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-RJointlyOwnedWithSpouseInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Account jointly owned with spouse
						</label>
					</div>
					<!--PART I REPEATING INFORMATION  End of Jointly Owned With Spouse Ind-->
					<!--PART I REPEATING INFORMATION  Start of No Tax Item Reported Ind-->
					<div  class="styLNDesc" style="width:87mm;"><b>d</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-RNoTaxItemReportedInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-RNoTaxItemReportedInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							No tax item reported in Part III with respect to this account
						</label>
					</div>
					<!--PART I REPEATING INFORMATION  End of No Tax Item Reported Ind-->
				</div>
			</div>
			<!--PART I REPEATING INFORMATION  Line 4  Start of Max. Account Value During TY Amount-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">4</div>
				<div  class="styLNDesc" style="height:5mm;width:146mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">
					Maximum value of account during tax year
					<!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-right:1mm;">....................</span>$
				</div>
				<div class="styLNAmountBoxNB"  style="height:2mm;padding-top:.7mm;padding-bottom:0mm;"
				  valign="bottom">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="MaxAccountValueDurTYAmt"/>
					</xsl:call-template>                         
				</div>
			</div>
			<!--PART I REPEATING INFORMATION  End of Line 4 Max. Account Value During TY Amount-->
			<!--PART I REPEATING INFORMATION  Line 5  Start of Exchange Rate Used Ind-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">5</div>
				<div  class="styLNDesc" style="height:5mm;width:179mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">
					Did you use a foreign currency exchange rate to convert the value of the account into U.S. dollars?
					<!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-right:1mm;">.....</span>
						<!--PART I REPEATING INFORMATION  Start of Exchange Rate Used Ind "Yes"-->
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-RExchangeRateUsedInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabelYes">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-RExchangeRateUsedInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Yes
						</label>
						<!--PART I REPEATING INFORMATION  End of Exchange Rate Used Ind "Yes"-->
						<span style="width:10px;"/>
						<!--PART I REPEATING INFORMATION  Start of Exchange Rate Used Ind "No"-->
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-RExchangeRateUsedInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-RExchangeRateUsedInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							No
						</label>
						<!--PART I REPEATING INFORMATION  End of Exchange Rate Used Ind "No"-->
				</div>
			</div>
			<!--PART I REPEATING INFORMATION  Line 5  End of Exchange Rate Used Ind-->
			<!--PART I REPEATING INFORMATION  Line 6  Start of If you answered yes to line 5, complete all that
				 apply-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">6</div>
				<div  class="styLNDesc" style="height:5mm;width:179mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">
					If you answered “Yes” to line 5, complete all that apply.
				</div>
			</div>
			<div class="styBB" style="width:187mm;">
				<!--PART I REPEATING INFORMATION  Start of Foreign Currency Description Text-->
				<div style="width:60mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 1px 0px 0px;">
					<div class="styLNDesc" style="width:55mm;padding-left:10mm;padding-bottom:2mm">
							<b>(1) </b> Foreign currency in which<br/> account is maintained
					</div>
					<div class="styLNDesc"  style="width:55mm;padding-top:1mm;padding-left:9mm;" valign="bottom">	
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignCurrencyDescTxt"/>
							<xsl:with-param name="BackupName">IRS8938FFA-RForeignCurrencyDescTxt</xsl:with-param>
						</xsl:call-template>                         
					</div>
				</div>
				<!--PART I REPEATING INFORMATION  End of Foreign Currency Description Text-->
				<!--PART I REPEATING INFORMATION  Start of Exchange Rate Used-->
				<div style="width:63mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 0px 0px 0px;">
					<div class="styLNDesc" style="width:61mm;padding-left:2mm;padding-bottom:2mm;">
							<b>(2) </b> Foreign currency exchange rate used to convert to U.S. dollars
					</div>
					<div class="styLNDesc"  style="width:61mm;padding-top:1mm;text-align:right" valign="bottom">	
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="ExchangeRateUsed"/>
							<xsl:with-param name="BackupName">IRS8938FFA-RExchangeRateUsed</xsl:with-param>
						</xsl:call-template>                        
					</div>
				</div>
				<!--PART I REPEATING INFORMATION  End of Exchange Rate Used-->
				<!--PART I REPEATING INFORMATION  Start of Source Of Exchange Rate Used Text-->
				<div style="width:64mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 0px 0px 1px;">
					<div class="styLNDesc" style="width:62mm;padding-left:2mm;padding-bottom:2mm">
							<b>(3) </b> Source of exchange rate used if not from U.S. Treasury Financial Management Service
					</div>
					<div class="styLNDesc"  style="width:62mm;padding-top:1mm;" valign="bottom">	
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="SourceOfExchangeRateUsedTxt"/>
							<xsl:with-param name="BackupName">IRS8938FFA-RSourceOfExchangeRateUsedTxt
							</xsl:with-param>
						</xsl:call-template>                         
					</div>
				</div>
				<!--PART I REPEATING INFORMATION  End of Source Of Exchange Rate Used Text-->
			</div>
			<!--PART I REPEATING INFORMATION  Line 6  End of If you answered yes to line 5, complete all that
				 apply-->
			<!--PART I REPEATING INFORMATION  Line 7  Start of Foreign Deposit and Custodial Accounts 
				 Business Name-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">7</div>
				<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">
					Name of financial institution in which account is maintained
				</div>
				<div class="styLNDesc"  style="width:186mm;padding-top:1mm;padding-left:10mm;" valign="bottom">	
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
					</xsl:call-template>
					<xsl:if test="BusinessName/BusinessNameLine2">
						<br/>	
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
						</xsl:call-template>
					</xsl:if>
				</div>
			</div>
			<!--PART I REPEATING INFORMATION  Line 7  End of Foreign Deposit and Custodial Accounts 
				 Business Name-->
			<!--PART I REPEATING INFORMATION  Line 8  Mailing Address-->	
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">8</div>
				<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">
					Mailing address of financial institution in which account is maintained. Number, street, and room or
					suite no.
				</div>
				<div class="styLNDesc"  style="width:62mm;padding-top:1mm;padding-left:10mm;"  valign="bottom">
					<!--PART I REPEATING INFORMATION  Start of Foreign Deposit and Custodial Accounts US
						 Address-->	
						<xsl:if test="USAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="USAddress/AddressLine1"/>
								<xsl:with-param name="BackupName">IRS8938FFA-RUSAddressLine1</xsl:with-param>
							</xsl:call-template>
							<xsl:if test="USAddress/AddressLine2">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="USAddress/AddressLine2"/>
									<xsl:with-param name="BackupName">IRS8938FFA-RUSAddressLine2</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</xsl:if>
					<!--PART I REPEATING INFORMATION  End of Foreign Deposit and Custodial Accounts US Address-->
					<!--PART I REPEATING INFORMATION  Start of Foreign Deposit and Custodial Accounts
						 Foreign Address-->	
						<xsl:if test="ForeignAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1"/>
								<xsl:with-param name="BackupName">IRS8938FFA-RForeignAddressLine1</xsl:with-param>
							</xsl:call-template>
							<xsl:if test="ForeignAddress/AddressLine2">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2"/>
									<xsl:with-param name="BackupName">IRS8938FFA-RForeignAddressLine2
									</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						</xsl:if>
					<!--PART I REPEATING INFORMATION  End of Foreign Deposit and Custodial Accounts Foreign 
						 Address-->	
				</div>
			</div>
			<!--PART I REPEATING INFORMATION  Line 8  End of Mailing Address-->
			<!--PART I REPEATING INFORMATION  Line 9  Start of City, State and Country-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">9</div>
				<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">
					City or town, province or state, and country (including postal code)
				</div>
				<div class="styLNDesc"  style="width:186mm;padding-top:1mm;padding-left:10mm;">
						<!--PART I REPEATING INFORMATION  Start of Foreign Deposit and Custodial Accounts US 
							 Address City, State, and Zip Code-->
							<xsl:if test="USAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="USAddress/City"/>
									<xsl:with-param name="BackupName">IRS8938FFA-RUSAddressCity</xsl:with-param>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="USAddress/State"/>
									<xsl:with-param name="BackupName">IRS8938FFA-RUSAddressState</xsl:with-param>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="USAddress/ZIPCode"/>
									<xsl:with-param name="BackupName">IRS8938FFA-RUSAddressZip</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
						<!--PART I REPEATING INFORMATION  End of Foreign Deposit and Custodial Accounts US 
							 Address City, State, and Zip Code-->	
							<xsl:if test="ForeignAddress">
						<!--PART I REPEATING INFORMATION  Start of Foreign Deposit and Custodial Accounts 
							 Foreign Address City, ProvinceOrState, PostalCode, and Country-->	
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/City"/>
									<xsl:with-param name="BackupName">IRS8938FFA-RForeignAddressCity</xsl:with-param>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrState"/>
									<xsl:with-param name="BackupName">IRS8938FFA-RForeignAddressProvinceOrState
									</xsl:with-param>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/PostalCode"/>
									<xsl:with-param name="BackupName">IRS8938FFA-RForeignAddressPostalCode
									</xsl:with-param>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/Country"/>
									<xsl:with-param name="BackupName">IRS8938FFA-RForeignAddressCountry
									</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
							<!--PART I REPEATING INFORMATION  End of  Foreign Deposit and Custodial Accounts
								 Foreign Address City, ProvinceOrState, PostalCode, and Country-->	
				</div>
			</div>
			<!--PART I REPEATING INFORMATION  Line 9  End of City, State and Country-->
			<!--PART I REPEATING INFORMATION  FOOTER-->
			<div class="pageEnd"  style="width:187mm;border-top:1px solid black;">
          <!--<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span> 
          <span style="width:116px;"></span>                      
          Cat. No. 37753A
          <span style="width:106px;"></span>  
          Form <span class="styBoldText" style="font-size:9pt">8938</span> (11-2012)-->
			</div> 
		</xsl:for-each>
	</xsl:if>
	<!--PART I REPEATING INFORMATION   End of Foreign Deposit and Custodial Accounts-->	
	
	<!--See Additional Table Message when Part I Repeating information for Foreign Deposit and Custodial
         Accounts is greater than 1 item-->		
    <xsl:if test="(count($FormData/ForeignFinclAccountGrp) &gt;= 2) and ($Print = $Separated)">
    <!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Start of Foreign Deposit and Custodial 
		 Accounts-->
		 <!--<xsl:for-each select="$FormData/ForeignFinclAccountGrp">-->
			<!-- PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  BEGIN TITLE -->
			<div class="styBB" style="width:187mm;">
				<div class="styPartName" style="font-size:9pt;padding-bottom:.5mm;font-family:arial">Part I</div>
				<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;float:left;clear:none;">
				  Foreign Deposit and Custodial Accounts<span style="font-weight:normal;"> (see instructions)</span>
				</div>
			</div>	
			<!-- PART I REPEATING ADDITIONAL TABLE MESSAGE  END TITLE --> 
			<div class="styBB" style="width:187mm;">
				<div  class="styLNDesc" style="width:187mm;">
				  If you have more than one account to report, attach a continuation sheet with the same information for
				  each additional account (see instructions).</div>
			</div>
			<div class="styBB" style="width:187mm;">
				<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Start of Type Of Account-->
				<div style="width:45mm;float:left;clear:none;">
					<div class="styLNLeftNumBox" style="padding-left:2mm;">1</div>
					<div class="styLNDesc" style="width:30mm;padding-left:2mm;">
						Type of account
					</div>
				</div>
				<div style="width:65mm;float:left;clear:none;">
				<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Start of  Deposit Account 
					 Type Ind-->	
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="DepositAccountTypeInd"/>
							<xsl:with-param name="BackupName">IRS8938FFA-ATMDepositAccountTypeInd
								<xsl:number value="position()"/></xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:5px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="DepositAccountTypeInd"/>
							<xsl:with-param name="BackupName">IRS8938FFA-ATMDepositAccountTypeInd
							<xsl:number value="position()"/></xsl:with-param>
						</xsl:call-template>
						Deposit 
					</label>
					<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  End of Deposit Account
					    Type Ind-->	
					<span style="width:8mm;"/>
					<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Start of Custodial Account 
						 Type Ind-->	
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="CustodialAccountTypeInd"/>
							<xsl:with-param name="BackupName">IRS8938FFA-ATMCustodialAccountTypeInd
							<xsl:number value="position()"/></xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:5px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="CustodialAccountTypeInd"/>
							<xsl:with-param name="BackupName">IRS8938FFA-ATMCustodialAccountTypeInd
							<xsl:number value="position()"/></xsl:with-param>
						</xsl:call-template>
						Custodial
					</label>
					<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  End of  Custodial Account 
						 Type Ind-->	
					<br/>
					<xsl:call-template name="PopulateAdditionalDataTableMessage">
						<xsl:with-param name="TargetNode" select="$FormData/ForeignFinclAccountGrp"/>
				    </xsl:call-template>
				</div>
				<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  End of Type Of Account-->
				<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Start of Identifying
					 Designation Number-->
				<div style="width:70mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 0px 0px 1px;">
					<div class="styLNLeftNumBox" style="width:5mm;text-align:center;float:left;
					  padding-bottom:0mm;">2</div>
					<div class="styLNDesc" style="width:64mm;padding-left:2mm;padding-bottom:0mm;">
							Account number or other designation
					</div>
					<div class="styLNDesc"  style="width:64mm;padding-left:5.5mm;padding-bottom:0mm;
					  padding-top:1mm;" valign="bottom">	
						<!--<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="IdentifyingDesignationNumber"/>
						</xsl:call-template>                        -->
					</div>
				</div>
				<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  End of  Identifying 
					 Designation Number-->
			</div> 
			<div class="styBB" style="width:187mm;">
				<div  style="width:187mm;">
					<div style="width:40mm;float:left;clear: none;">
						<div class="styLNLeftNumBox" style="padding-left:2mm;">3</div>
						<div class="styLNDesc" style="width:30mm;padding-left:2mm;float:left;">
							Check all that apply
						</div>
					</div>
					<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Start of Account Opened
						 During Tax Year Ind-->	
					<div  class="styLNDesc" style="width:60mm;"><b>a</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="AccountOpenedDuringTaxYearInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-ATMAccountOpenedDuringTaxYearInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="AccountOpenedDuringTaxYearInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-ATMAccountOpenedDuringTaxYearInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Account opened during tax year
						</label>
					</div>
					<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  End of Account Opened 
						 During Tax Year Ind-->
					<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Start of Account Closed 
						 During Tax Year Ind-->	
					<div  class="styLNDesc" style="width:85mm;"><b>b</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="AccountClosedDuringTaxYearInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-ATMAccountClosedDuringTaxYearInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="AccountClosedDuringTaxYearInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-ATMAccountClosedDuringTaxYearInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Account closed during tax year
						</label>
					</div>
					<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  End of Account Closed 
						 During Tax Year Ind-->
				</div>
				<div  style="width:187mm;">
					<div style="width:40mm;float:left;clear: none;"/>
					<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Start of Jointly Owned With 
						 Spouse Ind-->
					<div  class="styLNDesc" style="width:60mm;"><b>c</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-ATMJointlyOwnedWithSpouseInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-ATMJointlyOwnedWithSpouseInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Account jointly owned with spouse
						</label>
					</div>
					<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  End of Jointly Owned With 
						 Spouse Ind-->
					<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Start of No Tax Item 
						 Reported Ind-->
					<div  class="styLNDesc" style="width:87mm;"><b>d</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-ATMNoTaxItemReportedInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-ATMNoTaxItemReportedInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							No tax item reported in Part III with respect to this account
						</label>
					</div>
					<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  End of No Tax Item 
						 Reported Ind-->
				</div>
			</div>
			<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Line 4  Start of Max. Account 
				 Value During TY Amount-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">4</div>
				<div  class="styLNDesc" style="height:5mm;width:146mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">
					Maximum value of account during tax year
					<!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-right:1mm;">....................</span>$
				</div>
				<div class="styLNAmountBoxNB"  style="height:2mm;padding-top:.7mm;padding-bottom:0mm;"
				  valign="bottom">
					<!--<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="MaxAccountValueDurTYAmt"/>
					</xsl:call-template>                         -->
				</div>
			</div>
			<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  End of Line 4 Max. Account
				 Value During TY Amount-->
			<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Line 5 Start of Exchange Rate
				 Used Ind-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">5</div>
				<div  class="styLNDesc" style="height:5mm;width:179mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">
					Did you use a foreign currency exchange rate to convert the value of the account into U.S. dollars?
					<!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-right:1mm;">.....</span>
						<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Start of Exchange Rate
							 Used Ind "Yes"-->
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-ATMExchangeRateUsedInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabelYes">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-ATMExchangeRateUsedInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Yes
						</label>
						<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  End of Exchange Rate 
							Used Ind "Yes"-->
						<span style="width:10px;"/>
						<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Start of Exchange Rate
							 Used Ind "No"-->
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-ATMExchangeRateUsedInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-ATMExchangeRateUsedInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							No
						</label>
						<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  End of Exchange Rate
							 Used Ind "No"-->
				</div>
			</div>
			<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Line 5  End of  Exchange Rate
				 Used Ind-->
			<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Line 6  Start of If you answered 
				yes to line 5, complete all that apply-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">6</div>
				<div  class="styLNDesc" style="height:5mm;width:179mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">
					If you answered “Yes” to line 5, complete all that apply.
				</div>
			</div>
			<div class="styBB" style="width:187mm;">
				<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Start of Foreign Currency
					 Description Text-->
				<div style="width:60mm;float:left;clear:none;">
					<div class="styLNDesc" style="width:55mm;padding-left:10mm;">
							<b>(1) </b> Foreign currency in which<br/> account is maintained
					</div>
					<div class="styLNDesc"  style="width:55mm;padding-top:1mm;padding-left:9mm;" valign="bottom">	
						<!--<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignCurrencyDescTxt"/>
							<xsl:with-param name="BackupName">IRS8938FFA-ATMForeignCurrencyDescTxt
							</xsl:with-param>
						</xsl:call-template>                         -->
					</div>
				</div>
				<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  End of Foreign Currency
					 Description Text-->
				<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Start of Exchange Rate Used-->
				<div style="width:63mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 1px 0px 1px;">
					<div class="styLNDesc" style="width:61mm;padding-left:2mm;padding-bottom:2mm;">
							<b>(2) </b> Foreign currency exchange rate used to convert to U.S. dollars
					</div>
					<div class="styLNDesc"  style="width:61mm;padding-top:1mm;text-align:right" valign="bottom">	
						<!--<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="ExchangeRateUsed"/>
							<xsl:with-param name="BackupName">IRS8938FFA-ATMExchangeRateUsed</xsl:with-param>
						</xsl:call-template>                         -->
					</div>
				</div>
				<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  End of Exchange Rate Used-->
				<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Start of Source Of Exchange 
					 Rate Used Text-->
				<div style="width:64mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 0px 0px 0px;">
					<div class="styLNDesc" style="width:62mm;padding-left:2mm;padding-bottom:2mm;">
							<b>(3) </b> Source of exchange rate used if not from U.S. Treasury Financial Management Service
					</div>
					<div class="styLNDesc"  style="width:62mm;padding-top:1mm;" valign="bottom">	
						<!--xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="SourceOfExchangeRateUsedTxt"/>
							<xsl:with-param name="BackupName">IRS8938FFA-ATMSourceOfExchangeRateUsedTxt
							</xsl:with-param>
						</xsl:call-template>                         -->
					</div>
				</div>
				<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  End of Source Of Exchange
					 Rate Used Text-->
			</div>
			<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Line 6  End of If you 
				 answered	yes to line 5, complete all that apply-->
			<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Line 7  Start of Foreign Deposit
				 and Custodial Accounts Business Name-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">7</div>
				<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">
					Name of financial institution in which account is maintained
				</div>
				<div class="styLNDesc"  style="width:186mm;padding-top:1mm;padding-left:10mm;" valign="bottom">	
					<!--<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
					</xsl:call-template>
					<xsl:if test="BusinessName/BusinessNameLine2">
						<br/>	
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
						</xsl:call-template>
					</xsl:if>-->
				</div>
			</div>
			<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Line 7  End of Foreign Deposit
				 and Custodial Accounts Business Name-->
			<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Line 8  Mailing Address-->	
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">8</div>
				<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">
					Mailing address of financial institution in which account is maintained. Number, street, and room or
					suite no.
				</div>
				<div class="styLNDesc"  style="width:62mm;padding-top:1mm;padding-left:10mm;"  valign="bottom">
					<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Start of Foreign Deposit 
						and Custodial Accounts US Address-->	
						<xsl:if test="USAddress">
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="USAddress/AddressLine1"/>
								<xsl:with-param name="BackupName">IRS8938FFA-ATMUSAddressLine1</xsl:with-param>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="USAddress/AddressLine2"/>
								<xsl:with-param name="BackupName">IRS8938FFA-ATMUSAddressLine2</xsl:with-param>
							</xsl:call-template>-->
						</xsl:if>
					<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  End of Foreign Deposit and 
						 Custodial Accounts US Address-->
					<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Start of Foreign Deposit 
						 and Custodial Accounts Foreign Address-->	
						<xsl:if test="ForeignAddress">
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1"/>
								<xsl:with-param name="BackupName">IRS8938FFA-ATMForeignAddressLine1
								</xsl:with-param>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2"/>
								<xsl:with-param name="BackupName">IRS8938FFA-ATMForeignAddressLine2
								</xsl:with-param>
							</xsl:call-template>-->
						</xsl:if>
					<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  End of Foreign Deposit and 
						 Custodial Accounts Foreign Address-->	
				</div>
			</div>
			<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Line 8  End of Mailing Address-->
			<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Line 9  Start of City, State and 
				 Country-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">9</div>
				<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">
					City or town, province or state, and country (including postal code)
				</div>
				<div class="styLNDesc"  style="width:186mm;padding-top:1mm;padding-left:10mm;">
						<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Start of Foreign Deposit 
							 and Custodial Accounts US Address City, State, and Zip Code-->
							<xsl:if test="USAddress">
								<!--<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="USAddress/City"/>
									<xsl:with-param name="BackupName">IRS8938FFA-ATMUSAddressCity</xsl:with-param>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="USAddress/State"/>
									<xsl:with-param name="BackupName">IRS8938FFA-ATMUSAddressState</xsl:with-param>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="USAddress/ZIPCode"/>
									<xsl:with-param name="BackupName">IRS8938FFA-ATMUSAddressZip</xsl:with-param>
								</xsl:call-template>-->
							</xsl:if>
						<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  End of Foreign Deposit
							 and Custodial Accounts US Address City, State, and Zip Code-->	
							<xsl:if test="ForeignAddress">
						<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Start of Foreign Deposit 
							 and Custodial Accounts Foreign Address City, ProvinceOrState, PostalCode, and Country-->	
								<!--<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/City"/>
									<xsl:with-param name="BackupName">IRS8938FFA-ATMForeignAddressCity
									</xsl:with-param>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrState"/>
									<xsl:with-param name="BackupName">IRS8938FFA-ATMForeignAddressProvinceOrState
									</xsl:with-param>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/PostalCode"/>
									<xsl:with-param name="BackupName">IRS8938FFA-ATMForeignAddressPostalCode
									</xsl:with-param>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/Country"/>
									<xsl:with-param name="BackupName">IRS8938FFA-ATMForeignAddressCountry
									</xsl:with-param>
								</xsl:call-template>-->
							</xsl:if>
							<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  End of Foreign
								 Deposit and Custodial Accounts Foreign Address City, ProvinceOrState, PostalCode, and
								 Country-->	
				</div>
			</div>
			<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  Line 9  End of City, State and
				 Country-->
			<!-- PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE  FOOTER-->
			<!--<div class="pageEnd"  style="width:187mm;border-top:1px solid black;">-->
          <!--<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span> 
          <span style="width:116px;"></span>                      
          Cat. No. 37753A
          <span style="width:106px;"></span>  
          Form <span class="styBoldText" style="font-size:9pt">8938</span> (11-2012)-->
			<!--</div>--> 
		<!--</xsl:for-each>-->
	</xsl:if>
	<!--PART I REPEATING INFORMATION ADDITIONAL TABLE MESSAGE   End of Foreign Deposit and Custodial 
		 Accounts-->	

         
	<!--PART II  Start of Other Foreign Assets Lines 1 thru 5-->	
	<xsl:if test="(count($FormData/OtherForeignAssetGrp) &lt;=1)">
		<!-- PART II  BEGIN TITLE -->
		<div class="styBB" style="width:187mm;">
			<div class="styPartName" style="font-size:9pt;padding-bottom:.5mm;font-family:arial">Part II</div>
			<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;float:left;clear:none;">
			  Other Foreign Assets<span style="font-weight:normal;"> (see instructions)</span></div>
		</div>
		<!-- PART II  END TITLE -->  
		<div class="styBB" style="width:187mm;">
			<div  class="styLNDesc" style="width:187mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">
				<b>Note.</b><i> If you reported specified foreign financial assets on Forms 3520, 3520-A, 5471, 8621,
				 8865, or 8891 you do not have to include<br/>the assets on Form 8938. You must complete Part IV. See
				 instructions.</i></div>	
		</div>
		<div class="styBB" style="width:187mm;">
			<div  class="styLNDesc" style="width:187mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">
			  If you have more than one asset to report, attach a continuation sheet with the same information for each
			  additional asset (see instructions).</div>	
		</div>
		<div class="styBB" style="width:187mm;">
				<!--PART II  Line 1  Start of Asset Description-->
				<div style="width:110mm;float:left;clear:none;">
					<div style="width:70mm;float:left;clear:none;">
						<div class="styLNLeftNumBox"  style="padding-left:2mm;">1</div>
						<div class="styLNDesc" style="width:30mm;padding-left:2mm;">
							Description of asset
						</div>
					</div>	
					<div class="styLNDesc" style="width:110mm;padding-left:8.5mm;float:left;clear:none;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode"
								  select="$FormData/OtherForeignAssetGrp/AssetDescription"/>
								<xsl:with-param name="BackupName">IRS8938OFAAssetDescription</xsl:with-param>
							</xsl:call-template>                         
					</div>
				</div>
				<!--PART II  Line 1  End of Asset Description-->
				<!--PART II  Line 2  Start of Identifying Designation Number-->
				<div style="width:70mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 0px 0px 1px;">
					<div class="styLNLeftNumBox" style="width:5mm;text-align:center;float:left;padding-bottom:0mm;">
					  2</div>
					<div class="styLNDesc" style="width:64mm;padding-left:2mm;padding-bottom:0mm;">
							Identifying number or other designation
					</div>
					<div class="styLNDesc"  style="width:69mm;padding-left:5.5mm;padding-top:1mm;" valign="bottom">
						<xsl:choose>
							<xsl:when test="$FormData/OtherForeignAssetGrp/IdentifyingDesignationNumber">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" 
							  select="$FormData/OtherForeignAssetGrp/IdentifyingDesignationNumber"/>
									<xsl:with-param name="BackupName">IRS8938OFAIdentifyingDesignationNumber
									</xsl:with-param>
								</xsl:call-template>                        
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" 
							  select="$FormData/OtherForeignAssetGrp/BankAccountNumber"/>
									<xsl:with-param name="BackupName">IRS8938OFABankAccountNumber
									</xsl:with-param>
								</xsl:call-template>                        
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
				<!--PART II  Line 2  End of Identifying Designation Number-->
			</div> 
			<!--PART II  Line 3  Start of Complete all that apply-->
			<div class="styBB" style="width:187mm;">	
				<div style="width:187mm;float:left;clear:none;">
					<div class="styLNLeftNumBox"  style="padding-left:2mm;">3</div>
					<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
						Complete all that apply. See instructions for reporting of multiple acquisition or disposition dates.
					</div>
				</div>	
				<div style="width:187mm;">
					<!--PART II  Line 3a  Start of Date Acquired-->
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">a</div>
					<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
						Date asset acquired during tax year, if applicable
					<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">....................</span>
					</div>
					<div class="styFixedUnderline" style="height:4mm;padding-left:2mm;">
						<xsl:call-template name="PopulateMonth">
							<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/DateAcquired"/>
							<xsl:with-param name="BackupName">IRS8938OFADateAcquiredMonth</xsl:with-param>
						</xsl:call-template>               
						<xsl:call-template name="PopulateDay">
							<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/DateAcquired"/>
							<xsl:with-param name="BackupName">IRS8938OFADateAcquiredDay</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/DateAcquired"/>
							<xsl:with-param name="BackupName">IRS8938OFADateAcquiredYear</xsl:with-param>
						</xsl:call-template>
					</div>
					<!--PART II  Line 3a  End of Date Acquired-->
				</div>	
				<div style="width:187mm;">
					<!--PART II  Line 3b  Start of Disposed Of Date-->
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">b</div>
					<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
						Date asset disposed of during tax year, if applicable
					<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">...................</span>
					</div>
					<div class="styFixedUnderline" style="height:4mm;padding-left:2mm;">
						<xsl:call-template name="PopulateMonth">
							<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/DisposedOfDt"/>
							<xsl:with-param name="BackupName">IRS8938OFADisposedOfDtMonth</xsl:with-param>
						</xsl:call-template>                
						<xsl:call-template name="PopulateDay">
							<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/DisposedOfDt"/>
							<xsl:with-param name="BackupName">IRS8938OFADisposedOfDtDay</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/DisposedOfDt"/>
							<xsl:with-param name="BackupName">IRS8938OFADisposedOfDtYear</xsl:with-param>
						</xsl:call-template>
					</div>
					<!--PART II  Line 3b  End of Disposed Of Date-->
				</div>	
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">c</div>
					<div class="styLNDesc" style="width:80mm">
						<!--PART II  Line 3c  Start of Jointly Owned With Spouse Ind-->
						<span style="width:2mm"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode"
								  select="$FormData/OtherForeignAssetGrp/JointlyOwnedWithSpouseInd"/>
								<xsl:with-param name="BackupName">IRS8938OFAJointlyOwnedWithSpouseInd
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode"
								  select="$FormData/OtherForeignAssetGrp/JointlyOwnedWithSpouseInd"/>
								<xsl:with-param name="BackupName">IRS8938OFAJointlyOwnedWithSpouseInd
								</xsl:with-param>
							</xsl:call-template>
							Check if asset jointly owned with spouse
						</label>
					</div>
					<!--PART II  Line 3c  End of Jointly Owned With Spouse Ind-->
					<!--PART II  Line 3d  Start of No Tax Item Reported Ind-->
					<div class="styLNDesc" style="width:99mm;padding-left:2mm;"><b>d</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode"
								  select="$FormData/OtherForeignAssetGrp/NoTaxItemReportedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFANoTaxItemReportedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode"
								  select="$FormData/OtherForeignAssetGrp/NoTaxItemReportedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFANoTaxItemReportedInd</xsl:with-param>
							</xsl:call-template>
							Check if no tax item reported in Part III with respect to this asset
						</label>
					</div>
					<!--PART II  Line 3d  End of No Tax Item Reported Ind-->
				</div>	
			</div>
			<!--PART II  Line 3  End of Complete all that apply-->
			<!--PART II  Line 4  Start of Maximum value of asset during tax year-->
			<div class="styBB" style="width:187mm;">	
				<div style="width:187mm;float:left;clear:none;">
					<div class="styLNLeftNumBox"  style="padding-left:2mm;">4</div>
					<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
						Maximum value of asset during tax year (check box that applies)
					</div>
				</div>	
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">a</div>
					<div class="styLNDesc" style="width:35mm;padding-left:2mm;">
						<!--PART II  Line 4a  Start of Max. Value During TY 0 To 50000 Ind-->
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode"
								  select="$FormData/OtherForeignAssetGrp/MaxValueDuringTY0To50000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFAMaxValueDuringTY0To50000Ind
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode"
								  select="$FormData/OtherForeignAssetGrp/MaxValueDuringTY0To50000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFAMaxValueDuringTY0To50000Ind
								</xsl:with-param>
							</xsl:call-template>
							$0 - $50,000
						</label>
						<!--PART II  Line 4a  End of Max. Value During TY 0 To 50000 Ind-->
					</div>
					<div class="styLNDesc" style="width:45mm;padding-left:2mm;"><b>b</b>
						<span style="width:5px;"/>
						<!--PART II  Line 4b  Start of Max. Value During TY 50001 To 100000 Ind-->
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode"
								  select="$FormData/OtherForeignAssetGrp/MaxValueDurTY50001To100000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFAMaxValueDurTY50001To100000Ind
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode"
								  select="$FormData/OtherForeignAssetGrp/MaxValueDurTY50001To100000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFAMaxValueDurTY50001To100000Ind
								</xsl:with-param>
							</xsl:call-template>
							$50,001 - $100,000
						</label>
						<!--PART II  Line 4b  End of Max. Value During TY 50001 To 100000 Ind-->
					</div>
					<div class="styLNDesc" style="width:50mm;padding-left:2mm;"><b>c</b>
						<span style="width:5px;"/>
						<!--PART II  Line 4c  Start of Max. Value During TY 100001 To 150000 Ind-->
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode"
								  select="$FormData/OtherForeignAssetGrp/MaxValueDurTY100001To150000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFAMaxValueDurTY100001To150000Ind
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode"
								  select="$FormData/OtherForeignAssetGrp/MaxValueDurTY100001To150000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFAMaxValueDurTY100001To150000Ind
								</xsl:with-param>
							</xsl:call-template>
							$100,001 - $150,000
						</label>
						<!--PART II  Line 4c  End of Max. Value During TY 100001 To 150000 Ind-->
					</div>
					<div class="styLNDesc" style="width:45mm;padding-left:2mm;"><b>d</b>
						<span style="width:5px;"/>
						<!--PART II  Line 4d  Start of Max. Value During TY 150001 To 200000 Ind-->
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode"
								  select="$FormData/OtherForeignAssetGrp/MaxValueDurTY150001To200000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFAMaxValueDurTY150001To200000Ind
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode"
								  select="$FormData/OtherForeignAssetGrp/MaxValueDurTY150001To200000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFAMaxValueDurTY150001To200000Ind
								</xsl:with-param>
							</xsl:call-template>
							$150,001 - $200,000
						</label> 
						<!-- PART II  Line 4d  End of Max. Value During TY 150001 To 200000 Ind-->
					</div>
				</div>
				<!--PART II  Line 4e  Satrt of Max. Value During TY More Max. Amount-->
				<div style="width:187mm;">		    
					<div class="styLNLeftNumBox" style="height:2mm;padding-left:4mm;padding-top:0mm;
					  padding-bottom:0mm;">e</div>
					<div  class="styLNDesc" style="height:2mm;width:146mm;padding-left:2mm;padding-top:0mm;
					  padding-bottom:0mm;">
						If more than $200,000, list value
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-right:1mm;">.......................</span>$
					</div>
					<div class="styLNAmountBoxNB"  style="height:2mm;padding-top:0mm;padding-bottom:0mm;"
					  valign="bottom">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode"
							  select="$FormData/OtherForeignAssetGrp/MaxValueDurTYMoreMaxAmt"/>
							<xsl:with-param name="BackupName">IRS8938OFAMaxValueDurTYMoreMaxAmt
							</xsl:with-param>
						</xsl:call-template>                         
					</div>
				</div>
				<!-- PART II  Line 4e  End of Max. Value During TY More Max. Amount-->	
			</div>
			<!--PART II  Line 5  Start of Did you use a foreign currency exchange rate to convert the value-->
			<div style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">5</div>
				<div  class="styLNDesc" style="height:5mm;width:179mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">
					Did you use a foreign currency exchange rate to convert the value of the asset into U.S. dollars?
					<!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-right:1mm;">......</span>
						<!--PART II  Line 5  Start of Exchange Rate Used Ind "Yes"-->
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode"
								  select="$FormData/OtherForeignAssetGrp/ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFAExchangeRateUsedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabelYes">
								<xsl:with-param name="TargetNode"
								  select="$FormData/OtherForeignAssetGrp/ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFAExchangeRateUsedInd</xsl:with-param>
							</xsl:call-template>
							Yes
						</label>
						<!--PART II  Line 5  End of Exchange Rate Used Ind "Yes"-->
						<span style="width:5px;"/>
						<!--PART II  Line 5  Start of Exchange Rate Used Ind "No"-->
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode"
								  select="$FormData/OtherForeignAssetGrp/ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFAExchangeRateUsedInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode"
								  select="$FormData/OtherForeignAssetGrp/ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFAExchangeRateUsedInd</xsl:with-param>
							</xsl:call-template>
							No
						</label>
						<!--PART II  Line 5  End of Exchange Rate Used Ind "No"-->
				</div>
			</div>
			<!--PART II  FOOTER-->
        <div class="pageEnd"  style="width:187mm;border-top:1px solid black;">
          <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span> 
          <span style="width:116px;"></span>                      
          Cat. No. 37753A
          <span style="width:106px;"></span>  
          Form <span class="styBoldText" style="font-size:9pt">8938</span> (11-2012)
        </div> 
    <!--Begin Page 2 -->
	<!-- Page Header -->
		<div class="styBB" style="width:187mm;">
			<div style="float:left;">Form 8938 (11-2012)<span style="width:145mm;"/></div>
			<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>
		</div>
	<!-- END Page Header -->    
	
	<!--PART II  Line 5  End of Did you use a foreign currency exchange rate to convert the value-->
	
	<!--PART II  Start of Other Foreign Assets (Continued)-->
	<xsl:if test="(count($FormData/OtherForeignAssetGrp) &lt;=1)">
		<!--<xsl:for-each select="$FormData/OtherForeignAssetGrp">-->
			<div class="styBB" style="width:187mm;">
				<div class="styPartName" style="font-size:9pt;padding-bottom:.5mm;font-family:arial">Part II</div>
				<div class="styPartDesc" style="width:164mm;font-size:9pt;padding-left:3mm;float:left; clear:none">
				  Other Foreign Assets<span style="font-weight:normal;"> (continued)</span></div>
			</div>
			<!--PART II  Line 6  Start of If you answered "Yes" to line 5, complete all that apply-->		
			<div style="width:187mm;float:left;clear:none;border-style:solid;border-color:black;
			  border-width: 0px 0px 1px 0px;">
				<div class="styLNLeftNumBox"  style="padding-left:2mm;padding-top:.7mm;height:5mm">6</div>
				<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;padding-top:.7mm;height:5mm">
					If you answered “Yes” to line 5, complete all that apply.
				</div>
			</div>	
			<div class="styBB" style="width:187mm;">
				<!--PART II  Line 6(1)  Start of Foreign Currency Description Text-->
				<div style="width:60mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 1px 0px 0px;">
					<div class="styLNDesc" style="width:55mm;padding-left:10mm;padding-bottom:2mm;">
							<b>(1) </b> Foreign currency in which<br/> asset is denominated
					</div>
					<div class="styLNDesc"  style="width:55mm;padding-top:1mm;padding-left:8.5mm;" valign="bottom">	
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode"
							  select="$FormData/OtherForeignAssetGrp/ForeignCurrencyDescTxt"/>
							<xsl:with-param name="BackupName">IRS8938OFAForeignCurrencyDescTxt</xsl:with-param>
						</xsl:call-template>                         
					</div>
				</div>
				<!--PART II  Line 6(1)  End of Foreign Currency Description Text-->
				<!--PART II  Line 6(2)  Start of Exchange Rate Used-->
				<div style="width:63mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 0px 0px 0px;">
					<div class="styLNDesc" style="width:61mm;padding-left:2mm;padding-bottom:2mm;">
							<b>(2) </b> Foreign currency exchange rate used to convert to U.S. dollars
					</div>
					<div class="styLNDesc"  style="width:61mm;padding-top:1mm;padding-left:.8mm;text-align:right"
					  valign="bottom">	
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode"
							  select="$FormData/OtherForeignAssetGrp/ExchangeRateUsed"/>
							<xsl:with-param name="BackupName">IRS8938OFAExchangeRateUsed</xsl:with-param>
						</xsl:call-template>                       
					</div>
				</div>
				<!--PART II  Line 6(2)  End of Exchange Rate Used-->
				<!--PART II  Line 6(3)  Start of Source  Of Exchange Rate Used Text-->
				<div style="width:64mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 0px 0px 1px;">
					<div class="styLNDesc" style="width:62mm;padding-left:2mm;padding-bottom:2mm;">
							<b>(3) </b> Source of exchange rate used if not from U.S. Treasury Financial Management Service
					</div>
					<div class="styLNDesc"  style="width:62mm;padding-top:1mm;" valign="bottom">	
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode"
							  select="$FormData/OtherForeignAssetGrp/SourceOfExchangeRateUsedTxt"/>
							<xsl:with-param name="BackupName">IRS8938OFASourceOfExchangeRateUsedTxt
							</xsl:with-param>
						</xsl:call-template>                         
					</div>
				</div>
			</div>
			<!--PART II  Line 6(3)  End of Source Of Exchange Rate Used Text-->
			<!--PART II  Line 7 Report information-->
			<!--<xsl:for-each select="$FormData/AssetIsStockOfForeignEntityGrp">-->
			<div  style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:2mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">7</div>
				<div  class="styLNDesc" style="height:2mm;width:179mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">If asset reported in Part II, line 1, is stock of a foreign entity or an interest in a
				  foreign entity, report the following information.
				</div>
			</div>
			<!--PART II  Line 7a  Start of Name of Foreign Entity-->
			<div style="width:187mm;">
				<div class="styLNLeftLtrBox"  style="padding-left:4mm;">a</div>
				<div class="styLNDesc" style="width:32mm;padding-left:2mm;">
					Name of foreign entity
				</div>
				<div class="styFixedUnderline" style="width:147mm;padding-left:2mm;">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/NameOfEntity"/>
					</xsl:call-template>                   
				</div>
			</div>
			<!--PART II  Line 7a  End of Name of Foreign Entity-->
			<!--PART II  Line 7b  Start of Type of Foreign Entity-->	
			<div style="width:187mm;">
				<div class="styLNLeftLtrBox"  style="padding-left:4mm;">b</div>
				<div class="styLNDesc" style="width:50mm;padding-left:2mm;">Type of foreign entity</div>
				<!--PART II  Line 7b (1)  Start of Partnership-->
				<div  class="styLNDesc" style="width:35mm;"><b>(1)</b>
					<span style="width:5px;"/>
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/PartnershipInd"/>
							<xsl:with-param name="BackupName">IRS8938OFAPartnershipInd</xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:5px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/PartnershipInd"/>
							<xsl:with-param name="BackupName">IRS8938OFAPartnershipInd</xsl:with-param>
						</xsl:call-template>
						Partnership
					</label>
					<span style="width:5px;"/>
				</div>
				<!--PART II  Line 7b (1)  End of Partnership-->
				<!--PART II  Line 7b (2)  Start of Corporation-->
				<div  class="styLNDesc" style="width:35mm;"><b>(2)</b>
					<span style="width:5px;"/>
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/CorporationInd"/>
							<xsl:with-param name="BackupName">IRS8938OFACorporationInd</xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:5px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/CorporationInd"/>
							<xsl:with-param name="BackupName">IRS8938OFACorporationInd</xsl:with-param>
						</xsl:call-template>
						Corporation 
					</label>
					<span style="width:5px;"/>
				</div>
				<!--PART II  Line 7b (2)  End of Corporation-->
				<!--PART II  Line 7b (3)  Start of Trust-->
				<div  class="styLNDesc" style="width:35mm;"><b>(3)</b>
					<span style="width:5px;"/>
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/TrustInd"/>
							<xsl:with-param name="BackupName">IRS8938OFATrustInd</xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:5px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/TrustInd"/>
							<xsl:with-param name="BackupName">IRS8938OFATrustInd</xsl:with-param>
						</xsl:call-template>
						Trust 
					</label>
					<span style="width:5px;"/>
				</div>
				<!--PART II  Line 7b (3)  End of Trust-->
				<!--PART II  Line 7b (4)  Start of Estate-->
				<div  class="styLNDesc" style="width:20mm;"><b>(4)</b>
					<span style="width:5px;"/>
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/EstateInd"/>
							<xsl:with-param name="BackupName">IRS8938OFAEstateInd</xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:5px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp/EstateInd"/>
							<xsl:with-param name="BackupName">IRS8938OFAEstateInd</xsl:with-param>
						</xsl:call-template>
						Estate 
					</label>
				</div>
			</div>
			<!--PART II  Line 7b (4)  End of Estate-->
			<!--PART II  Line 7c  Start of Mailing Address-->
			<div style="width:187mm;">
				<div class="styLNLeftLtrBox"  style="padding-left:4mm;">c</div>
				<div  class="styLNDesc" style="height:2mm;width:179mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">
					Mailing address of foreign entity. Number, street, and room or suite no.
				</div>
				<div  class="styFixedUnderline" style="height:2mm;width:179mm;padding-left:2mm;padding-top:1mm;
				  padding-bottom:0mm;">
					<xsl:if test="$FormData/OtherForeignAssetGrp/USAddress">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode"
							  select="$FormData/OtherForeignAssetGrp/USAddress/AddressLine1"/>
							<xsl:with-param name="BackupName">IRS8938OFAUSAddressLine1</xsl:with-param>
						</xsl:call-template><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode"
							  select="$FormData/OtherForeignAssetGrp/USAddress/AddressLine2"/>
							<xsl:with-param name="BackupName">IRS8938OFAUSAddressLine2</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$FormData/OtherForeignAssetGrp/ForeignAddress">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode"
							  select="$FormData/OtherForeignAssetGrp/ForeignAddress/AddressLine1"/>
							<xsl:with-param name="BackupName">IRS8938OFAForeignAddressLine1</xsl:with-param>
						</xsl:call-template><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode"
							  select="$FormData/OtherForeignAssetGrp/ForeignAddress/AddressLine2"/>
							<xsl:with-param name="BackupName">IRS8938OFAForeignAddressLine2</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
				</div>
			</div>
			<!--PART II  Line 7c  End of Mailing Address-->
			<!--PART II  Line 7d  Start of City, State and country-->
			<div style="width:187mm;border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
				<div class="styLNLeftLtrBox"  style="padding-left:4mm;">d</div>
				<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-bottom:0mm;">
					City or town, province or state, and country (including postal code)
				</div>
				<div class="styLNDesc"  style="width:186mm;padding-left:10mm;">	
							<xsl:if test="$FormData/OtherForeignAssetGrp/USAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode"
									  select="$FormData/OtherForeignAssetGrp/USAddress/City"/>
									<xsl:with-param name="BackupName">IRS8938OFAUSAddressCity</xsl:with-param>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode"
									  select="$FormData/OtherForeignAssetGrp/USAddress/State"/>
									<xsl:with-param name="BackupName">IRS8938OFAUSAddressState</xsl:with-param>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode"
									  select="$FormData/OtherForeignAssetGrp/USAddress/ZIPCode"/>
									<xsl:with-param name="BackupName">IRS8938OFAUSAddressZIP</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$FormData/OtherForeignAssetGrp/ForeignAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode"
									  select="$FormData/OtherForeignAssetGrp/ForeignAddress/City"/>
									<xsl:with-param name="BackupName">IRS8938OFAForeignAddressCity
									</xsl:with-param>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode"
									  select="$FormData/OtherForeignAssetGrp/ForeignAddress/ProvinceOrState"/>
									<xsl:with-param name="BackupName">IRS8938OFAForeignAddressProvinceOrState
									</xsl:with-param>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode"
									  select="$FormData/OtherForeignAssetGrp/ForeignAddress/PostalCode"/>
									<xsl:with-param name="BackupName">IRS8938OFAForeignAddressZip
									</xsl:with-param>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode"
									  select="$FormData/OtherForeignAssetGrp/ForeignAddress/Country"/>
									<xsl:with-param name="BackupName">IRS8938OFAForeignAddressCountry
									</xsl:with-param>
								</xsl:call-template>
							</xsl:if>
				</div>
			</div>
			<!--PART II  Line 7d  Start of City, State and country-->
			<!--PART II  Line 8a - 8e  START of Report information of Asset Not Stock of Foreign Ent Grp = 0--> 
			<xsl:if test="(count($FormData/OtherForeignAssetGrp/AssetNotStockOfForeignEntGrp) &lt;1)">
			<!--<xsl:for-each select="$FormData/OtherForeignAssetGrp/AssetNotStockOfForeignEntGrp">-->
				<div  style="width:187mm;">
					<div class="styLNLeftNumBox" style="height:2mm;padding-left:2mm;padding-top:0mm;
					  padding-bottom:0mm;">8</div>
					<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-top:0mm;
					  padding-bottom:1mm;">
				      If asset reported in Part II, line 1, is not stock of a foreign entity or an interest in a foreign entity, enter
					  the following information for the asset.
					</div>
					<div  class="styLNDesc" style="width:179mm;padding-left:10mm;padding-top:0mm;
					  padding-bottom:0mm;">
						<b>Note.</b> If this asset has more than one issuer or counterparty, attach a continuation sheet with
						 the same information for each additional issuer or counterparty (see instructions).
					</div>
				</div><br/>
				<!--PART II  Line 8a  Start of Name of Issuer-->
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">a</div>
					<div class="styLNDesc" style="width:45mm;padding-left:2mm;">
					  Name of issuer or counterparty
					</div>
					<div class="styFixedUnderline" style="width:133mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
						</xsl:call-template>
						<xsl:if test="BusinessName/BusinessNameLine2">
							<br/>	
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
							</xsl:call-template>
						</xsl:if>
					</div>
				</div>
				<!--PART II  Line 8a  End of Name of Issuer-->	
				<!--PART II  Line 8a  Start of Check if information is for Issuer or Counterparty-->
				<div  style="width:187mm;padding-left:10mm;">
					<div class="styLNDesc" style="width:50.5mm;">Check if information is for</div>
					<div class="styLNDesc" style="width:35mm;">
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="IssuerInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ANSIssuerInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="IssuerInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ANSIssuerInd</xsl:with-param>
							</xsl:call-template>
							Issuer
						</label>
					</div>
					<div class="styLNDesc" style="width:35.5mm;">
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ANSCounterpartyInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ANSCounterpartyInd</xsl:with-param>
							</xsl:call-template>
							Counterparty
						</label>
					</div>
				</div><br/>
				<!--PART II  Line 8b  Start of Type of Issuer or counterparty-->
				<div  style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">b</div>
					<div class="styLNDesc" style="width:179mm;padding-left:2mm;">Type of issuer or counterparty</div>
				</div>	
				<!--PART II  Line 8b (1)  Start of Individual-->
				<div class="styLNDesc" style="width:187mm;padding-left:10mm;">
					<div  class="styLNDesc" style="width:47.3mm;"><b>(1)</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="IndividualInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ANSIndividualInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="IndividualInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ANSIndividualInd</xsl:with-param>
							</xsl:call-template>
							Individual
						</label>
					</div>
					<!--PART II  Line 8b (1)  End of Individual-->
					<!--PART II  Line 8b (2)  Start of Partnership-->
					<div  class="styLNDesc" style="width:32.5mm;"><b>(2)</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="PartnershipInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ANSPartnershipInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="PartnershipInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ANSPartnershipInd</xsl:with-param>
							</xsl:call-template>
							Partnership
						</label>
					</div>
					<!--PART II  Line 8b (2)  End of Partnership-->
					<!--PART II  Line 8b (3)  Start of Corporation-->
					<div  class="styLNDesc" style="width:35mm;"><b>(3)</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="CorporationInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ANSCorporationInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="CorporationInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ANSCorporationInd</xsl:with-param>
							</xsl:call-template>
							Corporation 
						</label>
					</div>
					<!--PART II  Line 8b (3)  End of Corporation-->
					<!--PART II  Line 8b (4)  Start of Trust-->
					<div  class="styLNDesc" style="width:37mm;"><b>(4)</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="TrustInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ANSTrustInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="TrustInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ANSTrustInd</xsl:with-param>
							</xsl:call-template>
							Trust 
						</label>
					</div>
					<!--PART II  Line 8b (5)  Start of Estate-->
					<div  class="styLNDesc" style="width:20mm;"><b>(5)</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="EstateInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ANSEstateInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="EstateInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ANSEstateInd</xsl:with-param>
							</xsl:call-template>
							Estate 
						</label>
					</div>
				</div><br/><br/>
				<!--PART II  Line 8b (5)  End of Estate-->
				<!--PART II  Line 8c  Start of Check if Issuer or Counterparty is US or Foreign-->
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">c</div>
					<div class="styLNDesc" style="width:55mm;padding-left:2mm;">Check if issuer or counterparty is a
					</div>
					<div class="styLNDesc" style="width:30.5mm;">	
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="USPersonInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ANSUSPersonInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="USPersonInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ANSUSPersonInd</xsl:with-param>
							</xsl:call-template>
							U.S. person
						</label>
					</div>	
					<div class="styLNDesc" style="width:40mm;padding-left:2mm;">
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="ForeignPersonInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ANSForeignPersonInd</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="ForeignPersonInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ANSForeignPersonInd</xsl:with-param>
							</xsl:call-template>
							Foreign person
						</label>
					</div>	
				</div><br/>
				<!--PART II  Line 8c  End of Check if Issuer or Counterparty is US or Foreign-->	
				<!--PART II  Line 8d  Start of Mailing Address-->	
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">d</div>
					<div  class="styLNDesc" style="height:2mm;width:179mm;padding-left:2mm;padding-top:0mm;
					  padding-bottom:0mm;">
					  Mailing address of issuer or counterparty. Number, street, and room or suite no.
					</div>
					<div  class="styFixedUnderline" style="height:2mm;width:179mm;padding-left:2mm;padding-top:1mm;
					  padding-bottom:0mm;">
						<xsl:if test="USAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="USAddress/AddressLine1"/>
							</xsl:call-template>
							<xsl:if test="USAddress/AddressLine2">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="USAddress/AddressLine2"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:if>
						<xsl:if test="ForeignAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1"/>
							</xsl:call-template>
							<xsl:if test="ForeignAddress/AddressLine2">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:if>
					</div>
				</div>
				<!--PART II  Line 8d  End of Mailing Address-->
				<!--PART II  Line 8e  Start of City, State or Country-->	
				<div style="width:187mm;border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">e</div>
					<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-bottom:0mm;">
					  City or town, province or state, and country (including postal code)
					</div>
					<div class="styLNDesc"  style="width:186mm;padding-left:10mm;">	
						<xsl:if test="USAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="USAddress/City"/>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode"  select="USAddress/State"/>
							</xsl:call-template>,
							<span style="width:2px;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="USAddress/ZIPCode"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="ForeignAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode"  select="ForeignAddress/City"/>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrState"/>
							</xsl:call-template>,
							<span style="width:2px;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignAddress/PostalCode"/>
							</xsl:call-template>,
							<span style="width:2px;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignAddress/Country"/>
							</xsl:call-template>
						</xsl:if>
					</div>
				</div>
				<!--PART II  Line 8e  End of City, State or Country-->
			<!--</xsl:for-each>-->
			</xsl:if>
			<!--PART II  Line 8a - 8e  END of Report information of Asset Not Stock of Foreign Ent Grp = 0--> 
						
			<!--PART II  START of Report Information of Asset Not Stock of Foreign Ent Grp >=1 (Lines 8a - 8e)--> 
			<xsl:if test="(count($FormData/OtherForeignAssetGrp/AssetNotStockOfForeignEntGrp) &gt;=1)">
				<xsl:for-each select="$FormData/OtherForeignAssetGrp/AssetNotStockOfForeignEntGrp">
					<div  style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:2mm;padding-left:2mm;padding-top:0mm;
						  padding-bottom:0mm;">8</div>
						<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-top:0mm;
						  padding-bottom:1mm;">
						  If asset reported in Part II, line 1, is not stock of a foreign entity or an interest in a foreign entity,
						  enter the following information for the asset.
						</div>
						<div  class="styLNDesc" style="width:179mm;padding-left:10mm;padding-top:0mm;
						  padding-bottom:0mm;">
							<b>Note.</b> If this asset has more than one issuer or counterparty, attach a continuation sheet
							 with the same information for each additional issuer or counterparty (see instructions).
						</div>
					</div><br/>
					<!--PART II  Line 8a  Start of Name of Issuer-->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox"  style="padding-left:4mm;">a</div>
						<div class="styLNDesc" style="width:45mm;padding-left:2mm;">
						  Name of issuer or counterparty
						</div>
						<div class="styFixedUnderline" style="width:133mm;">
							<xsl:choose>
								<xsl:when test="PersonName">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="PersonName"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
									</xsl:call-template>
									<xsl:if test="BusinessName/BusinessNameLine2">
										<br/>	
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!--PART II  Line 8a  End of Name of Issuer-->	
					<!--PART II  Line 8a  Start of Check if information is for Issuer or Counterparty-->
					<div  style="width:187mm;padding-left:10mm;">
						<div class="styLNDesc" style="width:50.5mm;">Check if information is for</div>
						<div class="styLNDesc" style="width:35mm;">
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" 
									select="IssuerInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-ANSIssuerInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="IssuerInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-ANSIssuerInd</xsl:with-param>
								</xsl:call-template>
								Issuer
							</label>
						</div>
						<div class="styLNDesc" style="width:35.5mm;">
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-ANSCounterpartyInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-ANSCounterpartyInd</xsl:with-param>
								</xsl:call-template>
								Counterparty
							</label>
						</div>
					</div><br/>
					<!--PART II  Line 8b  Start of Type of Issuer or counterparty-->
					<div  style="width:187mm;">
						<div class="styLNLeftLtrBox"  style="padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:179mm;padding-left:2mm;">Type of issuer or counterparty</div>
					</div>	
					<!--PART II  Line 8b (1)  Start of Individual-->
					<div class="styLNDesc" style="width:187mm;padding-left:10mm;">
						<div  class="styLNDesc" style="width:47.3mm;"><b>(1)</b>
							<span style="width:5px;"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="IndividualInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-ANSIndividualInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="IndividualInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-ANSIndividualInd</xsl:with-param>
								</xsl:call-template>
								Individual
							</label>
						</div>
						<!--PART II  Line 8b (1)  End of Individual-->
						<!--PART II  Line 8b (2)  Start of Partnership-->
						<div  class="styLNDesc" style="width:32.5mm;"><b>(2)</b>
							<span style="width:5px;"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="PartnershipInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-ANSPartnershipInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="PartnershipInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-ANSPartnershipInd</xsl:with-param>
								</xsl:call-template>
								Partnership
							</label>
						</div>
						<!--PART II  Line 8b (2)  End of Partnership-->
						<!--PART II  Line 8b (3)  Start of Corporation-->
						<div  class="styLNDesc" style="width:35mm;"><b>(3)</b>
							<span style="width:5px;"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="CorporationInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-ANSCorporationInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="CorporationInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-ANSCorporationInd</xsl:with-param>
								</xsl:call-template>
								Corporation 
							</label>
						</div>
						<!--PART II  Line 8b (3)  End of Corporation-->
						<!--PART II  Line 8b (4)  Start of Trust-->
						<div  class="styLNDesc" style="width:37mm;"><b>(4)</b>
							<span style="width:5px;"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="TrustInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-ANSTrustInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="TrustInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-ANSTrustInd</xsl:with-param>
								</xsl:call-template>
								Trust 
							</label>
						</div>
						<!--PART II  Line 8b (5)  Start of Estate-->
						<div  class="styLNDesc" style="width:20mm;"><b>(5)</b>
							<span style="width:5px;"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="EstateInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-ANSEstateInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="EstateInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-ANSEstateInd</xsl:with-param>
								</xsl:call-template>
								Estate 
							</label>
						</div>
					</div><br/><br/>
					<!--PART II  Line 8b (5)  End of Estate-->
					<!--PART II  Line 8c  Start of Check if Issuer or Counterparty is US or Foreign-->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox"  style="padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:55mm;padding-left:2mm;">Check if issuer or counterparty is a
						</div>
						<div class="styLNDesc" style="width:30.5mm;">	
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="USPersonInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-ANSUSPersonInd</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="USPersonInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-ANSUSPersonInd</xsl:with-param>
								</xsl:call-template>
								U.S. person
							</label>
						</div>	
						<div class="styLNDesc" style="width:40mm;padding-left:2mm;">
							<input type="Checkbox" class="styCkbox">
							  <xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="ForeignPersonInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ANSForeignPersonInd</xsl:with-param>
							  </xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
							  <xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="ForeignPersonInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ANSForeignPersonInd</xsl:with-param>
							  </xsl:call-template>
								Foreign person
							</label>
						</div>	
					</div><br/>
					<!--PART II  Line 8c  End of Check if Issuer or Counterparty is US or Foreign-->	
					<!--PART II  Line 8d  Start of Mailing Address-->	
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox"  style="padding-left:4mm;">d</div>
						<div  class="styLNDesc" style="height:2mm;width:179mm;padding-left:2mm;padding-top:0mm;
						  padding-bottom:0mm;">
						  Mailing address of issuer or counterparty. Number, street, and room or suite no.
						</div>
						<div  class="styFixedUnderline" style="height:2mm;width:179mm;padding-left:2mm;padding-top:1mm;
						  padding-bottom:0mm;">
							<xsl:if test="USAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="USAddress/AddressLine1"/>
								</xsl:call-template>
								<xsl:if test="USAddress/AddressLine2">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="USAddress/AddressLine2"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:if>
							<xsl:if test="ForeignAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1"/>
								</xsl:call-template>
								<xsl:if test="ForeignAddress/AddressLine2">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:if>
						</div>
					</div>
					<!--PART II  Line 8d  End of Mailing Address-->
					<!--PART II  Line 8e  Start of City, State or Country-->	
					<div style="width:187mm;border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
						<div class="styLNLeftLtrBox"  style="padding-left:4mm;">e</div>
						<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-bottom:0mm;">
						  City or town, province or state, and country (including postal code)
						</div>
						<div class="styLNDesc"  style="width:186mm;padding-left:10mm;">	
							<xsl:if test="USAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="USAddress/City"/>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode"  select="USAddress/State"/>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="USAddress/ZIPCode"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="ForeignAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode"  select="ForeignAddress/City"/>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrState"/>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/PostalCode"/>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/Country"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!--PART II  Line 8e  End of City, State or Country-->
				</xsl:for-each>
			</xsl:if>
			<!--PART II  Line 8a - 8e  END of Report information of Asset Not Stock of Foreign Ent Grp >= 1--> 
		<!--</xsl:for-each>-->
		</xsl:if>
	</xsl:if>
	<!--PART II  End of Other Foreign Assets Continued-->
		
	<!--PART II REPEATING INFORMATION  Start of Other Foreign Assets (see instructions) Lines 1-5-->
	<xsl:if test="(count($FormData/OtherForeignAssetGrp) &gt;= 2) and ($Print != $Separated)">
		<xsl:for-each select="$FormData/OtherForeignAssetGrp">
			<!-- PART II REPEATING INFORMATION  BEGIN TITLE -->
			<div class="styBB" style="width:187mm;">
				<div class="styPartName" style="font-size:9pt;padding-bottom:.5mm;font-family:arial">Part II</div>
				<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;float:left;clear:none;">
			      Other Foreign Assets<span style="font-weight:normal;"> (see instructions)</span></div>
			</div>
			<!-- PART II REPEATING INFORMATION  END TITLE -->  
			<div class="styBB" style="width:187mm;">
				<div  class="styLNDesc" style="width:187mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">
				<b>Note.</b><i> If you reported specified foreign financial assets on Forms 3520, 3520-A, 5471, 8621,
				 8865, or 8891 you do not have to include<br/>the assets on Form 8938. You must complete Part IV. See
				 instructions.</i></div>	
			</div>
			<div class="styBB" style="width:187mm;">
				<div  class="styLNDesc" style="width:187mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">
				  If you have more than one asset to report, attach a continuation sheet with the same information for each
				  additional asset (see instructions).</div>	
			</div>
			<!--PART II REPEATING INFORMATION  Line 1  Start of Asset Description-->
			<div class="styBB" style="width:187mm;">
				<div style="width:110mm;float:left;clear:none;">
					<div style="width:70mm;float:left;clear:none;">
						<div class="styLNLeftNumBox"  style="padding-left:2mm;">1</div>
						<div class="styLNDesc" style="width:30mm;padding-left:2mm;">
							Description of asset
						</div>
					</div>	
					<div class="styLNDesc" style="width:110mm;padding-left:8.5mm;float:left;clear:none;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="AssetDescription"/>
								<xsl:with-param name="BackupName">IRS8938OFA-RAssetDescription</xsl:with-param>
							</xsl:call-template>                         
					</div>
				</div>
				<!--PART II REPEATING INFORMATION  Line 1  End of Asset Description-->
				<!--PART II REPEATING INFORMATION  Line 2  Start of Identifying Designation Number-->
				<div style="width:70mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 0px 0px 1px;">
					<div class="styLNLeftNumBox" style="width:5mm;text-align:center;float:left;padding-bottom:0mm;">
					  2</div>
					<div class="styLNDesc" style="width:64mm;padding-left:2mm;padding-bottom:0mm;">
					  Identifying number or other designation</div>
					<div class="styLNDesc"  style="width:69mm;padding-left:5.5mm;padding-top:1mm;" valign="bottom">
						<xsl:choose>
							<xsl:when test="IdentifyingDesignationNumber">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="IdentifyingDesignationNumber"/>
									<xsl:with-param name="BackupName">IRS8938OFA-RIdentifyingDesignationNumber
									</xsl:with-param>
								</xsl:call-template>                        
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BankAccountNumber"/>
									<xsl:with-param name="BackupName">IRS8938OFA-RBankAccountNumber
									</xsl:with-param>
								</xsl:call-template>                        
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</div>
			</div>
			<!--PART II REPEATING INFORMATION  Line 2  End of Identifying Designation Number-->
			<!--PART II REPEATING INFORMATION  Line 3  Start of Complete all that apply--> 
			<div class="styBB" style="width:187mm;">	
				<div style="width:187mm;float:left;clear:none;">
					<div class="styLNLeftNumBox"  style="padding-left:2mm;">3</div>
					<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
		              Complete all that apply. See instructions for reporting of multiple acquisition or disposition dates.
		            </div>
				</div>	
				<!--PART II REPEATING INFORMATION  Line 3a  Start of Date Acquired-->
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">a</div>
					<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
						Date asset acquired during tax year, if applicable
					<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">....................</span>
					</div>
					<div class="styFixedUnderline" style="height:4mm;padding-left:2mm;">
						<xsl:call-template name="PopulateMonth">
							<xsl:with-param name="TargetNode" select="DateAcquired"/>
							<xsl:with-param name="BackupName">IRS8938OFA-RDateAcquiredMonth</xsl:with-param>
						</xsl:call-template>               
						<xsl:call-template name="PopulateDay">
							<xsl:with-param name="TargetNode" select="DateAcquired"/>
							<xsl:with-param name="BackupName">IRS8938OFA-RDateAcquiredDay</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="DateAcquired"/>
							<xsl:with-param name="BackupName">IRS8938OFA-RDateAcquiredYear</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
				<!--PART II REPEATING INFORMATION  Line 3a  End of Date Acquired-->
				<!--PART II REPEATING INFORMATION  Line 3b  Start of Disposed Of Date-->
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">b</div>
					<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
						Date asset disposed of during tax year, if applicable
					<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">...................</span>
					</div>
					<div class="styFixedUnderline" style="height:4mm;padding-left:2mm;">
						<xsl:call-template name="PopulateMonth">
							<xsl:with-param name="TargetNode" select="DisposedOfDt"/>
							<xsl:with-param name="BackupName">IRS8938OFA-RDisposedOfDtMonth</xsl:with-param>
						</xsl:call-template>                
						<xsl:call-template name="PopulateDay">
							<xsl:with-param name="TargetNode" select="DisposedOfDt"/>
							<xsl:with-param name="BackupName">IRS8938OFA-RDisposedOfDtDay</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="DisposedOfDt"/>
							<xsl:with-param name="BackupName">IRS8938OFA-RDisposedOfDtYear</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
				<!--PART II REPEATING INFORMATION  Line 3b  End of Disposed Of Date-->
				<!--PART II REPEATING INFORMATION  Line 3c  Start of Jointly Owned With Spouse Ind-->
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">c</div>
					<div class="styLNDesc" style="width:80mm;padding-left:2mm;">
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-RJointlyOwnedWithSpouseInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-RJointlyOwnedWithSpouseInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Check if asset jointly owned with spouse
						</label>
					</div>
					<!--PART II REPEATING INFORMATION  Line 3c  End of Jointly Owned With Spouse Ind-->
					<!--PART II REPEATING INFORMATION  Line 3d  Start of No Tax Item Reported Ind-->
					<div class="styLNDesc" style="width:99mm;padding-left:2mm;"><b>d</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-RNoTaxItemReportedInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-RNoTaxItemReportedInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Check if no tax item reported in Part III with respect to this asset
						</label>
					</div>
				</div>	
			</div>
			<!--PART II REPEATING INFORMATION  Line 3d  End of No Tax Item Reported Ind-->
			<!--PART II REPEATING INFORMATION  Line 4  Start of Maximum value of asset during tax year-->
			<div class="styBB" style="width:187mm;">	
				<div style="width:187mm;float:left;clear:none;">
					<div class="styLNLeftNumBox"  style="padding-left:2mm;">4</div>
					<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
						Maximum value of asset during tax year (check box that applies)
					</div>
				</div>
				<!--PART II REPEATING INFORMATION  Line 4a  Start of Max. Value During TY 0 To 50000 Ind-->
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">a</div>
					<div class="styLNDesc" style="width:35mm;padding-left:2mm;">
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="MaxValueDuringTY0To50000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-RMaxValueDuringTY0To50000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="MaxValueDuringTY0To50000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-RMaxValueDuringTY0To50000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							$0 - $50,000
						</label>
					</div>
					<!--PART II REPEATING INFORMATION  Line 4a  End of Max. Value During TY 0 To 50000 Ind-->
					<!--PART II REPEATING INFORMATION  Line 4b  Start of Max. Value During TY 50001 To 100000 Ind-->
					<div class="styLNDesc" style="width:45mm;padding-left:2mm;"><b>b</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="MaxValueDurTY50001To100000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-RMaxValueDurTY50001To100000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="MaxValueDurTY50001To100000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-RMaxValueDurTY50001To100000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							$50,001 - $100,000
						</label>
					</div>
				   <!--PART II REPEATING INFORMATION  Line 4b  End of Max. Value During TY 50001 To 100000 Ind-->
				   <!--PART II REPEATING INFORMATION  Line 4c  Start of Max. Value During TY 100001 To 150000 
						Ind-->
					<div class="styLNDesc" style="width:50mm;padding-left:2mm;"><b>c</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="MaxValueDurTY100001To150000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-RMaxValueDurTY100001To150000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="MaxValueDurTY100001To150000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-RMaxValueDurTY100001To150000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							$100,001 - $150,000
						</label>
					</div>
					<!--PART II REPEATING INFORMATION  Line 4c  End of Max. Value During TY 100001 To 150000
						 Ind-->
				    <!--PART II REPEATING INFORMATION  Line 4d  Start of Max. Value During TY 150001 To 200000
						 Ind-->
					<div class="styLNDesc" style="width:45mm;padding-left:2mm;"><b>d</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="MaxValueDurTY150001To200000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-RMaxValueDurTY150001To200000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="MaxValueDurTY150001To200000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-RMaxValueDurTY150001To200000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							$150,001 - $200,000
						</label>
					</div>
				</div>
				<!--PART II REPEATING INFORMATION  Line 4d  End of Max. Value During TY 150001 To 200000 Ind-->
				<!--PART II REPEATING INFORMATION  Line 4e  Start of Max. Value During TY More Max. Amount-->
				<div style="width:187mm;">		    
					<div class="styLNLeftNumBox" style="height:2mm;padding-left:4mm;padding-top:0mm;
					  padding-bottom:0mm;">e</div>
					<div  class="styLNDesc" style="height:2mm;width:146mm;padding-left:2mm;padding-top:0mm;
					  padding-bottom:0mm;">If more than $200,000, list value
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-right:1mm;">.......................</span>$
					</div>
					<div class="styLNAmountBoxNB"  style="height:2mm;padding-top:0mm;padding-bottom:0mm;" 
					  valign="bottom">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="MaxValueDurTYMoreMaxAmt"/>
							<xsl:with-param name="BackupName">IRS8938OFA-RMaxValueDurTYMoreMaxAmt
							</xsl:with-param>
						</xsl:call-template>                         
					</div>
				</div>
			</div>
			<!--PART II REPEATING INFORMATION  Line 4e  End of Max. Value During TY More Max. Amount-->	
			<!--PART II REPEATING INFORMATION  Line 5  Start of Exchange Rate used-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">5</div>
				<div  class="styLNDesc" style="height:5mm;width:179mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">
					Did you use a foreign currency exchange rate to convert the value of the asset into U.S. dollars?
					<!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-right:1mm;">......</span>
						<!--Start of Exchange Rate Used Ind "Yes"-->
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-RExchangeRateUsedInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabelYes">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-RExchangeRateUsedInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Yes
						</label>
						<!--PART II REPEATING INFORMATION  End of Exchange Rate Used Ind "Yes"-->
						<span style="width:5px;"/>
						<!--PART II REPEATING INFORMATION  Start of Exchange Rate Used Ind "No"-->
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-RExchangeRateUsedInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-RExchangeRateUsedInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							No
						</label>
						<!--PART II REPEATING INFORMATION  End of Exchange Rate Used Ind "No"-->
				</div>
			</div>
			<br/>
			<!--<xsl:choose>
				<xsl:when test="position()=1"><div class="pageEnd"  style="width:187mm;"/>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>	
	</xsl:if>-->
	<!--  PART II REPEATING INFORMATION  FOOTER-->
        <div style="width:187mm;border-top:1px solid black;">
          <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span> 
          <span style="width:116px;"></span>                      
          Cat. No. 37753A
          <span style="width:106px;"></span>  
          Form <span class="styBoldText" style="font-size:9pt">8938</span> (11-2012)
        </div>
        <!--Begin Page 2 -->
	<!-- Page Header -->
		<div class="styBB" style="width:187mm;">
			<div style="float:left;">Form 8938 (11-2012)<span style="width:145mm;"/></div>
			<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>
		</div>
	<!-- END Page Header --> 	
	<!--PART II REPEATING INFORMATION  End of Other Foreign Assets Lines 1 thru 5-->
	<!--PART II REPEATING INFORMATION  Start of Other Foreign Assets (continued) Lines 6 thru 8-->
	<!--<xsl:if test="(count($FormData/OtherForeignAssetGrp) &gt;=2)">
		<xsl:for-each select="$FormData/OtherForeignAssetGrp">-->
			<div class="styBB" style="width:187mm;">
				<div class="styPartName" style="font-size:9pt;padding-bottom:.5mm;font-family:arial">Part II</div>
				<div class="styPartDesc" style="width:164mm;font-size:9pt;padding-left:3mm;float:left; clear:none">
				  Other Foreign Assets<span style="font-weight:normal;"> (continued)</span></div>
			</div>
			<!--PART II REPEATING INFORMATION  Line 6  Start of If you answered "Yes" to line 5, complete all that
				apply-->		
			<div style="width:187mm;float:left;clear:none;border-style:solid;border-color:black;
			  border-width: 0px 0px 1px 0px;">
				<div class="styLNLeftNumBox"  style="padding-left:2mm;padding-top:.7mm;height:5mm">6</div>
				<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;padding-top:.7mm;height:5mm">
					If you answered “Yes” to line 5, complete all that apply.
				</div>
			</div>	
			<div class="styBB" style="width:187mm;">
				<!--PART II REPEATING INFORMATION  Line 6(1)  Start of Foreign Currency Description Text-->
				<div style="width:60mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 1px 0px 0px;">
					<div class="styLNDesc" style="width:55mm;padding-left:10mm;padding-bottom:2mm;">
							<b>(1) </b> Foreign currency in which<br/> asset is denominated
					</div>
					<div class="styLNDesc"  style="width:55mm;padding-top:1mm;padding-left:8.5mm;" valign="bottom">	
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignCurrencyDescTxt"/>
							<xsl:with-param name="BackupName">IRS8938OFA-RForeignCurrencyDescTxt</xsl:with-param>
						</xsl:call-template>                         
					</div>
				</div>
				<!--PART II REPEATING INFORMATION  Line 6(1)  End of Foreign Currency Description Text-->
				<!--PART II REPEATING INFORMATION  Line 6(2)  Start of Exchange Rate Used-->
				<div style="width:63mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 0px 0px 0px;">
					<div class="styLNDesc" style="width:61mm;padding-left:2mm;padding-bottom:2mm;">
							<b>(2) </b> Foreign currency exchange rate used to convert to U.S. dollars
					</div>
					<div class="styLNDesc"  style="width:61mm;padding-top:1mm;padding-left:.8mm;text-align:right"
					  valign="bottom">	
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="ExchangeRateUsed"/>
							<xsl:with-param name="BackupName">IRS8938OFA-RExchangeRateUsed</xsl:with-param>
						</xsl:call-template>                       
					</div>
				</div>
				<!--PART II REPEATING INFORMATION  Line 6(2)  End of Exchange Rate Used-->
				<!--PART II REPEATING INFORMATION  Line 6(3)  Start of Source  Of Exchange Rate Used Text-->
				<div style="width:64mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 0px 0px 1px;">
					<div class="styLNDesc" style="width:62mm;padding-left:2mm;padding-bottom:2mm;">
							<b>(3) </b> Source of exchange rate used if not from U.S. Treasury Financial Management Service
					</div>
					<div class="styLNDesc"  style="width:62mm;padding-top:1mm;" valign="bottom">	
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="SourceOfExchangeRateUsedTxt"/>
							<xsl:with-param name="BackupName">IRS8938OFA-RSourceOfExchangeRateUsedTxt
							</xsl:with-param>
						</xsl:call-template>                         
					</div>
				</div>
			</div>
			<!--PART II REPEATING INFORMATION  Line 6(3)  End of Source Of Exchange Rate Used Text-->
			<!--PART II REPEATING INFORMATION  Line 7 Report information-->
			<div  style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:2mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">7</div>
				<div  class="styLNDesc" style="height:2mm;width:179mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">If asset reported in Part II, line 1, is stock of a foreign entity or an interest in a
				  foreign entity, report the following information.
				</div>
			</div>
			<!--PART II REPEATING INFORMATION  Line 7a  Start of Name of Foreign Entity-->
			<div style="width:187mm;">
				<div class="styLNLeftLtrBox"  style="padding-left:4mm;">a</div>
				<div class="styLNDesc" style="width:32mm;padding-left:2mm;">
					Name of foreign entity
				</div>
				<div class="styFixedUnderline" style="width:147mm;padding-left:2mm;">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="NameOfEntity/BusinessNameLine1"/>
					</xsl:call-template> 
					<xsl:if test="NameOfEntity/BusinessNameLine2">
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="NameOfEntity/BusinessNameLine2"/>
						</xsl:call-template>
					 </xsl:if>                 
				</div>
			</div>
			<!--PART II REPEATING INFORMATION  Line 7a  End of Name of Foreign Entity-->
			<!--PART II REPEATING INFORMATION  Line 7b  Start of Type of Foreign Entity-->	
			<div style="width:187mm;">
				<div class="styLNLeftLtrBox"  style="padding-left:4mm;">b</div>
				<div class="styLNDesc" style="width:50mm;padding-left:2mm;">Type of foreign entity</div>
				<!--Part II Line 7b (1)  Start of Partnership-->
				<div  class="styLNDesc" style="width:35mm;"><b>(1)</b>
					<span style="width:5px;"/>
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="PartnershipInd"/>
							<xsl:with-param name="BackupName">IRS8938OFA-RPartnershipInd
							<xsl:number value="position()"/>
							</xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:5px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="PartnershipInd"/>
							<xsl:with-param name="BackupName">IRS8938OFA-RPartnershipInd
							<xsl:number value="position()"/>
							</xsl:with-param>
						</xsl:call-template>
						Partnership
					</label>
					<span style="width:5px;"/>
				</div>
				<!--PART II REPEATING INFORMATION  Line 7b (1)  End of Partnership-->
				<!--PART II REPEATING INFORMATION  Line 7b (2)  Start of Corporation-->
				<div  class="styLNDesc" style="width:35mm;"><b>(2)</b>
					<span style="width:5px;"/>
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="CorporationInd"/>
							<xsl:with-param name="BackupName">IRS8938OFA-RCorporationInd
							<xsl:number value="position()"/>
							</xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:5px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="CorporationInd"/>
							<xsl:with-param name="BackupName">IRS8938OFA-RCorporationInd
							<xsl:number value="position()"/>
							</xsl:with-param>
						</xsl:call-template>
						Corporation 
					</label>
					<span style="width:5px;"/>
				</div>
				<!--PART II REPEATING INFORMATION  Line 7b (2)  End of Corporation-->
				<!--PART II REPEATING INFORMATION  Line 7b (3)  Start of Trust-->
				<div  class="styLNDesc" style="width:35mm;"><b>(3)</b>
					<span style="width:5px;"/>
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="TrustInd"/>
							<xsl:with-param name="BackupName">IRS8938OFA-RTrustInd<xsl:number value="position()"/>
							</xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:5px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="TrustInd"/>
							<xsl:with-param name="BackupName">IRS8938OFA-RTrustInd<xsl:number value="position()"/>
							</xsl:with-param>
						</xsl:call-template>
						Trust 
					</label>
					<span style="width:5px;"/>
				</div>
				<!--PART II REPEATING INFORMATION  Line 7b (3)  End of Trust-->
				<!--PART II REPEATING INFORMATION  Line 7b (4)  Start of Estate-->
				<div  class="styLNDesc" style="width:20mm;"><b>(4)</b>
					<span style="width:5px;"/>
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="EstateInd"/>
							<xsl:with-param name="BackupName">IRS8938OFA-REstateInd<xsl:number value="position()"/>
							</xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:5px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="EstateInd"/>
							<xsl:with-param name="BackupName">IRS8938OFA-REstateInd<xsl:number value="position()"/>
							</xsl:with-param>
						</xsl:call-template>
						Estate 
					</label>
				</div>
			</div>
			<!--PART II REPEATING INFORMATION  Line 7b (4)  End of Estate-->
			<!--PART II REPEATING INFORMATION  Line 7c  Start of Mailing Address-->
			<div style="width:187mm;">
				<div class="styLNLeftLtrBox"  style="padding-left:4mm;">c</div>
				<div  class="styLNDesc" style="height:2mm;width:179mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">
					Mailing address of foreign entity. Number, street, and room or suite no.
				</div>
				<div  class="styFixedUnderline" style="height:2mm;width:179mm;padding-left:2mm;padding-top:1mm;
				  padding-bottom:0mm;">
					<xsl:if test="USAddress">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="USAddress/AddressLine1"/>
						</xsl:call-template>
						<xsl:if test="USAddress/AddressLine2">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="USAddress/AddressLine2"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:if>
					<xsl:if test="ForeignAddress">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1"/>
						</xsl:call-template>
						<xsl:if test="ForeignAddress/AddressLine2">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:if>
				</div>
			</div>
			<!--PART II REPEATING INFORMATION  Line 7c  End of Mailing Address-->
			<!--PART II REPEATING INFORMATION  Line 7d  Start of City, State and country-->
			<div style="width:187mm;border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
				<div class="styLNLeftLtrBox"  style="padding-left:4mm;">d</div>
				<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-bottom:0mm;">
					City or town, province or state, and country (including postal code)
				</div>
				<div class="styLNDesc"  style="width:186mm;padding-left:10mm;">	
					<xsl:if test="USAddress">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="USAddress/City"/>
						</xsl:call-template><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="USAddress/State"/>
						</xsl:call-template>,
						<span style="width:2px;"/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="USAddress/ZIPCode"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="ForeignAddress">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignAddress/City"/>
						</xsl:call-template><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrState"/>
						</xsl:call-template>,
						<span style="width:2px;"/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignAddress/PostalCode"/>
						</xsl:call-template>,
						<span style="width:2px;"/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignAddress/Country"/>
						</xsl:call-template>
					</xsl:if>
				</div>
			</div>
			<!--PART II REPEATING INFORMATION  Line 7d  Start of City, State and country-->
			
			<!--PART II  REPEATING INFORMATION Line 8a - 8e  START of Report information of Asset Not Stock
				 of Foreign Ent Grp = 0--> 
			<xsl:if test="(count(AssetNotStockOfForeignEntGrp) &lt;1)">
				<xsl:variable name="pos" select="position()"/>
				<!--<xsl:for-each select="AssetNotStockOfForeignEntGrp">-->
				<div  style="width:187mm;">
				    <div class="styLNLeftNumBox" style="height:2mm;padding-left:2mm;padding-top:0mm;
				      padding-bottom:0mm;">8</div>
					<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-top:0mm;
					  padding-bottom:1mm;">
					  If asset reported in Part II, line 1, is not stock of a foreign entity or an interest in a foreign entity, enter
					  the following information for the asset.
					</div>
					<div  class="styLNDesc" style="width:179mm;padding-left:10mm;padding-top:0mm;
					  padding-bottom:0mm;">
						<b>Note.</b> If this asset has more than one issuer or counterparty, attach a continuation sheet with
							 the same information for each additional issuer or counterparty (see instructions).
					</div>
				</div><br/>
				<!--PART II REPEATING INFORMATION  Line 8a  Start of Name of Issuer-->
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">a</div>
					<div class="styLNDesc" style="width:45mm;padding-left:2mm;">
					  Name of issuer or counterparty
					</div>
					<div class="styFixedUnderline" style="width:133mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
						</xsl:call-template>
						<xsl:if test="BusinessName/BusinessNameLine2">
							<br/>	
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
							</xsl:call-template>
						</xsl:if>
					</div>
				</div>
				<!--PART II REPEATING INFORMATION  Line 8a  End of Name of Issuer-->	
				<!--PART II REPEATING INFORMATION  Line 8a  Start of Check if information is for Issuer or 
					 Counterparty-->
				<div  style="width:187mm;padding-left:10mm;">
					<div class="styLNDesc" style="width:50.5mm;">Check if information is for</div>
					<div class="styLNDesc" style="width:35mm;">
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="IssuerInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
								  IssuerInd<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="IssuerInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
								  IssuerInd<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
							Issuer
						</label>
					</div>
					<div class="styLNDesc" style="width:35.5mm;">
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
								  CounterpartyInd<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
								  CounterpartyInd<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
							Counterparty
						</label>
					</div>
				</div><br/>
				<!--PART II REPEATING INFORMATION  Line 8b  Start of Type of Issuer or counterparty-->
				<div  style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">b</div>
					<div class="styLNDesc" style="width:179mm;padding-left:2mm;">Type of issuer or counterparty</div>
				</div>	
				<!--PART II REPEATING INFORMATION  Line 8b (1)  Start of Individual-->
				<div class="styLNDesc" style="width:187mm;padding-left:10mm;">
					<div  class="styLNDesc" style="width:47.3mm;"><b>(1)</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/IndividualInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
								  IndividualInd<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/IndividualInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
								  IndividualInd<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
							Individual
						</label>
					</div>
					<!--PART II REPEATING INFORMATION  Line 8b (1)  End of Individual-->
					<!--PART II REPEATING INFORMATION  Line 8b (2)  Start of Partnership-->
					<div  class="styLNDesc" style="width:32.5mm;"><b>(2)</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode"  select="AssetNotStockOfForeignEntGrp/PartnershipInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
								  PartnershipInd<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/PartnershipInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
								  PartnershipInd<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
							Partnership
						</label>
					</div>
					<!--PART II REPEATING INFORMATION  Line 8b (2)  End of Partnership-->
					<!--PART II REPEATING INFORMATION  Line 8b (3)  Start of Corporation-->
					<div  class="styLNDesc" style="width:35mm;"><b>(3)</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/CorporationInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
								  CorporationInd<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/CorporationInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
								  CorporationInd<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
							Corporation 
						</label>
					</div>
					<!--PART II REPEATING INFORMATION  Line 8b (3)  End of Corporation-->
					<!--PART II REPEATING INFORMATION  Line 8b (4)  Start of Trust-->
					<div  class="styLNDesc" style="width:37mm;"><b>(4)</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/TrustInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
								  TrustInd<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/TrustInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
								  TrustInd<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
							Trust 
						</label>
					</div>
					<!--PART II REPEATING INFORMATION  Line 8b (5)  Start of Estate-->
					<div  class="styLNDesc" style="width:20mm;"><b>(5)</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/EstateInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
								  EstateInd<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/EstateInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
								  EstateInd<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
							Estate 
						</label>
					</div>
				</div><br/><br/>
				<!--PART II REPEATING INFORMATION  Line 8b (5)  End of Estate-->
				<!--PART II REPEATING INFORMATION  Line 8c  Start of Check if Issuer or Counterparty is US or 
					 Foreign-->
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">c</div>
					<div class="styLNDesc" style="width:55mm;padding-left:2mm;">Check if issuer or counterparty is a
					</div>
					<div class="styLNDesc" style="width:30.5mm;">	
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/USPersonInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
								  USPersonInd<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/USPersonInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
								  USPersonInd<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
							U.S. person
						</label>
					</div>	
					<div class="styLNDesc" style="width:40mm;padding-left:2mm;">
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode"
								  select="AssetNotStockOfForeignEntGrp/ForeignPersonInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
								  ForeignPersonInd<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode"
								  select="AssetNotStockOfForeignEntGrp/ForeignPersonInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
								  ForeignPersonInd<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
							Foreign person
						</label>
					</div>	
				</div><br/>
				<!--PART II REPEATING INFORMATION  Line 8c  End of Check if Issuer or Counterparty is US or 
					 Foreign-->	
				<!--PART II REPEATING INFORMATION  Line 8d  Start of Mailing Address-->	
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">d</div>
					<div  class="styLNDesc" style="height:2mm;width:179mm;padding-left:2mm;padding-top:0mm;
					  padding-bottom:0mm;">Mailing address of issuer or counterparty. Number, street, and room or suite
					  no.
					</div>
					<div  class="styFixedUnderline" style="height:2mm;width:179mm;padding-left:2mm;padding-top:1mm;
					  padding-bottom:0mm;">
						<xsl:if test="AssetNotStockOfForeignEntGrp/USAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="USAddress/AddressLine1"/>
							</xsl:call-template>
							<xsl:if test="AssetNotStockOfForeignEntGrp/USAddress/AddressLine2">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="USAddress/AddressLine2"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:if>
						<xsl:if test="AssetNotStockOfForeignEntGrp/ForeignAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1"/>
							</xsl:call-template>
							<xsl:if test="AssetNotStockOfForeignEntGrp/ForeignAddress/AddressLine2">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddres/AddressLine2"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:if>
					</div>
				</div>
				<!--PART II REPEATING INFORMATION  Line 8d  End of Mailing Address-->
				<!--PART II REPEATING INFORMATION  Line 8e  Start of City, State or Country-->	
				<div style="width:187mm;border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">e</div>
					<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-bottom:0mm;">
					  City or town, province or state, and country (including postal code)
					</div>
					<div class="styLNDesc"  style="width:186mm;padding-left:10mm;">	
						<xsl:if test="AssetNotStockOfForeignEntGrp/USAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="USAddress/City"/>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="USAddress/State"/>
							</xsl:call-template>,
							<span style="width:2px;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="USAddress/ZIPCode"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="AssetNotStockOfForeignEntGrp/ForeignAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignAddress/City"/>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrState"/>
							</xsl:call-template>,
							<span style="width:2px;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignAddress/PostalCode"/>
							</xsl:call-template>,
							<span style="width:2px;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignAddress/Country"/>
							</xsl:call-template>
						</xsl:if>
					</div>
				</div>
				<!--PART II REPEATING INFORMATION  Line 8e  End of City, State or Country-->	
			<!--</xsl:for-each>-->
			</xsl:if>
			<!--PART II  Line 8a - 8e  END of Report information of Asset Not Stock of Foreign Ent Grp = 0--> 
			
			<!--PART II REPEATING INFORMATION  Start of Asset Not Stock of Foreign Ent Grp >=1 (Lines 8a - 8e)-->
			<xsl:if test="(count(AssetNotStockOfForeignEntGrp) &gt;=2)">
				<!--<xsl:for-each select="$FormData/OtherForeignAssetGrp/AssetNotStockOfForeignEntGrp">-->
				<xsl:variable name="pos" select="position()"/>
				<xsl:for-each select="AssetNotStockOfForeignEntGrp">
					<div  style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:2mm;padding-left:2mm;padding-top:0mm;
						  padding-bottom:0mm;">8</div>
						<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-top:0mm;
						  padding-bottom:1mm;">
						  If asset reported in Part II, line 1, is not stock of a foreign entity or an interest in a foreign entity,
						  enter the following information for the asset.
						</div>
						<div  class="styLNDesc" style="width:179mm;padding-left:10mm;padding-top:0mm;
						  padding-bottom:0mm;">
							<b>Note.</b> If this asset has more than one issuer or counterparty, attach a continuation sheet
							 with the same information for each additional issuer or counterparty (see instructions).
						</div>
					</div><br/>
					<!--PART II REPEATING INFORMATION  Line 8a  Start of Name of Issuer-->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox"  style="padding-left:4mm;">a</div>
						<div class="styLNDesc" style="width:45mm;padding-left:2mm;">
						  Name of issuer or counterparty
						</div>
						<div class="styFixedUnderline" style="width:133mm;">
							<xsl:choose>
								<xsl:when test="PersonName">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="PersonName"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
									</xsl:call-template>
									<xsl:if test="BusinessName/BusinessNameLine2">
										<br/>	
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!--PART II REPEATING INFORMATION  Line 8a  End of Name of Issuer-->	
					<!--PART II REPEATING INFORMATION  Line 8a  Start of Check if information is for Issuer or 
						 Counterparty-->
					<div  style="width:187mm;padding-left:10mm;">
						<div class="styLNDesc" style="width:50.5mm;">Check if information is for</div>
						<div class="styLNDesc" style="width:35mm;">
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="IssuerInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
									  IssuerInd<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="IssuerInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
									  IssuerInd<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
								Issuer
							</label>
						</div>
						<div class="styLNDesc" style="width:35.5mm;">
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
									  CounterpartyInd<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
									  CounterpartyInd<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
								Counterparty
							</label>
						</div>
					</div><br/>
					<!--PART II REPEATING INFORMATION  Line 8b  Start of Type of Issuer or counterparty-->
					<div  style="width:187mm;">
						<div class="styLNLeftLtrBox"  style="padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:179mm;padding-left:2mm;">Type of issuer or counterparty</div>
					</div>	
					<!--PART II REPEATING INFORMATION  Line 8b (1)  Start of Individual-->
					<div class="styLNDesc" style="width:187mm;padding-left:10mm;">
						<div  class="styLNDesc" style="width:47.3mm;"><b>(1)</b>
							<span style="width:5px;"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="IndividualInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
									  IndividualInd<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="IndividualInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
									  IndividualInd<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
								Individual
							</label>
						</div>
						<!--PART II REPEATING INFORMATION  Line 8b (1)  End of Individual-->
						<!--PART II REPEATING INFORMATION  Line 8b (2)  Start of Partnership-->
						<div  class="styLNDesc" style="width:32.5mm;"><b>(2)</b>
							<span style="width:5px;"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode"  select="PartnershipInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
									  PartnershipInd<xsl:number value="position()"/></xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="PartnershipInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
									  PartnershipInd<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
								Partnership
							</label>
						</div>
						<!--PART II REPEATING INFORMATION  Line 8b (2)  End of Partnership-->
						<!--PART II REPEATING INFORMATION  Line 8b (3)  Start of Corporation-->
						<div  class="styLNDesc" style="width:35mm;"><b>(3)</b>
							<span style="width:5px;"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="CorporationInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
									  CorporationInd<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="CorporationInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
									  CorporationInd<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
								Corporation 
							</label>
						</div>
						<!--PART II REPEATING INFORMATION  Line 8b (3)  End of Corporation-->
						<!--PART II REPEATING INFORMATION  Line 8b (4)  Start of Trust-->
						<div  class="styLNDesc" style="width:37mm;"><b>(4)</b>
							<span style="width:5px;"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="TrustInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
									  TrustInd<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="TrustInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
									  TrustInd<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
								Trust 
							</label>
						</div>
						<!--PART II REPEATING INFORMATION  Line 8b (5)  Start of Estate-->
						<div  class="styLNDesc" style="width:20mm;"><b>(5)</b>
							<span style="width:5px;"/>
							<input type="Checkbox" class="styCkbox">
							  <xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="EstateInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
								  EstateInd<xsl:number value="position()"/>
								</xsl:with-param>
							  </xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
							  <xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="EstateInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
								  EstateInd<xsl:number value="position()"/>
								</xsl:with-param>
							  </xsl:call-template>
							     Estate 
							</label>
						</div>
					</div><br/><br/>
					<!--PART II REPEATING INFORMATION  Line 8b (5)  End of Estate-->
					<!--PART II REPEATING INFORMATION  Line 8c  Start of Check if Issuer or Counterparty is US or 
						 Foreign-->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox"  style="padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:55mm;padding-left:2mm;">Check if issuer or counterparty is a
						</div>
						<div class="styLNDesc" style="width:30.5mm;">	
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="USPersonInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
									  USPersonInd<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="USPersonInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
									  USPersonInd<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
								   U.S. person
							</label>
						</div>	
						<div class="styLNDesc" style="width:40mm;padding-left:2mm;">
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="ForeignPersonInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
									  ForeignPersonInd<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="ForeignPersonInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-R-ANS-R<xsl:number value="$pos"/>
									  ForeignPersonInd<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
								   Foreign person
							</label>
						</div>	
					</div><br/>
					<!--PART II REPEATING INFORMATION  Line 8c  End of Check if Issuer or Counterparty is US or 
						 Foreign-->	
					<!--PART II REPEATING INFORMATION  Line 8d  Start of Mailing Address-->	
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox"  style="padding-left:4mm;">d</div>
						<div  class="styLNDesc" style="height:2mm;width:179mm;padding-left:2mm;padding-top:0mm;
						  padding-bottom:0mm;">Mailing address of issuer or counterparty. Number, street, and room or
						  suite no.
						</div>
						<div  class="styFixedUnderline" style="height:2mm;width:179mm;padding-left:2mm;
						  padding-top:1mm;padding-bottom:0mm;">
							<xsl:if test="USAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="USAddress/AddressLine1"/>
								</xsl:call-template>
								<xsl:if test="USAddress/AddressLine2">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="USAddress/AddressLine2"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:if>
							<xsl:if test="ForeignAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1"/>
								</xsl:call-template>
								<xsl:if test="ForeignAddress/AddressLine2">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ForeignAddres/AddressLine2"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:if>
						</div>
					</div>
					<!--PART II REPEATING INFORMATION  Line 8d  End of Mailing Address-->
					<!--PART II REPEATING INFORMATION  Line 8e  Start of City, State or Country-->	
					<div style="width:187mm;border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
						<div class="styLNLeftLtrBox"  style="padding-left:4mm;">e</div>
						<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-bottom:0mm;">
						  City or town, province or state, and country (including postal code)
						</div>
						<div class="styLNDesc"  style="width:186mm;padding-left:10mm;">	
							<xsl:if test="USAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="USAddress/City"/>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="USAddress/State"/>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="USAddress/ZIPCode"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="ForeignAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/City"/>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrState"/>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/PostalCode"/>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/Country"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!--PART II REPEATING INFORMATION  Line 8e  End of City, State or Country-->	
				</xsl:for-each>
			</xsl:if>
			<!--PART II REPEATING INFORMATION  END of Report Information of Asset Not Stock of Foreign Ent
			  Grp >=1 (Lines 8a - 8e)--> 
			
			<!--  PART II REPEATING INFORMATION  FOOTER-->
			<div class="pageEnd"  style="width:187mm;border-top:1px solid black;"/>
		</xsl:for-each>
	</xsl:if>		
				
	<!--See Additional Table Message when Part II Repeating information for Other Foreign Assets is greater than 
         1 item-->		
    <!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Start of Other Foreign Assets (see instructions) 
		 Lines 1-5-->
	<xsl:if test="(count($FormData/OtherForeignAssetGrp) &gt;= 2) and ($Print = $Separated)">
		<!---<xsl:for-each select="$FormData/OtherForeignAssetGrp">-->
			<!-- PART II REPEATING ADDITIONAL TABLE MESSAGE  BEGIN TITLE -->
			<div class="styBB" style="width:187mm;">
				<div class="styPartName" style="font-size:9pt;padding-bottom:.5mm;font-family:arial">Part II</div>
				<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;float:left;clear:none;">
			      Other Foreign Assets<span style="font-weight:normal;"> (see instructions)</span></div>
			</div>
			<!-- PART II REPEATING ADDITIONAL TABLE MESSAGE  END TITLE -->  
			<div class="styBB" style="width:187mm;">
				<div  class="styLNDesc" style="width:187mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">
				<b>Note.</b><i> If you reported specified foreign financial assets on Forms 3520, 3520-A, 5471, 8621,
				 8865, or 8891 you do not have to include<br/>the assets on Form 8938. You must complete Part IV. See
				 instructions.</i></div>	
			</div>
			<div class="styBB" style="width:187mm;">
				<div  class="styLNDesc" style="width:187mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">
				  If you have more than one asset to report, attach a continuation sheet with the same information for each
				  additional asset (see instructions).</div>	
			</div>
			<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 1  Start of Asset Description-->
			<div class="styBB" style="width:187mm;">
				<div style="width:110mm;float:left;clear:none;">
					<div style="width:70mm;float:left;clear:none;">
						<div class="styLNLeftNumBox"  style="padding-left:2mm;">1</div>
						<div class="styLNDesc" style="width:40mm;padding-left:2mm;">
							Description of asset
						</div>
					</div>	
					<div class="styLNDesc" style="width:110mm;padding-left:8.5mm;float:left;clear:none;">
						<xsl:call-template name="PopulateAdditionalDataTableMessage">
							<xsl:with-param name="TargetNode" select="$FormData/OtherForeignAssetGrp"/>
						</xsl:call-template>
						<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="AssetDescription"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMAssetDescription</xsl:with-param>
							</xsl:call-template>-->                         
					</div>
				</div>
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 1  End of Asset Description-->
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 2  Start of Identifying Designation
				     Number-->
				<div style="width:70mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 0px 0px 1px;">
					<div class="styLNLeftNumBox" style="width:5mm;text-align:center;float:left;padding-bottom:0mm;">
					  2</div>
					<div class="styLNDesc" style="width:64mm;padding-left:2mm;padding-bottom:0mm;">
					  Identifying number or other designation</div>
					<div class="styLNDesc"  style="width:69mm;padding-left:5.5mm;padding-top:1mm;" valign="bottom">	
						<!--<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="IdentifyingDesignationNumber"/>
							<xsl:with-param name="BackupName">IRS8938OFA-ATMIdentifyingDesignationNumber
							</xsl:with-param>
						</xsl:call-template>                        -->
					</div>
				</div>
			</div>
			<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 2  End of Identifying Designation Number-->
			<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 3  Start of Complete all that apply--> 
			<div class="styBB" style="width:187mm;">	
				<div style="width:187mm;float:left;clear:none;">
					<div class="styLNLeftNumBox"  style="padding-left:2mm;">3</div>
					<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
					  Complete all that apply. See instructions for reporting of multiple acquisition or disposition dates.
					</div>
				</div>	
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 3a  Start of Date Acquired-->
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">a</div>
					<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
						Date asset acquired during tax year, if applicable
					<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">....................</span>
					</div>
					<div class="styFixedUnderline" style="height:4mm;padding-left:2mm;">
						<!--<xsl:call-template name="PopulateMonth">
							<xsl:with-param name="TargetNode" select="DateAcquired"/>
							<xsl:with-param name="BackupName">IRS8938OFA-ATMDateAcquiredMonth</xsl:with-param>
						</xsl:call-template>               
						<xsl:call-template name="PopulateDay">
							<xsl:with-param name="TargetNode" select="DateAcquired"/>
							<xsl:with-param name="BackupName">IRS8938OFA-ATMDateAcquiredDay</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="DateAcquired"/>
							<xsl:with-param name="BackupName">IRS8938OFA-ATMDateAcquiredYear</xsl:with-param>
						</xsl:call-template>-->
					</div>
				</div>
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 3a  End of Date Acquired-->
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 3b  Start of Disposed Of Date-->
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">b</div>
					<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
						Date asset disposed of during tax year, if applicable
					<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">...................</span>
					</div>
					<div class="styFixedUnderline" style="height:4mm;padding-left:2mm;">
						<!--<xsl:call-template name="PopulateMonth">
							<xsl:with-param name="TargetNode" select="DisposedOfDt"/>
							<xsl:with-param name="BackupName">IRS8938OFA-ATMDisposedOfDtMonth</xsl:with-param>
						</xsl:call-template>                
						<xsl:call-template name="PopulateDay">
							<xsl:with-param name="TargetNode" select="DisposedOfDt"/>
							<xsl:with-param name="BackupName">IRS8938OFA-ATMDisposedOfDtDay</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="DisposedOfDt"/>
							<xsl:with-param name="BackupName">IRS8938OFA-ATMDisposedOfDtYear</xsl:with-param>
						</xsl:call-template>-->
					</div>
				</div>
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 3b  End of Disposed Of Date-->
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 3c  Start of Jointly Owned With 
					 Spouse Ind-->
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">c</div>
					<div class="styLNDesc" style="width:80mm;padding-left:2mm;">
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMJointlyOwnedWithSpouseInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMJointlyOwnedWithSpouseInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Check if asset jointly owned with spouse
						</label>
					</div>
					<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 3c  End of Jointly Owned With
						 Spouse Ind-->
					<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 3d  Start of No Tax Item Reported Ind-->
					<div class="styLNDesc" style="width:99mm;padding-left:2mm;"><b>d</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMNoTaxItemReportedInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMNoTaxItemReportedInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Check if no tax item reported in Part III with respect to this asset
						</label>
					</div>
				</div>	
			</div>
			<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 3d  End of No Tax Item Reported Ind-->
			<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 4  Start of Maximum value of asset
				 during tax year-->
			<div class="styBB" style="width:187mm;">	
				<div style="width:187mm;float:left;clear:none;">
					<div class="styLNLeftNumBox"  style="padding-left:2mm;">4</div>
					<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
						Maximum value of asset during tax year (check box that applies)
					</div>
				</div>
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 4a  Start of Max. Value During TY 0
					 To 50000 Ind-->
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">a</div>
					<div class="styLNDesc" style="width:35mm;padding-left:2mm;">
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="MaxValueDuringTY0To50000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMMaxValueDuringTY0To50000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="MaxValueDuringTY0To50000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMMaxValueDuringTY0To50000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							$0 - $50,000
						</label>
					</div>
					<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 4a  End of Max. Value During TY 0 
						 To 50000 Ind-->
					<!--PART II REPEATING ADDITIONAL TABLE MESSAGE   Line 4b  Start of Max. Value During TY 
						 50001 To 100000 Ind-->
					<div class="styLNDesc" style="width:45mm;padding-left:2mm;"><b>b</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="MaxValueDurTY50001To100000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMMaxValueDurTY50001To100000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="MaxValueDurTY50001To100000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMMaxValueDurTY50001To100000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							$50,001 - $100,000
						</label>
					</div>
				   <!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 4b  End of Max. Value During TY 
						50001 To 100000 Ind-->
				   <!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 4c  Start of Max. Value During TY 
						100001 To 150000 Ind-->
					<div class="styLNDesc" style="width:50mm;padding-left:2mm;"><b>c</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="MaxValueDurTY100001To150000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMMaxValueDurTY100001To150000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="MaxValueDurTY100001To150000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMMaxValueDurTY100001To150000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							$100,001 - $150,000
						</label>
					</div>
					<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 4c  End of Max. Value During TY
						 100001 To 150000 Ind-->
				    <!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 4d  Start of Max. Value During TY
						 150001 To 200000 Ind-->
					<div class="styLNDesc" style="width:45mm;padding-left:2mm;"><b>d</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="MaxValueDurTY150001To200000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMMaxValueDurTY150001To200000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="MaxValueDurTY150001To200000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMMaxValueDurTY150001To200000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							$150,001 - $200,000
						</label>
					</div>
				</div>
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 4d  End of Max. Value During TY 
					150001 To 200000 Ind-->
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 4e  Start of Max. Value During TY
					 More Max. Amount-->
				<div style="width:187mm;">		    
					<div class="styLNLeftNumBox" style="height:2mm;padding-left:4mm;padding-top:0mm;
					  padding-bottom:0mm;">e</div>
					<div  class="styLNDesc" style="height:2mm;width:146mm;padding-left:2mm;padding-top:0mm;
					  padding-bottom:0mm;">If more than $200,000, list value
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-right:1mm;">.......................</span>$
					</div>
					<div class="styLNAmountBoxNB"  style="height:2mm;padding-top:0mm;padding-bottom:0mm;" 
					  valign="bottom">
						<!--<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="MaxValueDurTYMoreMaxAmt"/>
							<xsl:with-param name="BackupName">IRS8938OFA-ATMMaxValueDurTYMoreMaxAmt
							</xsl:with-param>
						</xsl:call-template>                         -->
					</div>
				</div>
			</div>
			<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 4e  End of Max. Value During TY 
				 More Max. Amount-->	
			<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 5  Start of Exchange Rate used-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">5</div>
				<div  class="styLNDesc" style="height:5mm;width:179mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">
					Did you use a foreign currency exchange rate to convert the value of the asset into U.S. dollars?
					<!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-right:1mm;">......</span>
						<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Start of Exchange Rate Used Ind "Yes"-->
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMExchangeRateUsedInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabelYes">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMExchangeRateUsedInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Yes
						</label>
						<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  End of Exchange Rate Used Ind "Yes"-->
						<span style="width:5px;"/>
						<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Start of Exchange Rate Used Ind "No"-->
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMExchangeRateUsedInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMExchangeRateUsedInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							No
						</label>
						<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  End of Exchange Rate Used Ind "No"-->
				</div>
			</div>
			<br/>
			<!--<xsl:choose>
				<xsl:when test="position()=1"><div class="pageEnd"  style="width:187mm;"/>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>	
	</xsl:if>-->
	<!--  PART II REPEATING ADDITIONAL TABLE MESSAGE  FOOTER-->
        <div class="pageEnd"  style="width:187mm;border-top:1px solid black;">
          <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span> 
          <span style="width:116px;"></span>                      
          Cat. No. 37753A
          <span style="width:106px;"></span>  
          Form <span class="styBoldText" style="font-size:9pt">8938</span> (11-2012)
        </div>
        <!--Begin Page 2 -->
	<!-- Page Header -->
		<div class="styBB" style="width:187mm;">
			<div style="float:left;">Form 8938 (11-2012)<span style="width:145mm;"/></div>
			<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>
		</div>
	<!-- END Page Header --> 	
	<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  End of Other Foreign Assets Lines 1 thru 5-->
	<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Start of Other Foreign Assets (continued)
		 Lines 6 thru 8-->
	<!--<xsl:if test="(count($FormData/OtherForeignAssetGrp) &gt;=2)">
		<xsl:for-each select="$FormData/OtherForeignAssetGrp">-->
			<div class="styBB" style="width:187mm;">
				<div class="styPartName" style="font-size:9pt;padding-bottom:.5mm;font-family:arial">Part II</div>
				<div class="styPartDesc" style="width:164mm;font-size:9pt;padding-left:3mm;float:left; clear:none">
				  Other Foreign Assets<span style="font-weight:normal;"> (continued)</span></div>
			</div>
			<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 6  Start of If you answered "Yes" to line 5, 
				 complete all that apply-->		
			<div style="width:187mm;float:left;clear:none;border-style:solid;border-color:black;
			  border-width: 0px 0px 1px 0px;">
				<div class="styLNLeftNumBox"  style="padding-left:2mm;padding-top:.7mm;height:5mm">6</div>
				<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;padding-top:.7mm;height:5mm">
					If you answered “Yes” to line 5, complete all that apply.
				</div>
			</div>	
			<div class="styBB" style="width:187mm;">
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 6(1)  Start of Foreign Currency 
					 Description Text-->
				<div style="width:60mm;float:left;clear:none;">
					<div class="styLNDesc" style="width:55mm;padding-left:10mm;padding-bottom:2mm;">
							<b>(1) </b> Foreign currency in which<br/> asset is denominated
					</div>
					<div class="styLNDesc"  style="width:55mm;padding-top:1mm;padding-left:8.5mm;" valign="bottom">	
						<!--<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignCurrencyDescTxt"/>
							<xsl:with-param name="BackupName">IRS8938OFA-ATMForeignCurrencyDescTxt
							</xsl:with-param>
						</xsl:call-template>                         -->
					</div>
				</div>
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 6(1)  End of Foreign Currency 
					 Description Text-->
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 6(2)  Start of Exchange Rate Used-->
				<div style="width:63mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 1px 0px 1px;">
					<div class="styLNDesc" style="width:61mm;padding-left:2mm;padding-bottom:2mm;">
							<b>(2) </b> Foreign currency exchange rate used to convert to U.S. dollars
					</div>
					<div class="styLNDesc"  style="width:61mm;padding-top:1mm;padding-left:.8mm;text-align:right"
					  valign="bottom">	
						<!--<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="ExchangeRateUsed"/>
							<xsl:with-param name="BackupName">IRS8938OFA-ATMExchangeRateUsed</xsl:with-param>
						</xsl:call-template>                       -->
					</div>
				</div>
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 6(2)  End of Exchange Rate Used-->
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 6(3)  Start of Source  Of Exchange
					 Rate Used Text-->
				<div style="width:64mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 0px 0px 0px;">
					<div class="styLNDesc" style="width:62mm;padding-left:2mm;padding-bottom:2mm;">
							<b>(3) </b> Source of exchange rate used if not from U.S. Treasury Financial Management Service
					</div>
					<div class="styLNDesc"  style="width:62mm;padding-top:1mm;" valign="bottom">	
						<!--<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="SourceOfExchangeRateUsedTxt"/>
							<xsl:with-param name="BackupName">IRS8938OFA-ATMSourceOfExchangeRateUsedTxt
							</xsl:with-param>
						</xsl:call-template>                         -->
					</div>
				</div>
			</div>
			<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 6(3)  End of Source Of Exchange 
				 Rate Used Text-->
			<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 7 Report information-->
			<div  style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:2mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">7</div>
				<div  class="styLNDesc" style="height:2mm;width:179mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">If asset reported in Part II, line 1, is stock of a foreign entity or an interest in a
				  foreign entity, report the following information.
				</div>
			</div>
			<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 7a  Start of Name of Foreign Entity-->
			<div style="width:187mm;">
				<div class="styLNLeftLtrBox"  style="padding-left:4mm;">a</div>
				<div class="styLNDesc" style="width:32mm;padding-left:2mm;">
					Name of foreign entity
				</div>
				<div class="styFixedUnderline" style="width:147mm;padding-left:2mm;">
					<!--<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="NameOfEntity/BusinessNameLine1"/>
					</xsl:call-template> 
					<xsl:if test="NameOfEntity/BusinessNameLine2">
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="NameOfEntity/BusinessNameLine2"/>
						</xsl:call-template>
					 </xsl:if>                 -->
				</div>
			</div>
			<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 7a  End of Name of Foreign Entity-->
			<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 7b  Start of Type of Foreign Entity-->	
			<div style="width:187mm;">
				<div class="styLNLeftLtrBox"  style="padding-left:4mm;">b</div>
				<div class="styLNDesc" style="width:50mm;padding-left:2mm;">Type of foreign entity</div>
				<!--Part II Line 7b (1)  Start of Partnership-->
				<div  class="styLNDesc" style="width:35mm;"><b>(1)</b>
					<span style="width:5px;"/>
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="PartnershipInd"/>
							<xsl:with-param name="BackupName">IRS8938OFA-ATMPartnershipInd
							<xsl:number value="position()"/>
							</xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:5px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="PartnershipInd"/>
							<xsl:with-param name="BackupName">IRS8938OFA-ATMPartnershipInd
							<xsl:number value="position()"/>
							</xsl:with-param>
						</xsl:call-template>
						Partnership
					</label>
					<span style="width:5px;"/>
				</div>
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 7b (1)  End of Partnership-->
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 7b (2)  Start of Corporation-->
				<div  class="styLNDesc" style="width:35mm;"><b>(2)</b>
					<span style="width:5px;"/>
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="CorporationInd"/>
							<xsl:with-param name="BackupName">IRS8938OFA-ATMCorporationInd
							<xsl:number value="position()"/>
							</xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:5px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="CorporationInd"/>
							<xsl:with-param name="BackupName">IRS8938OFA-ATMCorporationInd
							<xsl:number value="position()"/>
							</xsl:with-param>
						</xsl:call-template>
						Corporation 
					</label>
					<span style="width:5px;"/>
				</div>
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 7b (2)  End of Corporation-->
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 7b (3)  Start of Trust-->
				<div  class="styLNDesc" style="width:35mm;"><b>(3)</b>
					<span style="width:5px;"/>
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
						  <xsl:with-param name="TargetNode" select="TrustInd"/>
						  <xsl:with-param name="BackupName">IRS8938OFA-ATMTrustInd<xsl:number value="position()"/>
						  </xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:5px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
						  <xsl:with-param name="TargetNode" select="TrustInd"/>
						  <xsl:with-param name="BackupName">IRS8938OFA-ATMTrustInd<xsl:number value="position()"/>
						  </xsl:with-param>
						</xsl:call-template>
						Trust 
					</label>
					<span style="width:5px;"/>
				</div>
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 7b (3)  End of Trust-->
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 7b (4)  Start of Estate-->
				<div  class="styLNDesc" style="width:20mm;"><b>(4)</b>
					<span style="width:5px;"/>
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="EstateInd"/>
							<xsl:with-param name="BackupName">IRS8938OFA-ATMEstateInd
							<xsl:number value="position()"/>
							</xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:5px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="EstateInd"/>
							<xsl:with-param name="BackupName">IRS8938OFA-ATMEstateInd
							<xsl:number value="position()"/>
							</xsl:with-param>
						</xsl:call-template>
						Estate 
					</label>
				</div>
			</div>
			<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 7b (4)  End of Estate-->
			<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 7c  Start of Mailing Address-->
			<div style="width:187mm;">
				<div class="styLNLeftLtrBox"  style="padding-left:4mm;">c</div>
				<div  class="styLNDesc" style="height:2mm;width:179mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">
					Mailing address of foreign entity. Number, street, and room or suite no.
				</div>
				<div  class="styFixedUnderline" style="height:2mm;width:179mm;padding-left:2mm;padding-top:1mm;
				  padding-bottom:0mm;">
					<xsl:if test="OtherForeignAssetGrp/USAddress">
						<!--<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode">USAddress/AddressLine1</xsl:with-param>
						</xsl:call-template><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode">USAddress/AddressLine2</xsl:with-param>
						</xsl:call-template>-->
					</xsl:if>
					<xsl:if test="ForeignAddress">
						<!--<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode">ForeignAddress/AddressLine1</xsl:with-param>
						</xsl:call-template><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode">ForeignAddress/AddressLine2</xsl:with-param>
						</xsl:call-template>-->
					</xsl:if>
				</div>
			</div>
			<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 7c  End of Mailing Address-->
			<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 7d  Start of City, State and country-->
			<div style="width:187mm;border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
				<div class="styLNLeftLtrBox"  style="padding-left:4mm;">d</div>
				<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-bottom:0mm;">
					City or town, province or state, and country (including postal code)
				</div>
				<div class="styLNDesc"  style="width:186mm;padding-left:10mm;">	
							<xsl:if test="OtherForeignAssetGrp/USAddress">
								<!--<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode">USAddress/City</xsl:with-param>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode">USAddress/State</xsl:with-param>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode">USAddress/ZIPCode</xsl:with-param>
								</xsl:call-template>-->
							</xsl:if>
							<xsl:if test="ForeignAddress">
								<!--<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode">ForeignAddress/City</xsl:with-param>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode">ForeignAddress/ProvinceOrState</xsl:with-param>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode">ForeignAddress/PostalCode</xsl:with-param>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode">ForeignAddress/Country</xsl:with-param>
								</xsl:call-template>-->
							</xsl:if>
				</div>
			</div>
			<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 7d  Start of City, State and country-->
			<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 8  Start of Report information-->
			<!--<xsl:for-each select="AssetNotStockOfForeignEntGrp">-->
			    <div  style="width:187mm;">
				    <div class="styLNLeftNumBox" style="height:2mm;padding-left:2mm;padding-top:0mm;
				      padding-bottom:0mm;">8</div>
					<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-top:0mm;
					  padding-bottom:1mm;">
					  If asset reported in Part II, line 1, is not stock of a foreign entity or an interest in a foreign entity, enter
					  the following information for the asset.
					</div>
					<div  class="styLNDesc" style="width:179mm;padding-left:10mm;padding-top:0mm;
					  padding-bottom:0mm;">
						<b>Note.</b> If this asset has more than one issuer or counterparty, attach a continuation sheet
						 with the same information for each additional issuer or counterparty (see instructions).
					</div>
				</div><br/>
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 8a  Start of Name of Issuer-->
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">a</div>
					<div class="styLNDesc" style="width:45mm;padding-left:2mm;">
					  Name of issuer or counterparty
					</div>
					<div class="styFixedUnderline" style="width:133mm;">
						<!--<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
						</xsl:call-template>
						<xsl:if test="BusinessName/BusinessNameLine2">
							<br/>	
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
							</xsl:call-template>
						</xsl:if>-->
					</div>
				</div>
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 8a  End of Name of Issuer-->	
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 8a  Start of Check if information is
					 for Issuer or Counterparty-->
				<div  style="width:187mm;padding-left:10mm;">
					<div class="styLNDesc" style="width:50.5mm;">Check if information is for</div>
					<div class="styLNDesc" style="width:35mm;">
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="IssuerInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMIssuerInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="IssuerInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMIssuerInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
							Issuer
						</label>
					</div>
					<div class="styLNDesc" style="width:35.5mm;">
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMCounterpartyInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMCounterpartyInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Counterparty
						</label>
					</div>
				</div><br/>
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 8b  Start of Type of Issuer or 
					 counterparty-->
				<div  style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">b</div>
					<div class="styLNDesc" style="width:179mm;padding-left:2mm;">Type of issuer or counterparty</div>
				</div>	
				<!--Part II Line 8b (1)  Start of Individual-->
				<div class="styLNDesc" style="width:187mm;padding-left:10mm;">
					<div  class="styLNDesc" style="width:47.3mm;"><b>(1)</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="IndividualInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMIndividualInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="IndividualInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMIndividualInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
							Individual
						</label>
					</div>
					<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 8b (1)  End of Individual-->
					<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 8b (2)  Start of Partnership-->
					<div  class="styLNDesc" style="width:32.5mm;"><b>(2)</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode"  select="PartnershipInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMPartnershipInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="PartnershipInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMPartnershipInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
							Partnership
						</label>
					</div>
					<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 8b (2)  End of Partnership-->
					<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 8b (3)  Start of Corporation-->
					<div  class="styLNDesc" style="width:35mm;"><b>(3)</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="CorporationInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMCorporationInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="CorporationInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMCorporationInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
							Corporation 
						</label>
					</div>
					<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 8b (3)  End of Corporation-->
					<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 8b (4)  Start of Trust-->
					<div  class="styLNDesc" style="width:37mm;"><b>(4)</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="TrustInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMTrustInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="TrustInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMTrustInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
							Trust 
						</label>
					</div>
					<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 8b (5)  Start of Estate-->
					<div  class="styLNDesc" style="width:20mm;"><b>(5)</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="EstateInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMEstateInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="EstateInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMEstateInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
							Estate 
						</label>
					</div>
				</div><br/><br/>
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 8b (5)  End of Estate-->
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 8c  Start of Check if Issuer or 
					 Counterparty is US or Foreign-->
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">c</div>
					<div class="styLNDesc" style="width:55mm;padding-left:2mm;">Check if issuer or counterparty is a
					</div>
					<div class="styLNDesc" style="width:30.5mm;">	
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="USPersonInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMUSPersonInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="USPersonInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMUSPersonInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
							U.S. person
						</label>
					</div>	
					<div class="styLNDesc" style="width:40mm;padding-left:2mm;">
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="ForeignPersonInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMForeignPersonInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="ForeignPersonInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-ATMForeignPersonInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Foreign person
						</label>
					</div>	
				</div><br/>
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 8c  End of Check if Issuer or 
					 Counterparty is US or Foreign-->	
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 8d  Start of Mailing Address-->	
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">d</div>
					<div  class="styLNDesc" style="height:2mm;width:179mm;padding-left:2mm;padding-top:0mm;
					  padding-bottom:0mm;">Mailing address of issuer or counterparty. Number, street, and room or suite
					  no.
					</div>
					<div  class="styFixedUnderline" style="height:2mm;width:179mm;padding-left:2mm;padding-top:1mm;
					  padding-bottom:0mm;">
						<xsl:if test="AssetNotStockOfForeignEntGrp/USAddress">
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode">USAddress/AddressLine1</xsl:with-param>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode">USAddress/AddressLine2</xsl:with-param>
							</xsl:call-template>-->
						</xsl:if>
						<xsl:if test="AssetNotStockOfForeignEntGrp/ForeignAddress">
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode">ForeignAddress/AddressLine1</xsl:with-param>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode">ForeignAddres/AddressLine2</xsl:with-param>
							</xsl:call-template>-->
						</xsl:if>
					</div>
				</div>
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 8d  End of Mailing Address-->
				<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 8e  Start of City, State or Country-->	
				<div style="width:187mm;border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">e</div>
					<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-bottom:0mm;">
					  City or town, province or state, and country (including postal code)
					</div>
					<div class="styLNDesc"  style="width:186mm;padding-left:10mm;">	
						<xsl:if test="AssetNotStockOfForeignEntGrp/USAddress">
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="USAddress/City"/>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="USAddress/State"/>
							</xsl:call-template>,
							<span style="width:2px;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode">USAddress/ZIPCode</xsl:with-param>
							</xsl:call-template>-->
						</xsl:if>
						<xsl:if test="AssetNotStockOfForeignEntGrp/ForeignAddress">
							<!--<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode">ForeignAddress/City</xsl:with-param>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode">ForeignAddress/ProvinceOrState</xsl:with-param>
							</xsl:call-template>,
							<span style="width:2px;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode">ForeignAddress/PostalCode</xsl:with-param>
							</xsl:call-template>,
							<span style="width:2px;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode">ForeignAddress/Country</xsl:with-param>
							</xsl:call-template>-->
						</xsl:if>
					</div>
				</div>
			<!--</xsl:for-each>-->
			<!--PART II REPEATING ADDITIONAL TABLE MESSAGE  Line 8e  End of City, State or Country-->	
		<!--</xsl:for-each>-->
	</xsl:if>		
	
	<!--PART III  Start -->   
   	<!-- BEGIN PART III TITLE -->
	<div class="styBB" style="width:187mm;">
		<div class="styPartName" style="font-size:9pt;padding-bottom:.5mm;font-family:arial">Part III</div>
		<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;float:left;clear:none;">
			Summary of Tax Items Attributable to Specified Foreign Financial Assets
			<span style="font-weight:normal;"> (see instructions)</span></div>
	</div>
	<!-- END PART IIl TITLE -->  
	<div style="width:187mm;border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
		<div class="styLNDesc"  style= "height:8mm;width:40mm;text-align:center;padding-top:4mm;
		  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">Asset Category</div>
		<div class="styLNDesc"  style="height:8mm;width:30mm;text-align:center;padding-top:4mm;
		  border-style:solid;border-color:black;border-width: 0px 1px 0px 1px;">Tax item</div>
		<div class="styLNDesc"  style="height:8mm;width:34.28mm;text-align:center;border-style:solid;
		  border-color:black;border-width: 0px 1px 0px 0px;">Amount reported on<br/> form or schedule</div>
		<div style="height:8mm;width:82mm;float:left;clear:none;">
			<div class="styLNDesc"  style="width:82mm;text-align:center;padding-top:0mm;padding-bottom:0mm;
			  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">Where reported</div><br/>
			<div style="width:82mm;">
				<div class="styLNDesc"  style="width:41mm;text-align:center;padding-top:0mm;padding-bottom:0mm;
				  border-style:solid;border-color:black;border-width: 0px 1px 0px 0px;">Form and line</div>
				<div class="styLNDesc"  style="width:41mm;text-align:center;padding-top:0mm;
				  padding-bottom:0mm;">Schedule and line</div>
			</div>
		</div>
	</div>
	<!--PART III  Start of Foreign Deposit and Custodial Accounts -->
	<!--INTEREST-->
	<div  style="width:187mm;">
		<div  class="styLNDesc" style="height:2mm;width:40mm;padding-bottom:0mm;">
			l. Foreign Deposit and<br/><span style="width:2mm"/> Custodial Accounts</div>
		<div class="styLNDesc"  style="width:30mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 0px 1px 1px 1px;"><b>a </b> Interest</div>
		<div  class="styLNDesc" style="width:2mm;border-style:solid;border-color:black;
		  border-width: 0px 0px 1px 0px;">$</div>
		<div class="styLNAmountBox"  style="border-left-width:0px;">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" 
		select="$FormData/ForeignFinclAccountSumGrp/InterestSumGrp/ReportedOnFormOrScheduleAmt"/>
			</xsl:call-template>                         
		</div>
		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 0px 1px 1px 1px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" 
		select="$FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLine"/>
			</xsl:call-template>
		</div> 
		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 0px 0px 1px 0px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode"
		select="$FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedScheduleAndLine"/>
			</xsl:call-template>
		</div>
		<div  class="styLNDesc" style="height:0mm;width:64mm;padding-left:3mm;padding-top:0mm;"/>
		<!-- Interest Test Form <=1 and Schedule >1)-->
		<xsl:if test="	
	  (count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLine) &lt;=1)
	       and
	  (count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedScheduleAndLine) &gt;1) ">
       		<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 0px 0px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Interest Test Form >1 and (Form > Sched)-->
		<xsl:if test="	
	 ((count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Interest Test Form >1 and (Form <= Sched)-->
		<xsl:if test="	
	 ((count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLine)) &lt;=
	  (count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Interest Test Schedule >1 and (Form = Schedule)-->
		<xsl:if test="	
	  ((count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLine)) =
	  (count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>		
		<!-- Interest Test Schedule >1 and (Form < Schedule)-->
		<xsl:if test="	
	  ((count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and 
	  ((count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLine)) &lt;
	  (count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Interest Test Schedule >1 and (Form > Schedule)-->
		<xsl:if test="	
	  ((count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/ForeignFinclAccountSumGrp/InterestSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
	</div>
	<br/>
	<!--DIVIDENDS-->
	<div  style="width:187mm;">
		<div  class="styLNDesc" style="height:2mm;width:40mm;padding-left:3mm;padding-top:0mm;"/>
		<div class="styLNDesc"  style="width:30mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;"><b>b </b> Dividends</div>
		<div  class="styLNDesc" style="width:2mm;border-style:solid;border-color:black;
		  border-width: 1px 0px 1px 0px;"> $</div>
		<div class="styLNAmountBox"  style="border-left-width:0px;border-top-width:1px">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" 
		select="$FormData/ForeignFinclAccountSumGrp/DividendSumGrp/ReportedOnFormOrScheduleAmt"/>
			</xsl:call-template>                         
		</div>
		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode"
		select="$FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLine"/>
			</xsl:call-template>
		</div>
		<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 0px 1px 0px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode"
		select="$FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedScheduleAndLine"/>
			</xsl:call-template>
		</div>
		<div  class="styLNDesc" style="height:0mm;width:104mm;padding-left:3mm;padding-top:0mm;"/>
		<!-- Dividend Test Form <=1 and Schedule >1)-->
		<xsl:if test="	
	  (count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLine) &lt;=1)
	       and
	  (count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedScheduleAndLine) &gt;1) ">
			<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
		  border-color:black;border-width: 0px 0px 0px 0px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Dividend Test Form >1 and (Form > Sched)-->
		<xsl:if test="	
	 ((count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Dividend Test Form >1 and (Form <= Sched)-->
		<xsl:if test="	
	 ((count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLine)) &lt;=
	  (count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>		
		<!-- Dividend Test Schedule >1 and (Form = Schedule)-->
		<xsl:if test="	
	  ((count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLine)) =
	  (count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Dividend Test Schedule >1 and (Form < Schedule)-->
		<xsl:if test="	
	  ((count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and 
	  ((count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLine)) &lt;
	  (count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Dividend Test Schedule >1 and (Form > Schedule)-->
		<xsl:if test="	
	  ((count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/ForeignFinclAccountSumGrp/DividendSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
	</div>
	<br/>
	<!-- ROYALTIES>-->
	<div  style="width:187mm;">
		<div  class="styLNDesc" style="height:2mm;width:40mm;padding-left:3mm;padding-top:0mm;"/>
		<div class="styLNDesc"  style="width:30mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;"><b>c </b> Royalties</div>
		<div  class="styLNDesc" style="width:2mm;border-style:solid;border-color:black;
		  border-width: 1px 0px 1px 0px;"> $</div>
		<div class="styLNAmountBox"  style="border-left-width:0px;border-top-width:1px">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" 
		select="$FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/ReportedOnFormOrScheduleAmt"/>
			</xsl:call-template>                         
		</div>
		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" 
		select="$FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLine"/>
			</xsl:call-template>
		</div>
		<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 0px 1px 0px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" 
		select="$FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine"/>
			</xsl:call-template>
		</div>
		<div  class="styLNDesc" style="height:0mm;width:104mm;padding-left:3mm;padding-top:0mm;"/>
		<!-- Royalty Test Form <=1 and Schedule >1)-->
		<xsl:if test="	
	  (count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLine) &lt;=1)
	       and
	  (count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine) &gt;1) ">
			<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
		  border-color:black;border-width: 0px 0px 0px 0px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Royalty Test Form >1 and (Form > Sched)-->
		<xsl:if test="	
	 ((count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Royalty Test Form >1 and (Form <= Sched)-->
		<xsl:if test="	
	 ((count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLine)) &lt;=
	  (count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>		
		<!-- Royalty Test Schedule >1 and (Form = Schedule)-->
		<xsl:if test="	
	  ((count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLine)) =
	  (count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Royalty Test Schedule >1 and (Form < Schedule)-->
		<xsl:if test="	
	  ((count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and 
	  ((count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLine)) &lt;
	  (count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Royalty Test Schedule >1 and (Form > Schedule)-->
		<xsl:if test="	
	  ((count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/ForeignFinclAccountSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
	</div>
	<br/>
	<!--OTHER INCOME-->
	<div  style="width:187mm;">
		<div  class="styLNDesc" style="height:2mm;width:40mm;padding-left:3mm;padding-top:0mm;"/>
		<div class="styLNDesc"  style="width:30mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;"><b>d </b> Other income</div>
		<div  class="styLNDesc" style="width:2mm;border-style:solid;border-color:black;
		  border-width: 1px 0px 1px 0px;"> $</div>
		<div class="styLNAmountBox"  style="border-left-width:0px;border-top-width:1px">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" 
		select="$FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/ReportedOnFormOrScheduleAmt"/>
			</xsl:call-template>                         
		</div>
		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" 
		select="$FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine"/>
			</xsl:call-template>
		</div>
		<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 0px 1px 0px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode"
		select="$FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine"/>
			</xsl:call-template>
		</div>
		<div  class="styLNDesc" style="height:0mm;width:104mm;padding-left:3mm;padding-top:0mm;"/>
		<!-- OtherIncome Test Form <=1 and Schedule >1)-->
		<xsl:if test="	
	 (count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine) &lt;=1)
	      and
	 (count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine) &gt;1) ">
			<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
		  border-color:black;border-width: 0px 0px 0px 0px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- OtherIncome Test Form >1 and (Form > Sched)-->
		<xsl:if test="	
	 ((count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- OtherIncome Test Form >1 and (Form <= Sched)-->
		<xsl:if test="	
	 ((count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine)) &lt;=
	  (count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>		
		<!-- OtherIncome Test Schedule >1 and (Form = Schedule)-->
		<xsl:if test="	
	  ((count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine)) =
	  (count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- OtherIncome Test Schedule >1 and (Form < Schedule)-->
		<xsl:if test="	
	  ((count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and 
	  ((count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine)) &lt;
	  (count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- OtherIncome Test Schedule >1 and (Form > Schedule)-->
		<xsl:if test="	
	  ((count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/ForeignFinclAccountSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
	</div>
	<br/>
	<!--GAINLOSS-->
	<div  style="width:187mm;">
		<div  class="styLNDesc" style="height:2mm;width:40mm;padding-left:3mm;padding-top:0mm;"/>
		<div class="styLNDesc"  style="width:30mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;"><b>e </b> Gains (losses)</div>
		<div  class="styLNDesc" style="width:2mm;border-style:solid;border-color:black;
		  border-width: 1px 0px 1px 0px;"> $</div>
		<div class="styLNAmountBox"  style="border-left-width:0px;border-top-width:1px">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" 
		select="$FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/ReportedOnFormOrScheduleAmt"/>
			</xsl:call-template>                         
		</div>
		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" 
		select="$FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLine"/>
			</xsl:call-template>
		</div>
		<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 0px 1px 0px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode"
		select="$FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine"/>
			</xsl:call-template>
		</div>
		<div  class="styLNDesc" style="height:0mm;width:104mm;padding-left:3mm;padding-top:0mm;"/>
		<!-- GainLoss Test Form <=1 and Schedule >1)-->
		<xsl:if test="	
	 (count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLine) &lt;=1)
	      and
	 (count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine) &gt;1) ">
			<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
		  border-color:black;border-width: 0px 0px 0px 0px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- GainLoss Test Form >1 and (Form > Sched)-->
		<xsl:if test="	
	 ((count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- GainLoss Test Form >1 and (Form <= Sched)-->
		<xsl:if test="	
	 ((count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLine)) &lt;=
	  (count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>		
		<!-- GainLoss Test Schedule >1 and (Form = Schedule)-->
		<xsl:if test="	
	  ((count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLine)) =
	  (count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- GainLoss Test Schedule >1 and (Form < Schedule)-->
		<xsl:if test="	
	  ((count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and 
	  ((count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLine)) &lt;
	  (count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- GainLoss Test Schedule >1 and (Form > Schedule)-->
		<xsl:if test="	
	  ((count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/ForeignFinclAccountSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
	</div>
	<br/>
	<!--DEDUCTION-->
	<div  style="width:187mm;">
		<div  class="styLNDesc" style="height:2mm;width:40mm;padding-left:3mm;padding-top:0mm;"/>
		<div class="styLNDesc"  style="width:30mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;"><b>f </b> Deductions</div>
		<div  class="styLNDesc" style="width:2mm;border-style:solid;border-color:black;
		  border-width: 1px 0px 1px 0px;"> $</div>
		<div class="styLNAmountBox"  style="border-left-width:0px;border-top-width:1px">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode"
		select="$FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/ReportedOnFormOrScheduleAmt"/>
			</xsl:call-template>                         
		</div>
		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode"
		select="$FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLine"/>
			</xsl:call-template>
		</div>
		<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 0px 1px 0px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode"
		select="$FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine"/>
			</xsl:call-template>
		</div>
		<div  class="styLNDesc" style="height:0mm;width:104mm;padding-left:3mm;padding-top:0mm;"/>
		<!-- Deduction Test Form <=1 and Schedule >1)-->
		<xsl:if test="	
	 (count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLine) &lt;=1)
	      and
	 (count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine) &gt;1) ">
			<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
		  border-color:black;border-width: 0px 0px 0px 0px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Deduction Test Form >1 and (Form > Sched)-->
		<xsl:if test="	
	 ((count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Deduction Test Form >1 and (Form <= Sched)-->
		<xsl:if test="	
	 ((count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLine)) &lt;=
	  (count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>		
		<!-- Deduction Test Schedule >1 and (Form = Schedule)-->
		<xsl:if test="	
	  ((count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLine)) =
	  (count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Deduction Test Schedule >1 and (Form < Schedule)-->
		<xsl:if test="	
	  ((count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and 
	  ((count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLine)) &lt;
	  (count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Deduction Test Schedule >1 and (Form > Schedule)-->
		<xsl:if test="	
	  ((count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/ForeignFinclAccountSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
	</div>
	<br/>
	<!--CREDIT-->
	<div  style="width:187mm;">
		<div  class="styLNDesc" style="height:2mm;width:40mm;padding-left:3mm;padding-top:0mm;"/>
		<div class="styLNDesc"  style="width:30mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;"><b>g </b> Credits</div>
		<div  class="styLNDesc" style="width:2mm;border-style:solid;border-color:black;
		  border-width: 1px 0px 1px 0px;"> $</div>
		<div class="styLNAmountBox"  style="border-left-width:0px;border-top-width:1px">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" 
		select="$FormData/ForeignFinclAccountSumGrp/CreditSumGrp/ReportedOnFormOrScheduleAmt"/>
			</xsl:call-template>                         
		</div>
		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode"
			select="$FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLine"/>
			</xsl:call-template>
		</div>
		<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 0px 1px 0px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" 
		select="$FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedScheduleAndLine"/>
			</xsl:call-template>
		</div>
		<div  class="styLNDesc" style="height:0mm;width:104mm;padding-left:3mm;padding-top:0mm;"/>
		<!-- Credit Test Form <=1 and Schedule >1)-->
		<xsl:if test="	
	 (count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLine) &lt;=1)
	      and
	 (count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedScheduleAndLine) &gt;1) ">
			<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
		  border-color:black;border-width: 0px 0px 0px 0px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Credit Test Form >1 and (Form > Sched)-->
		<xsl:if test="	
	 ((count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Credit Test Form >1 and (Form <= Sched)-->
		<xsl:if test="	
	 ((count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLine)) &lt;=
	  (count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>		
		<!-- Credit Test Schedule >1 and (Form = Schedule)-->
		<xsl:if test="	
	  ((count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLine)) =
	  (count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Credit Test Schedule >1 and (Form < Schedule)-->
		<xsl:if test="	
	  ((count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and 
	  ((count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLine)) &lt;
	  (count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Credit Test Schedule >1 and (Form > Schedule)-->
		<xsl:if test="	
	  ((count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/ForeignFinclAccountSumGrp/CreditSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
	</div>
	<br/>
	<!--PART III  End of Foreign Deposit and Custodial Accounts-->
	
	<!--PART III  Start of Other Foreign Assets -->
	<!--OTHER INTEREST-->
	<div  style="width:187mm;">
		<div  class="styLNDesc" style="height:2mm;width:40mm;padding-bottom:0mm;border-style:solid;
		  border-color:black;border-width: 1px 0px 0px 0px;">
		  ll. Other Foreign Assets</div>
		<div class="styLNDesc"  style="width:30mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;"><b>a </b> Interest</div>
		<div  class="styLNDesc" style="width:2mm;border-style:solid;border-color:black;
		  border-width: 1px 0px 1px 0px;">$</div>
		<div class="styLNAmountBox"  style="border-left-width:0px;border-top-width:1px">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode"
		select="$FormData/OtherForeignAssetSumGrp/InterestSumGrp/ReportedOnFormOrScheduleAmt"/>
			</xsl:call-template>                         
		</div>
		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" 
		select="$FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLine"/>
			</xsl:call-template>
		</div>
		<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 0px 1px 0px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" 
		select="$FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedScheduleAndLine"/>
			</xsl:call-template>
		</div>
		<div  class="styLNDesc" style="height:0mm;width:104mm;padding-left:3mm;padding-top:0mm;"/>
		<!-- Other Interest Test Form <=1 and Schedule >1)-->
		<xsl:if test="	
	  (count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLine) &lt;=1)
	       and
	  (count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedScheduleAndLine) &gt;1) ">
       		<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 0px 0px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other Interest Test Form >1 and (Form > Sched)-->
		<xsl:if test="	
	 ((count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other Interest Test Form >1 and (Form <= Sched)-->
		<xsl:if test="	
	 ((count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLine)) &lt;=
	  (count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>		
		<!-- Other Interest Test Schedule >1 and (Form = Schedule)-->
		<xsl:if test="	
	  ((count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLine)) =
	  (count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other Interest Test Schedule >1 and (Form < Schedule)-->
		<xsl:if test="	
	  ((count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and 
	  ((count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLine)) &lt;
	  (count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other Interest Test Schedule >1 and (Form > Schedule)-->
		<xsl:if test="	
	  ((count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/OtherForeignAssetSumGrp/InterestSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
	</div>
	<br/>
	<!--OTHER DIVIDEND-->
	<div  style="width:187mm;">
		<div  class="styLNDesc" style="height:2mm;width:40mm;padding-left:3mm;padding-top:0mm;"/>
		<div class="styLNDesc"  style="width:30mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;"><b>b </b> Dividends</div>
		<div  class="styLNDesc" style="width:2mm;border-style:solid;border-color:black;
		  border-width: 1px 0px 1px 0px;"> $</div>
		<div class="styLNAmountBox"  style="border-left-width:0px;border-top-width:1px">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" 
		select="$FormData/OtherForeignAssetSumGrp/DividendSumGrp/ReportedOnFormOrScheduleAmt"/>
			</xsl:call-template>                         
		</div>
		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode"
		select="$FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLine"/>
			</xsl:call-template>
		</div>
		<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 0px 1px 0px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode"
		select="$FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedScheduleAndLine"/>
			</xsl:call-template>
		</div>
		<div  class="styLNDesc" style="height:0mm;width:104mm;padding-left:3mm;padding-top:0mm;"/>
		<!-- Other Dividend Test Form <=1 and Schedule >1)-->
		<xsl:if test="	
	  (count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLine) &lt;=1)
	       and
	  (count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedScheduleAndLine) &gt;1) ">
			<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
		  border-color:black;border-width: 0px 0px 0px 0px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other Dividend Test Form >1 and (Form > Sched)-->
		<xsl:if test="	
	 ((count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other Dividend Test Form >1 and (Form <= Sched)-->
		<xsl:if test="	
	 ((count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLine)) &lt;=
	  (count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>		
		<!-- Other Dividend Test Schedule >1 and (Form = Schedule)-->
		<xsl:if test="	
	  ((count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLine)) =
	  (count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other Dividend Test Schedule >1 and (Form < Schedule)-->
		<xsl:if test="	
	  ((count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and 
	  ((count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLine)) &lt;
	  (count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other Dividend Test Schedule >1 and (Form > Schedule)-->
		<xsl:if test="	
	  ((count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/OtherForeignAssetSumGrp/DividendSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
	</div>
	<br/>
	<!-- OTHER ROYALTY-->			
	<div  style="width:187mm;">
		<div  class="styLNDesc" style="height:2mm;width:40mm;padding-left:3mm;padding-top:0mm;"/>
		<div class="styLNDesc"  style="width:30mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;"><b>c </b> Royalties</div>
		<div  class="styLNDesc" style="width:2mm;border-style:solid;border-color:black;
		  border-width: 1px 0px 1px 0px;"> $</div>
		<div class="styLNAmountBox"  style="border-left-width:0px;border-top-width:1px">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode"
		select="$FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/ReportedOnFormOrScheduleAmt"/>
			</xsl:call-template>                         
		</div>
		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode"
		select="$FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLine"/>
			</xsl:call-template>
		</div>
		<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 0px 1px 0px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode"
		select="$FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine"/>
			</xsl:call-template>
		</div>
		<div  class="styLNDesc" style="height:0mm;width:104mm;padding-left:3mm;padding-top:0mm;"/>
		<!-- Other Royalty Test Form <=1 and Schedule >1)-->
		<xsl:if test="	
	  (count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLine) &lt;=1)
	       and
	  (count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine) &gt;1) ">
			<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
		  border-color:black;border-width: 0px 0px 0px 0px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other Royalty Test Form >1 and (Form > Sched)-->
		<xsl:if test="	
	 ((count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other Royalty Test Form >1 and (Form <= Sched)-->
		<xsl:if test="	
	 ((count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLine)) &lt;=
	  (count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>		
		<!-- Other Royalty Test Schedule >1 and (Form = Schedule)-->
		<xsl:if test="	
	  ((count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLine)) =
	  (count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other Royalty Test Schedule >1 and (Form < Schedule)-->
		<xsl:if test="	
	  ((count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and 
	  ((count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLine)) &lt;
	  (count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other Royalty Test Schedule >1 and (Form > Schedule)-->
		<xsl:if test="	
	  ((count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/OtherForeignAssetSumGrp/RoyaltySumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
	</div>
	<br/>
	<!--OTHER OTHER INCOME-->
	<div  style="width:187mm;">
		<div  class="styLNDesc" style="height:2mm;width:40mm;padding-left:3mm;padding-top:0mm;"/>
		<div class="styLNDesc"  style="width:30mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;"><b>d </b> Other income</div>
		<div  class="styLNDesc" style="width:2mm;border-style:solid;border-color:black;
		  border-width: 1px 0px 1px 0px;"> $</div>
		<div class="styLNAmountBox"  style="border-left-width:0px;border-top-width:1px">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode"
		select="$FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/ReportedOnFormOrScheduleAmt"/>
			</xsl:call-template>                         
		</div>
		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" 
		select="$FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine"/>
			</xsl:call-template>
		</div>
		<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 0px 1px 0px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode"
		select="$FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine"/>
			</xsl:call-template>
		</div>
		<div  class="styLNDesc" style="height:0mm;width:104mm;padding-left:3mm;padding-top:0mm;"/>
		<!-- Other OtherIncome Test Form <=1 and Schedule >1)-->
		<xsl:if test="	
	 (count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine) &lt;=1)
	      and
	 (count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine) &gt;1) ">
			<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
		  border-color:black;border-width: 0px 0px 0px 0px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other OtherIncome Test Form >1 and (Form > Sched)-->
		<xsl:if test="	
	 ((count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other OtherIncome Test Form >1 and (Form <= Sched)-->
		<xsl:if test="	
	 ((count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine)) &lt;=
	  (count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>		
		<!-- Other OtherIncome Test Schedule >1 and (Form = Schedule)-->
		<xsl:if test="	
	  ((count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine)) =
	  (count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other OtherIncome Test Schedule >1 and (Form < Schedule)-->
		<xsl:if test="	
	  ((count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and 
	  ((count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine)) &lt;
	  (count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other OtherIncome Test Schedule >1 and (Form > Schedule)-->
		<xsl:if test="	
	  ((count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/OtherForeignAssetSumGrp/OtherIncomeSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
	</div>
	<br/>
	<!--OTHER GAIN LOSS-->
	<div  style="width:187mm;">
		<div  class="styLNDesc" style="height:2mm;width:40mm;padding-left:3mm;padding-top:0mm;"/>
		<div class="styLNDesc"  style="width:30mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;"><b>e </b> Gains (losses)</div>
		<div  class="styLNDesc" style="width:2mm;border-style:solid;border-color:black;
		  border-width: 1px 0px 1px 0px;"> $</div>
		<div class="styLNAmountBox"  style="border-left-width:0px;border-top-width:1px">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" 
		select="$FormData/OtherForeignAssetSumGrp/GainLossSumGrp/ReportedOnFormOrScheduleAmt"/>
			</xsl:call-template>                         
		</div>
		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" 
		select="$FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLine"/>
			</xsl:call-template>
		</div>
		<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 0px 1px 0px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode"
		select="$FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine"/>
			</xsl:call-template>
		</div>
		<div  class="styLNDesc" style="height:0mm;width:104mm;padding-left:3mm;padding-top:0mm;"/>
		<!-- Other GainLoss Test Form <=1 and Schedule >1)-->
		<xsl:if test="	
	 (count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLine) &lt;=1)
	      and
	 (count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine) &gt;1) ">
			<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
		  border-color:black;border-width: 0px 0px 0px 0px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other GainLoss Test Form >1 and (Form > Sched)-->
		<xsl:if test="	
	 ((count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other GainLoss Test Form >1 and (Form <= Sched)-->
		<xsl:if test="	
	 ((count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLine)) &lt;=
	  (count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>		
		<!-- Other GainLoss Test Schedule >1 and (Form = Schedule)-->
		<xsl:if test="	
	  ((count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLine)) =
	  (count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other GainLoss Test Schedule >1 and (Form < Schedule)-->
		<xsl:if test="	
	  ((count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and 
	  ((count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLine)) &lt;
	  (count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other GainLoss Test Schedule >1 and (Form > Schedule)-->
		<xsl:if test="	
	  ((count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/OtherForeignAssetSumGrp/GainLossSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
	</div>
	<br/>
	<!--OTHER DEDUCTIONS-->
	<div  style="width:187mm;">
		<div  class="styLNDesc" style="height:2mm;width:40mm;padding-left:3mm;padding-top:0mm;"/>
		<div class="styLNDesc"  style="width:30mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;"><b>f </b> Deductions</div>
		<div  class="styLNDesc" style="width:2mm;border-style:solid;border-color:black;
		  border-width: 1px 0px 1px 0px;"> $</div>
		<div class="styLNAmountBox"  style="border-left-width:0px;border-top-width:1px">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode"
		select="$FormData/OtherForeignAssetSumGrp/DeductionSumGrp/ReportedOnFormOrScheduleAmt"/>
			</xsl:call-template>                         
		</div>
		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode"
		select="$FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLine"/>
			</xsl:call-template>
		</div>
		<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 0px 1px 0px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode"
		select="$FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine"/>
			</xsl:call-template>
		</div>
		<div class="styLNDesc" style="height:0mm;width:104mm;padding-left:3mm;padding-top:0mm;"/>
		<!-- Other Deduction Test Form <=1 and Schedule >1)-->
		<xsl:if test="	
	 (count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLine) &lt;=1)
	      and
	 (count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine) &gt;1) ">
			<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
		  border-color:black;border-width: 0px 0px 0px 0px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other Deduction Test Form >1 and (Form > Sched)-->
		<xsl:if test="	
	 ((count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other Deduction Test Form >1 and (Form <= Sched)-->
		<xsl:if test="	
	 ((count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLine)) &lt;=
	  (count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>		
		<!-- Other Deduction Test Schedule >1 and (Form = Schedule)-->
		<xsl:if test="	
	  ((count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLine)) =
	  (count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other Deduction Test Schedule >1 and (Form < Schedule)-->
		<xsl:if test="	
	  ((count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and 
	  ((count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLine)) &lt;
	  (count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other Deduction Test Schedule >1 and (Form > Schedule)-->
		<xsl:if test="	
	  ((count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/OtherForeignAssetSumGrp/DeductionSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
	</div>
	<br/>
	<!--OTHER CREDIT-->		
	<div  style="width:187mm;border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
		<div  class="styLNDesc" style="height:2mm;width:40mm;padding-left:3mm;padding-top:0mm;"/>
		<div class="styLNDesc"  style="width:30mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;"><b>g </b> Credits</div>
		<div  class="styLNDesc" style="width:2mm;border-style:solid;border-color:black;
		  border-width: 1px 0px 1px 0px"> $</div>
		<div class="styLNAmountBox"  style="border-left-width:0px;border-bottom-width:1px;border-top-width:1px">
			<xsl:call-template name="PopulateAmount">
				<xsl:with-param name="TargetNode" 
		select="$FormData/OtherForeignAssetSumGrp/CreditSumGrp/ReportedOnFormOrScheduleAmt"/>
			</xsl:call-template>                         
		</div>
		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 1px 1px 1px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode"
		select="$FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLine"/>
			</xsl:call-template>
		</div>
		<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;border-style:solid;
		  border-color:black;border-width: 1px 0px 1px 0px;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode"
		select="$FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedScheduleAndLine"/>
			</xsl:call-template>
		</div>
		<div  class="styLNDesc" style="height:0mm;width:104mm;padding-left:3mm;padding-top:0mm;"/>
		<!-- Other Credit Test Form <=1 and Schedule >1)-->
		<xsl:if test="	
	 (count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLine) &lt;=1)
	      and
	 (count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedScheduleAndLine) &gt;1) ">
			<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
		  border-color:black;border-width: 0px 0px 0px 0px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc" style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 0px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other Credit Test Form >1 and (Form > Sched)-->
		<xsl:if test="	
	 ((count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 1px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other Credit Test Form >1 and (Form <= Sched)-->
		<xsl:if test="	
	 ((count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLine) &gt;1)
	       and 
	 ((count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLine)) &lt;=
	  (count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedScheduleAndLine))))">
       		<div class="styLNDesc"  style="width:41.1mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 1px;padding-top:0mm">
				<xsl:for-each 
		select="$FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:40.7mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>		
		<!-- Other Credit Test Schedule >1 and (Form = Schedule)-->
		<xsl:if test="	
	  ((count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLine)) =
	  (count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other Credit Test Schedule >1 and (Form < Schedule)-->
		<xsl:if test="	
	  ((count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and 
	  ((count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLine)) &lt;
	  (count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 1px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
		<!-- Other Credit Test Schedule >1 and (Form > Schedule)-->
		<xsl:if test="	
	  ((count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedScheduleAndLine) &gt;1)
	       and
	  ((count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedFormAndLine)) &gt;
	  (count($FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedScheduleAndLine))))">
			<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:0mm;border-style:solid;
			  border-color:black;border-width: 0px 0px 1px 0px;padding-top:0mm;">
				<xsl:for-each
		select="$FormData/OtherForeignAssetSumGrp/CreditSumGrp/WhereReportedScheduleAndLine">
					<xsl:choose>
						<xsl:when test="position()>1">
							<div class="styLNDesc"  style="width:41.3mm;text-align:left;padding-left:1mm;
							  border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="."/>
								</xsl:call-template>
							</div>
						</xsl:when>
					</xsl:choose>
				</xsl:for-each>
			</div>
		</xsl:if>
	</div>
	<br/>
	<!--PART III  End of Other Foreign Assets )-->	
	<!--Start of Part IV-->   
   	<!-- BEGIN PART IV TITLE -->
		<div class="styBB" style="width:187mm;">
			<div class="styPartName" style="font-size:9pt;padding-bottom:.5mm;font-family:arial">Part IV</div>
			<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;float:left;clear:none;">
 				Excepted Specified Foreign Financial Assets<span style="font-weight:normal;"> (see instructions)
 				</span></div>
		</div>
	<!-- END PART lV TITLE -->  
					
		<div  style="width:187mm;">	
				<div  class="styLNDesc" style="width:187mm;padding-bottom:3mm;">
					If you reported specified foreign financial assets on the following forms, check the appropriate box(es). Indicate number of forms filed. 
					You do not need to include these assets on Form 8938 for the tax year.
				</div>
		</div>				
		<div style="width:187mm;">
			<div  class="styLNDesc" style="width:60mm;">
				<div  class="styLNDesc" style="width:13mm;">
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode"
							select="$FormData/ExceptedSpcfdFrgnAssetGrp/Form3520Ind"/>
							<xsl:with-param name="BackupName">IRS8938Form3520Ind</xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:1px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode"
							select="$FormData/ExceptedSpcfdFrgnAssetGrp/Form3520Ind"/>
							<xsl:with-param name="BackupName">IRS8938Form3520Ind</xsl:with-param>
						</xsl:call-template>
						3520
					</label>
				</div>
				<div  class="styLNDesc" style="width:23mm;">Number of forms</div>
				<div class="styFixedUnderline" style="width:15mm;font-size:6.3pt;text-align:right">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" 
				select="$FormData/ExceptedSpcfdFrgnAssetGrp/Form3520Ind/@formCnt"/>
					</xsl:call-template>                
				</div>
			</div>
			<div  class="styLNDesc" style="width:64mm;">
				<div  class="styLNDesc" style="width:16mm;">
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode"
							select="$FormData/ExceptedSpcfdFrgnAssetGrp/Form3520AInd"/>
							<xsl:with-param name="BackupName">IRS8938Form3520AInd</xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:1px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode"
							select="$FormData/ExceptedSpcfdFrgnAssetGrp/Form3520AInd"/>
							<xsl:with-param name="BackupName">IRS8938Form3520AInd</xsl:with-param>
						</xsl:call-template>
						3520-A
					</label>
				</div>
				<div  class="styLNDesc" style="width:23mm;">Number of forms</div>
				<div class="styFixedUnderline" style="width:16mm;font-size:6.3pt;text-align:right">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode"
						select="$FormData/ExceptedSpcfdFrgnAssetGrp/Form3520AInd/@formCnt"/>
					</xsl:call-template>                 
				</div>
			</div>
			<div  class="styLNDesc" style="width:63mm;">
				<div  class="styLNDesc" style="width:13mm;">
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode"
							select="$FormData/ExceptedSpcfdFrgnAssetGrp/Form5471Ind"/>
							<xsl:with-param name="BackupName">IRS8938Form5471Ind</xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:1px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" 
							select="$FormData/ExceptedSpcfdFrgnAssetGrp/Form5471Ind"/>
							<xsl:with-param name="BackupName">IRS8938Form5471Ind</xsl:with-param>
						</xsl:call-template>
						5471
					</label>
				</div>
				<div  class="styLNDesc" style="width:23mm;">Number of forms</div>
				<div class="styFixedUnderline" style="width:16mm;font-size:6.3pt;text-align:right">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" 
				    	select="$FormData/ExceptedSpcfdFrgnAssetGrp/Form5471Ind/@formCnt"/>
					</xsl:call-template>               
				</div>
			</div>
		</div>

		<div style="width:187mm;">
			<div  class="styLNDesc" style="width:60mm;">
				<div  class="styLNDesc" style="width:13mm;">
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode"
							select="$FormData/ExceptedSpcfdFrgnAssetGrp/Form8621Ind"/>
							<xsl:with-param name="BackupName">IRS8938Form8621Ind</xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:1px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode"
							select="$FormData/ExceptedSpcfdFrgnAssetGrp/Form8621Ind"/>
							<xsl:with-param name="BackupName">IRS8938Form8621Ind</xsl:with-param>
						</xsl:call-template>
						8621
					</label>
				</div>
				<div  class="styLNDesc" style="width:23mm;">Number of forms</div>
				<div class="styFixedUnderline" style="width:15mm;font-size:6.3pt;text-align:right">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" 
						select="$FormData/ExceptedSpcfdFrgnAssetGrp/Form8621Ind/@formCnt"/>
					</xsl:call-template>                
				</div>
			</div>
			<div  class="styLNDesc" style="width:64mm;">
				<div  class="styLNDesc" style="width:16mm;">
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" 
							select="$FormData/ExceptedSpcfdFrgnAssetGrp/Form8865Ind"/>
							<xsl:with-param name="BackupName">IRS8938Form8865Ind</xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:1px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode"
							select="$FormData/ExceptedSpcfdFrgnAssetGrp/Form8865Ind"/>
							<xsl:with-param name="BackupName">IRS8938Form8865Ind</xsl:with-param>
						</xsl:call-template>
						8865
					</label>
				</div>
				<div  class="styLNDesc" style="width:23mm;">Number of forms</div>
				<div class="styFixedUnderline" style="width:16mm;font-size:6.3pt;text-align:right">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" 
						select="$FormData/ExceptedSpcfdFrgnAssetGrp/Form8865Ind/@formCnt"/>
					</xsl:call-template>                 
				</div>
			</div>
			<div  class="styLNDesc" style="width:63mm;">
				<div  class="styLNDesc" style="width:13mm;">
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode"
							select="$FormData/ExceptedSpcfdFrgnAssetGrp/Form8891Ind"/>
							<xsl:with-param name="BackupName">IRS8938Form8891Ind</xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:1px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" 
							select="$FormData/ExceptedSpcfdFrgnAssetGrp/Form8891Ind"/>
							<xsl:with-param name="BackupName">IRS8938Form8891Ind</xsl:with-param>
						</xsl:call-template>
						8891
					</label>
				</div>
				<div  class="styLNDesc" style="width:23mm;">Number of forms</div>
				<div class="styFixedUnderline" style="width:16mm;font-size:6.3pt;text-align:right">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" 
				    	select="$FormData/ExceptedSpcfdFrgnAssetGrp/Form8891Ind/@formCnt"/>
					</xsl:call-template>               
				</div>
			</div>
		</div>
			
		<!--  FOOTER-->
        <div style="width:187mm;border-top:1px solid black;text-align:right">
            Form <span class="styBoldText" style="font-size:9pt;">8938</span> (11-2012)
        </div> 
        <div class="pageEnd"/>
        
        <!-- BEGIN Left Over Table -->  
        <!-- Additonal Data Title Bar and Button -->
        <div class="styLeftOverTitleLine" id="LeftoverData">
          <div class="styLeftOverTitle">
            Additional Data        
          </div>
          <div class="styLeftOverButtonContainer">
            <input class="styLeftoverTableBtn" TabIndex="1"  type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
          </div>      
        </div>
        <!-- Additional Data Table -->
        <table class="styLeftOverTbl">
          <xsl:call-template name="PopulateCommonLeftover">
            <xsl:with-param name="TargetNode" select="$FormData" />
            <xsl:with-param name="DescWidth" select="100"/>
          </xsl:call-template>          
        <xsl:call-template name="PopulateLeftoverRow"> 
            <xsl:with-param name="Desc">Single Producer</xsl:with-param> 
            <xsl:with-param name="TargetNode" select="$FormData/SingleProducer"/> 
            <xsl:with-param name="DescWidth" select="100"/> 
        </xsl:call-template> 
        </table>
      <!-- END Left Over Table -->  
      
    <!--OPTIONAL SEPARATED PRINT FOR REPEATING DATA TABLE FOR PART I LINES 1 - 9 --> 
    <!--PART I SEPARATED PRINT  Start of Foreign Deposit and Custodial Accounts--> 	
    <xsl:if test="(count($FormData/ForeignFinclAccountGrp) &gt;= 2) and ($Print = $Separated)">
		<span class="styRepeatingDataTitle" style="font-weight:bold;font-size:10pt;background-color:lightblue">
		  Part I Foreign Deposit and Custodial Accounts Lines 1-9</span>
	    <br/><br/>	
		<xsl:for-each select="$FormData/ForeignFinclAccountGrp">
			<!-- PART I SEPARATED PRINT  BEGIN TITLE -->
			<div class="styBB" style="width:187mm;">
				<div class="styPartName" style="font-size:9pt;padding-bottom:.5mm;font-family:arial">Part I</div>
				<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;float:left;clear:none;">
				  Foreign Deposit and Custodial Accounts<span style="font-weight:normal;"> (see instructions)</span>
				</div>
			</div>	
			<!-- PART I SEPARATED PRINT  END TITLE --> 
			<div class="styBB" style="width:187mm;">
				<div  class="styLNDesc" style="width:187mm;">
				  If you have more than one account to report, attach a continuation sheet with the same information for
				  each additional account (see instructions).</div>
			</div>
			<div class="styBB" style="width:187mm;">
				<!--PART I SEPARATED PRINT  Start of Type Of Account-->
				<div style="width:45mm;float:left;clear:none;">
					<div class="styLNLeftNumBox" style="padding-left:2mm;">1</div>
					<div class="styLNDesc" style="width:30mm;padding-left:2mm;">
						Type of account
					</div>
				</div>
				<div style="width:65mm;float:left;clear:none;">
					<!--PART I SEPARATED PRINT  Start of Deposit Account Type Ind-->	
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="DepositAccountTypeInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-SEPDepositAccountTypeInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="DepositAccountTypeInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-SEPDepositAccountTypeInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Deposit 
						</label>
						<!--PART I SEPARATED PRINT  End of Deposit Account Type Ind-->	
						<span style="width:8mm;"/>
						<!--PART I SEPARATED PRINT  Start of Custodial Account Type Ind-->	
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="CustodialAccountTypeInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-SEPCustodialAccountTypeInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="CustodialAccountTypeInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-SEPCustodialAccountTypeInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Custodial
						</label>
						<!--PART I SEPARATED PRINT  End of Custodial Account Type Ind-->	
				</div>
				<!--PART I SEPARATED PRINT  End of Type Of Account-->
				<!--PART I SEPARATED PRINT  Start of Identifying Designation Number-->
				<div style="width:70mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 0px 0px 1px;">
					<div class="styLNLeftNumBox" style="width:5mm;text-align:center;float:left;
					  padding-bottom:0mm;">2</div>
					<div class="styLNDesc" style="width:64mm;padding-left:2mm;padding-bottom:0mm;">
							Account number or other designation
					</div>
					<div class="styLNDesc"  style="width:64mm;padding-left:5.5mm;padding-bottom:0mm;
					  padding-top:1mm;" valign="bottom">
					  	<xsl:choose>
							<xsl:when test="IdentifyingDesignationNumber">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="IdentifyingDesignationNumber"/>
								</xsl:call-template>                        
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BankAccountNumber"/>
								</xsl:call-template>                        
							</xsl:otherwise>
						</xsl:choose> 
					</div>
				</div>
				<!--PART I SEPARATED PRINT  End of Identifying Designation Number-->
			</div> 
			<div class="styBB" style="width:187mm;">
				<div  style="width:187mm;">
					<div style="width:40mm;float:left;clear: none;">
						<div class="styLNLeftNumBox" style="padding-left:2mm;">3</div>
						<div class="styLNDesc" style="width:30mm;padding-left:2mm;float:left;">
							Check all that apply
						</div>
					</div>
					<!--PART I SEPARATED PRINT  Start of Account Opened During Tax Year Ind-->	
					<div  class="styLNDesc" style="width:60mm;"><b>a</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="AccountOpenedDuringTaxYearInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-SEPAccountOpenedDuringTaxYearInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="AccountOpenedDuringTaxYearInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-SEPAccountOpenedDuringTaxYearInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Account opened during tax year
						</label>
					</div>
					<!--PART I SEPARATED PRINT  End of Account Opened During Tax Year Ind-->
					<!--PART I SEPARATED PRINT  Start of Account Closed During Tax Year Ind-->		
					<div  class="styLNDesc" style="width:85mm;"><b>b</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="AccountClosedDuringTaxYearInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-SEPAccountClosedDuringTaxYearInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="AccountClosedDuringTaxYearInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-SEPAccountClosedDuringTaxYearInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Account closed during tax year
						</label>
					</div>
					<!--PART I SEPARATED PRINT  End of Account Closed During Tax Year Ind-->
				</div>
				<div  style="width:187mm;">
					<div style="width:40mm;float:left;clear: none;"/>
					<!--PART I SEPARATED PRINT  Start of Jointly Owned With Spouse Ind-->
					<div  class="styLNDesc" style="width:60mm;"><b>c</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-SEPJointlyOwnedWithSpouseInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-SEPJointlyOwnedWithSpouseInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Account jointly owned with spouse
						</label>
					</div>
					<!--PART I SEPARATED PRINT  End of Jointly Owned With Spouse Ind-->
					<!--PART I SEPARATED PRINT  Start of No Tax Item Reported Ind-->
					<div  class="styLNDesc" style="width:87mm;"><b>d</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-SEPNoTaxItemReportedInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-SEPNoTaxItemReportedInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							No tax item reported in Part III with respect to this account
						</label>
					</div>
					<!--PART I SEPARATED PRINT  End of No Tax Item Reported Ind-->
				</div>
			</div>
			<!--PART I SEPARATED PRINT  Line 4  Start of Max. Account Value During TY Amount-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">4</div>
				<div  class="styLNDesc" style="height:5mm;width:146mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">
					Maximum value of account during tax year
					<!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-right:1mm;">....................</span>$
				</div>
				<div class="styLNAmountBoxNB"  style="height:2mm;padding-top:.7mm;padding-bottom:0mm;"
				  valign="bottom">
					<xsl:call-template name="PopulateAmount">
						<xsl:with-param name="TargetNode" select="MaxAccountValueDurTYAmt"/>
					</xsl:call-template>                         
				</div>
			</div>
			<!--PART I SEPARATED PRINT  End of Line 4 Max. Account Value During TY Amount-->
			<!--PART I SEPARATED PRINT  Line 5  Start of Exchange Rate Used Ind-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">5</div>
				<div  class="styLNDesc" style="height:5mm;width:179mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">
					Did you use a foreign currency exchange rate to convert the value of the account into U.S. dollars?
					<!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-right:1mm;">.....</span>
						<!--PART I SEPARATED PRINT  Start of Exchange Rate Used Ind "Yes"-->
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-SEPExchangeRateUsedInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabelYes">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-SEPExchangeRateUsedInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Yes
						</label>
						<!--PART I SEPARATED PRINT  End of Exchange Rate Used Ind "Yes"-->
						<span style="width:10px;"/>
						<!--PART I SEPARATED PRINT  Start of Exchange Rate Used Ind "No"-->
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-SEPExchangeRateUsedInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938FFA-SEPExchangeRateUsedInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							No
						</label>
						<!--PART I SEPARATED PRINT  End of Exchange Rate Used Ind "No"-->
				</div>
			</div>
			<!--PART I SEPARATED PRINT  Line 5  End of Exchange Rate Used Ind-->
			<!--PART I SEPARATED PRINT  Line 6  Start of If you answered yes to line 5, complete all that apply-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">6</div>
				<div  class="styLNDesc" style="height:5mm;width:179mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">
					If you answered “Yes” to line 5, complete all that apply.
				</div>
			</div>
			<div class="styBB" style="width:187mm;">
				<!--PART I SEPARATED PRINT  Start of Foreign Currency Description Text-->
				<div style="width:60mm;float:left;clear:none;">
					<div class="styLNDesc" style="width:55mm;padding-left:10mm;">
							<b>(1) </b> Foreign currency in which<br/> account is maintained
					</div>
					<div class="styLNDesc"  style="width:55mm;padding-top:1mm;padding-left:9mm;" valign="bottom">	
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignCurrencyDescTxt"/>
							<xsl:with-param name="BackupName">IRS8938FFA-SEPForeignCurrencyDescTxt
							</xsl:with-param>
						</xsl:call-template>                         
					</div>
				</div>
				<!--PART I SEPARATED PRINT  End of Foreign Currency Description Text-->
				<!--PART I SEPARATED PRINT  Start of Exchange Rate Used-->
				<div style="width:63mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 1px 0px 1px;">
					<div class="styLNDesc" style="width:61mm;padding-left:2mm;padding-bottom:2mm;">
							<b>(2) </b> Foreign currency exchange rate used to convert to U.S. dollars
					</div>
					<div class="styLNDesc"  style="width:61mm;padding-top:1mm;text-align:right" valign="bottom">	
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="ExchangeRateUsed"/>
							<xsl:with-param name="BackupName">IRS8938FFA-SEPExchangeRateUsed</xsl:with-param>
						</xsl:call-template>                        
					</div>
				</div>
				<!--PART I SEPARATED PRINT  End of Exchange Rate Used-->
				<!--PART I SEPARATED PRINT  Start of Source Of Exchange Rate Used Text-->
				<div style="width:64mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 0px 0px 0px;">
					<div class="styLNDesc" style="width:62mm;padding-left:2mm;padding-bottom:2mm;">
							<b>(3) </b> Source of exchange rate used if not from U.S. Treasury Financial Management Service
					</div>
					<div class="styLNDesc"  style="width:62mm;padding-top:1mm;" valign="bottom">	
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="SourceOfExchangeRateUsedTxt"/>
							<xsl:with-param name="BackupName">IRS8938FFA-SEPSourceOfExchangeRateUsedTxt
							</xsl:with-param>
						</xsl:call-template>                         
					</div>
				</div>
				<!--PART I SEPARATED PRINT  End of Source Of Exchange Rate Used Text-->
			</div>
			<!--PART I SEPARATED PRINT  Line 6  End of If you answered yes to line 5, complete all that apply-->
			<!--PART I SEPARATED PRINT  Line 7  Start of Part I Foreign Deposit and Custodial Accounts Business
				 Name-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">7</div>
				<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">
					Name of financial institution in which account is maintained
				</div>
				<div class="styLNDesc"  style="width:186mm;padding-top:1mm;padding-left:10mm;" valign="bottom">	
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
					</xsl:call-template>
					<xsl:if test="BusinessName/BusinessNameLine2">
						<br/>	
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
						</xsl:call-template>
					</xsl:if>
				</div>
			</div>
			<!--PART I SEPARATED PRINT  Line 7  End of Part I Foreign Deposit and Custodial Accounts Business 
				 Name-->
			<!--PART I SEPARATED PRINT  Line 8  Mailing Address-->	
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">8</div>
				<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">
					Mailing address of financial institution in which account is maintained. Number, street, and room or
					suite no.
				</div>
				<div class="styLNDesc"  style="width:62mm;padding-top:1mm;padding-left:10mm;"  valign="bottom">
					<!--PART I SEPARATED PRINT  Start of Foreign Deposit and Custodial Accounts US Address-->	
						<xsl:if test="USAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="USAddress/AddressLine1"/>
								<xsl:with-param name="BackupName">IRS8938FFA-SEPUSAddressLine1</xsl:with-param>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="USAddress/AddressLine2"/>
								<xsl:with-param name="BackupName">IRS8938FFA-SEPUSAddressLine2</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
					<!--PART I SEPARATED PRINT  End of Foreign Deposit and Custodial Accounts US Address-->
					<!--PART I SEPARATED PRINT  Start of Foreign Deposit and Custodial Accounts Foreign Address-->	
						<xsl:if test="ForeignAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1"/>
								<xsl:with-param name="BackupName">IRS8938FFA-SEPForeignAddressLine1
								</xsl:with-param>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2"/>
								<xsl:with-param name="BackupName">IRS8938FFA-SEPForeignAddressLine2
								</xsl:with-param>
							</xsl:call-template>
						</xsl:if>
					<!--PART I SEPARATED PRINT  End of Foreign Deposit and Custodial Accounts Foreign Address-->	
				</div>
			</div>
			<!--PART I SEPARATED PRINT  Line 8  End of Mailing Address-->
			<!--PART I SEPARATED PRINT  Line 9  Start of City, State and Country-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">9</div>
				<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">
					City or town, province or state, and country (including postal code)
				</div>
				<div class="styLNDesc"  style="width:186mm;padding-top:1mm;padding-left:10mm;">
					<!--PART I SEPARATED PRINT  Start of Foreign Deposit and Custodial Accounts US Address City, 
						State, and Zip Code-->
					<xsl:if test="USAddress">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="USAddress/City"/>
							<xsl:with-param name="BackupName">IRS8938FFA-SEPUSAddressCity</xsl:with-param>
						</xsl:call-template><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="USAddress/State"/>
							<xsl:with-param name="BackupName">IRS8938FFA-SEPUSAddressState</xsl:with-param>
						</xsl:call-template>,
						<span style="width:2px;"/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ZIPCode"/>
							<xsl:with-param name="BackupName">IRS8938FFA-SEPUSAddressZip</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
					<!--End of Part I Foreign Deposit and Custodial Accounts US Address City, State, and Zip Code-->	
					<xsl:if test="ForeignAddress">
						<!--Start of Part I Foreign Deposit and Custodial Accounts Foreign Address City, ProvinceOrState,
                             PostalCode, and Country-->	
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignAddress/City"/>
							<xsl:with-param name="BackupName">IRS8938FFA-SEPForeignAddressCity</xsl:with-param>
						</xsl:call-template><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrState"/>
							<xsl:with-param name="BackupName">IRS8938FFA-SEPForeignAddressProvinceOrState
							</xsl:with-param>
						</xsl:call-template>,
						<span style="width:2px;"/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignAddress/PostalCode"/>
							<xsl:with-param name="BackupName">IRS8938FFA-SEPForeignAddressPostalCode
							</xsl:with-param>
						</xsl:call-template>,
						<span style="width:2px;"/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignAddress/Country"/>
							<xsl:with-param name="BackupName">IRS8938FFA-SEPForeignAddressCountry
							</xsl:with-param>
						</xsl:call-template>
					</xsl:if>
					<!--PART I SEPARATED PRINT  End of Foreign Deposit and Custodial Accounts Foreign Address
						 City, ProvinceOrState, PostalCode, and Country-->	
				</div>
			</div>
			<!--PART I SEPARATED PRINT  Line 9  End of City, State and Country-->
			<!--PART I SEPARATED PRINT  FOOTER-->
			<div class="pageEnd"  style="width:187mm;border-top:1px solid black;">
          <!--<span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span> 
          <span style="width:116px;"></span>                      
          Cat. No. 37753A
          <span style="width:106px;"></span>  
          Form <span class="styBoldText" style="font-size:9pt">8938</span> (11-2012)-->
			</div> 
		</xsl:for-each>
	</xsl:if>
	<!--PART I SEPARATED PRINT  End of Foreign Deposit and Custodial Accounts-->	
	
    <!--OPTIONAL SEPARATED PRINT FOR REPEATING DATA TABLE FOR PART II LINES 1-8 --> 
    <!--PART II SEPARATED PRINT  Start of Other Foreign Assets (see instructions)-->
	<xsl:if test="(count($FormData/OtherForeignAssetGrp) &gt;= 2) and ($Print = $Separated)">
		<span class="styRepeatingDataTitle" style="font-weight:bold;font-size:10pt;background-color:lightblue">
		  Part II Other Foreign Assets Lines 1-8</span>
	    <br/><br/>	
		<xsl:for-each select="$FormData/OtherForeignAssetGrp">
			<!-- PART II SEPARATED PRINT  BEGIN TITLE -->
			<div class="styBB" style="width:187mm;">
				<div class="styPartName" style="font-size:9pt;padding-bottom:.5mm;font-family:arial">Part II</div>
				<div class="styPartDesc" style="font-size:9pt;padding-left:3mm;float:left;clear:none;">
			      Other Foreign Assets<span style="font-weight:normal;"> (see instructions)</span></div>
			</div>
			<!-- PART II SEPARATED PRINT  END TITLE -->  
			<div class="styBB" style="width:187mm;">
				<div  class="styLNDesc" style="width:187mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">
				<b>Note.</b><i> If you reported specified foreign financial assets on Forms 3520, 3520-A, 5471, 8621,
				 8865, or 8891 you do not have to include<br/>the assets on Form 8938. You must complete Part IV. See
				 instructions.</i></div>	
			</div>
			<div class="styBB" style="width:187mm;">
				<div  class="styLNDesc" style="width:187mm;padding-left:2mm;padding-top:0mm;padding-bottom:0mm;">
				  If you have more than one asset to report, attach a continuation sheet with the same information for each
				  additional asset (see instructions).</div>	
			</div>
			<!--PART II SEPARATED PRINT  Line 1  Start of Asset Description-->
			<div class="styBB" style="width:187mm;">
				<div style="width:110mm;float:left;clear:none;">
					<div style="width:70mm;float:left;clear:none;">
						<div class="styLNLeftNumBox"  style="padding-left:2mm;">1</div>
						<div class="styLNDesc" style="width:40mm;padding-left:2mm;">
							Description of asset
						</div>
					</div>	
					<div class="styLNDesc" style="width:110mm;padding-left:8.5mm;float:left;clear:none;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="AssetDescription"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEPAssetDescription</xsl:with-param>
							</xsl:call-template>                         
					</div>
				</div>
				<!--PART II SEPARATED PRINT  Line 1  End of Asset Description-->
				<!--PART II SEPARATED PRINT  Line 2  Start of Identifying Designation Number-->
				<div style="width:70mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 0px 0px 1px;">
					<div class="styLNLeftNumBox" style="width:5mm;text-align:center;float:left;padding-bottom:0mm;">
					  2</div>
					<div class="styLNDesc" style="width:64mm;padding-left:2mm;padding-bottom:0mm;">
					  Identifying number or other designation</div>
					<div class="styLNDesc"  style="width:69mm;padding-left:5.5mm;padding-top:1mm;" valign="bottom">
					<xsl:choose>
							<xsl:when test="IdentifyingDesignationNumber">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="IdentifyingDesignationNumber"/>
									<xsl:with-param name="BackupName">IRS8938OFA-SEPIdentifyingDesignationNumber
									</xsl:with-param>
								</xsl:call-template>                        
							</xsl:when>
							<xsl:otherwise>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="BankAccountNumber"/>
									<xsl:with-param name="BackupName">IRS8938OFA-SEPBankAccountNumber
									</xsl:with-param>
								</xsl:call-template>                        
							</xsl:otherwise>
						</xsl:choose>	
					</div>
				</div>
			</div>
			<!--PART II SEPARATED PRINT  Line 2  End of Identifying Designation Number-->
			<!--PART II SEPARATED PRINT  Line 3  Start of Complete all that apply--> 
			<div class="styBB" style="width:187mm;">	
				<div style="width:187mm;float:left;clear:none;">
					<div class="styLNLeftNumBox"  style="padding-left:2mm;">3</div>
					<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
					  Complete all that apply. See instructions for reporting of multiple acquisition or disposition dates.
					</div>
				</div>	
				<!--PART II SEPARATED PRINT  Line 3a  Start of Date Acquired-->
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">a</div>
					<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
						Date asset acquired during tax year, if applicable
					<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">....................</span>
					</div>
					<div class="styFixedUnderline" style="height:4mm;padding-left:2mm;">
						<xsl:call-template name="PopulateMonth">
							<xsl:with-param name="TargetNode" select="DateAcquired"/>
							<xsl:with-param name="BackupName">IRS8938OFA-SEPDateAcquiredMonth</xsl:with-param>
						</xsl:call-template>               
						<xsl:call-template name="PopulateDay">
							<xsl:with-param name="TargetNode" select="DateAcquired"/>
							<xsl:with-param name="BackupName">IRS8938OFA-SEPDateAcquiredDay</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="DateAcquired"/>
							<xsl:with-param name="BackupName">IRS8938OFA-SEPDateAcquiredYear</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
				<!--PART II SEPARATED PRINT  Line 3a  End of Date Acquired-->
				<!--PART II SEPARATED PRINT  Line 3b  Start of Disposed Of Date-->
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">b</div>
					<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
						Date asset disposed of during tax year, if applicable
					<span class="styDotLn" style="float:none;clear:none;padding-left:2mm;">...................</span>
					</div>
					<div class="styFixedUnderline" style="height:4mm;padding-left:2mm;">
						<xsl:call-template name="PopulateMonth">
							<xsl:with-param name="TargetNode" select="DisposedOfDt"/>
							<xsl:with-param name="BackupName">IRS8938OFA-SEPDisposedOfDtMonth</xsl:with-param>
						</xsl:call-template>                
						<xsl:call-template name="PopulateDay">
							<xsl:with-param name="TargetNode" select="DisposedOfDt"/>
							<xsl:with-param name="BackupName">IRS8938OFA-SEPDisposedOfDtDay</xsl:with-param>
						</xsl:call-template>
						<xsl:call-template name="PopulateYear">
							<xsl:with-param name="TargetNode" select="DisposedOfDt"/>
							<xsl:with-param name="BackupName">IRS8938OFA-SEPDisposedOfDtYear</xsl:with-param>
						</xsl:call-template>
					</div>
				</div>
				<!--PART II SEPARATED PRINT  Line 3b  End of Disposed Of Date-->
				<!--PART II SEPARATED PRINT  Line 3c  Start of Jointly Owned With Spouse Ind-->
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">c</div>
					<div class="styLNDesc" style="width:80mm;padding-left:2mm;">
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEPJointlyOwnedWithSpouseInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="JointlyOwnedWithSpouseInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEPJointlyOwnedWithSpouseInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Check if asset jointly owned with spouse
						</label>
					</div>
					<!--PART II SEPARATED PRINT  Line 3c  End of Jointly Owned With Spouse Ind-->
					<!--PART II SEPARATED PRINT  Line 3d  Start of No Tax Item Reported Ind-->
					<div class="styLNDesc" style="width:99mm;padding-left:2mm;"><b>d</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEPNoTaxItemReportedInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="NoTaxItemReportedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEPNoTaxItemReportedInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Check if no tax item reported in Part III with respect to this asset
						</label>
					</div>
				</div>	
			</div>
			<!--PART II SEPARATED PRINT  Line 3d  End of No Tax Item Reported Ind-->
			<!--PART II SEPARATED PRINT  Line 4  Start of Maximum value of asset during tax year-->
			<div class="styBB" style="width:187mm;">	
				<div style="width:187mm;float:left;clear:none;">
					<div class="styLNLeftNumBox"  style="padding-left:2mm;">4</div>
					<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;">
						Maximum value of asset during tax year (check box that applies)
					</div>
				</div>
				<!--PART II SEPARATED PRINT  Line 4a  Start of Max. Value During TY 0 To 50000 Ind-->
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">a</div>
					<div class="styLNDesc" style="width:35mm;padding-left:2mm;">
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="MaxValueDuringTY0To50000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEPMaxValueDuringTY0To50000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="MaxValueDuringTY0To50000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEPMaxValueDuringTY0To50000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							$0 - $50,000
						</label>
					</div>
					<!--PART II SEPARATED PRINT  Line 4a  End of Max. Value During TY 0 To 50000 Ind-->
					<!--PART II SEPARATED PRINT  Line 4b  Start of Max. Value During TY 50001 To 100000 Ind-->
					<div class="styLNDesc" style="width:45mm;padding-left:2mm;"><b>b</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="MaxValueDurTY50001To100000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEPMaxValueDurTY50001To100000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="MaxValueDurTY50001To100000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEPMaxValueDurTY50001To100000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							$50,001 - $100,000
						</label>
					</div>
				   <!--PART II SEPARATED PRINT  Line 4b  End of Max. Value During TY 50001 To 100000 Ind-->
				   <!--PART II SEPARATED PRINT  Line 4c  Start of Max. Value During TY 100001 To 150000 Ind-->
					<div class="styLNDesc" style="width:50mm;padding-left:2mm;"><b>c</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="MaxValueDurTY100001To150000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEPMaxValueDurTY100001To150000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="MaxValueDurTY100001To150000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEPMaxValueDurTY100001To150000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							$100,001 - $150,000
						</label>
					</div>
					<!--PART II SEPARATED PRINT  Line 4c  End of Max. Value During TY 100001 To 150000 Ind-->
				    <!--PART II SEPARATED PRINT  Line 4d  Start of Max. Value During TY 150001 To 200000 Ind-->
					<div class="styLNDesc" style="width:45mm;padding-left:2mm;"><b>d</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="MaxValueDurTY150001To200000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEPMaxValueDurTY150001To200000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="MaxValueDurTY150001To200000Ind"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEPMaxValueDurTY150001To200000Ind
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							$150,001 - $200,000
						</label>
					</div>
				</div>
				<!--PART II SEPARATED PRINT  Line 4d  End of Max. Value During TY 150001 To 200000 Ind-->
				<!--PART II SEPARATED PRINT  Line 4e  Start of Max. Value During TY More Max. Amount-->
				<div style="width:187mm;">		    
					<div class="styLNLeftNumBox" style="height:2mm;padding-left:4mm;padding-top:0mm;
					  padding-bottom:0mm;">e</div>
					<div  class="styLNDesc" style="height:2mm;width:146mm;padding-left:2mm;padding-top:0mm;
					  padding-bottom:0mm;">If more than $200,000, list value
						<!--Dotted Line-->
						<span class="styDotLn" style="float:none;clear:none;padding-right:1mm;">.......................</span>$
					</div>
					<div class="styLNAmountBoxNB"  style="height:2mm;padding-top:0mm;padding-bottom:0mm;" 
					  valign="bottom">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="MaxValueDurTYMoreMaxAmt"/>
							<xsl:with-param name="BackupName">IRS8938OFA-SEPMaxValueDurTYMoreMaxAmt
							</xsl:with-param>
						</xsl:call-template>                         
					</div>
				</div>
			</div>
			<!--PART II SEPARATED PRINT  Line 4e  End of Max. Value During TY More Max. Amount-->	
			<!--PART II SEPARATED PRINT  Line 5  Start of Exchange Rate used-->
			<div class="styBB" style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:5mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">5</div>
				<div  class="styLNDesc" style="height:5mm;width:179mm;padding-left:2mm;padding-top:.7mm;
				  padding-bottom:0mm;">
					Did you use a foreign currency exchange rate to convert the value of the asset into U.S. dollars?
					<!--Dotted Line-->
					<span class="styDotLn" style="float:none;clear:none;padding-right:1mm;">......</span>
						<!--PART II SEPARATED PRINT  Start of Exchange Rate Used Ind "Yes"-->
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateYesCheckbox">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEPExchangeRateUsedInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabelYes">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEPExchangeRateUsedInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Yes
						</label>
						<!--PART II SEPARATED PRINT  End of Exchange Rate Used Ind "Yes"-->
						<span style="width:5px;"/>
						<!--PART II SEPARATED PRINT  Start of Exchange Rate Used Ind "No"-->
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateNoCheckbox">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEPExchangeRateUsedInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabelNo">
								<xsl:with-param name="TargetNode" select="ExchangeRateUsedInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEPExchangeRateUsedInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							No
						</label>
						<!--PART II SEPARATED PRINT  End of Exchange Rate Used Ind "No"-->
				</div>
			</div>
			<br/>
			<!--<xsl:choose>
				<xsl:when test="position()=1"><div class="pageEnd"  style="width:187mm;"/>
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>	
	</xsl:if>-->
	<!--PART II SEPARATED PRINT  FOOTER-->
        <div class="pageEnd"  style="width:187mm;border-top:1px solid black;">
          <span class="styBoldText">For Paperwork Reduction Act Notice, see instructions. </span> 
          <span style="width:116px;"></span>                      
          Cat. No. 37753A
          <span style="width:106px;"></span>  
          Form <span class="styBoldText" style="font-size:9pt">8938</span> (11-2012)
        </div>
        <!--Begin Page 2 -->
	<!-- Page Header -->
		<div class="styBB" style="width:187mm;">
			<div style="float:left;">Form 8938 (11-2012)<span style="width:145mm;"/></div>
			<div style="float:right;">Page <span style="font-weight:bold;font-size:8pt;">2</span></div>
		</div>
	<!-- END Page Header --> 	
	<!--PART II SEPARATED PRINT  End of Other Foreign Assets Lines 1 thru 5-->
	<!--PART II SEPARATED PRINT  Start of Other Foreign Assets (continued) Lines 6 thru 8-->
	<!--<xsl:if test="(count($FormData/OtherForeignAssetGrp) &gt;=2)">
		<xsl:for-each select="$FormData/OtherForeignAssetGrp">-->
			<div class="styBB" style="width:187mm;">
				<div class="styPartName" style="font-size:9pt;padding-bottom:.5mm;font-family:arial">Part II</div>
				<div class="styPartDesc" style="width:164mm;font-size:9pt;padding-left:3mm;float:left; clear:none">
				  Other Foreign Assets<span style="font-weight:normal;"> (continued)</span></div>
			</div>
			<!--PART II SEPARATED PRINT  Line 6  Start of If you answered "Yes" to line 5, complete all that apply-->
			<div style="width:187mm;float:left;clear:none;border-style:solid;border-color:black;
			  border-width: 0px 0px 1px 0px;">
				<div class="styLNLeftNumBox"  style="padding-left:2mm;padding-top:.7mm;height:5mm">6</div>
				<div class="styLNDesc" style="width:146.5mm;padding-left:2mm;padding-top:.7mm;height:5mm">
					If you answered “Yes” to line 5, complete all that apply.
				</div>
			</div>	
			<div class="styBB" style="width:187mm;">
				<!--PART II SEPARATED PRINT  Line 6(1)  Start of Foreign Currency Description Text-->
				<div style="width:60mm;float:left;clear:none;">
					<div class="styLNDesc" style="width:55mm;padding-left:10mm;padding-bottom:2mm;">
							<b>(1) </b> Foreign currency in which<br/> asset is denominated
					</div>
					<div class="styLNDesc"  style="width:55mm;padding-top:1mm;padding-left:8.5mm;" valign="bottom">	
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignCurrencyDescTxt"/>
							<xsl:with-param name="BackupName">IRS8938OFA-SEPForeignCurrencyDescTxt
							</xsl:with-param>
						</xsl:call-template>                         
					</div>
				</div>
				<!--PART II SEPARATED PRINT  Line 6(1)  End of Foreign Currency Description Text-->
				<!--PART II SEPARATED PRINT  Line 6(2)  Start of Exchange Rate Used-->
				<div style="width:63mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 1px 0px 1px;">
					<div class="styLNDesc" style="width:61mm;padding-left:2mm;padding-bottom:2mm;">
							<b>(2) </b> Foreign currency exchange rate used to convert to U.S. dollars
					</div>
					<div class="styLNDesc"  style="width:61mm;padding-top:1mm;padding-left:.8mm;text-align:right"
					  valign="bottom">	
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="ExchangeRateUsed"/>
							<xsl:with-param name="BackupName">IRS8938OFA-SEPExchangeRateUsed</xsl:with-param>
						</xsl:call-template>                       
					</div>
				</div>
				<!--PART II SEPARATED PRINT  Line 6(2)  End of Exchange Rate Used-->
				<!--PART II SEPARATED PRINT  Line 6(3)  Start of Source  Of Exchange Rate Used Text-->
				<div style="width:64mm;float:left;clear:none;border-style:solid;border-color:black;
				  border-width: 0px 0px 0px 0px;">
					<div class="styLNDesc" style="width:62mm;padding-left:2mm;padding-bottom:2mm;">
							<b>(3) </b> Source of exchange rate used if not from U.S. Treasury Financial Management Service
					</div>
					<div class="styLNDesc"  style="width:62mm;padding-top:1mm;" valign="bottom">	
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="SourceOfExchangeRateUsedTxt"/>
							<xsl:with-param name="BackupName">IRS8938OFA-SEPSourceOfExchangeRateUsedTxt
							</xsl:with-param>
						</xsl:call-template>                         
					</div>
				</div>
			</div>
			<!--PART II SEPARATED PRINT  Line 6(3)  End of Source Of Exchange Rate Used Text-->
			<!--PART II SEPARATED PRINT  Line 7 Report information-->
			<div  style="width:187mm;">
				<div class="styLNLeftNumBox" style="height:2mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">7</div>
				<div  class="styLNDesc" style="height:2mm;width:179mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">If asset reported in Part II, line 1, is stock of a foreign entity or an interest in a
				  foreign entity, report the following information.
				</div>
			</div>
			<!--PART II SEPARATED PRINT  Line 7a  Start of Name of Foreign Entity-->
			<div style="width:187mm;">
				<div class="styLNLeftLtrBox"  style="padding-left:4mm;">a</div>
				<div class="styLNDesc" style="width:32mm;padding-left:2mm;">
					Name of foreign entity
				</div>
				<div class="styFixedUnderline" style="width:147mm;padding-left:2mm;">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="NameOfEntity/BusinessNameLine1"/>
					</xsl:call-template> 
					<xsl:if test="NameOfEntity/BusinessNameLine2">
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="NameOfEntity/BusinessNameLine2"/>
						</xsl:call-template>
					 </xsl:if>                 
				</div>
			</div>
			<!--PART II SEPARATED PRINT  Line 7a  End of Name of Foreign Entity-->
			<!--PART II SEPARATED PRINT  Line 7b  Start of Type of Foreign Entity-->	
			<div style="width:187mm;">
				<div class="styLNLeftLtrBox"  style="padding-left:4mm;">b</div>
				<div class="styLNDesc" style="width:50mm;padding-left:2mm;">Type of foreign entity</div>
				<!--Part II Line 7b (1)  Start of Partnership-->
				<div  class="styLNDesc" style="width:35mm;"><b>(1)</b>
					<span style="width:5px;"/>
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="PartnershipInd"/>
							<xsl:with-param name="BackupName">IRS8938OFA-SEPPartnershipInd
							<xsl:number value="position()"/>
							</xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:5px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="PartnershipInd"/>
							<xsl:with-param name="BackupName">IRS8938OFA-SEPPartnershipInd
							<xsl:number value="position()"/>
							</xsl:with-param>
						</xsl:call-template>
						Partnership
					</label>
					<span style="width:5px;"/>
				</div>
				<!--PART II SEPARATED PRINT  Line 7b (1)  End of Partnership-->
				<!--PART II SEPARATED PRINT  Line 7b (2)  Start of Corporation-->
				<div  class="styLNDesc" style="width:35mm;"><b>(2)</b>
					<span style="width:5px;"/>
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="CorporationInd"/>
							<xsl:with-param name="BackupName">IRS8938OFA-SEPCorporationInd
							<xsl:number value="position()"/>
							</xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:5px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="CorporationInd"/>
							<xsl:with-param name="BackupName">IRS8938OFA-SEPCorporationInd
							<xsl:number value="position()"/>
							</xsl:with-param>
						</xsl:call-template>
						Corporation 
					</label>
					<span style="width:5px;"/>
				</div>
				<!--PART II SEPARATED PRINT  Line 7b (2)  End of Corporation-->
				<!--PART II SEPARATED PRINT  Line 7b (3)  Start of Trust-->
				<div  class="styLNDesc" style="width:35mm;"><b>(3)</b>
					<span style="width:5px;"/>
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="TrustInd"/>
							<xsl:with-param name="BackupName">IRS8938OFA-SEPTrustInd<xsl:number value="position()"/>
							</xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:5px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="TrustInd"/>
							<xsl:with-param name="BackupName">IRS8938OFA-SEPTrustInd<xsl:number value="position()"/>
							</xsl:with-param>
						</xsl:call-template>
						Trust 
					</label>
					<span style="width:5px;"/>
				</div>
				<!--PART II SEPARATED PRINT  Line 7b (3)  End of Trust-->
				<!--PART II SEPARATED PRINT  Line 7b (4)  Start of Estate-->
				<div  class="styLNDesc" style="width:20mm;"><b>(4)</b>
					<span style="width:5px;"/>
					<input type="Checkbox" class="styCkbox">
						<xsl:call-template name="PopulateCheckbox">
							<xsl:with-param name="TargetNode" select="EstateInd"/>
							<xsl:with-param name="BackupName">IRS8938OFA-SEPEstateInd
							<xsl:number value="position()"/>
							</xsl:with-param>
						</xsl:call-template>
					</input>
					<span style="width:5px;"/>
					<label>
						<xsl:call-template name="PopulateLabel">
							<xsl:with-param name="TargetNode" select="EstateInd"/>
							<xsl:with-param name="BackupName">IRS8938OFA-SEPEstateInd
							<xsl:number value="position()"/>
							</xsl:with-param>
						</xsl:call-template>
						Estate 
					</label>
				</div>
			</div>
			<!--PART II SEPARATED PRINT  Line 7b (4)  End of Estate-->
			<!--PART II SEPARATED PRINT  Line 7c  Start of Mailing Address-->
			<div style="width:187mm;">
				<div class="styLNLeftLtrBox"  style="padding-left:4mm;">c</div>
				<div  class="styLNDesc" style="height:2mm;width:179mm;padding-left:2mm;padding-top:0mm;
				  padding-bottom:0mm;">
					Mailing address of foreign entity. Number, street, and room or suite no.
				</div>
				<div  class="styFixedUnderline" style="height:2mm;width:179mm;padding-left:2mm;padding-top:1mm;
				  padding-bottom:0mm;">
					<xsl:if test="USAddress">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="USAddress/AddressLine1"/>
						</xsl:call-template>
						<xsl:if test="USAddress/AddressLine2">	
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="USAddress/AddressLine2"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:if>
					<xsl:if test="ForeignAddress">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1"/>
						</xsl:call-template>
						<xsl:if test="ForeignAddress/AddressLine2">
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine2"/>
							</xsl:call-template>
						</xsl:if>
					</xsl:if>
				</div>
			</div>
			<!--PART II SEPARATED PRINT  Line 7c  End of Mailing Address-->
			<!--PART II SEPARATED PRINT  Line 7d  Start of City, State and country-->
			<div style="width:187mm;border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
				<div class="styLNLeftLtrBox"  style="padding-left:4mm;">d</div>
				<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-bottom:0mm;">
					City or town, province or state, and country (including postal code)
				</div>
				<div class="styLNDesc"  style="width:186mm;padding-left:10mm;">	
					<xsl:if test="USAddress">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="USAddress/City"/>
						</xsl:call-template><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="USAddress/State"/>
						</xsl:call-template>,
						<span style="width:2px;"/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="USAddress/ZIPCode"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="ForeignAddress">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignAddress/City"/>
						</xsl:call-template><br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrState"/>
						</xsl:call-template>,
						<span style="width:2px;"/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignAddress/PostalCode"/>
						</xsl:call-template>,
						<span style="width:2px;"/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignAddress/Country"/>
						</xsl:call-template>
					</xsl:if>
				</div>
			</div>
			<!--PART II SEPARATED PRINT  Line 7d  Start of City, State and country-->
			
			<!--PART II SEPARATED PRINT  Line 8a - 8e  START of Report information of Asset Not Stock of Foreign
				 Ent Grp = 0--> 
			<xsl:if test="(count(AssetNotStockOfForeignEntGrp) &lt;1)">
			    <div  style="width:187mm;">
				    <div class="styLNLeftNumBox" style="height:2mm;padding-left:2mm;padding-top:0mm;
				      padding-bottom:0mm;">8</div>
					<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-top:0mm;
					  padding-bottom:1mm;">
					  If asset reported in Part II, line 1, is not stock of a foreign entity or an interest in a foreign entity, enter
					  the following information for the asset.
					</div>
					<div  class="styLNDesc" style="width:179mm;padding-left:10mm;padding-top:0mm;
					  padding-bottom:0mm;">
						<b>Note.</b> If this asset has more than one issuer or counterparty, attach a continuation sheet with
							 the same information for each additional issuer or counterparty (see instructions).
					</div>
				</div><br/>
				<!--PART II SEPARATED PRINT  Line 8a  Start of Name of Issuer-->
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">a</div>
					<div class="styLNDesc" style="width:45mm;padding-left:2mm;">
					  Name of issuer or counterparty
					</div>
					<div class="styFixedUnderline" style="width:133mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
						</xsl:call-template>
						<xsl:if test="BusinessName/BusinessNameLine2">
							<br/>	
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
							</xsl:call-template>
						</xsl:if>
					</div>
				</div>
				<!--PART II SEPARATED PRINT  Line 8a  End of Name of Issuer-->	
				<!--PART II SEPARATED PRINT  Line 8a  Start of Check if information is for Issuer or Counterparty-->
				<div  style="width:187mm;padding-left:10mm;">
					<div class="styLNDesc" style="width:50.5mm;">Check if information is for</div>
					<div class="styLNDesc" style="width:35mm;">
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="IssuerInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSIssuerInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="IssuerInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSIssuerInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
							Issuer
						</label>
					</div>
					<div class="styLNDesc" style="width:35.5mm;">
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSCounterpartyInd
									<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSCounterpartyInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Counterparty
						</label>
					</div>
				</div><br/>
				<!--PART II SEPARATED PRINT  Line 8b  Start of Type of Issuer or counterparty-->
				<div  style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">b</div>
					<div class="styLNDesc" style="width:179mm;padding-left:2mm;">Type of issuer or counterparty</div>
				</div>	
				<!--PART II SEPARATED PRINT  Line 8b (1)  Start of Individual-->
				<div class="styLNDesc" style="width:187mm;padding-left:10mm;">
					<div  class="styLNDesc" style="width:47.3mm;"><b>(1)</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/IndividualInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSIndividualInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/IndividualInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSIndividualInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
							Individual
						</label>
					</div>
					<!--PART II SEPARATED PRINT  Line 8b (1)  End of Individual-->
					<!--PART II SEPARATED PRINT  Line 8b (2)  Start of Partnership-->
					<div  class="styLNDesc" style="width:32.5mm;"><b>(2)</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode"  select="AssetNotStockOfForeignEntGrp/PartnershipInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSPartnershipInd
								<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/PartnershipInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSPartnershipInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
							Partnership
						</label>
					</div>
					<!--PART II SEPARATED PRINT  Line 8b (2)  End of Partnership-->
					<!--PART II SEPARATED PRINT  Line 8b (3)  Start of Corporation-->
					<div  class="styLNDesc" style="width:35mm;"><b>(3)</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/CorporationInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSCorporationInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/CorporationInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSCorporationInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
							Corporation 
						</label>
					</div>
					<!--PART II SEPARATED PRINT  Line 8b (3)  End of Corporation-->
					<!--PART II SEPARATED PRINT  Line 8b (4)  Start of Trust-->
					<div  class="styLNDesc" style="width:37mm;"><b>(4)</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/TrustInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSTrustInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/TrustInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSTrustInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
							Trust 
						</label>
					</div>
					<!--PART II SEPARATED PRINT  Line 8b (5)  Start of Estate-->
					<div  class="styLNDesc" style="width:20mm;"><b>(5)</b>
						<span style="width:5px;"/>
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/EstateInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSEstateInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/EstateInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSEstateInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
							Estate 
						</label>
					</div>
				</div><br/><br/>
				<!--PART II SEPARATED PRINT  Line 8b (5)  End of Estate-->
				<!--PART II SEPARATED PRINT  Line 8c  Start of Check if Issuer or Counterparty is US or Foreign-->
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">c</div>
					<div class="styLNDesc" style="width:55mm;padding-left:2mm;">Check if issuer or counterparty is a
					</div>
					<div class="styLNDesc" style="width:30.5mm;">	
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/USPersonInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSUSPersonInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="AssetNotStockOfForeignEntGrp/USPersonInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSUSPersonInd
								<xsl:number value="position()"/>
								</xsl:with-param>
							</xsl:call-template>
							U.S. person
						</label>
					</div>	
					<div class="styLNDesc" style="width:40mm;padding-left:2mm;">
						<input type="Checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode"
								  select="AssetNotStockOfForeignEntGrp/ForeignPersonInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSForeignPersonInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
						</input>
						<span style="width:5px;"/>
						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode"
								  select="AssetNotStockOfForeignEntGrp/ForeignPersonInd"/>
								<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSForeignPersonInd
									<xsl:number value="position()"/></xsl:with-param>
							</xsl:call-template>
							Foreign person
						</label>
					</div>	
				</div><br/>
				<!--PART II SEPARATED PRINT  Line 8c  End of Check if Issuer or Counterparty is US or Foreign-->	
				<!--PART II SEPARATED PRINT  Line 8d  Start of Mailing Address-->	
				<div style="width:187mm;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">d</div>
					<div  class="styLNDesc" style="height:2mm;width:179mm;padding-left:2mm;padding-top:0mm;
					  padding-bottom:0mm;">Mailing address of issuer or counterparty. Number, street, and room or suite
					  no.
					</div>
					<div  class="styFixedUnderline" style="height:2mm;width:179mm;padding-left:2mm;padding-top:1mm;
					  padding-bottom:0mm;">
						<xsl:if test="AssetNotStockOfForeignEntGrp/USAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="USAddress/AddressLine1"/>
							</xsl:call-template>
							<xsl:if test="AssetNotStockOfForeignEntGrp/USAddress/AddressLine2">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="USAddress/AddressLine2"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:if>
						<xsl:if test="AssetNotStockOfForeignEntGrp/ForeignAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1"/>
							</xsl:call-template>
							<xsl:if test="AssetNotStockOfForeignEntGrp/ForeignAddress/AddressLine2">
								<br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddres/AddressLine2"/>
								</xsl:call-template>
							</xsl:if>
						</xsl:if>
					</div>
				</div>
				<!--PART II SEPARATED PRINT  Line 8d  End of Mailing Address-->
				<!--PART II SEPARATED PRINT  Line 8e  Start of City, State or Country-->	
				<div style="width:187mm;border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
					<div class="styLNLeftLtrBox"  style="padding-left:4mm;">e</div>
					<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-bottom:0mm;">
					  City or town, province or state, and country (including postal code)
					</div>
					<div class="styLNDesc"  style="width:186mm;padding-left:10mm;">	
						<xsl:if test="AssetNotStockOfForeignEntGrp/USAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="USAddress/City"/>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="USAddress/State"/>
							</xsl:call-template>,
							<span style="width:2px;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="USAddress/ZIPCode"/>
							</xsl:call-template>
						</xsl:if>
						<xsl:if test="AssetNotStockOfForeignEntGrp/ForeignAddress">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignAddress/City"/>
							</xsl:call-template><br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrState"/>
							</xsl:call-template>,
							<span style="width:2px;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignAddress/PostalCode"/>
							</xsl:call-template>,
							<span style="width:2px;"/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="ForeignAddress/Country"/>
							</xsl:call-template>
						</xsl:if>
					</div>
				</div>
			<!--PART II SEPARATED PRINT  Line 8e  End of City, State or Country-->	
			<!--</xsl:for-each>-->
			</xsl:if>
			<!--PART II SEPARATED PRINT  Line 8a - 8e  END of Report information of Asset Not Stock of Foreign
				 Ent Grp = 0--> 
				 
			<!--PART II REPEATING INFORMATION  Start of Asset Not Stock of Foreign Ent Grp >=1 (Lines 8a - 8e)-->
			<xsl:if test="(count(AssetNotStockOfForeignEntGrp) &gt;=2)">
				<xsl:for-each select="AssetNotStockOfForeignEntGrp">
					<div  style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:2mm;padding-left:2mm;padding-top:0mm;
						  padding-bottom:0mm;">8</div>
						<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-top:0mm;
						  padding-bottom:1mm;">
						  If asset reported in Part II, line 1, is not stock of a foreign entity or an interest in a foreign entity,
						  enter the following information for the asset.
						</div>
						<div  class="styLNDesc" style="width:179mm;padding-left:10mm;padding-top:0mm;
						  padding-bottom:0mm;">
							<b>Note.</b> If this asset has more than one issuer or counterparty, attach a continuation sheet
							 with the same information for each additional issuer or counterparty (see instructions).
						</div>
					</div><br/>
					<!--PART II SEPARATED PRINT  Line 8a  Start of Name of Issuer-->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox"  style="padding-left:4mm;">a</div>
						<div class="styLNDesc" style="width:45mm;padding-left:2mm;">
						  Name of issuer or counterparty
						</div>
						<div class="styFixedUnderline" style="width:133mm;">
							<xsl:choose>
								<xsl:when test="PersonName">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="PersonName"/>
									</xsl:call-template>
								</xsl:when>
								<xsl:otherwise>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1"/>
									</xsl:call-template>
									<xsl:if test="BusinessName/BusinessNameLine2">
										<br/>	
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2"/>
										</xsl:call-template>
									</xsl:if>
								</xsl:otherwise>
							</xsl:choose>
						</div>
					</div>
					<!--PART II SEPARATED PRINT  Line 8a  End of Name of Issuer-->	
					<!--PART II SEPARATED PRINT  Line 8a  Start of Check if information is for Issuer or Counterparty-->
					<div  style="width:187mm;padding-left:10mm;">
						<div class="styLNDesc" style="width:50.5mm;">Check if information is for</div>
						<div class="styLNDesc" style="width:35mm;">
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="IssuerInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSIssuerInd
									<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="IssuerInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSIssuerInd
									<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
								Issuer
							</label>
						</div>
						<div class="styLNDesc" style="width:35.5mm;">
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSCounterpartyInd
										<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="CounterpartyInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSCounterpartyInd
										<xsl:number value="position()"/></xsl:with-param>
								</xsl:call-template>
								Counterparty
							</label>
						</div>
					</div><br/>
					<!--PART II SEPARATED PRINT  Line 8b  Start of Type of Issuer or counterparty-->
					<div  style="width:187mm;">
						<div class="styLNLeftLtrBox"  style="padding-left:4mm;">b</div>
						<div class="styLNDesc" style="width:179mm;padding-left:2mm;">Type of issuer or counterparty</div>
					</div>	
					<!--PART II SEPARATED PRINT  Line 8b (1)  Start of Individual-->
					<div class="styLNDesc" style="width:187mm;padding-left:10mm;">
						<div  class="styLNDesc" style="width:47.3mm;"><b>(1)</b>
							<span style="width:5px;"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="IndividualInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSIndividualInd
									<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="IndividualInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSIndividualInd
									<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
								Individual
							</label>
						</div>
						<!--PART II SEPARATED PRINT  Line 8b (1)  End of Individual-->
						<!--PART II SEPARATED PRINT  Line 8b (2)  Start of Partnership-->
						<div  class="styLNDesc" style="width:32.5mm;"><b>(2)</b>
							<span style="width:5px;"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode"  select="PartnershipInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSPartnershipInd
									<xsl:number value="position()"/></xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="PartnershipInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSPartnershipInd
									<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
								Partnership
							</label>
						</div>
						<!--PART II SEPARATED PRINT  Line 8b (2)  End of Partnership-->
						<!--PART II SEPARATED PRINT  Line 8b (3)  Start of Corporation-->
						<div  class="styLNDesc" style="width:35mm;"><b>(3)</b>
							<span style="width:5px;"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="CorporationInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSCorporationInd
									<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="CorporationInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSCorporationInd
									<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
								Corporation 
							</label>
						</div>
						<!--PART II SEPARATED PRINT  Line 8b (3)  End of Corporation-->
						<!--PART II SEPARATED PRINT  Line 8b (4)  Start of Trust-->
						<div  class="styLNDesc" style="width:37mm;"><b>(4)</b>
							<span style="width:5px;"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="TrustInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSTrustInd
									<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="TrustInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSTrustInd
									<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
								Trust 
							</label>
						</div>
						<!--PART II SEPARATED PRINT  Line 8b (5)  Start of Estate-->
						<div  class="styLNDesc" style="width:20mm;"><b>(5)</b>
							<span style="width:5px;"/>
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="EstateInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSEstateInd
									<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="EstateInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSEstateInd
									<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
								Estate 
							</label>
						</div>
					</div><br/><br/>
					<!--PART II SEPARATED PRINT  Line 8b (5)  End of Estate-->
					<!--PART II SEPARATED PRINT  Line 8c  Start of Check if Issuer or Counterparty is US or Foreign-->
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox"  style="padding-left:4mm;">c</div>
						<div class="styLNDesc" style="width:55mm;padding-left:2mm;">Check if issuer or counterparty is a
						</div>
						<div class="styLNDesc" style="width:30.5mm;">	
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="USPersonInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSUSPersonInd
									<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="USPersonInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSUSPersonInd
									<xsl:number value="position()"/>
									</xsl:with-param>
								</xsl:call-template>
								U.S. person
							</label>
						</div>	
						<div class="styLNDesc" style="width:40mm;padding-left:2mm;">
							<input type="Checkbox" class="styCkbox">
								<xsl:call-template name="PopulateCheckbox">
									<xsl:with-param name="TargetNode" select="ForeignPersonInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSForeignPersonInd
										<xsl:number value="position()"/></xsl:with-param>
								</xsl:call-template>
							</input>
							<span style="width:5px;"/>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="ForeignPersonInd"/>
									<xsl:with-param name="BackupName">IRS8938OFA-SEP-ANSForeignPersonInd
										<xsl:number value="position()"/></xsl:with-param>
								</xsl:call-template>
								Foreign person
							</label>
						</div>	
					</div><br/>
					<!--PART II SEPARATED PRINT  Line 8c  End of Check if Issuer or Counterparty is US or Foreign-->	
					<!--PART II SEPARATED PRINT  Line 8d  Start of Mailing Address-->	
					<div style="width:187mm;">
						<div class="styLNLeftLtrBox"  style="padding-left:4mm;">d</div>
						<div  class="styLNDesc" style="height:2mm;width:179mm;padding-left:2mm;padding-top:0mm;
						  padding-bottom:0mm;">Mailing address of issuer or counterparty. Number, street, and room
						  or suite no.
						</div>
						<div  class="styFixedUnderline" style="height:2mm;width:179mm;padding-left:2mm;padding-top:1mm;
						  padding-bottom:0mm;">
							<xsl:if test="USAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="USAddress/AddressLine1"/>
								</xsl:call-template>
								<xsl:if test="USAddress/AddressLine2">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="USAddress/AddressLine2"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:if>
							<xsl:if test="ForeignAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/AddressLine1"/>
								</xsl:call-template>
								<xsl:if test="ForeignAddress/AddressLine2">
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ForeignAddres/AddressLine2"/>
									</xsl:call-template>
								</xsl:if>
							</xsl:if>
						</div>
					</div>
					<!--PART II SEPARATED PRINT  Line 8d  End of Mailing Address-->
					<!--PART II SEPARATED PRINT  Line 8e  Start of City, State or Country-->	
					<div style="width:187mm;border-style:solid;border-color:black;border-width: 0px 0px 1px 0px;">
						<div class="styLNLeftLtrBox"  style="padding-left:4mm;">e</div>
						<div  class="styLNDesc" style="width:179mm;padding-left:2mm;padding-bottom:0mm;">
						  City or town, province or state, and country (including postal code)
						</div>
						<div class="styLNDesc"  style="width:186mm;padding-left:10mm;">	
							<xsl:if test="USAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="USAddress/City"/>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="USAddress/State"/>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="USAddress/ZIPCode"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="ForeignAddress">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/City"/>
								</xsl:call-template><br/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/ProvinceOrState"/>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/PostalCode"/>
								</xsl:call-template>,
								<span style="width:2px;"/>
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="ForeignAddress/Country"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<!--PART II SEPARATED PRINT  Line 8e  End of City, State or Country-->	
				</xsl:for-each>
			</xsl:if>
			<!--PART II REPEATING INFORMATION  END of Asset Not Stock of Foreign Ent Grp >=1 
				(Lines 8a - 8e)-->
		</xsl:for-each>
	 </xsl:if>		  
    </form>  
   </body>
  </html>
 </xsl:template>    
</xsl:stylesheet>