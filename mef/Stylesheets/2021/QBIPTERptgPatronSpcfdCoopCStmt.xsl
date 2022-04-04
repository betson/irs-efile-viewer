<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/QBIPTERptgPatronSpcfdCoopCStmt"/>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>

  <!-- Template to display table items -->
  
  <xsl:template name="ShowDependencyData">
  
    <!-- Itemized Other Income Schedule Data -->
    <table id="DependencyDataTbl" class="styDepTbl">
      <!--<thead class="styTableThead">
      <tr class="styDepTblHdr">         
         <th class="styDepTblCell" scope="col">Trade Or Business Aggregation Description</th>         
         <th class="styDepTblCell" scope="col">Prior Year Change Description</th> 
      </tr>
      </thead>-->
        <tfoot/>
        
       <tbody>
      <xsl:for-each select="$DependencyData/QBIPTERpgtPatronSpcfdCoopGrp">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
                              
       <td class="styDepTblCell" style="text-align:left">      		
          <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Trade Or Business Description:</div>
          <div style="float:left;clear:none;width:118mm;">
           <br/>
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="./TradeOrBusinessDesc"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
		<xsl:if test="./PubliclyTradedPartnershipInd">
          <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Publicly Traded Partnership Indicator:</div>
          <div style="float:left;clear:none;width:118mm;">
 			<input type="checkbox" class="styckbox" name="checkbox">
				<xsl:call-template name="PopulateCheckbox">
				  <xsl:with-param name="TargetNode" select="./PubliclyTradedPartnershipInd"/>
				</xsl:call-template>
			</input> 
          </div>
        </div>
		</xsl:if>
		<xsl:if test="./AggregatedInd">
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Aggregated Indicator:</div>
          <div style="float:left;clear:none;width:118mm;">
  			<input type="checkbox" class="styckbox" name="checkbox">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="./AggregatedInd"/>
				</xsl:call-template>
			</input>
          </div>
        </div>
		</xsl:if>
		<xsl:if test="./SSTBInd">		
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">SSTB Indicator:</div>
          <div style="float:left;clear:none;width:118mm;">
  			<input type="checkbox" class="styckbox" name="checkbox">
				<xsl:call-template name="PopulateCheckbox">
					<xsl:with-param name="TargetNode" select="./SSTBInd"/>
				</xsl:call-template>
			</input>
          </div>
        </div>
		</xsl:if>
        <br/>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Ordinary Business Income Loss Amount:</div>
          <div style="float:left;clear:none;width:60mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="./OrdinaryBusinessIncomeLossAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Rental Income Loss Amount:</div>
          <div style="float:left;clear:none;width:60mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="./RentalIncomeLossAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
         <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Royalty Income Loss Amount:</div>
          <div style="float:left;clear:none;width:60mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="./RoyaltyIncomeLossAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>
         <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Section 1231 Gain Loss Amount:</div>
          <div style="float:left;clear:none;width:60mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="./Section1231GainLossAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/> 
         <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Other Income Loss Amount:</div>
          <div style="float:left;clear:none;width:60mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="./OtherIncomeLossAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/> 
         <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Section 179 Deduction Amount:</div>
          <div style="float:left;clear:none;width:60mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="./Section179DeductionAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/> 
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Charitable Contribution Amount:</div>
          <div style="float:left;clear:none;width:60mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="./CharitableContributionAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>  
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Other Deductions Amount:</div>
          <div style="float:left;clear:none;width:60mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="./OtherDeductionsAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>  
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">W2 Wages Amount:</div>
          <div style="float:left;clear:none;width:60mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="./W2WagesAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>  
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">W2 Wages Allcbl Qlfy Cooperative Payment Amount:</div>
          <div style="float:left;clear:none;width:60mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="./W2WageAllcblQlfyCoopPymtAmt"/>
            </xsl:call-template>
          </div>
        </div>
        <br/>  
	</td>
      </tr>
      </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  <!-- Main template -->
  <xsl:template match="/">

    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
         <title><xsl:value-of select="$depDocTitle"/></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache"/>
         <meta http-equiv="Cache-Control" content="no-cache"/>
         <meta http-equiv="Expires" content="0"/>
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private"/>
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>         
         <meta name="Description" content="{$depDocTitle}"/>
         <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
        <xsl:call-template name="InitJS"/>
        
        <style type="text/css">
                  </style>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"/>    
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
    </head>    
      <body class="styBodyClass">
  
        <xsl:call-template name="DocumentHeaderDependency"/>  
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="width:160mm;">
            <span><xsl:value-of select="$depDocTitle"/></span>
          </span>
        </div>
 
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>

		<xsl:if test="$DependencyData/PatrSpcfdCoopPrtshpNameGrp">
		<div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Pass Through Entity Name:</div>
          <div style="float:left;clear:none;width:118mm;">
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopPrtshpNameGrp/PassThroughEntityName/BusinessNameLine1Txt"/>
				</xsl:call-template><br/>
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopPrtshpNameGrp/PassThroughEntityName/BusinessNameLine2Txt"/>
				</xsl:call-template>
		  </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="align:right;float:left;clear:none;">Pass Through Entity EIN:</div>
          <div style="float:left;clear:none;width:118mm;">
			<xsl:choose>
				<xsl:when test="$DependencyData/PatrSpcfdCoopPrtshpNameGrp/PassThroughEntityEIN">
					<xsl:call-template name="PopulateEIN">
						<xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopPrtshpNameGrp/PassThroughEntityEIN"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopPrtshpNameGrp/MissingEINReasonCd"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose> 
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Partner Name:</div>
          <div style="float:left;clear:none;width:118mm;">
			<xsl:if test="$DependencyData/PatrSpcfdCoopPrtshpNameGrp/PartnerPersonNm">
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopPrtshpNameGrp/PartnerPersonNm"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:if test="$DependencyData/PatrSpcfdCoopPrtshpNameGrp/PartnerBusinessName">
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopPrtshpNameGrp/PartnerBusinessName/BusinessNameLine1Txt"/>
				</xsl:call-template><br/>
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopPrtshpNameGrp/PartnerBusinessName/BusinessNameLine2Txt"/>
				</xsl:call-template>
			</xsl:if>
		  </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Partner EIN:</div>
          <div style="float:left;clear:none;width:118mm;">
					<xsl:if test="$DependencyData/PatrSpcfdCoopPrtshpNameGrp/MissingSSNEINReasonCd">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopPrtshpNameGrp/MissingSSNEINReasonCd"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$DependencyData/PatrSpcfdCoopPrtshpNameGrp/PartnerEIN">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopPrtshpNameGrp/PartnerEIN"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$DependencyData/PatrSpcfdCoopPrtshpNameGrp/PartnerSSN">
						<xsl:call-template name="PopulateSSN">
							<xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopSCorpNameGrp/PartnerSSN"/>
						</xsl:call-template>
					</xsl:if>				
		  </div>
        </div>        
		</xsl:if>
		<xsl:if test="$DependencyData/PatrSpcfdCoopSCorpNameGrp">
		<div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Cooperative Name:</div>
          <div style="float:left;clear:none;width:118mm;">
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopSCorpNameGrp/CooperativeName/BusinessNameLine1Txt"/>
				</xsl:call-template><br/>
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopSCorpNameGrp/CooperativeName/BusinessNameLine2Txt"/>
				</xsl:call-template>
		  </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="align:right;float:left;clear:none;">Cooperative EIN:</div>
          <div style="float:left;clear:none;width:118mm;">
			<xsl:choose>
				<xsl:when test="$DependencyData/PatrSpcfdCoopSCorpNameGrp/CooperativeEIN">
					<xsl:call-template name="PopulateEIN">
						<xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopSCorpNameGrp/CooperativeEIN"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopSCorpNameGrp/MissingEINReasonCd"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose> 
          </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Pass Through Entity Name:</div>
          <div style="float:left;clear:none;width:118mm;">
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopSCorpNameGrp/PassThroughEntityName/BusinessNameLine1Txt"/>
				</xsl:call-template><br/>
				<xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopSCorpNameGrp/PassThroughEntityName/BusinessNameLine2Txt"/>
				</xsl:call-template>
		  </div>
        </div>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Pass Through Entity EIN:</div>
          <div style="float:left;clear:none;width:118mm;">
					<xsl:if test="$DependencyData/PatrSpcfdCoopSCorpNameGrp/MissingSSNEINReasonCd">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopSCorpNameGrp/MissingSSNEINReasonCd"/>
						</xsl:call-template>
					</xsl:if>
					<xsl:if test="$DependencyData/PatrSpcfdCoopSCorpNameGrp/PassThroughEntityEIN">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopSCorpNameGrp/PassThroughEntityEIN"/>
						</xsl:call-template>
					</xsl:if>
		  </div>
        </div>        
			<div class="styTopSectionLine" style="width:187mm;">
		    <div class="styTopSectionLineLbl" style="float:left;clear:none;">Shareholder Name:</div>
			  <div style="float:left;clear:none;width:118mm;">
				<xsl:if test="$DependencyData/PatrSpcfdCoopSCorpNameGrp/ShareholderBusinessName">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopSCorpNameGrp/ShareholderBusinessName/BusinessNameLine1Txt"/>
					</xsl:call-template><br/>
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopSCorpNameGrp/ShareholderBusinessName/BusinessNameLine2Txt"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="$DependencyData/PatrSpcfdCoopSCorpNameGrp/ShareholderPersonNm">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopSCorpNameGrp/ShareholderPersonNm"/>
					</xsl:call-template>
				</xsl:if>
			  <div class="styTopSectionLineLbl" style="float:left;clear:none;">Shareholder Identification Number:</div>
				<xsl:if test="$DependencyData/PatrSpcfdCoopSCorpNameGrp/MissingSSNEINReasonCd">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopSCorpNameGrp/MissingSSNEINReasonCd"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="$DependencyData/PatrSpcfdCoopSCorpNameGrp/ShareholderEIN">
					<xsl:call-template name="PopulateEIN">
						<xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopSCorpNameGrp/ShareholderEIN"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="$DependencyData/PatrSpcfdCoopSCorpNameGrp/ShareholderSSN">
					<xsl:call-template name="PopulateSSN">
						<xsl:with-param name="TargetNode" select="$DependencyData/PatrSpcfdCoopSCorpNameGrp/ShareholderSSN"/>
					</xsl:call-template>
				</xsl:if>				
			</div>
		</div>
		</xsl:if>
        <xsl:call-template name="ShowDependencyData"/>
		<br/>
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:none;">Section 199Ag Deduction Amount:</div>
          <div style="float:left;clear:none;width:118mm;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/Section199AgDeductionAmt"/>
            </xsl:call-template>
          </div>         
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>