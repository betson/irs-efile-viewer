<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="IRS8824Style.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<!-- Defines the stage of the data, e.g. original or latest -->
	<xsl:param name="Form8824Data" select="$RtnDoc/IRS8824"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:call-template name="FormTitle">
						<xsl:with-param name="RootElement" select="local-name($Form8824Data)"/>
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
				<meta name="Description" content="Form IRS8824"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
				<style type="text/css">
					<!-- PRINT STATEMENT -->
					<xsl:if test="not($Print) or $Print=''">
						<xsl:call-template name="IRS8824Style"/>
						<xsl:call-template name="AddOnStyle"/>
					</xsl:if>
				</style>
				<xsl:call-template name="GlobalStylesForm"/>
			</head>
			<body class="styBodyClass">
				<form name="Form8824">
					<!-- BEGIN WARNING LINE -->
					<xsl:call-template name="DocumentHeader"/>
					<!-- END WARNING LINE -->
					<div class="styBB" style="width:187mm;">
						<div class="styFNBox" style="width:31mm;height:20mm;">
          Form <span class="styFormNumber">8824</span>
							<br/>
							<!-- Push Pin -->
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form8824Data"/>
							</xsl:call-template>
							<br/>
							<br/>
							<span class="styAgency">Department of the Treasury</span>
							<br/>
							<span class="styAgency">Internal Revenue Service</span>
						</div>
						<div class="styFTBox" style="width:125mm;padding-top:2mm">
							<div class="styMainTitle">
            Like-Kind Exchanges 
            <br/>
							</div>
							<br/>
							<div class="styFST" style="font-size:7pt;">
            (and section 1043 conflict-of-interest sales)
          </div>
							<br/>
							<div class="styFST" style="font-size:7pt;padding-top:1mm;">
								<img src="{$ImagePath}/8824_Bullet_Title.gif" alt="bullet image"/>
            Attach to your tax return.
          </div>
						</div>
						<div class="styTYBox" style="width:30mm;height:13mm;">
							<div class="styOMB" style="height:2mm;">
            OMB No. 1545-1190
          </div>
							<div class="styTaxYear" style="height:10mm;">
            20<span class="styTYColor">11</span>
							</div>
							<div class="styOMB" style="height:3mm;border-bottom-width:0px;text-align:left;padding-left:3mm;">Attachment <br/>Sequence No. 
          <span class="styBoldText">109</span>
							</div>
						</div>
					</div>
					<!-- Names and ID's -->
					<div class="styBB" style="width:187mm;">
						<div class="styNameBox" style="width:144mm;height:8mm;font-size:7pt;">
            Name(s) shown on tax return<br/>
            
            <xsl:choose>
  <xsl:when test="$RtnHdrData/ReturnType='1040'">								  
    <br/>
    <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">Name</xsl:with-param>
    </xsl:call-template>
  </xsl:when>
  <xsl:otherwise>
    <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
    </xsl:call-template>
    <br/>
    <xsl:call-template name="PopulateReturnHeaderFiler">
      <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
    </xsl:call-template>
  </xsl:otherwise>
</xsl:choose>
<!--							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
							</xsl:call-template>
							<br/>
							<xsl:call-template name="PopulateReturnHeaderFiler">
								<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
							</xsl:call-template>-->
							<!--<xsl:choose>
					<xsl:when test="/AppData/Parameters/SubmissionType='CIT'">
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
						</xsl:call-template>
						<br/> 
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<br/>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">Name</xsl:with-param>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>-->
						</div>
						<div class="styEINBox" style="width:42mm;height:4mm;padding-left:2mm;font-size:7pt;">
            Identifying number<br/>
							<br/>
							<span style="font-weight:normal;">
							

  <!-- WARNING: Return Type will need to be update with various future form 1040 return type-->
  <xsl:choose>
    <xsl:when test="$RtnHdrData/ReturnType='1040'">
      <xsl:call-template name="PopulateReturnHeaderFiler">
        <xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
      </xsl:call-template>
    </xsl:when>
    <xsl:otherwise>
      <xsl:call-template name="PopulateReturnHeaderFiler">
        <xsl:with-param name="TargetNode">EIN</xsl:with-param>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
	
