<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>

<!-- Updated 5/29/2015 per UWR 123023 4/22/15 by Robert L Jones -->
<!-- Updated 1/06/2015 per IBM Defect 43522 lines not connecting at 1,9,19, Additional Info section after Additional data and Checkbox in header off a bit, changed dots to another format to avoid 508 errors with Jaws -  by Robert L Jones -->
<!-- Updated 7/22/2015 per IBM Defect 43522 1,9,19 not connecting to line above, Additional Dat to sep page  by Robert L Jones -->
<!-- Updated per UWR 161465 8/12/15 by Robert L Jones -->
<!-- Updated per PDF REVIEW 11/5/15 by Robert L Jones -->
<!-- Updated per 44921 IBM Defect 11/20/15 by Robert L Jones -->
<!-- Updated per 44921 IBM Defect 12/11/15 by Robert L Jones -->
<!-- Updated per 46028 IBM Defect 6/21/16 Foreign address overlap at header, Special Condition Pen missing and Spec Cond Pen not in Add Data Section by Robert L Jones -->
<!-- Updated 9/29/2016 per PDF Review by Robert L Jones -->
<!-- Updated per UWR 195015 5/19/17 by Robert L Jones -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1120POLStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
	<xsl:param name="FormData" select="$RtnDoc/IRS1120POL"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
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
        <meta name="Description" content="IRS Form 1120POL"/>
        <!-- javascript include -->
				<!-- javascript include -->
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS1120POLStyle"/>
						<xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>    
      <xsl:call-template name="GlobalStylesForm"/>
</head>
      <body class="styBodyClass">
<!-- Standard Warning Line -->
				<xsl:call-template name="DocumentHeader"/>
        <!-- BEGIN FORM HEADER -->
        <div class="IRS1120POL_LineContainer">
          <!-- Form Name -->
          <div class="IRS1120POL_FormNumBlock" style="padding-top:5px;">
     Form <span class="styFormNumber">1120-POL</span>
    <xsl:call-template name="SetFormLinkInline">
      <xsl:with-param name="TargetNode" select="$FormData"/>
    </xsl:call-template>
     <!--General DependencySmall Push Pin --> 
     <!--<xsl:call-template name="SetFormLinkInline">
       <xsl:with-param name="TargetNode" select="$FormData"/>
     </xsl:call-template>-->
