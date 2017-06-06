<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>

  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />

  <xsl:param name="DependencyData" select="$RtnDoc/FECRecord" />
  
  <xsl:param name="depDocTitle">
  <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
  
 
  <!-- Main template -->
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
         <title><xsl:value-of select="$depDocTitle" /></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache" />
         <meta http-equiv="Cache-Control" content="no-cache" />
         <meta http-equiv="Expires" content="0" />
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private" />
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
         <meta name="Description" content= "{$depDocTitle}" />
         
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
        <style type="text/css">
  <xsl:if test="not($Print) or $Print=''">
    <xsl:call-template name="AddOnStyle"></xsl:call-template>    
  </xsl:if>
</style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>
    
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>    
          <div class="styDepTitleLine">
            <span class="styDepTitle">
              <span style="width:75mm;">
                <xsl:value-of select="$depDocTitle" />
              </span>
            </span>
          </div>
          <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>
			<!-- Employee TIN -->
           <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Employee TIN: </div>
          </div>
          <div class="styExplanationLine" style="float:left">          
             <xsl:call-template name="PopulateSSN">
              <xsl:with-param name="TargetNode" select="$DependencyData/EmployeeTIN" />
            </xsl:call-template>
           </div>                  
        </div>        
 			<!-- Employee Name Control -->
          <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Employee Name Control: </div>
          </div>
          <div class="styExplanationLine" style="float:left">          
              <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/EmployeeNameControl" />
            </xsl:call-template>
           </div>                  
        </div>      
 			<!-- Employee Name -->
           <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Employee Name: </div>
          </div>
          <div class="styExplanationLine" style="float:left">          
              <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/EmployeeName" />
            </xsl:call-template>
          </div>                  
        </div> 
			<!-- Employee In Care Of Name -->
           <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Employee In Care of Name:</div>
          </div>
          <div class="styExplanationLine" style="float:left">          
              <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/EmployeeInCareOfName" />
            </xsl:call-template>
          </div>                  
        </div>        
			<!-- Choice between Employee US Address or Foreign Address -->
           <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Employee Address:</div>
          </div>
          <div class="styExplanationLine" style="float:left">
          				<!-- US Address -->
							  <xsl:if test="$DependencyData/USAddress">
									<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/USAddress/AddressLine1" />
									</xsl:call-template><br/>
									<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/USAddress/AddressLine2" />
									</xsl:call-template><br/>
									<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/USAddress/City" />
									</xsl:call-template>,
									<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/USAddress/State" />
									</xsl:call-template>,
									<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/USAddress/ZIPCode" />
									</xsl:call-template>
							 </xsl:if> 
						<!-- Foreign Address -->
							  <xsl:if test="$DependencyData/ForeignAddress">
									<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/ForeignAddress/AddressLine1" />
									</xsl:call-template><br/>
									<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/ForeignAddress/AddressLine2" />
									</xsl:call-template><br/>
									<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/ForeignAddress/City" />
									</xsl:call-template>,
									<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/ForeignAddress/ProvinceOrState" />
									</xsl:call-template>,
									<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/ForeignAddress/PostalCode" />
									</xsl:call-template>,
									<xsl:call-template name="PopulateText">
									<xsl:with-param name="TargetNode" select="$DependencyData/ForeignAddress/Country" />
									</xsl:call-template>
							 </xsl:if> 
          </div>                  
        </div>        
			<!-- Work Performed Residing In US Indicator -->
          <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
 						<label>
							<xsl:call-template name="PopulateLabel">
								<xsl:with-param name="TargetNode" select="$DependencyData/WorkPerformedResidingInUSInd"/>
								</xsl:call-template>
              Work Performed Residing in US Indicator:
                        </label>
          </div><br/>
          <div class="styExplanationLine" style="float:left">          
 						<input type="checkbox" class="styCkbox">
							<xsl:call-template name="PopulateCheckbox">
								<xsl:with-param name="TargetNode" select="$DependencyData/WorkPerformedResidingInUSInd"/>
							</xsl:call-template>
						</input>
             </div>                  
        </div>      
			<!-- Country Code -->
           <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Country Code: </div>
          </div>
          <div class="styExplanationLine" style="float:left">          
             <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/CountryCd" />
            </xsl:call-template>
            </div>                  
        </div>      
			<!-- Choice between Foreign Employer Person Name or ForeignEmployerBusinessName -->
          <div class="styTopSectionLine">
			  <xsl:if test="$DependencyData/ForeignEmployerPersonName">          
				  <div class="styTopSectionLineLbl" style="float:left;">
						<!-- Foreign Employer Person Name -->
					<div class="styBold">Foreign Employer Person Name:</div>
				  </div>
				  <div class="styExplanationLine" style="float:left">          
					   <xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$DependencyData/ForeignEmployerPersonName" />
					</xsl:call-template>
				</div>
			 </xsl:if>
			  <xsl:if test="$DependencyData/ForeignEmployerBusinessName">          
				  <div class="styTopSectionLineLbl" style="float:left;">
						<!-- Foreign Employer Business Name -->
					<div class="styBold">Foreign Employer Business Name:</div>
				  </div>
				  <div class="styExplanationLine" style="float:left">          
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$DependencyData/ForeignEmployerBusinessName/BusinessNameLine1" />
					</xsl:call-template><br/>
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$DependencyData/ForeignEmployerBusinessName/BusinessNameLine2" />
					</xsl:call-template>
				</div>
			 </xsl:if>
        </div>      
			<!-- Employer In Care Of Name -->
           <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Employer In Care of Name: </div>
          </div>
          <div class="styExplanationLine" style="float:left">          
              <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/EmployerInCareOfName" />
            </xsl:call-template>
          </div>                  
        </div>        
 			<!-- Foreign Employer Address -->
           <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Foreign Employer Address:</div>
          </div>
          <div class="styExplanationLine" style="float:left">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/ForeignEmployerAddress/AddressLine1" />
					</xsl:call-template><br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/ForeignEmployerAddress/AddressLine2" />
					</xsl:call-template><br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/ForeignEmployerAddress/City" />
					</xsl:call-template>,
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/ForeignEmployerAddress/ProvinceOrState" />
					</xsl:call-template>,
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/ForeignEmployerAddress/PostalCode" />
					</xsl:call-template>,
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/ForeignEmployerAddress/Country" />
					</xsl:call-template>
            </div>                  
        </div>
 			<!-- Foreign EIN -->
           <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Foreign Employer EIN:</div>
          </div>
          <div class="styExplanationLine" style="float:left">          
              <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$DependencyData/ForeignEIN" />
            </xsl:call-template>
          </div>                  
        </div>        
 			<!--Foreign Employer Compensation Amount  -->
           <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Foreign Employer Compensation Amt:</div>
          </div><br/>
          <div class="styExplanationLine" style="float:left">          
              <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/ForeignEmployerCompensationAmt" />
            </xsl:call-template>
          </div>                  
        </div>        
 			<!--Foreign Pension Received Amount-->
           <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Foreign Pension Received Amt:</div>
          </div>
          <div class="styExplanationLine" style="float:left">          
              <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/ForeignPensionReceivedAmt" />
            </xsl:call-template>
          </div>                  
        </div>        
 			<!--Foreign Pension Taxable Amount -->
           <div class="styTopSectionLine">          
          <div class="styTopSectionLineLbl" style="float:left;">
            <div class="styBold">Foreign Pension Taxable Amt:</div>
          </div>
          <div class="styExplanationLine" style="float:left">          
              <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="$DependencyData/ForeignPensionTaxableAmt" />
            </xsl:call-template>
          </div>                  
        </div>        
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