<!--								<xsl:call-template name="PopulateReturnHeaderFiler">
									<xsl:with-param name="TargetNode">EIN</xsl:with-param>
								</xsl:call-template>-->
								
								
								<!--<xsl:choose>
					<xsl:when test="/AppData/Parameters/SubmissionType='CIT'">
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">EIN</xsl:with-param>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateReturnHeaderFiler">
							<xsl:with-param name="TargetNode">PrimarySSN</xsl:with-param>
						</xsl:call-template>
					</xsl:otherwise>
				</xsl:choose>  -->
							</span>
						</div>
					</div>
					<!-- End of Names and ID's -->
					<!-- Like Kind Exchange information -->
					<!-- Part I-->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part I</div>
						<div class="styPartDesc">
							<span style="width:8px;"/>Information on the Like-Kind Exchange
			</div>
					</div>
					<!-- Note Line-->
					<div class="styBB" style="width:187mm;">
						<div style="width:187mm;">
							<div class="styLNLeftNumBox"/>
							<div class="styGenericDiv">
								<br/>
								<span class="styBoldText">Note:</span>
								<span class="styItalicText"> If the property described on line 1 or line 2 is real or personal property located outside the United States, indicate the country.
				</span>
							</div>
						</div>
						<!-- Line 1-->
						<div style="width:187mm;height:8mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.5mm;padding-top:3mm">1</div>
							<div class="styGenericDiv" style="padding-top:3.5mm;">
				Description of like-kind property given up:
                <span style="width:4px;"/>
							</div>
							<div class="styGenericDiv" style="padding-top:3.5mm;">
								<span class="styFixedUnderline" style="float:none;clear:none;width:119mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8824Data/DescOfLikeKindPropertyGivenUp"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<!-- Line 2-->
						<div style="width:187mm;height:6mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.5mm;padding-top:3mm">2</div>
							<div class="styGenericDiv" style="padding-top:3.5mm;">
			    Description of like-kind property received:
                <span style="width:4px;"/>
							</div>
							<div class="styGenericDiv" style="padding-top:3.5mm;">
								<span class="styFixedUnderline" style="float:none;clear:none;width:119mm;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8824Data/DescOfLikeKindPropertyReceived"/>
									</xsl:call-template>
								</span>
							</div>
						</div>
						<div style="width:187mm;"/>
						<!-- Line 3-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left:2.5mm;">3</div>
							<div class="styLNDesc" style="width:137.9mm;">
								<span style="float:left;">Date like-kind property given up was originally acquired (month, day, year) </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
							</div>
							<div class="styLNRightNumBox" style="height:4.5mm;">3</div>
							<div class="styLNAmountBox" style="height:4.5mm;text-align:left;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form8824Data/DateLikeKindPropertyGivenUpAcq"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 4-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.5mm;">4</div>
							<div class="styLNDesc" style="width:137.9mm;">
								<span style="float:left;">Date you actually transferred your property to other party (month, day, year) </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">.........</div>
							</div>
							<div class="styLNRightNumBox">4</div>
							<div class="styLNAmountBox" style="text-align:left;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form8824Data/DatePropActuallyTransferred"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 5 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.5mm;">5</div>
							<div class="styLNDesc" style="width:137.9mm;">
				Date like-kind property you received was identified by written notice to another party (month, day, year). 
				<span style="float:left;">See instructions for 45-day written identification requirement </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:4mm;">5</div>
							<div class="styLNAmountBox" style="height:8mm;text-align:left;padding-top:4mm;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form8824Data/DateLikeKindPropRcvdIdentified"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 6 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.5mm;">6</div>
							<div class="styLNDesc" style="width:137.9mm;">
				Date you actually received the like-kind property from other party (month, day, year). See instructions
				<!--Dotted Line-->
							</div>
							<div class="styLNRightNumBox">6</div>
							<div class="styLNAmountBox" style="text-align:left;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form8824Data/DatePropertyActuallyReceived"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 7-->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.5mm;padding-top:4mm;">7</div>
							<div class="styLNDesc" style="width:179mm;padding-top:4mm;">
				Was the exchange of the property given up or received made with a related party, either directly or indirectly (such as through an 
				<!--Dotted Line-->
							</div>
						</div>
						<!-- Line 7 line 2 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.5mm;padding-top:0px;"/>
							<div class="styGenericDiv" style="width:154mm;">
								<span style="float:left;">intermediary)? See instructions. If “Yes,” complete Part II. If “No,” go to Part III </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">............</div>
							</div>
							<div class="styGenericDiv" style="width:25mm;float:right;clear:none;height:3.5mm;">
							
        <input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateYesCheckbox">
            <xsl:with-param name="TargetNode" select="$Form8824Data/ExchangeMadeWithRelatedParty" />
            <xsl:with-param name="BackupName">Exchange Made With Related Party Yes Box</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="$Form8824Data/ExchangeMadeWithRelatedParty" />
            <xsl:with-param name="BackupName">Exchange Made With Related Party Yes Box</xsl:with-param>
          </xsl:call-template>
          <span style="width:1mm;"/>
          <b>Yes</b>
        </label>    
							
								<span style="width:5mm;"/>
        <input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateNoCheckbox">
            <xsl:with-param name="TargetNode" select="$Form8824Data/ExchangeMadeWithRelatedParty" />
            <xsl:with-param name="BackupName">Exchange Made With Related Party No Box</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabelNo">
            <xsl:with-param name="TargetNode" select="$Form8824Data/ExchangeMadeWithRelatedParty" />
            <xsl:with-param name="BackupName">Exchange Made With Related Party No Box</xsl:with-param>
          </xsl:call-template>
          <span style="width:1mm;"/>
          <b>No</b>
        </label>   
							</div>
						</div>
					</div>
					<!-- belong to which div?-->
					<!-- End of like kind exchange information -->
					<!-- Start of Exchange information -->
					<!-- Part II -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part II</div>
						<div class="styPartDesc">
							<span style="width:8px;"/>Related Party Exchange Information
			</div>
					</div>
					<!-- Line 8 -->
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox" style="border-bottom-width:0px;padding-left: 2.5mm">8</div>
						<div class="styIRS8824RelatedNameBox" style="width:100mm;height:10mm;">
			  Name of related party<br/>
							<xsl:choose>
								<xsl:when test="$Form8824Data/RelatedPartyBusinessName/BusinessNameLine1">
									<div style="font-family:verdana;font-size:7pt;">
										<xsl:call-template name="PopulateText">
											<xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartyBusinessName/BusinessNameLine1"/>
										</xsl:call-template>
										<xsl:if test="$Form8824Data/RelatedPartyBusinessName/BusinessNameLine2">
											<br/>
											<xsl:call-template name="PopulateText">
												<xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartyBusinessName/BusinessNameLine2"/>
											</xsl:call-template>
										</xsl:if>
									</div>
								</xsl:when>
								<xsl:otherwise>
									<br/>
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartyPersonName"/>
									</xsl:call-template>
								</xsl:otherwise>
							</xsl:choose>
						</div>
						<div class="styIRS8824RelatedNameBox" style="width:30mm;height:10mm;font-size:7pt;font-weight:normal;padding-left:2mm;">
			  Relationship to you<br/>
							<br/>
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8824Data/RelationshipToYou"/>
							</xsl:call-template>
						</div>
						<div class="styIRS8824RelatedEINBox" style="width:48mm;height:10mm;font-size:7pt;font-weight:normal;padding-left:2mm;">
			  Related party's identifying number<br/>
							<br/>
							<xsl:if test="$Form8824Data/RelatedPartyEIN != ' ' ">
								<span>
									<xsl:call-template name="PopulateEIN">
										<xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartyEIN"/>
									</xsl:call-template>
								</span>
							</xsl:if>
							<xsl:if test="$Form8824Data/RelatedPartySSN !=' '">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateSSN">
										<xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartySSN"/>
									</xsl:call-template>
								</span>
							</xsl:if>
							<xsl:if test="$Form8824Data/MissingEINReason !=' '">
								<span style="font-weight:normal;">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="$Form8824Data/MissingEINReason"/>
									</xsl:call-template>
								</span>
							</xsl:if>
						</div>
					</div>
					<div class="styGenericDiv" style="width:187mm;">
						<div class="styLNLeftNumBox" style="width:8mm;"/>
						<div class="styIRS8824RelatedNameBox" style="width:178mm;height:8mm;font-size:7pt;border-right-width:0px;">
			  Address (no., street, and apt., room, or suite no., city or town, state, and ZIP code)<br/>
							<xsl:if test="$Form8824Data/USRelatedPartyAddress != ' ' ">
								<xsl:call-template name="PopulateUSAddressTemplate">
									<xsl:with-param name="TargetNode" select="$Form8824Data/USRelatedPartyAddress"/>
								</xsl:call-template>
							</xsl:if>
							<xsl:if test="$Form8824Data/ForeignRelatedPartyAddress != ' ' ">
								<xsl:call-template name="PopulateForeignAddressTemplate">
									<xsl:with-param name="TargetNode" select="$Form8824Data/ForeignRelatedPartyAddress"/>
								</xsl:call-template>
							</xsl:if>
						</div>
					</div>
					<div style="width:187mm;"/>
					<div class="styBB" style="width:187mm;">
						<!-- Line 9 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.5mm;">9</div>
							<div class="styLNDesc" style="width:179mm;">
				During this tax year (and before the date that is 2 years after the last transfer of property that was part of the
                exchange), did the related party sell or dispose of any part of the like-kind property received from you (or an
                intermediary) in the exchange or transfer property
              </div>
						</div>
						<!-- Line 9 line 2 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.5mm;padding-top:0px;"/>
							<div class="styGenericDiv" style="width:154mm;">
								<span style="float:left;">into the exchange, directly or indirectly (such as through an
                  intermediary), that became your replacement property? </span>
							</div>
							<div class="styGenericDiv" style="width:25mm;float:right;clear:none;height:3.5mm;">
							
        <input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateYesCheckbox">
            <xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartySoldPropReceived" />
            <xsl:with-param name="BackupName">Related Party Sold Prop Received Yes Box</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartySoldPropReceived" />
            <xsl:with-param name="BackupName">Related Party Sold Prop Received Yes Box</xsl:with-param>
          </xsl:call-template>
          <span style="width:1mm;"/>
          <b>Yes</b>
        </label>    