<xsl:call-template name="LinkToLeftoverDataTableInline">
                  <xsl:with-param name="TargetNode" select="$FormData/SpecialConditionDesc"/>
                </xsl:call-template>
                <br/>
						<span style=" font-family:Arial Narrow; ">Department of the Treasury</span>
            <br/>
            <span style=" font-family:Arial Narrow; ">Internal Revenue Service</span>
          </div>
          <!-- Form Title Box -->
          <div class="IRS1120POL_FormTitleBlock">
            <!-- Form Title -->
            <span class="styMainTitle">U.S. Income Tax Return for Certain Political Organizations</span><br/><br/>
            <img src="{$ImagePath}/1120POL_Bullet_Sm.gif" alt="right arrow"/>
              Go to <!--www.irs.gov/form990.--><a href="http://www.irs.gov/form1120pol" title="Link to IRS.gov">
                <i>www.irs.gov/Form1120POL</i></a> for the latest information. 

            <!-- Form Subtitle -->
          </div>
          <!-- Tax Year Box -->
          <div class="IRS1120POL_FormYearBlock">
            <!-- OMB No. -->
            <div class="IRS1120POL_OMB">OMB No. 1545-0123</div>
            <!-- Tax Year -->
            <div class="IRS1120POL_TaxYear">
							<span>20<span class="styTYColor">19</span>
							</span>
            </div>
          </div>
        </div>
        <!-- commenting line -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LineBottom">
            For calendar year 2019 or other tax year beginning
             <span style="width: 18mm">
							<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
            </span>    
          , and ending 
             <span style="width: 18mm">
							<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
            </span>  
          </div>
        </div>
        <div class="IRS1120POL_LineContainer" style="height:auto;">
          <div class="IRS1120POL_LineBottom" style="width:184mm;">
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$FormData/Sect501cOrgOrSegregatedFundInd"/>
                <xsl:with-param name="BackupName">IRS1120POLSect501cOrgOrSegregatedFundInd</xsl:with-param>
              </xsl:call-template>Check the box if this is a section 501(c) organization
            </label>
           <!--Dotted Line-->		
			<span style="letter-spacing:4mm; font-weight:bold; ">.......................  </span>
            <img src="{$ImagePath}/1120POL_Bullet_Sm.gif" alt="right arrow"/>
          <!--span class="IRS1120POL_DotSpacing">..........</span-->
          </div>
          <div class="IRS1120POL_LineBottom" style="width:4mm;text-align:right;padding-bottom:0px;">
            <input type="checkbox" alt="Section501cOrganization" class="IRS1120POL_Checkbox" >
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/Sect501cOrgOrSegregatedFundInd"/>
                <xsl:with-param name="BackupName">IRS1120POLSect501cOrgOrSegregatedFundInd</xsl:with-param>
              </xsl:call-template>
            </input>
          </div>
        </div>
        <div class="styBB" style="width:187mm;float:none;">
          <div class="styIRS1120POLRightLine" style="width:27.5mm;height:28mm;border-right-width:0px;padding-top:0.5mm;">
						
            Check if:
            <br/>
						<input type="checkbox" alt="FinalReturn" class="IRS1120POL_Checkbox" >
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/FinalReturnInd"/>
                  <xsl:with-param name="BackupName">IRS1120POLFinalReturnInd
                </xsl:with-param>
              </xsl:call-template>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/FinalReturnInd"/>
                  <xsl:with-param name="BackupName">IRS1120POLFinalReturnInd
                  </xsl:with-param>
                </xsl:call-template>
                Final return
              </label>            
            </input>
            <br/>
             
						<input type="checkbox" alt="NameChange" class="IRS1120POL_Checkbox" >
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/NameChange"/>
                  <xsl:with-param name="BackupName">IRS1120POLNameChange
                </xsl:with-param>
              </xsl:call-template>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/NameChange"/>
                  <xsl:with-param name="BackupName">IRS1120POLNameChange
                  </xsl:with-param>
                </xsl:call-template>
                Name change
              </label>            
            </input>
            <br/>
           
            <input type="checkbox" alt="AddressChange" class="IRS1120POL_Checkbox">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/AddressChangeInd"/>
                  <xsl:with-param name="BackupName">IRS1120POLAddressChangeInd        </xsl:with-param>
             </xsl:call-template>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$FormData/AddressChangeInd"/>
                    <xsl:with-param name="BackupName">IRS1120POLAddressChangeInd       </xsl:with-param>
                </xsl:call-template>
                Address change
              </label>            
            </input>
            <br/>
						<input type="checkbox" alt="AmendedReturn" class="IRS1120POL_Checkbox" >
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
								<xsl:with-param name="BackupName">IRS1120POLAmendedReturnInd
                </xsl:with-param>
							</xsl:call-template>
							<label>
								<xsl:call-template name="PopulateLabel">
									<xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
									<xsl:with-param name="BackupName">IRS1120POLAmendedReturnInd
                 </xsl:with-param>
								</xsl:call-template>
                Amended return
              </label>
						</input>
						<xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$FormData/AmendedReturnInd"/>
            </xsl:call-template>
					</div>
            
          <div class="styIRS1120POLRightLine" style="width:98mm;height:31mm;border-right-width: 0px;">
            <div class="styNameBox" style="width:98mm;height:auto;border-bottom-width:1px;border-right-width:0px;padding-left:4px;font-size:7pt;border-left-width:1px;">
              <span style="font-size:6pt;">Name of organization</span>
              <br/>
              <span style="font-size:6pt;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">InCareOfName</xsl:with-param>
								</xsl:call-template>
              </span>
            </div>
            <div class="styNameBox" style="width:159mm;height:10mm;border-right-width:0px;border-bottom-width:1px;padding-left:4px;border-left-width:1px;">
							<span style="font-size:6pt;">Number, street, and room or suite no.</span>
							<span style="font-size:6pt;"> (If a P.O. box, see instructions.)</span>
							<br/>
							<span style="font-size:7pt;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
								</xsl:call-template>
              </span>
            </div>
            <div class="styNameBox" style="width:187mm;height:10mm;border-right-width:0px;padding-left:4px;font-size:6pt;border-left-width:1px;">
              City or state or province, country, ZIP or foreign postal code
              <br/>
              <span style="font-size:6pt;">
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
								</xsl:call-template>
								<br/>
								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
									<xsl:with-param name="MainForm">true</xsl:with-param>
								</xsl:call-template>
							</span>
						</div>
          </div>
          <div class="styIRS1120POLRightLine" style="width:61mm;height:28mm;border-right-width:0px;">
						<div class="styGenericDiv" style="width:61mm;height:11mm;border:solid 0 black;border-width:0px 0px 1px 1px;padding-left:4px;">
              <span style="font-size:6pt;font-weight:bold;">Employer identification number</span>
              <br/>
              <!-- Since this is a main form, we must check for and display an updated EIN.  To do this, we use the EINChanged parameter when calling PopulateReturnHeaderFiler.-->
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="EINChanged">true</xsl:with-param>
								<xsl:with-param name="TargetNode">EIN</xsl:with-param>
							</xsl:call-template>
            </div> 
           <!-- 10.2R5 DELETED XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX 
			<div class="" style="width:61mm;height:9mm;padding-left:4px;">
              <span style="font-size:6pt;font-weight:bold;">Candidates for U.S. Congress Only</span>
                <br/>
              <span style="font-size:5pt;">
                 <label>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$FormData/USCongressPltclCommitteeInd"/>
                    <xsl:with-param name="BackupName">IRS1120POLUSCongressPltclCommitteeInd</xsl:with-param>
                  </xsl:call-template>
                   If this is a principal campaign committee, and it is the ONLY political committee, check here 
                   	<span style="float:right;">
                   	 <span class="styDotLn" style="font-size: 6pt;">.......</span>
              <input class="IRS1120POL_CheckBox" type="checkbox" style="width: 3mm; height: 3mm; margin-top: 0px; margin-left: 0px;">
                  <xsl:call-template name="PopulateCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/USCongressPltclCommitteeInd"/>
                    <xsl:with-param name="BackupName">IRS1120POLUSCongressPltclCommitteeInd</xsl:with-param>
                  </xsl:call-template>
                </input>       
                </span>                             
              </label>
            </span>
            </div>-->
                
                 <!-- 10.2R5 DELETED XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
				 <div class="" style="width:61mm;height:9mm;padding-left:4px;">
                 <span style="font-size:5pt;">
                  <label>  
                    <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$FormData/USCongressNotOnlyCommitteeInd"/>
                    <xsl:with-param name="BackupName">IRS1120POLUSCongressNotOnlyCommitteeInd</xsl:with-param>
                  </xsl:call-template>
                  If this is a principal campaign committee, but is NOT the only political committee, check here and attach a copy of designation. See instructions.
                   <xsl:call-template name="SetFormLinkInline">
                    <xsl:with-param name="TargetNode" select="$FormData/USCongressNotOnlyCommitteeInd"/>
                  </xsl:call-template> 
                  
				Dotted Line
               10.2R5 DELETED XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
                    <span style="float:right;">
					<span class="styDotLn" style="font-size: 6pt;">.........</span>
                  <xsl:call-template name="PopulateLabel">
                    <xsl:with-param name="TargetNode" select="$FormData/USCongressNotOnlyCommitteeInd"/>
                    <xsl:with-param name="BackupName">IRS1120POLUSCongressNotOnlyCommitteeInd</xsl:with-param>
                  </xsl:call-template>
                <input class="IRS1120POL_CheckBox" type="checkbox" style="width: 3mm; height: 3mm; margin-top: 0px; margin-left: 0px;">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/USCongressNotOnlyCommitteeInd"/>
                  <xsl:with-param name="BackupName">IRS1120POLUSCongressNotOnlyCommitteeInd</xsl:with-param>
                </xsl:call-template>
          	</input>
                </span>
				</label>  
              </span>
				</div>-->
            </div>
          </div>
        <!-- superimposed image title - Income -->
        <div class="IRS1120POL_LineContainer">
          <span style="z-index:1;position:absolute;padding-top:10mm;">
            <img src="{$ImagePath}/1120POL_Income.gif" width="9" height="43" alt="Income Image" border="0"/>
          </span>
       
        <!-- line 1 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex">1</div>
          <div class="IRS1120POL_LineDescLong">Dividends (attach statement)          
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$FormData/DividendAmt"/>
            </xsl:call-template>
           <!--Dotted Line-->
							
								<span style="letter-spacing:4mm; font-weight:bold; ">...................  </span>
                     <!--span class="IRS1120POL_DotSpacing">..................................</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">1</div>
          <div class="IRS1120POL_MoneyField">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/DividendAmt"/>
            </xsl:call-template>
          </div>
        </div>
         </div>
        <!-- line 2 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex">2</div>
          <div class="IRS1120POL_LineDescLong">Interest
                    <!--Dotted Line-->
            <span style="letter-spacing:4mm; font-weight:bold; ">..........................  </span>
             <!--span class="IRS1120POL_DotSpacing">...........................................</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">2</div>
          <div class="IRS1120POL_MoneyField">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/TaxableInterestAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 3 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex">3</div>
          <div class="IRS1120POL_LineDescLong">Gross rents
            <!--Dotted Line-->
             <span style="letter-spacing:4mm; font-weight:bold; ">........................  </span>
                     <!--span class="IRS1120POL_DotSpacing">..........................................</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">3</div>
          <div class="IRS1120POL_MoneyField">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/GrossRentsAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 4 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex">4</div>
          <div class="IRS1120POL_LineDescLong">Gross royalties
            <!--Dotted Line-->
            <span style="letter-spacing:4mm; font-weight:bold; ">........................  </span>
                     <!--span class="IRS1120POL_DotSpacing">........................................</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">4</div>
          <div class="IRS1120POL_MoneyField">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/GrossRoyaltiesAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 5 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex">5</div>
					<div class="IRS1120POL_LineDescLong">Capital gain net income (attach Schedule D (Form 1120))
             <xsl:call-template name="SetFormLinkInline">
            <!--<xsl:with-param name="TargetNode" select="$FormData/CapitalGainNetAmt"/>-->
          <xsl:with-param name="TargetNode" select="$FormData/CapitalGainNetIncomeAmt"/>
            </xsl:call-template>
            <!--Dotted Line-->
           <span style="letter-spacing:4mm; font-weight:bold; ">.............</span>
                    <!--span class="IRS1120POL_DotSpacing">.....................</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">5</div>
          <div class="IRS1120POL_MoneyField">
            <xsl:call-template name="PopulateAmount">
            <!-- <xsl:with-param name="TargetNode" select="$FormData/CapitalGainNetAmt"/>-->
            <xsl:with-param name="TargetNode" select="$FormData/CapitalGainNetIncomeAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 6 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex">6</div>
          <div class="IRS1120POL_LineDescLong">Net gain or (loss) from Form 4797, Part II, line 17 (attach Form 4797)
             <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$FormData/TotalOrdinaryGainLossAmt"/>
            </xsl:call-template>
            <!--Dotted Line-->
             <span style="letter-spacing:4mm; font-weight:bold; ">.........</span>
                     <!--span class="IRS1120POL_DotSpacing">...............</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">6</div>
          <div class="IRS1120POL_MoneyField">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/TotalOrdinaryGainLossAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 7 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex">7</div>
          <div class="IRS1120POL_LineDescLong">Other income and nonexempt function expenditures (see instructions)
             <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$FormData/OtherIncomeNonExemptExpendAmt"/>
            </xsl:call-template>
            <!--Dotted Line-->
            <span style="letter-spacing:4mm; font-weight:bold; ">.........</span>
                     <!--span class="IRS1120POL_DotSpacing">...............</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">7</div>
          <div class="IRS1120POL_MoneyField">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/OtherIncomeNonExemptExpendAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 8 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace" style="border-bottom-width:1px;"/>
          <div class="IRS1120POL_LineIndex" style="border-bottom-width:1px;">8</div>
          <div class="IRS1120POL_LineDescLong" style="border-bottom-width:1px;">
            <span style="font-weight:bold;">Total income.</span>
              Add lines 1 through 7
            <!--Dotted Line-->
           <span style="letter-spacing:4mm; font-weight:bold; ">..................</span>
              <!--span class="IRS1120POL_DotSpacing">...............................</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid" style="border-bottom-width:1px;">8</div>
          <div class="IRS1120POL_MoneyField" style="border-bottom-width:1px;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/TotalIncomeAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- superimposed image title - Deduction -->
        <div class="IRS1120POL_LineContainer">
          <span style="z-index:1;position:absolute;padding-top:16mm;">
            <img src="{$ImagePath}/1120POL_Deductions.gif" width="9" height="67" alt="Deductions Image" border="0"/>
          </span>
       
        <!-- line 9 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex">9</div>
          <div class="IRS1120POL_LineDescLong">Salaries and wages
              <!--Dotted Line-->
            <span style="letter-spacing:4mm; font-weight:bold; ">.......................</span>
                   <!--span class="IRS1120POL_DotSpacing">.......................................</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">9</div>
          <div class="IRS1120POL_MoneyField">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/SalariesAndWagesAmt"/>
            </xsl:call-template>
          </div>
        </div>
         </div>
        <!-- line 10 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex">10</div>
          <div class="IRS1120POL_LineDescLong">Repairs and maintenance
                  <!--Dotted Line-->
           <span style="letter-spacing:4mm; font-weight:bold; ">.....................</span>
                 <!--span class="IRS1120POL_DotSpacing">...................................</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">10</div>
          <div class="IRS1120POL_MoneyField">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/RepairsAndMaintenanceAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 11 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex">11</div>
          <div class="IRS1120POL_LineDescLong">Rents
                 <!--Dotted Line-->
            <span style="letter-spacing:4mm; font-weight:bold; ">..........................</span>
                  <!--span class="IRS1120POL_DotSpacing">............................................</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">11</div>
          <div class="IRS1120POL_MoneyField">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/RentAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 12 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex">12</div>
          <div class="IRS1120POL_LineDescLong">Taxes and licenses
                    <!--Dotted Line-->
           <span style="letter-spacing:4mm; font-weight:bold; ">.......................</span>
               <!--span class="IRS1120POL_DotSpacing">......................................</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">12</div>
          <div class="IRS1120POL_MoneyField">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/TaxesAndLicensesAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 13 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex">13</div>
          <div class="IRS1120POL_LineDescLong">Interest
                      <!--Dotted Line-->
            <span style="letter-spacing:4mm; font-weight:bold; ">..........................</span>
                 <!--span class="IRS1120POL_DotSpacing">...........................................</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">13</div>
          <div class="IRS1120POL_MoneyField">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/InterestDeductionAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 14 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex">14</div>
          <div class="IRS1120POL_LineDescLong">Depreciation (attach Form 4562)
             <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$FormData/DepreciationAmt"/>
            </xsl:call-template>
                    <!--Dotted Line-->
           <span style="letter-spacing:4mm; font-weight:bold; ">..................</span>
                   <!--span class="IRS1120POL_DotSpacing">................................</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">14</div>
          <div class="IRS1120POL_MoneyField">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/DepreciationAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 15 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex">15</div>
          <div class="IRS1120POL_LineDescLong">Other deductions (attach statement)
             <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$FormData/OtherDeductionsAmt"/>
            </xsl:call-template>
                    <!--Dotted Line-->
           <span style="letter-spacing:4mm; font-weight:bold; ">................</span>
                     <!--span class="IRS1120POL_DotSpacing">...............................</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">15</div>
          <div class="IRS1120POL_MoneyField">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/OtherDeductionsAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 16 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex">16</div>
          <div class="IRS1120POL_LineDescLong">
            <span style="font-weight:bold;">Total deductions. </span>
            Add lines 9 through 15
                    <!--Dotted Line-->
            <span style="letter-spacing:4mm; font-weight:bold; ">................</span>
                     <!--span class="IRS1120POL_DotSpacing">............................</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">16</div>
          <div class="IRS1120POL_MoneyField">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/TotalDeductionAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 17 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex">17</div>
          <div class="IRS1120POL_LineDescLong">
            Taxable income before specific deduction of $100. See instructions. Section 501(c) organizations show:
            </div>
          <div class="IRS1120POL_LineIndexMidFiller"/>
          <div class="IRS1120POL_MoneyFieldFiller"/>
        </div>
        <!-- line 17a -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_SubLineIndex">a</div>
          <div class="IRS1120POL_LineDescLong" style="width:106mm;border-right-width:0px;">
            Amount of net investment income
                    <!--Dotted Line-->
           <span style="letter-spacing:4mm; font-weight:bold; ">...........</span>
                  <!--span class="IRS1120POL_DotSpacing">.....................</span-->
          </div>
          <div class="IRS1120POL_LineDescLong" style="width:4mm;border-right-width:0px;">
            <img src="{$ImagePath}/1120POL_Bullet_Sm.gif" alt="right arrow"/>
          </div>
          <div class="IRS1120POL_MoneyField" style="border-style:solid;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/NetInvestmentIncomeAmt"/>
            </xsl:call-template>
          </div>
          <div class="IRS1120POL_LineDescLong" style="width:4mm;"/>
          <div class="IRS1120POL_LineIndexMidFiller"/>
          <div class="IRS1120POL_MoneyFieldFiller"/>
        </div>
        <!-- line 17b -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_SubLineIndex">b</div>
          <div class="IRS1120POL_LineDescLong" style="width:106mm;border-right-width:0px;">
            Aggregate amount expended for an exempt function (attach statement)
             <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$FormData/ExpendedForExemptFunctionAmt"/>
            </xsl:call-template>
                    <!--Dotted Line-->
            <span style="letter-spacing:4mm; font-weight:bold; "></span>
                  <!--span class="IRS1120POL_DotSpacing">.....</span-->
          </div>
          <div class="IRS1120POL_LineDescLong" style="width:4mm;border-right-width:0px;">
            <img src="{$ImagePath}/1120POL_Bullet_Sm.gif" alt="right arrow"/>
          </div>
          <div class="IRS1120POL_MoneyField" style="border-style:solid;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/ExpendedForExemptFunctionAmt"/>
            </xsl:call-template>
          </div>
          <div class="IRS1120POL_LineDescLong" style="width:4mm;"/>
          <div class="IRS1120POL_LineIndexMid">17c</div>
          <div class="IRS1120POL_MoneyField">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/TaxableIncmBefore100DolDedAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 18 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace" style="border-bottom-width:1px;"/>
          <div class="IRS1120POL_LineIndex" style="border-bottom-width:1px;">18</div>
          <div class="IRS1120POL_LineDescLong" style="border-bottom-width:1px;">
              Specific  deduction of $100 (not allowed for newsletter funds defined under section 527(g))
                    <!--Dotted Line-->
           <span style="letter-spacing:4mm; font-weight:bold; ">...</span>
              <!--span class="IRS1120POL_DotSpacing">......</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid" style="border-bottom-width:1px;">18</div>
          <div class="IRS1120POL_MoneyField" style="border-bottom-width:1px;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/Specific100DollarDeductionAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- superimposed image title - Tax -->
        <div class="IRS1120POL_LineContainer">
          <span style="z-index:1;position:absolute;padding-top:17mm;">
            <img src="{$ImagePath}/1120POL_Tax.gif" width="9" height="20" alt="Tax Image" border="0"/>
          </span>
       
        <!-- line 19 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex">19</div>
          <div class="IRS1120POL_LineDescLong">
            <span style="font-weight:bold;">Taxable income. </span>
            Subtract line 18 from line 17c. If line 19 is zero or less, see the instructions.
            <!--Dotted Line-->
            <span style="letter-spacing:4mm; font-weight:bold; ">..</span>
                     <!--span class="IRS1120POL_DotSpacing">....</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">19</div>
          <div class="IRS1120POL_MoneyField">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/TaxableIncomeAmt"/>
            </xsl:call-template>
          </div>
        </div>
         </div>
        <!-- line 20 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex">20</div>
          <div class="IRS1120POL_LineDescLong">
            <span style="font-weight:bold;">Income tax.</span>
            See instructions.
                 <!--Dotted Line-->
            <span style="letter-spacing:4mm; font-weight:bold; ">..................</span>
             <!--span class="IRS1120POL_DotSpacing">..................................</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">20</div>
          <div class="IRS1120POL_MoneyField">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/IncomeTaxAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 21 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex">21</div>
          <div class="IRS1120POL_LineDescLong">
            <span style="font-weight:bold;">Tax credits. </span>
            Attach the applicable credit  forms.  See instructions.
                 <!--Dotted Line-->
           <span style="letter-spacing:4mm; font-weight:bold; ">...........</span>
                       <!--span class="IRS1120POL_DotSpacing">.................</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">21</div>
          <div class="IRS1120POL_MoneyField">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/TaxCreditsAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 22 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex">22</div>
          <div class="IRS1120POL_LineDescLong">
            Total tax.  Subtract line 21 from line 20
            <xsl:call-template name="LinkToLeftoverDataTableInline">
              <xsl:with-param name="Desc">Line 22 - Qualified Electric Vehicle Recapture</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
            </xsl:call-template>
                 <!--Dotted Line-->
            <span style="letter-spacing:4mm; font-weight:bold; ">................</span>
                     <!--span class="IRS1120POL_DotSpacing">.............................</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">22</div>
          <div class="IRS1120POL_MoneyField">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
            </xsl:call-template>
           </div>
        </div>
        <!-- line 23 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex">23</div>
          <div class="IRS1120POL_LineDescLong" style="width:15mm;border-right-width:0px;">Payments:</div>
          <div class="IRS1120POL_LineDescLong" style="width:4mm;border-right-width:0px;font-weight:bold;">a</div>
          <div class="IRS1120POL_LineDescLong" style="width:87mm;">
            Tax deposited with Form 7004
            <!--Dotted Line-->
           <span style="letter-spacing:4mm; font-weight:bold; ">.........</span>
                   <!--span class="IRS1120POL_DotSpacing">..............</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">23a</div>
          <div class="IRS1120POL_MoneyFieldMid">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/TaxPaidForm7004Amt"/>
            </xsl:call-template>
          </div>
          <div class="IRS1120POL_LineIndexMidFiller"/>
          <div class="IRS1120POL_MoneyFieldFiller"/>
        </div>
        <!-- line 23b -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex"/>
          <div class="IRS1120POL_LineDescLong" style="width:15mm;border-right-width:0px;"/>
          <div class="IRS1120POL_LineDescLong" style="width:4mm;border-right-width:0px;font-weight:bold;">b</div>
          <div class="IRS1120POL_LineDescLong" style="width:87mm;">
            <span>
              Credit for tax paid on undistributed capital gains (attach Form 2439)
            </span>
            <!--Dotted Line-->
           <span style="letter-spacing:4mm; font-weight:bold; ">....</span>
            <!--span class="IRS1120POL_DotSpacing">.......</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">23b</div>
          <div class="IRS1120POL_MoneyFieldMid">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/TaxPaidOnUndistrCapGainsAmt"/>
            </xsl:call-template>
          </div>
          <div class="IRS1120POL_LineIndexMidFiller"/>
          <div class="IRS1120POL_MoneyFieldFiller"/>
        </div>
        <!-- line 23c -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex"/>
          <div class="IRS1120POL_LineDescLong" style="width:15mm;border-right-width:0px;"/>
          <div class="IRS1120POL_LineDescLong" style="width:4mm;border-right-width:0px;font-weight:bold;">c</div>
          <div class="IRS1120POL_LineDescLong" style="width:87mm;">
            Credit for federal tax on fuels (attach Form 4136)
            <!--Dotted Line-->
            <span style="letter-spacing:4mm; font-weight:bold; ">...</span>
                 <!--span class="IRS1120POL_DotSpacing">.....</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">23c</div>
          <div class="IRS1120POL_MoneyFieldMid">
            <xsl:call-template name="PopulateAmount">
             <xsl:with-param name="TargetNode" select="$FormData/TotalFuelTaxCreditAmt"/>
            </xsl:call-template>
          </div>
          <div class="IRS1120POL_LineIndexMidFiller"/>
          <div class="IRS1120POL_MoneyFieldFiller"/>
        </div>
        <!-- line + -->
     <!--<div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace" style=""/>
          <div class="IRS1120POL_LineIndex"/>
          <div class="IRS1120POL_LineDescLong" style="width:15mm;border-right-width:0px;"/>
          <div class="IRS1120POL_LineDescLong" style="width:4mm;border-right-width:0px;font-weight:bold;">d</div>-->
         <!-- <div class="IRS1120POL_LineDescLong" style="width:87mm">
            Credit for federal telephone excise tax paid (attach Form 8913)-->
            <!--Dotted Line-->
            <!--<span class="styBoldText">
              
             
		   </span>-->
                 <!--span class="IRS1120POL_DotSpacing">.....</span-->
          <!--</div>-->
          <!--<div class="IRS1120POL_LineIndexMid" style="">23d</div>-->
          <!--<div class="IRS1120POL_MoneyFieldMid" style="">
             <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/TelephoneTaxCredit"/>
            </xsl:call-template>
          </div>-->
          <!--<div class="IRS1120POL_LineIndexMidFiller" style=""/>-->
          <!--<div class="IRS1120POL_MoneyFieldFiller"/>-->
       <!-- </div>-->
        <!-- line 23d-->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex"/>
          <div class="IRS1120POL_LineDescLong" style="width:15mm;border-right-width:0px;"/>
          <div class="IRS1120POL_LineDescLong" style="width:4mm;border-right-width:0px;font-weight:bold;">d</div>
          <div class="IRS1120POL_LineDescLong" style="width:121mm;">
           <span class="styBoldText">Total payments. </span> Add lines 23a through 23c
              <!--Dotted Line-->
           <span style="letter-spacing:4mm; font-weight:bold; ">..........</span>
                   <!--span class="IRS1120POL_DotSpacing">........................</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">23d</div>
          <div class="IRS1120POL_MoneyField" style="">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/TotalPaymentsAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 24 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace"/>
          <div class="IRS1120POL_LineIndex">24</div>
          <div class="IRS1120POL_LineDescLong">
            <span style="font-weight:bold;">Tax due. </span>
        Subtract line 23d from line 22. See instructions for depository method of payment
                 <!--span class="IRS1120POL_DotSpacing">..</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid">24</div>
          <div class="IRS1120POL_MoneyField">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/TaxDueAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- line 25 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpace" style="border-bottom-width:1px;"/>
          <div class="IRS1120POL_LineIndex" style="border-bottom-width:1px;">25</div>
          <div class="IRS1120POL_LineDescLong" style="border-bottom-width:1px;">
            <span style="font-weight:bold;">Overpayment.</span>
                Subtract line 22 from line 23d
              <!--Dotted Line-->
              <span style="letter-spacing:4mm; font-weight:bold; ">................</span>
              <!--span class="IRS1120POL_DotSpacing">...........................</span-->
          </div>
          <div class="IRS1120POL_LineIndexMid" style="border-bottom-width:1px;">25</div>
          <div class="IRS1120POL_MoneyField" style="border-bottom-width:1px;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/OverpaymentAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- superimposed image title - Additional info -->
			<div class="IRS1120POL_LineContainer"  style="display:inline;">
			<span style="padding-right: 10mm; padding-bottom: 23mm; font-size: 10pt; font-weight: bold; position: absolute; transform: rotate(270deg); text-align: center;">
			Additional<br/>
			Information
			</span>
        </div>
       
        <!-- additional info line 1 -->
				
				<div style="margin-left:10.2mm; border-left: 1px solid black; border-bottom: 1px solid black; width: 176.8mm;">
			<div class="IRS1120POL_LineContainer" >
				<div class="IRS1120POL_LabelSpaceWide" style="padding-top:1mm;border-right-width:0px;width:0;"/>
				<div class="IRS1120POL_LineIndex" style="padding-top:1mm">1</div>
				<div class="IRS1120POL_LineDescLong" style="width:142mm;border-right-width:0px;font-size:7pt;padding-top:1mm">
              At any time during the 2019 calendar year, did the organization have an interest in or a signature or other 
              </div>
 </div>
 
             <div class="IRS1120POL_LineContainer">
				<div class="IRS1120POL_LabelSpaceWide" style="border-right-width:0px;width:0;"/>
				<div class="IRS1120POL_LineIndex" />
				<div class="IRS1120POL_LineDescLong" style="width:142mm;border-right-width:0px;font-size:7pt;">
              authority over  a financial account (such as a bank account, securities account, or other financial account)
        </div> 
				<div class="IRS1120POL_MoneyFieldFiller" style="border-right-width:0px;"/>
			</div>
			<!-- additional info line 1 -->
			<div class="IRS1120POL_LineContainer">
					<div class="IRS1120POL_LabelSpaceWide" style="border-right-width:0px;width:0;"/>
					<div class="IRS1120POL_LineIndex" />
					<div class="IRS1120POL_LineDescLong" style="width:142mm;border-right-width:0px;font-size:7pt;">
              in a foreign country?  See instructions.
                <span class="styDotLn" style="float:right;">.......................</span>
