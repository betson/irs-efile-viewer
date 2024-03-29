<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
    
  <xsl:include href="PopulateTemplate.xsl"/>
   <xsl:include href="AddHeader.xsl"/>
   <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  
  <xsl:param name="DependencyData" select="$RtnDoc/OtherExpensesSchedule2"/>
  
  <!-- Template to display table items -->
  
  <xsl:template name="ShowDependencyData">
    <table id="DependencyDataTbl" class="styDepTbl" style="font-size: 7pt">
      <thead class="styTableThead">
				<tr class="styDepTblHdr">
					<th class="styDepTblCell" style="width:49mm;" scope="col">Other Expenses Description</th>
					<th class="styDepTblCell" style="width:58mm;" scope="col">Qualified Business Unit (QBU) Name</th>
					<th class="styDepTblCell" style="width:12mm;" scope="col">Row Identifier</th>
					<th class="styDepTblCell" style="width:30mm;" scope="col">Reference ID number</th>
					<th class="styDepTblCell" style="width:8mm;" scope="col">Country Code</th>
					<th class="styDepTblCell" style="width:30mm;" scope="col">Other Expenses Amount</th>
				</tr>
			</thead>
			<tbody>
				<xsl:for-each select="$DependencyData/OtherExpensesSchedule2Grp">
        <tr>
          <xsl:attribute name="class">
          <xsl:choose>
             <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
             <xsl:otherwise>styDepTblRow2</xsl:otherwise>
          </xsl:choose>
          </xsl:attribute>
					<td class="styDepTblCell" style="text-align:left;width:49mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="OtherExpenseDesc"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="text-align:left;width:58mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="QBUName/BusinessNameLine1Txt"/>
						</xsl:call-template>
						<xsl:if test="QBUName/BusinessNameLine2Txt">
							<br />
							<xsl:call-template name="PopulateText">
								<xsl:with-param name="TargetNode" select="QBUName/BusinessNameLine2Txt"/>
							</xsl:call-template>
						</xsl:if>
					</td>
					<td class="styDepTblCell" style="text-align:left;width:12mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="RowId"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="text-align:left;width:30mm;word-break:break-all;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="ForeignEntityIdentificationGrp/ForeignEntityReferenceIdNum"/>
						</xsl:call-template>
					</td> 
					<td class="styDepTblCell" style="text-align:center;width:8mm;">
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="CountryCd"/>
						</xsl:call-template>
					</td>
					<td class="styDepTblCell" style="text-align:right;width:30mm;">
						<xsl:call-template name="PopulateAmount">
							<xsl:with-param name="TargetNode" select="OtherExpensesAmt"/>
							<xsl:with-param name="MaxSize" select="17"/>
						</xsl:call-template>
					</td>
        </tr>
      </xsl:for-each>
      </tbody>
    </table>
  </xsl:template>
  
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>
  
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
         <meta name="Author" content="Jason Iozzo"/>
         <meta name="Desc" content="{$depDocTitle}"/> 
                
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
           
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="AddOnStyle"/>    
          </xsl:if>
        </style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>
     <!-- NameDisplay - IRS990PF - Other Expenses Schedule  -->
      <body class="styBodyClass">
        <xsl:call-template name="DocumentHeaderDependency"/>
          
        <div class="styDepTitleLine">
          <span class="styDepTitle" style="padding-right:5mm;">
            <xsl:value-of select="$depDocTitle"/>        
          </span>
        </div>
        
        <!--Adding template for left over data  -->
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>        
                
        <xsl:call-template name="ShowDependencyData"/>          
        <br/>                      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>