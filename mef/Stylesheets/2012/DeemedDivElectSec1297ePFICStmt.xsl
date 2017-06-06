<?xml version="1.0" encoding="UTF-8" ?>
<!-- 09-11-2012 - Created as per UWR 58627 - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/DeemedDivElectSec1297ePFICStmt" />
  <!-- Display Name  Deemed Dividend Election Statement  -->
  <!-- Main template -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/" >

    <html>
      <head>
           <title><xsl:value-of select="$depDocTitle" /></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache" />
         <meta http-equiv="Cache-Control" content="no-cache" />
         <meta http-equiv="Expires" content="0" />
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private" />
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />         
         <meta name="Description" content="{$depDocTitle}" />
         <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
        
        <style type="text/css">                
        </style>
        <style type="text/css">
  <xsl:if test="not($Print) or $Print=''">
    <xsl:call-template name="AddOnStyle"></xsl:call-template>    
  </xsl:if>
</style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>    
      <body class="styBodyClass">

        <xsl:call-template name="DocumentHeaderDependency" />  
        <div class="styDepTitleLine">

          <span class="styDepTitle">
            <span style="width:187mm;"><xsl:value-of select="$depDocTitle" /></span>        
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <div class="styTopSectionLine" style="width:187mm;">        
          <div class=" styTopSectionLineLbl" style="float:left;clear:none;">Name:</div>
          <div style="float:left;clear:none;">       
				<xsl:if test="$DependencyData/PersonName !=''">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/PersonName"/>
					</xsl:call-template><br/>
				</xsl:if>
				<xsl:if test="$DependencyData/Name/BusinessNameLine1 !=''">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/Name/BusinessNameLine1"/>
					</xsl:call-template>
				</xsl:if>
				<xsl:if test="$DependencyData/Name/BusinessNameLine2 !=''">
				    <br/>
				    <xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" select="$DependencyData/Name/BusinessNameLine2"/>
					</xsl:call-template>
				</xsl:if>
		   </div>
		</div>  
        
        
        <div class="styTopSectionLine" style="width:187mm;">
          <div class="styTopSectionLineLbl" style="float:left;clear:both;">Address:</div>
          <div style="float:left;clear:right;">
            <xsl:if test="$DependencyData/Address">
                <xsl:call-template name="PopulateUSAddressTemplate">
                <xsl:with-param name="TargetNode" select="$DependencyData/Address"/>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="$DependencyData/ForeignAddress">
                <xsl:call-template name="PopulateForeignAddressTemplate">
                <xsl:with-param name="TargetNode" select="$DependencyData/ForeignAddress"/>
                </xsl:call-template>
              </xsl:if>
          </div>
        </div>         


 <!--      Placed line and label formatting within choose statement 3/16/07  -->
   
         <xsl:choose>
              <xsl:when test="$DependencyData/SocialSecurityNumber">
 <!-- added Line label for ssn case -->  
              <div class="styTopSectionLine" style="width:187mm;"> 
                <div class="styTopSectionLineLbl" style="float:left;clear:both;">Social Security Number: </div>
               <div style="float:left;clear:right;"> 
                 <xsl:call-template name="PopulateSSN">
              	  <xsl:with-param name="TargetNode" select="$DependencyData/SocialSecurityNumber"/>
                </xsl:call-template>
                </div>
                </div>
              </xsl:when>
              <xsl:when test="$DependencyData/MissingEINReason">

  <!-- added Line label for missing ein case --> 
       
                <div class="styTopSectionLine" style="width:187mm;"> 
                <div class="styTopSectionLineLbl" style="float:left;clear:both;"> Missing EIN reason:
      		 </div>
      		 <div style="float:left;clear:right;"> 
                 <xsl:call-template name="PopulateText">
              	  <xsl:with-param name="TargetNode" select="$DependencyData/MissingEINReason" />
                </xsl:call-template>
                </div>
                </div>
              </xsl:when>
              <xsl:otherwise>
              
				 <!-- added Line label for ein case here-->    
          	 
              	 <div class="styTopSectionLine" style="width:187mm;"> 
              	 <div class="styTopSectionLineLbl" style="float:left;clear:both;"> Employer Identification Number: </div>
                 <div style="float:left;clear:right;"> 
              	<xsl:call-template name="PopulateEIN"><xsl:with-param name="TargetNode" select="$DependencyData/EmployerIdentificationNumber" />
              	</xsl:call-template>  
              	 </div>
                </div>
              	</xsl:otherwise>
            </xsl:choose>
        
           <div class="styTopSectionLine" style="width:187mm;">        
			  <div class="styTopSectionLineLbl" style="float:left;clear:both;">The CFC qualification date as defined in Regulations section 1.1297-3(d), for the Section 1297(e) PFIC:</div>
			  <div style="float:left;clear:right;">
				  <xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$DependencyData/CFCQualificationDate"/>
				  </xsl:call-template>
			 </div> 
			</div>  
           <div class="styTopSectionLine" style="width:187mm;">        
			  <div class="styTopSectionLineLbl" style="float:left;clear:both;">Beginning dates of the taxable year of the shareholding in which the CFC qualifitication dat falls (ie. The election year):</div>
			  <div style="float:left;clear:right;">
				  <xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$DependencyData/BeginDtTaxblYrCFCQulfyDtFalls"/>
				  </xsl:call-template>
			 </div> 
			</div>   
           <div class="styTopSectionLine" style="width:187mm;">        
			  <div class="styTopSectionLineLbl" style="float:left;clear:both;">Ending dates of the taxable year of the sharholding in which the CFC qualification date falls (i.e., the election year):</div>
			  <div style="float:left;clear:right;">
				  <xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$DependencyData/EndDtTaxblYrCFCQulfyDtFalls"/>
				  </xsl:call-template>
			 </div> 
			</div>    
           <div class="styTopSectionLine" style="width:187mm;">        
			  <div class="styTopSectionLineLbl" style="float:left;clear:both;">Tax year in which the amount was previously included in income:</div>
			  <div style="float:left;clear:right;">
				  <xsl:call-template name="PopulateYear">
					  <xsl:with-param name="TargetNode" select="$DependencyData/TaxYearAmountIncludedInIncome"/>
				  </xsl:call-template>
			 </div> 
			</div>   
           <div class="styTopSectionLine" style="width:187mm;">        
			  <div class="styTopSectionLineLbl" style="float:left;clear:both;">The law under which the amount was previously included in income:</div>
			  <div style="float:left;clear:right;">
				  <xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$DependencyData/LawUnderWhichAmountWasIncluded"/>
				  </xsl:call-template>
			 </div> 
			</div>    
           <div class="styTopSectionLine" style="width:187mm;">        
			  <div class="styTopSectionLineLbl" style="float:left;clear:both;">Description of transaction in which the shareholder acquired the stock of the PFIC from the other US person:</div>
			  <div style="float:left;clear:right;">
				  <xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$DependencyData/DescriptionOfTransaction"/>
				  </xsl:call-template>
			 </div> 
			</div>        
           <div class="styTopSectionLine" style="width:187mm;">        
			  <div class="styTopSectionLineLbl" style="float:left;clear:both;">The law under which the shareholder’s holding period includes the holding period of the other US person:</div>
			  <div style="float:left;clear:right;">
				  <xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="$DependencyData/ShareholdersHoldingPeriodLaw"/>
				  </xsl:call-template>
			 </div> 
			</div>    
                
			<table id="DARSTbl" class="styDepTbl">
			  <thead class="styTableThead">
			  <tr class="styDepTblHdr">         
				 <th class="styDepTblCell" scope="col">Tax year for each tax year the taxpayer held the stock (i.e., the PFIC stock the taxpayer held on the CFC qualification date).</th>        
				 <th class="styDepTblCell" scope="col">Post 1986 E&amp;P Prorated to the Shareholder for the tax year specified.</th>  
				 <th class="styDepTblCell" scope="col">Amount of Post-1986 E&amp;P in Post1986EIProratedShrHldr that is prorated to the shareholder for the tax year specified.</th>        
				 <th class="styDepTblCell" scope="col">Explanation that shows the calculation of this amount as required under Section 1297(e) PFIC for the election year.</th>       
			  </tr>
			  </thead>
				<tfoot></tfoot>
			   <tbody>
			  <xsl:for-each select="$DependencyData/ShareholdersProRataShareSchedule">
				<tr>
				  <xsl:attribute name="class">
				  <xsl:choose>
					 <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
					 <xsl:otherwise>styDepTblRow2</xsl:otherwise>
				  </xsl:choose>
				  </xsl:attribute>
									  
				  <td class="styDepTblCell" style="text-align:left">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="TxYrTPHeldStock"/>
					</xsl:call-template>                  
				  </td>            
				  <td class="styDepTblCell" style="text-align:right">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="Post1986EPProratedShrHldrTxYr"/>
					</xsl:call-template>
				  </td>  				  
				  <td class="styDepTblCell" style="text-align:right">
					<xsl:call-template name="PopulateAmount">
					  <xsl:with-param name="TargetNode" select="Post1986EPProratedtoShrHldr"/>
					</xsl:call-template>                  
				  </td>            
				  <td class="styDepTblCell" style="text-align:left">
					<xsl:call-template name="PopulateText">
					  <xsl:with-param name="TargetNode" select="Calculation"/>
					</xsl:call-template>
				  </td>       
				</tr>
			  </xsl:for-each>
			  </tbody>
			</table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