</div>
					<div class="IRS1120POL_MoneyFieldFiller" style="border-right-width:0px;">
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignAccountsQuestionInd"/>
							</xsl:call-template>
							<input type="checkbox" alt="ForeignAccountsQuestionYES" class="IRS1120POL_Checkbox" >
								<xsl:call-template name="PopulateYesCheckbox">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignAccountsQuestionInd"/>
									<xsl:with-param name="BackupName">IRS1120POLForeignAccountsQuestionInd</xsl:with-param>
								</xsl:call-template>
							</input>
						</span>
						<span style="font-weight:bold;width:7mm;">
							<label>
								<xsl:call-template name="PopulateLabelYes">
									<xsl:with-param name="TargetNode" select="$FormData/ForeignAccountsQuestionInd"/>
									<xsl:with-param name="BackupName">IRS1120POLForeignAccountsQuestionInd</xsl:with-param>
								</xsl:call-template>
                Yes
              </label>
						</span>
				
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignAccountsQuestionInd"/>
              </xsl:call-template>
              <input type="checkbox" alt="ForeignAccountsQuestionNo" class="IRS1120POL_Checkbox" >
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/ForeignAccountsQuestionInd"/>
                <xsl:with-param name="BackupName">IRS1120POLForeignFinancialAccount</xsl:with-param>
              </xsl:call-template>
            </input>
            </span>
            <span style="font-weight:bold;width:7mm;">
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$FormData/ForeignAccountsQuestionInd"/>
                  <xsl:with-param name="BackupName">IRS1120POLForeignAccountsQuestionInd</xsl:with-param>
                </xsl:call-template>
                No
              </label>            
            </span>
          </div>
        </div>
        <!-- additional info line 1 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpaceWide" style="border-right-width:0px;width:0;"/>
          <div class="IRS1120POL_LineIndex"/>
          <div class="IRS1120POL_LineDescLong" style="width:62mm;border-right-width:0px;">
              If "Yes," enter the name of the foreign country
            <img src="{$ImagePath}/1120POL_Bullet_Sm.gif" alt="right arrow"/>
          </div>
          <div class="IRS1120POL_MoneyField" style="width:80mm;border-right-width:0px;border-style:dashed;text-align:left; padding-top:0; height:3.5mm;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/ForeignAccountsQuestionInd/@countryCd"/>
            </xsl:call-template>
          </div>
        <div class="IRS1120POL_MoneyFieldFiller" style="border-right-width:0px;"/>
        </div>
        <!-- additional info line 2 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpaceWide" style="border-right-width:0px;width:0;"/>
          <div class="IRS1120POL_LineIndex">2</div>
          <div class="IRS1120POL_LineDescLong" style="width:142mm;border-right-width:0px;">
              During the tax year, did the organization receive a distribution from, or was it the grantor of, or transferor
          </div>
          <div class="IRS1120POL_MoneyFieldFiller" style="border-right-width:0px;"/>
        </div>
        <!-- additional info line 2 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpaceWide" style="border-right-width:0px;width:0;"/>
          <div class="IRS1120POL_LineIndex"/>
          <div class="IRS1120POL_LineDescLong" style="width:142mm;border-right-width:0px;">
              to, a foreign trust? If "Yes," the organization may have to file Form 3520
             <!--Dotted Line-->
				<span class="styDotLn" style="float:right;">............</span>
					</div>
					<div class="IRS1120POL_MoneyFieldFiller" style="border-right-width:0px;">
						<span>
							<xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignTrustQuestionInd"/>
                </xsl:call-template>
                <input type="checkbox" alt="ForeignTrustQuestionYES" class="IRS1120POL_Checkbox" >
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$FormData/ForeignTrustQuestionInd"/>
                    <xsl:with-param name="BackupName">IRS1120POLForeignTrustQuestionInd</xsl:with-param>
                  </xsl:call-template>
                </input>
            </span>
            <span style="font-weight:bold;width:7mm;">
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$FormData/ForeignTrustQuestionInd"/>
                  <xsl:with-param name="BackupName">IRS1120POLForeignTrustQuestionInd</xsl:with-param>
                </xsl:call-template>
                Yes
              </label>            
            </span>
            <span>
              <xsl:call-template name="PopulateSpan">
								<xsl:with-param name="TargetNode" select="$FormData/ForeignTrustQuestionInd"/>
              </xsl:call-template>
              <input type="checkbox" alt="ForeignTrustQuestionNo" class="IRS1120POL_Checkbox" >
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$FormData/ForeignTrustQuestionInd"/>
                  <xsl:with-param name="BackupName">IRS1120POLForeignTrustQuestionInd</xsl:with-param>
                </xsl:call-template>
              </input>
            </span>
            <span style="font-weight:bold;width:7mm;">
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$FormData/ForeignTrustQuestionInd"/>
                  <xsl:with-param name="BackupName">IRS1120POLForeignTrustQuestionInd</xsl:with-param>
                </xsl:call-template>
                No
            </label>            
            </span>
          </div>
        </div>
        
        <!-- additional info line 3 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpaceWide" style="border-right-width:0px;width:0;"/>
          <div class="IRS1120POL_LineIndex">3</div>
          <div class="IRS1120POL_LineDescLong" style="width:134mm;border-right-width:0px">
              Enter the amount of tax-exempt interest received or accrued during the tax year
             <span style="float:right; padding-right:1.75mm;">
				<span class="styDotLn">.......</span>
				<img src="{$ImagePath}/1120POL_Bullet_Sm.gif" alt="right arrow"/>
			</span>
          </div>
          <div class="IRS1120POL_LineIndexMid" style="border-right-width:0px; border-left: 1px solid black; width: 6mm;">$</div>
          <div class="IRS1120POL_MoneyField" style="width: 28mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$FormData/TaxExemptInterestAmt"/>
            </xsl:call-template>
          </div>
        </div>
         <!-- add info line 4 -->
        <div class="IRS1120POL_LineContainer">
          <div class="IRS1120POL_LabelSpaceWide" style="border-right-width:0px;width:0;"/>
          <div class="IRS1120POL_LineIndex">4</div>
          <div class="IRS1120POL_GenericDesc" style="width:34mm;">Date organization formed </div>
          <div class="IRS1120POL_GenericDesc" style="width:4mm;">
            <img src="{$ImagePath}/1120POL_Bullet_Sm.gif" alt="right arrow"/>
          </div>
          <div class="IRS1120POL_GenericDesc" style="width:42mm;border-bottom-width:1px;border-style:dashed; height:3.5mm; padding-top: 0;">
            <xsl:call-template name="PopulateMonthDayYear">
              <xsl:with-param name="TargetNode" select="$FormData/OrganizationFormedDt"/>
            </xsl:call-template>
          </div>
          <div class="IRS1120POL_GenericDesc" style="width:88mm;"/>
        </div>
        <!-- add info line 5ab -->
         <div class="IRS1120POL_LineContainer" style="border-left-width:0;">
			<!-- 5a -->
			<div class="IRS1120POL_LabelSpaceWide" style="padding-bottom:0mm; border-right-width:0px; min-height:5mm;width:0;"/>
			<div class="IRS1120POL_LineIndex" style="padding-bottom:0mm;padding-right:2.2mm;">5a</div>
					<div class="IRS1120POL_GenericDesc" style="width:34mm;padding-bottom:0mm;">The books are in care of </div>
					<div class="IRS1120POL_GenericDesc" style="width:4mm;padding-bottom:0mm;">
				<img src="{$ImagePath}/1120POL_Bullet_Sm.gif" alt="right arrow"/>
			</div>
			<div class="IRS1120POL_GenericDesc" style="width:42mm;border-bottom-width:1px;border-style:dashed; min-height: 4mm; height:auto; padding-top: 0;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/BooksInCareOfTxt"/>
            </xsl:call-template>
          </div>
          <div class="IRS1120POL_GenericDesc" style="width:8mm;font-weight:bold;padding-left:4mm;">b</div>
			<div class="IRS1120POL_GenericDesc" style="width:34mm;">Enter name of candidate</div>
         <div class="IRS1120POL_GenericDesc" style="width:4mm;">
				<img src="{$ImagePath}/1120POL_Bullet_Sm.gif" alt="right arrow"/>
			</div>
			<div class="IRS1120POL_GenericDesc" style="width:42mm;border-bottom-width:1px;border-style:dashed;min-height: 4mm; height:auto; padding-top: 0;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$FormData/CandidateNm"/>
            </xsl:call-template>
          </div>
        </div>
        <!-- add info line 5cd -->