<span style="width:5mm;"/>

        <input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateNoCheckbox">
            <xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartySoldPropReceived" />
            <xsl:with-param name="BackupName">Related Party Sold Prop Received No Box</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabelNo">
            <xsl:with-param name="TargetNode" select="$Form8824Data/RelatedPartySoldPropReceived" />
            <xsl:with-param name="BackupName">Related Party Sold Prop Received No Box</xsl:with-param>
          </xsl:call-template>
          <span style="width:1mm;"/>
          <b>No</b>
        </label>   

							</div>
						</div>
						<div style="width:187mm;"/>
						<!-- Line 10 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">10</div>
							<div class="styLNDesc" style="width:179mm;">
				During this tax year (and before the date that is 2 years after the last transfer of property that was part of the
                  exchange), did you sell or 
              </div>
						</div>
						<!-- Line 10 line 2 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-left: 2.5mm;padding-top:0px;"/>
							<div class="styGenericDiv" style="width:154mm;">
								<span style="float:left;">dispose of any part of the like-kind property you received?</span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
							</div>
							<div class="styGenericDiv" style="width:25mm;float:right;clear:none;height:3.5mm;">
							
							
        <input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateYesCheckbox">
            <xsl:with-param name="TargetNode" select="$Form8824Data/YouSoldPropertyReceived" />
            <xsl:with-param name="BackupName">You Sold Property Received Yes Box</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabelYes">
            <xsl:with-param name="TargetNode" select="$Form8824Data/YouSoldPropertyReceived" />
            <xsl:with-param name="BackupName">You Sold Property Received Yes Box</xsl:with-param>
          </xsl:call-template>
          <span style="width:1mm;"/>
          <b>Yes</b>
        </label>    

