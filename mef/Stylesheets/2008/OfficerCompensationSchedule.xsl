<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*" />
    
  <xsl:include href="PopulateTemplate.xsl"/>  
  <xsl:include href="AddHeader.xsl"/>  
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>  
   
  <xsl:param name="DependencyData" select="$RtnDoc/OfficerCompensationSchedule" />


  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>  
  </xsl:param>
    
  <!-- Template to display dependency schedule -->

  <!-- Form Design per RIS_EXO60053A00_00.doc document written by the client  -->

  <xsl:template name="DependencyTemplate">
      <xsl:for-each select="$DependencyData/OfficerCompensation">
        
        <div style="width:187mm;padding-left:2mm;font-family:verdana;font-weight:bold;font-size:10pt;">
          <xsl:if test="OfficerBusinessName">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="OfficerBusinessName/BusinessNameLine1" />
            </xsl:call-template>                     
            <br/>
            <xsl:if test="OfficerBusinessName/BusinessNameLine2 != ''"> 
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="OfficerBusinessName/BusinessNameLine2" />
              </xsl:call-template>                     
              <br/>
            </xsl:if>
          </xsl:if>
          <xsl:if test="OfficerPersonName">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="OfficerPersonName" />
            </xsl:call-template>                     
          </xsl:if>
        </div>
      
        <table class="styDepTbl">

            <tr class="styDepTblHdr">
              <th class="styDepTblCell" scope="col" style="width:47mm;"><span style="width:1px;"/></th>
              <th class="styDepTblCell" scope="col" style="width:46mm;">Compensation</th>
              <th class="styDepTblCell" scope="col" style="width:46mm;">EE Benefit Plans</th>
              <th class="styDepTblCell" scope="col" style="width:46mm;">Expense Acct</th>        
            </tr>          
            <tr class="styDepTblRow1">
              <td class="styDepTblHdr" style="text-align:left;font-weight:bold;border-bottom:1px solid black;">
                Program Services
              </td>              
              <td class="styDepTblCell" style="text-align:right">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="ProgramServicesCompensation" />
                </xsl:call-template>             
              </td>                                    
              <td class="styDepTblCell" style="text-align:right">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="ProgSrvcContriToEmplBnftPlan" />
                </xsl:call-template>             
              </td>                                    
              <td class="styDepTblCell" style="text-align:right">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="ProgramServicesExpenseAccount" />
                </xsl:call-template>             
              </td>                                    
            </tr>
            <tr class="styDepTblRow2">
              <td class="styDepTblHdr" style="text-align:left;font-weight:bold;border-bottom:1px solid black;">
                Mgmt &amp; General
              </td>              
              <td class="styDepTblCell" style="text-align:right">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="MgmtAndGenera1Compensation" />
                </xsl:call-template>             
              </td>                                    
              <td class="styDepTblCell" style="text-align:right">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="MgmtAndGenContriToEmplBnftPlan" />
                </xsl:call-template>             
              </td>                                    
              <td class="styDepTblCell" style="text-align:right">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="MgmtAndGenera1ExpenseAccount" />
                </xsl:call-template>             
              </td>                                    
            </tr>
            <tr class="styDepTblRow1">
              <td class="styDepTblHdr" style="text-align:left;font-weight:bold;border-bottom:1px solid black;">
                Fundraising
              </td>              
              <td class="styDepTblCell" style="text-align:right">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="FundraisingCompensation" />
                </xsl:call-template>             
              </td>                                    
              <td class="styDepTblCell" style="text-align:right">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="FndrsngContriToEmplBnftPlan" />
                </xsl:call-template>             
              </td>                                    
              <td class="styDepTblCell" style="text-align:right">
                <xsl:call-template name="PopulateAmount">
                  <xsl:with-param name="TargetNode" select="FundraisingExpenseAccount" />
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
         <title><xsl:value-of select="$depDocTitle" /></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache" />
         <meta http-equiv="Cache-Control" content="no-cache" />
         <meta http-equiv="Expires" content="0" />
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private" />
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
         <meta name="Author" content="lshen@us.ibm.com" />
   
         <meta name="Description" content="{$depDocTitle}" />
    
        
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
        <xsl:call-template name="InitJS"></xsl:call-template>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <!--Generic CSS Styles are located in the template called below -->
            <xsl:call-template name="AddOnStyle"></xsl:call-template>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesDep"/>
      </head>
    
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependency"></xsl:call-template>  
        <div class="styDepTitleLine">
          <span class="styDepTitle">
   
            <xsl:value-of select="$depDocTitle" />&nbsp;            
    
          </span>
        </div>        
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData" /></xsl:call-template>

        <br/>            
        <xsl:call-template name="DependencyTemplate" />          
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>