<div class="IRS1120POL_LineContainer" style="border-style: solid; border-color: black; border-top-width: 0px; border-bottom-width: 0; border-left-width: 0px; border-right-width: 0px; height:auto;">
				<div class="IRS1120POL_LabelSpaceWide" style="padding-bottom:0mm; height:5mm; border-right-width:0px; width:0;"/>
				<div class="IRS1120POL_SubLineIndex" style="padding-bottom:0mm;padding-left:1.5mm;">c</div>
					<div class="IRS1120POL_GenericDesc" style="width:34mm;">The books are located at</div>
					<div class="IRS1120POL_GenericDesc" style="width:4mm;">
					<img src="{$ImagePath}/1120POL_Bullet_Sm.gif" alt="right arrow"/>
				</div>
				<div class="IRS1120POL_GenericDesc" style="width:42mm; min-height: 4mm; height:auto; border-bottom:1px dashed black;">
    <!-- not enough space here -->
    <!-- us address type -->
    <!-- replaced the code and called the populateUSaddress template -->
    <xsl:if test="not($FormData/LocationOfBooksUSAddress/AddressLine1Txt='' or not($FormData/LocationOfBooksUSAddress/AddressLine1Txt))">
      <xsl:call-template name="PopulateUSAddressTemplate">
        <xsl:with-param name="TargetNode" select="$FormData/LocationOfBooksUSAddress"/>
      </xsl:call-template>
    </xsl:if>
              <!-- foreign address type -->
    <xsl:if test="not($FormData/LocationOfBooksForeignAddress/AddressLine1Txt='' or not($FormData/LocationOfBooksForeignAddress/AddressLine1Txt))">
      <xsl:call-template name="PopulateForeignAddressTemplate">
        <xsl:with-param name="TargetNode" select="$FormData/LocationOfBooksForeignAddress"/>
      </xsl:call-template>
    </xsl:if>
    <!-- end address type -->
  </div>
					<div class="IRS1120POL_GenericDesc" style="width:8mm;font-weight:bold;padding-left:4mm;">d</div>
					<div class="IRS1120POL_GenericDesc" style="width:20mm;">Telephone No.</div>
					<div class="IRS1120POL_GenericDesc" style="width:4mm;">
					<img src="{$ImagePath}/1120POL_Bullet_Sm.gif" alt="right arrow"/>
				</div>
				<div class="IRS1120POL_GenericDesc" style="width:56mm; min-height: 4mm; height:auto; border-bottom:1px dashed black;">
    <xsl:call-template name="PopulatePhoneNumber">
      <xsl:with-param name="TargetNode" select="$FormData/PhoneNum"/>
    </xsl:call-template>
