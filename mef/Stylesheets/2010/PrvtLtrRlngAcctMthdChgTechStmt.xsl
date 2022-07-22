<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:param name="Form3115Deps38Data" select="$RtnDoc/PrvtLtrRlngAcctMthdChgTechStmt"/>
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName">
      <xsl:with-param name="TargetNode" select="$Form3115Deps38Data"/>
    </xsl:call-template>
  </xsl:param>
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
        <meta name="Author" content="Jessica Lee - jesslee@us.ibm.com"/>
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
          <span class="styDepTitle"  style="width:97mm">
            <xsl:value-of select="$depDocTitle"/>
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover">
          <xsl:with-param name="TargetNode" select="$Form3115Deps38Data"/>
        </xsl:call-template>
        <table class="styDepTbl" style="margin-top:4mm; font-size:7pt; font-family:Verdana">
          <thead class="styTableThead">
            <tr class="styDepTblHdr">
              <th class="styDepTblCell" scope="col">

                 Business / Person Name

              </th>
              <th class="styDepTblCell" scope="col">

                 TIN

              </th>
              <th class="styDepTblCell" scope="col">

                 Type of Request

              </th>
              <th class="styDepTblCell" scope="col">       

                Specific Issue

              </th>
            </tr>
          </thead>
          <tfoot/>
          <tbody>
            <xsl:for-each select="$Form3115Deps38Data/RequestInfo">
              <tr>
                <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                <td class="styDepTblCell" align="left" width="220mm">
                              		<xsl:choose> 
            		<xsl:when test="BusinessName">            
                		<xsl:call-template name="PopulateText">
                  			<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine1" />
               		 </xsl:call-template>
                		<xsl:if test="normalize-space(BusinessName/BusinessNameLine2)!=''">
	                  		<br/>  
	                  		<xsl:call-template name="PopulateText">
	                    		<xsl:with-param name="TargetNode" select="BusinessName/BusinessNameLine2" />
	                 		 </xsl:call-template>    
                		</xsl:if>
                	</xsl:when> 
          		<xsl:otherwise>       
	                <xsl:call-template name="PopulateText">
	                  <xsl:with-param name="TargetNode" select="PersonName" />
	                </xsl:call-template>    
	             </xsl:otherwise>
        		</xsl:choose>          
                </td>
                
                <!--New Test For MissingSSNEINREASON -->

                <td class="styDepTblCell" align="center">
                  <div>
                  <nobr>
                    <xsl:choose> 
            		<xsl:when test="EIN">   
	                    <xsl:call-template name="PopulateEIN">
	                      <xsl:with-param name="TargetNode" select="EIN" />
	                    </xsl:call-template>    
                    </xsl:when> 
          	     <xsl:when test="SSN">                 
	                  <xsl:call-template name="PopulateSSN">
	                    <xsl:with-param name="TargetNode" select="SSN" />
	                  </xsl:call-template>
                  		<br/>
                    </xsl:when> 
          		<xsl:otherwise>   
	                  <xsl:call-template name="PopulateText">
	                    <xsl:with-param name="TargetNode" select="MissingSSNEINReason" />
	                  </xsl:call-template>  
                  	</xsl:otherwise>
        		</xsl:choose>   
        		</nobr>                 
        		</div>
                </td>
                
                
                <td class="styDepTblCell" align="center">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="TypeOfRequest"/>
                  </xsl:call-template>
                </td>
                <td class="styDepTblCell" align="left">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="SpecificIssue"/>
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
