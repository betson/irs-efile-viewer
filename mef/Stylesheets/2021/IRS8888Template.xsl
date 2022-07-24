<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="iso-8859-1"/>
<!--
***************************************************************************************************************************************************************
IRS8888 Template
***************************************************************************************************************************************************************
Description: This stylesheet contains XSL templates that are used in every xsl "IRS Form" stylesheet. 
***************************************************************************************************************************************************************
-->
<!--
***************************************************************************************************************************************************************
Name:           IRS8888IndividualNumberBox
Description:    Template for splitting up Number fields into individual letter boxes such as on 8849
Req Param:   
Opt Param:   
Called By:      
Calls:          PopulateID, PopulateChgHistory
Log:           2008-06-17 - James Ganzy - Initial creation
***************************************************************************************************************************************************************
-->
     <xsl:template name="IRS8888IndividualNumberBox">
    <xsl:param name="TargetNode"/>
    <xsl:param name="BoxNum"/>
    
    <div style="width:5mm;height:6mm;font-size:8.5pt;padding-top:1.3mm;text-align:center;border:1 solid black;border-right-width:0;clear:none;float:left">
      <span>
        <xsl:attribute name="id">    
          <xsl:call-template name="PopulateID">
            <xsl:with-param name="TargetNode" select="$TargetNode"/>
          </xsl:call-template>    
        </xsl:attribute>
        <xsl:call-template name="PopulateChgHistory">
          <xsl:with-param name="targetNode" select="$TargetNode"/>
          <xsl:with-param name="thisTemplate" select=" 'forLetterBox' "/>   
          <xsl:with-param name="boxNum" select="$BoxNum"/>  
        </xsl:call-template>
      </span>   
    </div>        
    
  </xsl:template>  

      
<!--
***************************************************************************************************************************************************************
Name:           IRS8888IndividualSizablenumbterBox
Description:    Template for splitting up Number fields into individual letter boxes of varying sizes such as on 2290 
Req Param:   BoxWidth,BoxHeight,BoxTopPadding
Opt Param:   
Called By:      
Calls:          PopulateID, PopulateChgHistory
Log:           2007-05-21 - Jason Goltermann - Initial creation
                  2007-06-26 - Jason Goltermann - Added <span> tags around calls to PopulateID and PopulateChangeHistory
***************************************************************************************************************************************************************
-->

    <xsl:template name="IRS8888IndividualSizableNumberBox">
    <xsl:param name="TargetNode"/>
    <xsl:param name="BoxNum"/>
    <xsl:param name="BoxWidth" />
    <xsl:param name="BoxHeight" />
    <xsl:param name="BoxTopPadding" />

    <div style="width:{$BoxWidth};height:{$BoxHeight};padding-top:{$BoxTopPadding};font-size:8.5pt;text-align:center;border:1 solid black;clear:none;float:left" >
      <span>    
        <xsl:attribute name="id">    
          <xsl:call-template name="PopulateID">
            <xsl:with-param name="TargetNode" select="$TargetNode"/>
          </xsl:call-template>    
        </xsl:attribute>        
        <xsl:call-template name="PopulateChgHistory">
          <xsl:with-param name="targetNode" select="$TargetNode"/>
          <xsl:with-param name="thisTemplate" select=" 'forLetterBox' "/>   
          <xsl:with-param name="boxNum" select="$BoxNum"/>  
        </xsl:call-template> 
      </span>        
    </div>        
    
  </xsl:template>  

     
  
</xsl:stylesheet>