</div>
</div>
</div>
      <!-- BEGIN SIGNATURE SECTION -->
  <!-- Implementing the signature section in tables -->
<table border="0" cellspacing="0" cellpadding="0" style="width:187mm;font-size:6pt;height:auto;">
	<tr>
		<td rowspan="3" style="height:auto;width:10mm;font-size: 11pt;font-weight:bold;border-right:1px solid black;border-bottom:1px solid black;">Sign Here</td>
		<td colspan="6" style="height:auto;padding-left:1mm;padding-bottom:1mm;">Under penalties of perjury, I declare that I have examined this return, including accompanying schedules and statements, and to the best of my knowledge and belief, it is true,
correct, and complete. Declaration of preparer (other than taxpayer) is based on all information of which preparer has any knowledge. </td>
	</tr>
	<tr>
						<td rowspan="2" style="border-bottom:1px solid black;padding-left:1mm;">
							<img src="{$ImagePath}/1120POL_Bullet_Lg.gif" alt="LargeBullet"/>
						</td>
		<td style="height:auto;width:52mm;border-right:1px solid black;border-bottom:1px solid black;vertical-align:bottom;">
              <xsl:call-template name="PopulateReturnHeaderOfficer"> 
	         <xsl:with-param name="TargetNode">Name</xsl:with-param> 
            </xsl:call-template>
     </td>
		<td style="height:auto;width:20mm;border-bottom:1px solid black;vertical-align:bottom;padding-left:.5mm;">
        <xsl:call-template name="PopulateReturnHeaderOfficer">
          <xsl:with-param name="TargetNode">DateSigned</xsl:with-param> 
        </xsl:call-template>
		</td>
						<td rowspan="2" style="border-bottom:1px solid black;padding-left:1mm;">
							<img src="{$ImagePath}/1120POL_Bullet_Lg.gif" alt="LargeBullet"/>
						</td>
		<td style="width:60mm;border-bottom:1px solid black;vertical-align:bottom;">
      <xsl:call-template name="PopulateReturnHeaderOfficer">
        <xsl:with-param name="TargetNode">Title</xsl:with-param>
      </xsl:call-template>
		</td>
		<td rowspan="2" style="width:40mm;border-bottom:1px solid black;padding-bottom:1mm;">
							<div class="styGenericDiv" style="width:2px;"/>
		<div style="border-right:3px solid black;border-left:3px solid black;border-bottom:3px solid black;border-top:3px solid black;float:right;" class="styGenericDiv">		
		May the IRS discuss this return<br/>
