<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:include href="CommonPathRef.xsl"/>
	<xsl:include href="AddHeader.xsl"/>
	<xsl:include href="AddOnTable.xsl"/>
	<xsl:include href="PopulateTemplate.xsl"/>
	<xsl:output method="html" indent="yes"/>
	<xsl:strip-space elements="*"/>
	<xsl:param name="DependencyData" select="$RtnDoc/ControlledForeignPrtshpStmt"/>
	<xsl:param name="depDocTitle">
		<xsl:call-template name="PopulateDisplayName">
			<xsl:with-param name="TargetNode" select="$DependencyData"/>
		</xsl:call-template>
	</xsl:param>
	<xsl:template name="ControlledForeignPrtshpStmtTemp">
		<xsl:for-each select="$DependencyData/ControlledForeignPartnership">
			<table id="ControlledForeignPrtshpStmtTbl" class="styDepTbl">
				
	<!-- Item No. -->
	<tr class="styDepTblRow1">
      		<th class="styDepTblCell" scope="row"  style="width:40%;text-align:right;">Item No.</th>
      		<td class="styDepTblCell" style="text-align:center;" ><xsl:value-of select="position()" /></td>
    	</tr>

	<!-- Statement that the person qualified ... -->
	<tr class="styDepTblRow2">
		<th class="styDepTblCell" scope="row" style="width:40%;text-align:right;">
            		Statement that the person qualified as a category 1 filer, but is not submitting Form 8865.
          	</th>
		<td class="styDepTblCell" style="text-align:left;">
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="CAT1FilerStatement"/>
			</xsl:call-template>
		</td>
	</tr>
				<!-- Corporation Name -->
				<tr class="styDepTblRow1">
					<th class="styDepTblCell" scope="row" style="text-align:right;">
            Corporation Name            
          </th>
					<td class="styDepTblCell" style="text-align:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine1"/>
						</xsl:call-template>
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="CorporationName/BusinessNameLine2"/>
						</xsl:call-template>
					</td>
				</tr>
				<!-- Corporation EIN -->
				<tr class="styDepTblRow2">
					<th class="styDepTblCell" scope="row" style="text-align:right;">
            Corporation EIN or SSN
          </th>
					<td class="styDepTblCell" style="text-align:left;">
					<div>
			              <xsl:choose> 
            		              <xsl:when test="CorporationEIN">		
                                       <xsl:call-template name="PopulateEIN">
							     <xsl:with-param name="TargetNode" select="CorporationEIN"/>
						    </xsl:call-template>
			              </xsl:when> 
          	                    <xsl:when test="CorporationSSN">                 
	                              <xsl:call-template name="PopulateSSN">
	                              <xsl:with-param name="TargetNode" select="CorporationSSN" />
	                              </xsl:call-template>
                                 <br/>
                            </xsl:when> 
                            <xsl:otherwise>
                                <xsl:call-template name="PopulateText">
                                    <xsl:with-param name="TargetNode" select="MissingEINReason" />
                                </xsl:call-template>
                            </xsl:otherwise>
                         </xsl:choose>                    
                      </div>
			</td>
		</tr>
		
				<!-- Foreign Partnership Business Name -->
				<tr class="styDepTblRow1">
					<th class="styDepTblCell" scope="row" style="text-align:right;">
            Foreign Partnership Name
          </th>
					<td class="styDepTblCell" style="text-align:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignPartnershipName/BusinessNameLine1"/>
						</xsl:call-template>
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignPartnershipName/BusinessNameLine2"/>
						</xsl:call-template>
					</td>
				</tr>
				<!-- Foreign Partnership Address -->
				<tr class="styDepTblRow2">
					<th class="styDepTblCell" scope="row" style="text-align:right;">
            Foreign Partnership Address
          </th>
					<td class="styDepTblCell" style="text-align:left;">
						<xsl:call-template name="PopulateForeignAddressTemplate">
              					<xsl:with-param name="TargetNode" select="ForeignPartnershipAddress"/>
            					</xsl:call-template>											
            				</td>
				</tr>
					<!-- Foreign Partnership EIN -->
				<tr class="styDepTblRow1">
					<th class="styDepTblCell" scope="row" style="text-align:right;">
            Foreign Partnership EIN
          </th>
					<td class="styDepTblCell" style="text-align:left;">
					<xsl:choose>
	  			       <xsl:when test="ForeignPartnershipEIN">	
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="ForeignPartnershipEIN"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="FrgnPrtshpMissingSSNEINReason"/>
						</xsl:call-template>
					</xsl:otherwise>
      					</xsl:choose>
					</td>
				</tr>
				<!-- Filing Requirement -->
				<tr class="styDepTblRow2">
					<th class="styDepTblCell" scope="row" style="text-align:right;">
            The filing requirement has been or will be satisfied
          </th>
					<td class="styDepTblCell" style="text-align:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="FilingRequirementSatisfied"/>
						</xsl:call-template>
					</td>
				</tr>
				<!-- Name of person filing 8865 -->
				<tr class="styDepTblRow1">
					<th class="styDepTblCell" scope="row" style="text-align:right;">
            Name Of Person Filing Form 8865
          </th>
					<td class="styDepTblCell" style="text-align:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="NameOfPersonFiling8865/BusinessNameLine1"/>
						</xsl:call-template>
						<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="NameOfPersonFiling8865/BusinessNameLine2"/>
						</xsl:call-template>
					</td>
				</tr>
				<!-- Address of person filing 8865 -->
				<tr class="styDepTblRow2">
					<th class="styDepTblCell" scope="row" style="text-align:right;">
            Address Of Person Filing Form 8865
          </th>
				<td class="styDepTblCell" style="text-align:left;">
				      <xsl:if test="USAddressOfPersonFiling8865 != ' ' ">
						<xsl:call-template name="PopulateUSAddressTemplate">
              					<xsl:with-param name="TargetNode" select="USAddressOfPersonFiling8865"/>
            					</xsl:call-template>	
            				</xsl:if>	
				      <xsl:if test="FrgnAddressOfPersonFiling8865 != ' ' ">
						<xsl:call-template name="PopulateForeignAddressTemplate">
              					<xsl:with-param name="TargetNode" select="FrgnAddressOfPersonFiling8865"/>
            					</xsl:call-template>	
         				</xsl:if>	
            				
					</td>
				</tr>
				<!-- IRS Filing Center -->
				<tr class="styDepTblRow2">
					<th class="styDepTblCell" scope="row" style="text-align:right;">
            IRS center where Form 8865 must be filed
          </th>
					<td class="styDepTblCell" style="text-align:left;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="IRSCenWhereForm8865MustBeFiled"/>
						</xsl:call-template>
					</td>
				</tr>
			</table>
			<br/>
		</xsl:for-each>
	</xsl:template>
	<!-- Main template -->
	<xsl:template match="/">
		<html>
			<head>
				<title>
					<xsl:value-of select="$depDocTitle"/>
				</title>
				<!-- No Browser Caching -->
				<meta http-equiv="Pragma" content="no-cache"/>
				<meta http-equiv="Cache-Control" content="no-cache"/>
				<meta http-equiv="Expires" content="0"/>
				<!-- No Proxy Caching -->
				<meta http-equiv="Cache-Control" content="private"/>
				<!-- Define Character Set -->
				<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
				<meta name="Author" content="Venkata Boggavarapu:: boggav@us.ibm.com"/>
				<meta name="Description" content="{$depDocTitle}"/>
				<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
				<xsl:call-template name="InitJS"/>
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
					<span class="styDepTitle">
						<span style="width:73mm;">
							<xsl:value-of select="$depDocTitle"/>
						</span>
					</span>
				</div>
				<xsl:call-template name="PopulateDepCommonLeftover">
					<xsl:with-param name="TargetNode" select="$DependencyData"/>
				</xsl:call-template>
				<xsl:call-template name="ControlledForeignPrtshpStmtTemp"/>
				<br/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