<span style="width:5mm;"/>

        <input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateNoCheckbox">
            <xsl:with-param name="TargetNode" select="$Form8824Data/YouSoldPropertyReceived" />
            <xsl:with-param name="BackupName">You Sold Property Received No Box</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabelNo">
            <xsl:with-param name="TargetNode" select="$Form8824Data/YouSoldPropertyReceived" />
            <xsl:with-param name="BackupName">You Sold Property Received No Box</xsl:with-param>
          </xsl:call-template>
          <span style="width:1mm;"/>
          <b>No</b>
        </label>   

							</div>
						</div>
						<!-- Italics text section -->
						<div style="width:187mm;height:8mm;padding-top:2mm;">
							<div class="styLNLeftNumBox" style="padding-top:2mm;"/>
							<div class="styLNDesc" style="width:178mm;padding-top:2mm;">
								<span class="styItalicText">
				  If both lines 9 and 10 are "No" and this is the year of the exchange, go to Part III. If both lines 9 and 10 are "No" and  this is 
				  <span class="styBoldText">not</span> the year of the exchange, stop here. If either line 9 or line 10 is "Yes," complete Part III and report on this year’s tax return the deferred gain or (loss) from line 24 <span class="styBoldText">unless</span> one of the exceptions on line 11 applies. 
				</span>
							</div>
						</div>
						<div style="width:187mm;"/>
						<!-- Line 11 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">11</div>
							<div class="styLNDesc" style="width:175mm;">
			    If one of the exceptions below applies to the disposition, check the applicable box:
			  </div>
						</div>
						<!-- Line 11a-->
						<div style="width:187mm;">
							<div class="styLNLeftLtrBoxDD" style="padding-top:3mm;">a</div>
							<div class="styLNDesc" style="width:165mm;padding-top:3mm">

        <input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateCheckbox">
            <xsl:with-param name="TargetNode" select="$Form8824Data/DisposWasAfterDeathRltdParties" />
            <xsl:with-param name="BackupName">The disposition was after the death of either of the related parties checkbox.</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form8824Data/DisposWasAfterDeathRltdParties" />
            <xsl:with-param name="BackupName">The disposition was after the death of either of the related parties checkbox.</xsl:with-param>
          </xsl:call-template>
          <span style="width:1mm;"/>
          The disposition was after the death of either of the related parties.
        </label>
							
							</div>
						</div>
						<!-- Line 11b-->
						<div style="width:187mm;">
							<div class="styLNLeftLtrBoxDD" style="padding-top:3mm">b</div>
							<div class="styLNDesc" style="width:165mm;padding-top:3mm">
							
        <input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateCheckbox">
            <xsl:with-param name="TargetNode" select="$Form8824Data/DisposWasInvoluntaryConversion" />
            <xsl:with-param name="BackupName">The disposition was an involuntary conversion,
             and the threat of conversion occurred after the exchange checkbox.</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form8824Data/DisposWasInvoluntaryConversion" />
            <xsl:with-param name="BackupName">The disposition was an involuntary conversion,
             and the threat of conversion occurred after the exchange checkbox.</xsl:with-param>
          </xsl:call-template>
          <span style="width:1mm;"/>
          The disposition was an involuntary conversion, and the threat of conversion occurred after the exchange.
        </label>							
							</div>
						</div>
						<!-- Line 11c-->
						<div style="width:187mm;">
							<div class="styLNLeftLtrBoxDD" style="padding-top:3mm">c</div>
							<div class="styLNDesc" style="width:179mm;padding-top:3mm">
       
        <input type="checkbox"  class="styCkbox"  name="Checkbox">
         <xsl:call-template name="PopulateCheckbox">
            <xsl:with-param name="TargetNode" select="$Form8824Data/ExchangeDisposNotTaxAvoidance" />
            <xsl:with-param name="BackupName">Exchange Dispos Not Tax Avoidance checkbox.</xsl:with-param>
          </xsl:call-template>
        </input> 
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="$Form8824Data/ExchangeDisposNotTaxAvoidance" />
            <xsl:with-param name="BackupName">Exchange Dispos Not Tax Avoidance checkbox.</xsl:with-param>
          </xsl:call-template>
          <span style="width:1mm;"/>
                    You can establish to the satisfaction of the IRS that neither the exchange nor the disposition had tax avoidance as one of its
                    principal purposes. If this box is checked, attach an explanation (see instructions).
        </label>								
								<!-- set the push pin image -->
								<xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form8824Data/ExchangeDisposNotTaxAvoidance"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End of Exchange Information -->
					<!--footer -->
					<div style="width:187mm;clear:both;padding-top:1mm;" class="pageend">
						<div style="width:90mm;font-weight:bold;" class="styGenericDiv">For Paperwork Reduction Act Notice, see the instructions.</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv">Cat. No. 12311A</div>
						<div style="float:right;" class="styGenericDiv">Form <span class="styBoldText">8824</span> (2011)</div>
					</div>
					<!-- header -->
					<div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;" class="styBB">
						<div style="width:90mm;" class="styGenericDiv">Form 8824 (2011)</div>
						<div style="width:55mm;text-align:center;" class="styGenericDiv"/>
						<div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">2</span>
						</div>
					</div>
					<!-- Begin Second page Name and ID section -->
					<div class="styBB" style="width:187mm;clear:both;">
						<div class="styNameBox" style="width:144mm;height:9.5mm;font-size:7pt;">
              Name(s) shown on tax return. Do not enter name and social security number if shown on other side.<br/>
							<!--<xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                </xsl:call-template>-->
						</div>
						<div class="styEINBox" style="width:42mm;height:9.5mm;padding-left:2mm;font-size:7pt;">
              Your social security number<br/>
							<br/>
							<!-- <span style="font-weight:normal;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template>
             </span>-->
						</div>
					</div>
					<!-- End Second page Name and ID section -->
					<!-- Start of Part III -->
					<div class="styBB" style="width:187mm;">
						<div class="styPartName">Part III</div>
						<div class="styPartDesc">
							<span style="width:8px;"/>
				Realized Gain or (Loss), Recognized Gain, and Basis of Like-Kind Property Received
			</div>
					</div>
					<!-- Caution line -->
					<div style="width:187mm;height:8mm;padding-top:0mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:178mm;">
							<span class="styBoldText">Caution:</span>
							<span class="styItalicText">
				If you transferred
				<span class="styBoldText">and</span> received
				<span class="styBoldText">(a)</span> more than one group of like-kind properties
				or <span class="styBoldText">(b)</span> cash or other (not like-kind) property, see </span>
							<span class="styBoldText">Reporting of multi-asset exchanges</span>
							<span class="styItalicText"> in the instructions.</span>
						</div>
					</div>
					<!-- Note line -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox"/>
						<div class="styLNDesc" style="width:178mm;">
							<span class="styBoldText">Note:</span>
							<span class="styItalicText">
				Complete lines 12 through 14
				<span class="styBoldText">only</span>
				if you gave up property that was not like-kind.
				Otherwise, go to line 15.
			  </span>
						</div>
					</div>
					<!-- Line 12 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">12</div>
						<div class="styLNDesc" style="width:98mm;height:4.5mm;">
							<span style="float:left;">Fair market value (FMV) of other property given up </span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">12</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8824Data/FMVOfOtherPropertyGivenUp"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; border-bottom-width:0px"/>
					</div>
					<!-- Line 13 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="height:4.5mm;">13</div>
						<div class="styLNDesc" style="width:98mm;height:4.5mm;">
							<span style="float:left;">Adjusted basis of other property given up </span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
						</div>
						<div class="styLNRightNumBox" style="height:4.5mm;">13</div>
						<div class="styLNAmountBox" style="height:4.5mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8824Data/AdjBasisOfOtherPropertyGivenUp"/>
							</xsl:call-template>
						</div>
						<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;"/>
						<div class="styLNAmountBox" style="height:4.5mm; border-bottom-width:0px"/>
					</div>
					<div class="styBB" style="width:187mm;">
						<!-- Line 14 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">14</div>
							<div class="styLNDesc" style="width:137.9mm;">
				Gain or (loss) recognized on other property given up. Subtract line 13 from line 12. Report the
				gain or <span style="float:left;">(loss) in the same manner as if the exchange had been a sale </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
							</div>
							<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">14</div>
							<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8824Data/GainLossOnOtherPropertyGivenUp"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 14 Caution -->
						<div style="width:187mm;">
							<div class="styGenericDiv" style="width:145.9mm;padding-left:8mm;padding-bottom:0mm;height:7mm;">
								<b>Caution: </b>
								<i>If the property given up was used previously or partly as a home, see </i>
								<b>Property used
				as home </b>
								<i>in the instructions.</i>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:7mm;"/>
							<div class="styLNAmountBoxNBB" style="height:7mm;"/>
						</div>
						<!-- Line 15 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">15</div>
							<div class="styLNDesc" style="width:137.9mm;">
				Cash received, FMV of other property received, plus net liabilities assumed by other party, reduced
				(but <span style="float:left;">not below zero) by any exchange expenses you incurred (see instructions) </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">..........</div>
							</div>
							<div class="styLNRightNumBox" style="height:8mm;padding-top:3.5mm;">15</div>
							<div class="styLNAmountBox" style="height:8mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8824Data/CashFMVAndNetLiabRedByExpenses"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 16 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">16</div>
							<div class="styLNDesc" style="width:137.9mm;">
								<span style="float:left;">FMV of like-kind property you received </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">....................</div>
							</div>
							<div class="styLNRightNumBox">16</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8824Data/FMVOfLikeKindPropertyReceived"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 17 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">17</div>
							<div class="styLNDesc" style="width:137.9mm;">
								<span style="float:left;">Add lines 15 and 16 </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">..........................</div>
							</div>
							<div class="styLNRightNumBox">17</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8824Data/AmountRealized"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 18 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">18</div>
							<div class="styLNDesc" style="width:137.9mm;">
				Adjusted basis of like-kind property you gave up, net amounts paid to other party, plus any
				exchange <span style="float:left">expenses <span class="styBoldText">not</span> used on line 15 (see instructions) </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">...................</div>
							</div>
							<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">18</div>
							<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8824Data/AdjBasisOfLikeKindPropGivenUp"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 19 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">19</div>
							<div class="styLNDesc" style="width:137.9mm;">
								<span style="float:left;">
									<span class="styBoldText">Realized gain or (loss).</span> Subtract line 18 from line 17 </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
							</div>
							<div class="styLNRightNumBox">19</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8824Data/RealizedGainOrLoss"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 20 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">20</div>
							<div class="styLNDesc" style="width:137.9mm;">
								<span style="float:left;">Enter the smaller of line 15 or line 19, but not less than zero </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">...............</div>
							</div>
							<div class="styLNRightNumBox">20</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8824Data/SmallerGainOrLoss"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 21 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">21</div>
							<div class="styLNDesc" style="width:137.9mm;">
								<span style="float:left;">Ordinary income under recapture rules. Enter here and on Form 4797, line 16 (see instructions) </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
							</div>
							<div class="styLNRightNumBox">21</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8824Data/OrdinaryIncmUndRecaptureRules"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 22 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">22</div>
							<div class="styLNDesc" style="width:137.9mm;">
				Subtract line 21 from line 20. If zero or less, enter -0-. If more than zero, enter here and on Schedule D
				<span style="float:left;">or Form 4797, unless the installment method applies (see instructions) </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">...........</div>
							</div>
							<div class="styLNRightNumBox" style="height:7.5mm;padding-top:3.5mm;">22</div>
							<div class="styLNAmountBox" style="height:7.5mm;padding-top:3.5mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8824Data/SmallerGainLossLessOrdnryIncm"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 23 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">23</div>
							<div class="styLNDesc" style="width:137.9mm;">
								<span style="float:left;">
									<span class="styBoldText">Recognized gain.</span> Add lines 21 and 22 </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">....................</div>
							</div>
							<div class="styLNRightNumBox">23</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8824Data/RecognizedGain"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 24 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">24</div>
							<div class="styLNDesc" style="width:137.9mm;">
								<span style="float:left;">Deferred gain or (loss). Subtract line 23 from line 19. If a related party exchange, see instructions </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
							</div>
							<div class="styLNRightNumBox">24</div>
							<div class="styLNAmountBox">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8824Data/DeferredGainOrLoss"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 25 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">25</div>
							<div class="styLNDesc" style="width:137.9mm;">
								<span style="float:left;">
									<span class="styBoldText">Basis of like-kind property received.</span>
				Subtract line 15 from the sum of lines 18 and 23 </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
							</div>
							<div class="styLNRightNumBoxNBB">25</div>
							<div class="styLNAmountBoxNBB">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8824Data/BasisOfLikeKindPropertyRcvd"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- End of Part III -->
					<!-- Begin Section IV -->
					<div class="styBB" style="width:187mm;clear:both;float:none;">
						<div class="styPartName">Part IV</div>
						<div class="styPartDesc">
							<span style="width:8px;"/>
				Deferral of Gain From Section 1043 Conflict-of-Interest Sales    
			</div>
					</div>
					<!-- Section IV Note Line -->
					<div style="width:187mm;height:8mm;padding-top:1mm;clear:both;float:none;">
						<div class="styLNLeftNumBox" style="height:4mm;"/>
						<div class="styLNDesc" style="width:178mm;">
							<span class="styItalicText">
								<span class="styBoldText">Note:</span> This part is to be used  
				<span class="styBoldText">only</span> by officers or employees of the executive branch of the Federal Government or judicial
				  officers of the Federal Government (including certain spouses, minor or dependent children, and trustees as described in section 1043)
				  for reporting nonrecognition of gain under section 1043 on the sale of property to comply with the conflict-of-interest 
				  requirements. This part can be used        
				<span class="styBoldText">only</span> if the cost of the replacement property is more than the basis of the divested property.</span>
						</div>
					</div>
					<!-- Line 26 -->
					<div style="width:187mm;">
						<div class="styLNLeftNumBox" style="padding-top:3mm;">26</div>
						<div class="styLNDesc" style="width:118mm;padding-top:3mm;">
			  Enter the number from the upper right corner of your certificate of divestiture. (<span class="styBoldText">Do not</span>
							<span style="float:left;"> attach a copy of your certificate. Keep the certificate with your records.) </span>
							<!--Dotted Line-->
							<div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
						</div>
						<br/>
						<span class="styFixedUnderline" style="float:none;clear:none;width:60mm;">
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainCertOfDvsttrNum"/>
							</xsl:call-template>
						</span>
					</div>
					<!-- Line 27 -->
					<div style="width:187mm;height:6mm;padding-top:3mm;">
						<div class="styLNLeftNumBox">27</div>
						<div class="styGenericDiv" style="padding-top:.5mm;">
			  Description of divested property
			  <img src="{$ImagePath}/8824_Bullet_Line.gif" alt="bullet image"/>
							<span style="width:4px;"/>
						</div>
						<div class="styGenericDiv">
							<span class="styFixedUnderline" style="float:none;clear:none;width:131mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainDvstdProperty"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<!-- Line 28 -->
					<div style="width:187mm;height:6mm;padding-top:3mm;">
						<div class="styLNLeftNumBox">28</div>
						<div class="styGenericDiv" style="padding-top:.5mm;">
			  Description of replacement property
			  <img src="{$ImagePath}/8824_Bullet_Line.gif" alt="bullet image"/>
							<span style="width:4px;"/>
						</div>
						<div class="styGenericDiv">
							<span class="styFixedUnderline" style="float:none;clear:none;width:127mm;">
								<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainDescOfRplcProp"/>
								</xsl:call-template>
							</span>
						</div>
					</div>
					<div class="styBB" style="width:187mm;clear:both;padding-top:3mm;">
						<!-- Line 29 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox">29</div>
							<div class="styLNDesc" style="width:137.9mm;">
								<span style="float:left;">Date divested property was sold (month, day, year) </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">..................</div>
							</div>
							<div class="styLNRightNumBox">29</div>
							<div class="styLNAmountBox" style="text-align:left;">
								<xsl:call-template name="PopulateMonthDayYear">
									<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainDvstdPropSoldDt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 30 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-top:3mm;height:7mm;">30</div>
							<div class="styLNDesc" style="width:98mm;padding-top:3mm;height:7mm;">
								<span style="float:left;">Sales price of divested property (see instructions)  </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">........</div>
							</div>
							<div class="styLNRightNumBox" style="padding-top:3mm;height:7mm;">30</div>
							<div class="styLNAmountBox" style="padding-top:3mm;height:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainDvstdPropSaleAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;padding-top:3mm;"/>
							<div class="styLNAmountBoxNBB" style="height:7mm;border-bottom-width:0px;padding-top:3mm;"/>
						</div>
						<!-- Line 31 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-top:3mm;height:7mm;">31</div>
							<div class="styLNDesc" style="width:98mm;padding-top:3mm;height:7mm;">
								<span style="float:left;">Basis of divested property  </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">................</div>
							</div>
							<div class="styLNRightNumBox" style="padding-top:3mm;height:7mm;">31</div>
							<div class="styLNAmountBox" style="padding-top:3mm;height:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainDvstdPropBssAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;padding-top:3mm;height:7mm;"/>
							<div class="styLNAmountBoxNBB" style="padding-top:3mm;height:7mm;"/>
						</div>
						<!-- Line 32 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-top:3mm">32</div>
							<div class="styLNDesc" style="width:137.9mm;padding-top:3mm;">
								<span style="float:left;">
									<span class="styBoldText">Realized gain.</span> Subtract line 31 from line 30  </span>
								<!--Dotted Line-->
								<div class="styDotLn" style="float:right;padding-right:1mm;">....................</div>
							</div>
							<div class="styLNRightNumBox" style="padding-top:3mm;">32</div>
							<div class="styLNAmountBox" style="padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainRealizedGainAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 33 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-top:3mm;height:7mm;">33</div>
							<div class="styLNDesc" style="width:98mm;padding-top:3mm;height:7mm;">
				Cost of replacement property purchased within 60 days after date of sale
			    <!--Dotted Line
			    <div class="styDotLn" style="float:right;padding-right:1mm;"></div>-->
							</div>
							<div class="styLNRightNumBox" style="padding-top:3mm;">33</div>
							<div class="styLNAmountBox" style="padding-top:3mm;height:7mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainRplcCostAftrAmt"/>
								</xsl:call-template>
							</div>
							<div class="styLNRightNumBoxNBB" style="background-color:lightgrey;padding-top:3mm;height:7mm;"/>
							<div class="styLNAmountBox" style="border-bottom-width:0px;padding-top:3mm;height:7mm;"/>
						</div>
						<!-- Line 34 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-top:3mm;">34</div>
							<div class="styLNDesc" style="width:137.9mm;padding-top:3mm;">
								<span style="float:left;">Subtract line 33 from line 30. If zero or less, enter -0- </span>
								<!--Dotted Line -->
								<div class="styDotLn" style="float:right;padding-right:1mm;">.................</div>
							</div>
							<div class="styLNRightNumBox" style="padding-top:3mm;">34</div>
							<div class="styLNAmountBox" style="padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainRcgnzGainAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 35 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-top:3mm;">35</div>
							<div class="styLNDesc" style="width:137.9mm;padding-top:3mm;">
								<span style="float:left;">Ordinary income under recapture rules. Enter here and on Form 4797, line 10 (see instructions)  </span>
								<!--Dotted Line -->
								<div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
							</div>
							<div class="styLNRightNumBox" style="padding-top:3mm;">35</div>
							<div class="styLNAmountBox" style="padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8824Data/GainOrLoss"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 36 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="height:10mm;padding-top:3mm;">36</div>
							<div class="styLNDesc" style="width:137.9mm;height:10mm;padding-top:3mm;">
				Subtract line 35 from line 34. If zero or less, enter -0-. If more than zero, enter here and on Schedule D 
				<span style="float:left;">or Form 4797 (see instructions) </span>
								<!--Dotted Line -->
								<div class="styDotLn" style="float:right;padding-right:1mm;">........................</div>
							</div>
							<div class="styLNRightNumBox" style="height:10mm;padding-top:6mm;">36</div>
							<div class="styLNAmountBox" style="height:10mm;padding-top:6mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainRcgnzLessLossAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 37 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-top:3mm;">37</div>
							<div class="styLNDesc" style="width:137.9mm;padding-top:3mm;">
								<span style="float:left;">
									<span class="styBoldText">Deferred gain.</span> Subtract the sum of lines 35 and 36 from line 32 </span>
								<!--Dotted Line -->
								<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
							</div>
							<div class="styLNRightNumBox" style="padding-top:3mm;">37</div>
							<div class="styLNAmountBox" style="padding-top:3mm;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainAmt"/>
								</xsl:call-template>
							</div>
						</div>
						<!-- Line 38 -->
						<div style="width:187mm;">
							<div class="styLNLeftNumBox" style="padding-top:3mm;">38</div>
							<div class="styLNDesc" style="width:137.9mm;padding-top:3mm;">
								<span style="float:left;">
									<span class="styBoldText">Basis of replacement property.</span>
				  Subtract line 37 from line 33 </span>
								<!--Dotted Line -->
								<div class="styDotLn" style="float:right;padding-right:1mm;">..............</div>
							</div>
							<div class="styLNRightNumBoxNBB" style="padding-top:3mm;">38</div>
							<div class="styLNAmountBox" style="padding-top:3mm;border-bottom-width:0px;">
								<xsl:call-template name="PopulateAmount">
									<xsl:with-param name="TargetNode" select="$Form8824Data/DeferralOfGainBssOfRplcPropAmt"/>
								</xsl:call-template>
							</div>
						</div>
					</div>
					<!-- Footer -->
					<div style="width:187mm;padding-top:1mm;">
						<div style="float:left;"/>
						<div style="float:right;">
							<span style="width:80px;"/>  
			  Form <span class="styBoldText">8824</span> (2011)
			</div>
					</div>
					<!-- Introducing page end -->
					<p class="pageend"/>
					<!-- Begininning of write-in data -->
					<div class="styLeftOverTitleLine" id="LeftoverData">
						<div class="styLeftOverTitle">
				Additional Data        
			</div>
						<div class="styLeftOverButtonContainer">
							<input class="styLeftoverTableBtn" tabindex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
						</div>
					</div>
					<table class="styLeftOverTbl">
						<xsl:call-template name="PopulateCommonLeftover">
							<xsl:with-param name="TargetNode" select="$Form8824Data"/>
							<xsl:with-param name="DescWidth" select="100"/>
						</xsl:call-template>
					</table>
				</form>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