with the preparer shown below?<br/>
See instructions.
      <input type="checkbox" alt="AuthorizeThirdPartyYesCheckbox" class="styCkbox"  name="Checkbox" id="dummyidyes" style="width:2.5mm;">
        <xsl:call-template name="PopulateReturnHeaderOfficer">
          <xsl:with-param name="TargetNode">AuthorizeThirdPartyYesCheckbox</xsl:with-param>
          <xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
        </xsl:call-template>
      </input>
      <span class="styBoldText">
        <label for="dummyidyes">
          <xsl:call-template name="PopulateReturnHeaderOfficer">
            <xsl:with-param name="TargetNode">AuthorizeThirdPartyYesLabel</xsl:with-param>
            <xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
          </xsl:call-template>
          Yes
        </label>
      </span>
      <input type="checkbox" alt="AuthorizeThirdPartyNoCheckbox" class="styCkbox"  name="Checkbox" id="dummyidno" style="width:2.5mm;">
        <xsl:call-template name="PopulateReturnHeaderOfficer">
          <xsl:with-param name="TargetNode">AuthorizeThirdPartyNoCheckbox</xsl:with-param>
          <xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
        </xsl:call-template>
      </input> 
      <span class="styBoldText">
        <label for="dummyidno">  
          <xsl:call-template name="PopulateReturnHeaderOfficer">
            <xsl:with-param name="TargetNode">AuthorizeThirdPartyNoLabel</xsl:with-param>
            <xsl:with-param name="BackupName">ReturnHeaderMayIRSDiscussReturnWithPrep</xsl:with-param>
          </xsl:call-template>
          No
        </label>
      </span>
		</div>
	 </td>
	</tr>
	<tr>
		<td style="border-bottom:1px solid black;vertical-align:top;">Signature of officer      </td>
		<td style="border-bottom:1px solid black;vertical-align:top;">Date</td>
		<td style="border-bottom:1px solid black;vertical-align:top;">Title</td>
	</tr>
</table>
<!-- END Signature Section -->
        <!-- END OFFICER SIGNATURE -->
        <!-- BEGIN PREPARER SIGNATURE SECTION -->
					<!-- Implementing the preparer section in table -->
					<div class="styBB" style="width:187mm;font-size:6pt;">
            <div style="height:auto;width:22.75mm;padding-top:4mm;float:left;clear:none;">
              <span class="styMainTitle" style="font-size:11pt;">
                  Paid
                  Preparer
                  Use Only
                  </span>
            </div>
            <div style="width:164mm;float:left;clear:none;">
              <div style="height:auto;width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
                <div class="styLNDesc" style="height:9mm;width:46.8mm;padding-top:0mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
                
                Print/Type preparer's name<br/>
               <xsl:call-template name="PopulateReturnHeaderPreparer">
														<xsl:with-param name="TargetNode">Name</xsl:with-param>
													</xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:9mm;width:46.5mm;padding-top:0mm;border-right:1px solid black;padding-left:1mm;">
                Preparer's signature<br/>
                <!--<xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">Name</xsl:with-param>
									</xsl:call-template>-->
              </div>
                <div class="styLNDesc" style="height:9mm;width:15mm;border-right:1px solid black;padding-top:0mm;padding-left:1mm;">Date <br/>
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
                    <xsl:with-param name="TargetNode">DatePrepared</xsl:with-param>
                   <!-- <xsl:with-param name="BackupName">PopulateReturnHeaderPreparer</xsl:with-param>-->
                  </xsl:call-template>
                </div>
                <div class="styLNDesc" style="height:auto;width:18mm;border-right:0px solid black;padding-top:0mm;padding-bottom:0mm;padding-left:1mm;text-align:top;">
                  <label>
                    <xsl:call-template name="PopulateReturnHeaderPreparer">
											<xsl:with-param name="TargetNode">SelfEmployedLabel</xsl:with-param>
											<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
										</xsl:call-template>
                    Check 
                    <input class="styCkbox" type="checkbox" alt="PreparerSelfEmployed" style="width:2mm;">
                      <xsl:call-template name="PopulateReturnHeaderPreparer">
										<xsl:with-param name="TargetNode">SelfEmployedCheckbox</xsl:with-param>
										<xsl:with-param name="BackupName">PreparerSelfEmployed</xsl:with-param>
									</xsl:call-template>
                    </input>
                    <span style="width:4px;"/>if<br/>self-employed
                  </label>
                </div>
                <div class="styLNDesc" style="height:9mm;width:16mm;padding-top:0mm;padding-left:1mm;border-left:1px solid black;">PTIN
                             <br/>
                             <xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">SSN</xsl:with-param>
								</xsl:call-template>
								<xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">PTIN</xsl:with-param>
								</xsl:call-template>
                             
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;border-style:solid;border-color:black;border-width:0px 0px 1px 0px;">
                <div class="styLNDesc" style="height:auto;width:108.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
                  <span class="styGenericDiv" style="">Firm's name 
                  <span style="width:2.2mm;"/>
                    <img src="{$ImagePath}/1120POL_Bullet_Sm.gif" alt="right arrow"/>
                    <span style="width:4px;"/>
                  </span>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
                    <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
										</xsl:call-template>
										
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
										</xsl:call-template>
                    
                  </div>
                </div>
                <div class="styLNDesc" style="height:auto;width:32mm;padding-left:1mm;">Firm's EIN
                <img src="{$ImagePath}/1120POL_Bullet_Sm.gif" alt="right arrow"/>
                  <span style="width:4px;"/>
                                   <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>
                </div>
              </div>
              <div style="width:164mm;float:left;clear:none;">
                <div class="styLNDesc" style="height:auto;width:108.5mm;border-right:1px solid black;border-left:1px solid black;padding-left:1mm;">
                  <div class="styGenericDiv" style="padding-right:.5mm;">Firm's address 
                  <img src="{$ImagePath}/1120POL_Bullet_Sm.gif" alt="right arrow"/>
                  </div>
                  <div class="styGenericDiv" style="padding-right:.5mm;">
                
                    <xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
										</xsl:call-template>
										<br/>
										<xsl:call-template name="PopulateReturnHeaderPreparerFirm">
											<xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
										</xsl:call-template>
    
                  </div>
                </div>
                <div class="styLNDesc" style="height:auto;width:32mm;padding-left:1mm;"> Phone no. 
                
                  <xsl:call-template name="PopulateReturnHeaderPreparer">
									<xsl:with-param name="TargetNode">Phone</xsl:with-param>
								</xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- END paid preparer -->
        <!-- footer line -->
        <div class="IRS1120POL_LineContainer">
					<div style="font-weight:bold;width:120mm;float:left;">
            For Paperwork Reduction Act Notice, see instructions.
          </div>
					<div style="width:30mm;float:left;text-align:center;">
            Cat. No. 11523K
          </div>
          <div style="width:37mm;text-align:right;float:left;">Form <span style="font-weight:bold;">1120-POL </span> (2019)</div>
        </div>
        <!-- leftover data table -->
				
		<p style="page-break-before:always"/>
		
		
  <!-- Additonal Data Title Bar and Button -->
<div class="styLeftOverTitleLine" id="LeftoverData">
  <div class="styLeftOverTitle">
    Additional Data        
  </div>
  <div class="styLeftOverButtonContainer">
    <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
  </div>      
</div>  
<table class="styLeftOverTbl">
  <xsl:call-template name="PopulateCommonLeftover">
						<xsl:with-param name="TargetNode" select="$FormData"/>
    <xsl:with-param name="DescWidth" select="100"/>
  </xsl:call-template>
  
  <xsl:call-template name="PopulateLeftoverRowAmount">
    <xsl:with-param name="Desc">Line 22 - Qualified Electric Vehicle Recapture</xsl:with-param>
    <xsl:with-param name="TargetNode" select="$FormData/TotalTaxAmt"/>
    <xsl:with-param name="DescWidth" select="100"/>
  </xsl:call-template>
  
</table>
	
<!--Special Condition Description -->
<br />
 <span class="styRepeatingDataTitle">Form 1120-POL, Special Condition Description: </span>


<table class="styDepTbl" cellspacing="0" style="font-size:7pt;">

<thead class="styTableThead">

<tr class="styDepTblHdr">

<th class="styDepTblCell" scope="col" rowspan="2" style="width:179mm;font-size:8pt;">

Special Condition Description</th>

</tr>

</thead>

<tfoot/>

<tbody>

<xsl:for-each select="$FormData/SpecialConditionDesc">

<tr style="border-color:black;height:6mm;">

<xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>

<td class="styTableCellText" style="width:179mm;">

<xsl:call-template name="PopulateText">

<xsl:with-param name="TargetNode" select="."/>

</xsl:call-template>

<span class="styTableCellPad"/>

</td>

</tr>

</xsl:for-each>

</tbody>

</table>

</body>
    </html>
  </xsl:template>
</xsl:stylesheet>
