<?xml version="1.0" encoding="UTF-8"?>
<!--
*******************************************************************************
Name: MasterStyle.xsl
*******************************************************************************
Description: All paper form display-based stylesheets (known as "PDF 
  stylesheets") have a separate, corresponding CSS style file. The CSS style 
  file defines the form-specific CSS styles that will be repeatedly used in the 
  stylesheet. Whenever a PDF stylesheet is displayed, the associated CSS style 
  file is included at the top of the PDF stylesheet's XSL code. The print 
  application requires multiple pages to be printed at once, and to do this the 
  HTML from multiple PDF stylesheets are put one-on-top-of-another into one 
  large HTML file that can be printed in one call to the printer. When 
  conglomerating multiple HTML pages into one big file, the unique CSS styles 
  for each PDF stylesheet is embedded throughout the main body of the HTML. This 
  causes a problem since HTML has a problem reading CSS style files embedded in 
  the body of HTML. MasterStyle.xsl fixes the problem by extracting all of the 
  appropriate CSS style files and include them at the top of the large HTML file 
  to be printed, thus ensuring that all CSS styles are read properly by the print 
  application.
*******************************************************************************  
Update when: When a new PDF stylesheet is created, include the style file and 
  add a new condition for the style file to the template.
*******************************************************************************  
IMPORTANT NOTE: In MasterStyle.xsl, DocumentName actually refers to the root element 
of the schema used by the stylesheet. It DOES NOT refer to the literal DocumentName 
attribute from the schema.
*******************************************************************************  
Log: 
*******************************************************************************
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1040AStyle.xsl"/>
  <xsl:include href="IRS1040EZStyle.xsl"/>
  <xsl:include href="IRS1040Schedule8812Style.xsl"/>
  <xsl:include href="IRS1040ScheduleAStyle.xsl"/>
  <xsl:include href="IRS1040ScheduleBStyle.xsl"/>
  <xsl:include href="IRS1040ScheduleCEZStyle.xsl"/>
  <xsl:include href="IRS1040ScheduleCStyle.xsl"/>
  <xsl:include href="IRS1040ScheduleDStyle.xsl"/>
  <xsl:include href="IRS1040ScheduleEICStyle.xsl"/>
  <xsl:include href="IRS1040ScheduleEStyle.xsl"/>
  <xsl:include href="IRS1040ScheduleFStyle.xsl"/>
  <xsl:include href="IRS1040ScheduleHStyle.xsl"/>
  <xsl:include href="IRS1040ScheduleJStyle.xsl"/>
  <xsl:include href="IRS1040ScheduleMStyle.xsl"/>
  <xsl:include href="IRS1040ScheduleRStyle.xsl"/>
  <xsl:include href="IRS1040ScheduleSEStyle.xsl"/>
  <xsl:include href="IRS1040SSPRStyle.xsl"/>
  <xsl:include href="IRS1040Style.xsl"/>
  <xsl:include href="IRS1065BScheduleK1Style.xsl"/>
  <xsl:include href="IRS1065BStyle.xsl"/>
  <xsl:include href="IRS1065ScheduleB1Style.xsl"/>
  <xsl:include href="IRS1065ScheduleCStyle.xsl"/>
  <xsl:include href="IRS1065ScheduleDStyle.xsl"/>
  <xsl:include href="IRS1065ScheduleK1Style.xsl"/>
  <xsl:include href="IRS1065ScheduleM3Style.xsl"/>
  <xsl:include href="IRS1065Style.xsl"/>
  <xsl:include href="IRS1099RStyle.xsl"/>
  <xsl:include href="IRS1116Style.xsl"/>
  <xsl:include href="IRS1118AMTStyle.xsl"/>
  <xsl:include href="IRS1118ScheduleIStyle.xsl"/>
  <xsl:include href="IRS1118ScheduleJStyle.xsl"/>
  <xsl:include href="IRS1118ScheduleKStyle.xsl"/>
  <xsl:include href="IRS1118Style.xsl"/>
  <xsl:include href="IRS1120EliminationsOrAdjStyle.xsl"/>
  <xsl:include href="IRS1120FScheduleHStyle.xsl"/>
  <xsl:include href="IRS1120FScheduleIStyle.xsl"/>
  <xsl:include href="IRS1120FScheduleM1M2Style.xsl"/>
  <xsl:include href="IRS1120FScheduleM3Style.xsl"/>
  <xsl:include href="IRS1120FSchedulePStyle.xsl"/>
  <xsl:include href="IRS1120FScheduleSStyle.xsl"/>
  <xsl:include href="IRS1120FScheduleVStyle.xsl"/>
  <xsl:include href="IRS1120FStyle.xsl"/>
  <xsl:include href="IRS1120LEliminationsOrAdjStyle.xsl"/>
  <xsl:include href="IRS1120LScheduleM3Style.xsl"/>
  <xsl:include href="IRS1120LSchM3EliminationsOrAdjStyle.xsl"/>
  <xsl:include href="IRS1120LStyle.xsl"/>
  <xsl:include href="IRS1120PCEliminationsOrAdjStyle.xsl"/>
  <xsl:include href="IRS1120PCScheduleM3Style.xsl"/>
  <xsl:include href="IRS1120PCSchM3ElimOrAdjStyle.xsl"/>
  <xsl:include href="IRS1120PCStyle.xsl"/>
  <xsl:include href="IRS1120POLStyle.xsl"/>
  <xsl:include href="IRS1120ScheduleBStyle.xsl"/>
  <xsl:include href="IRS1120ScheduleDStyle.xsl"/>
  <xsl:include href="IRS1120ScheduleGStyle.xsl"/>
  <xsl:include href="IRS1120ScheduleHStyle.xsl"/>
  <xsl:include href="IRS1120ScheduleM3Style.xsl"/>
  <xsl:include href="IRS1120ScheduleNStyle.xsl"/>
  <xsl:include href="IRS1120ScheduleOStyle.xsl"/>
  <xsl:include href="IRS1120SchedulePHStyle.xsl"/>
  <xsl:include href="IRS1120ScheduleUTPStyle.xsl"/>
  <xsl:include href="IRS1120SchM3EliminationsOrAdjStyle.xsl"/>
  <xsl:include href="IRS1120SScheduleDStyle.xsl"/>
  <xsl:include href="IRS1120SScheduleK1Style.xsl"/>
  <xsl:include href="IRS1120SScheduleM3Style.xsl"/>
  <xsl:include href="IRS1120SStyle.xsl"/>
  <xsl:include href="IRS1120Style.xsl"/>
  <xsl:include href="IRS1120XStyle.xsl"/>
  <xsl:include href="IRS1122Style.xsl"/>
  <xsl:include href="IRS1125AStyle.xsl"/>
  <xsl:include href="IRS1125EStyle.xsl"/>
  <xsl:include href="IRS1310Style.xsl"/>
  <xsl:include href="IRS2106EZStyle.xsl"/>
  <xsl:include href="IRS2106Style.xsl"/>
  <xsl:include href="IRS2120Style.xsl"/>
  <xsl:include href="IRS2210FStyle.xsl"/>
  <xsl:include href="IRS2210Style.xsl"/>
  <xsl:include href="IRS2220Style.xsl"/>
  <xsl:include href="IRS2290Schedule1Style.xsl"/>
  <xsl:include href="IRS2290Style.xsl"/>
  <xsl:include href="IRS2350Style.xsl"/>
  <xsl:include href="IRS2439Style.xsl"/>
  <xsl:include href="IRS2441Style.xsl"/>
  <xsl:include href="IRS2555EZStyle.xsl"/>
  <xsl:include href="IRS2555Style.xsl"/>
  <xsl:include href="IRS3115Style.xsl"/>
  <xsl:include href="IRS3468Style.xsl"/>
  <xsl:include href="IRS3800Style.xsl"/>
  <xsl:include href="IRS3903Style.xsl"/>
  <xsl:include href="IRS4136Style.xsl"/>
  <xsl:include href="IRS4137Style.xsl"/>
  <xsl:include href="IRS4255Style.xsl"/>
  <xsl:include href="IRS4466Style.xsl"/>
  <xsl:include href="IRS4562Style.xsl"/>
  <xsl:include href="IRS4563Style.xsl"/>
  <xsl:include href="IRS4626Style.xsl"/>
  <xsl:include href="IRS4684Style.xsl"/>
  <xsl:include href="IRS4797Style.xsl"/>
  <xsl:include href="IRS4835Style.xsl"/>
  <xsl:include href="IRS4868Style.xsl"/>
  <xsl:include href="IRS4952Style.xsl"/>
  <xsl:include href="IRS4970Style.xsl"/>
  <xsl:include href="IRS4972Style.xsl"/>
  <xsl:include href="IRS499W2PRStyle.xsl"/>
  <xsl:include href="IRS5074Style.xsl"/>
  <xsl:include href="IRS5329Style.xsl"/>
  <xsl:include href="IRS5405Style.xsl"/>
  <xsl:include href="IRS5452Style.xsl"/>
  <xsl:include href="IRS5471ScheduleJStyle.xsl"/>
  <xsl:include href="IRS5471ScheduleMStyle.xsl"/>
  <xsl:include href="IRS5471ScheduleNStyle.xsl"/>
  <xsl:include href="IRS5471ScheduleOStyle.xsl"/>
  <xsl:include href="IRS5471Style.xsl"/>
  <xsl:include href="IRS5472Style.xsl"/>
  <xsl:include href="IRS5695Style.xsl"/>
  <xsl:include href="IRS56Style.xsl"/>
  <xsl:include href="IRS5713ScheduleAStyle.xsl"/>
  <xsl:include href="IRS5713ScheduleBStyle.xsl"/>
  <xsl:include href="IRS5713ScheduleCStyle.xsl"/>
  <xsl:include href="IRS5713Style.xsl"/>
  <xsl:include href="IRS5735Style.xsl"/>
  <xsl:include href="IRS5884AStyle.xsl"/>
  <xsl:include href="IRS5884BStyle.xsl"/>
  <xsl:include href="IRS5884Style.xsl"/>
  <xsl:include href="IRS6197Style.xsl"/>
  <xsl:include href="IRS6198Style.xsl"/>
  <xsl:include href="IRS6251Style.xsl"/>
  <xsl:include href="IRS6252Style.xsl"/>
  <xsl:include href="IRS6478Style.xsl"/>
  <xsl:include href="IRS6627Style.xsl"/>
  <xsl:include href="IRS6765Style.xsl"/>
  <xsl:include href="IRS6781Style.xsl"/>
  <xsl:include href="IRS7004Style.xsl"/>
  <xsl:include href="IRS720Style.xsl"/>
  <xsl:include href="IRS8050Style.xsl"/>
  <xsl:include href="IRS8082Style.xsl"/>
  <xsl:include href="IRS8275RStyle.xsl"/>
  <xsl:include href="IRS8275Style.xsl"/>
  <xsl:include href="IRS8283Style.xsl"/>
  <xsl:include href="IRS8302Style.xsl"/>
  <xsl:include href="IRS8308Style.xsl"/>
  <xsl:include href="IRS8379Style.xsl"/>
  <xsl:include href="IRS8396Style.xsl"/>
  <xsl:include href="IRS851Style.xsl"/>
  <xsl:include href="IRS8582CRStyle.xsl"/>
  <xsl:include href="IRS8582Style.xsl"/>
  <xsl:include href="IRS8586Style.xsl"/>
  <xsl:include href="IRS8594Style.xsl"/>
  <xsl:include href="IRS8606Style.xsl"/>
  <xsl:include href="IRS8609AStyle.xsl"/>
  <xsl:include href="IRS8611Style.xsl"/>
  <xsl:include href="IRS8615Style.xsl"/>
  <xsl:include href="IRS8621Style.xsl"/>
  <xsl:include href="IRS8689Style.xsl"/>
  <xsl:include href="IRS8697Style.xsl"/>
  <xsl:include href="IRS8716Style.xsl"/>
  <xsl:include href="IRS8801Style.xsl"/>
  <xsl:include href="IRS8810Style.xsl"/>
  <xsl:include href="IRS8812Style.xsl"/>
  <xsl:include href="IRS8814Style.xsl"/>
  <xsl:include href="IRS8815Style.xsl"/>
  <xsl:include href="IRS8816Style.xsl"/>
  <xsl:include href="IRS8820Style.xsl"/>
  <xsl:include href="IRS8824Style.xsl"/>
  <xsl:include href="IRS8825Style.xsl"/>
  <xsl:include href="IRS8826Style.xsl"/>
  <xsl:include href="IRS8827Style.xsl"/>
  <xsl:include href="IRS8828Style.xsl"/>
  <xsl:include href="IRS8829Style.xsl"/>
  <xsl:include href="IRS8832Style.xsl"/>
  <xsl:include href="IRS8833Style.xsl"/>
  <xsl:include href="IRS8834Style.xsl"/>
  <xsl:include href="IRS8835Style.xsl"/>
  <xsl:include href="IRS8838Style.xsl"/>
  <xsl:include href="IRS8839Style.xsl"/>
  <xsl:include href="IRS8844Style.xsl"/>
  <xsl:include href="IRS8845Style.xsl"/>
  <xsl:include href="IRS8846Style.xsl"/>
  <xsl:include href="IRS8847Style.xsl"/>
  <xsl:include href="IRS8849Schedule1Style.xsl"/>
  <xsl:include href="IRS8849Schedule2Style.xsl"/>
  <xsl:include href="IRS8849Schedule3Style.xsl"/>
  <xsl:include href="IRS8849Schedule5Style.xsl"/>
  <xsl:include href="IRS8849Schedule6Style.xsl"/>
  <xsl:include href="IRS8849Schedule8Style.xsl"/>
  <xsl:include href="IRS8849Style.xsl"/>
  <xsl:include href="IRS8853Style.xsl"/>
  <xsl:include href="IRS8854Style.xsl"/>
  <xsl:include href="IRS8858ScheduleMStyle.xsl"/>
  <xsl:include href="IRS8858Style.xsl"/>
  <xsl:include href="IRS8859Style.xsl"/>
  <xsl:include href="IRS8861Style.xsl"/>
  <xsl:include href="IRS8862Style.xsl"/>
  <xsl:include href="IRS8863Style.xsl"/>
  <xsl:include href="IRS8864Style.xsl"/>
  <xsl:include href="IRS8865ScheduleK1Style.xsl"/>
  <xsl:include href="IRS8865ScheduleOStyle.xsl"/>
  <xsl:include href="IRS8865SchedulePStyle.xsl"/>
  <xsl:include href="IRS8865Style.xsl"/>
  <xsl:include href="IRS8866Style.xsl"/>
  <xsl:include href="IRS8867Style.xsl"/>
  <xsl:include href="IRS8868Style.xsl"/>
  <xsl:include href="IRS8873Style.xsl"/>
  <xsl:include href="IRS8874Style.xsl"/>
  <xsl:include href="IRS8880Style.xsl"/>
  <xsl:include href="IRS8881Style.xsl"/>
  <xsl:include href="IRS8882Style.xsl"/>
  <xsl:include href="IRS8883Style.xsl"/>
  <xsl:include href="IRS8885Style.xsl"/>
  <xsl:include href="IRS8886Style.xsl"/>
  <xsl:include href="IRS8888Style.xsl"/>
  <xsl:include href="IRS8889Style.xsl"/>
  <xsl:include href="IRS8896Style.xsl"/>
  <xsl:include href="IRS8900Style.xsl"/>
  <xsl:include href="IRS8902Style.xsl"/>
  <xsl:include href="IRS8903Style.xsl"/>
  <xsl:include href="IRS8906Style.xsl"/>
  <xsl:include href="IRS8907Style.xsl"/>
  <xsl:include href="IRS8908Style.xsl"/>
  <xsl:include href="IRS8909Style.xsl"/>
  <xsl:include href="IRS8910Style.xsl"/>
  <xsl:include href="IRS8911Style.xsl"/>
  <xsl:include href="IRS8912Style.xsl"/>
  <xsl:include href="IRS8913Style.xsl"/>
  <xsl:include href="IRS8916AStyle.xsl"/>
  <xsl:include href="IRS8916Style.xsl"/>
  <xsl:include href="IRS8919Style.xsl"/>
  <xsl:include href="IRS8923Style.xsl"/>
  <xsl:include href="IRS8925Style.xsl"/>
  <xsl:include href="IRS8926Style.xsl"/>
  <xsl:include href="IRS8930Style.xsl"/>
  <xsl:include href="IRS8931Style.xsl"/>
  <xsl:include href="IRS8932Style.xsl"/>
  <xsl:include href="IRS8933Style.xsl"/>
  <xsl:include href="IRS8936Style.xsl"/>
  <xsl:include href="IRS8938Style.xsl"/>
  <xsl:include href="IRS8941Style.xsl"/>
  <xsl:include href="IRS8949Style.xsl"/>
  <xsl:include href="IRS8958Style.xsl"/>
  <xsl:include href="IRS926Style.xsl"/>
  <xsl:include href="IRS9465Style.xsl"/>
  <xsl:include href="IRS970Style.xsl"/>
  <xsl:include href="IRS972Style.xsl"/>
  <xsl:include href="IRS973Style.xsl"/>
  <xsl:include href="IRS982Style.xsl"/>
  <xsl:include href="IRS990EZStyle.xsl"/>
  <xsl:include href="IRS990NStyle.xsl"/>
  <xsl:include href="IRS990PFStyle.xsl"/>
  <xsl:include href="IRS990ScheduleAStyle.xsl"/>
  <xsl:include href="IRS990ScheduleBStyle.xsl"/>
  <xsl:include href="IRS990ScheduleCStyle.xsl"/>
  <xsl:include href="IRS990ScheduleDStyle.xsl"/>
  <xsl:include href="IRS990ScheduleEStyle.xsl"/>
  <xsl:include href="IRS990ScheduleFStyle.xsl"/>
  <xsl:include href="IRS990ScheduleGStyle.xsl"/>
  <xsl:include href="IRS990ScheduleHStyle.xsl"/>
  <xsl:include href="IRS990ScheduleIStyle.xsl"/>
  <xsl:include href="IRS990ScheduleJStyle.xsl"/>
  <xsl:include href="IRS990ScheduleKStyle.xsl"/>
  <xsl:include href="IRS990ScheduleLStyle.xsl"/>
  <xsl:include href="IRS990ScheduleMStyle.xsl"/>
  <xsl:include href="IRS990ScheduleNStyle.xsl"/>
  <xsl:include href="IRS990ScheduleOStyle.xsl"/>
  <xsl:include href="IRS990ScheduleRStyle.xsl"/>
  <xsl:include href="IRS990Style.xsl"/>
  <xsl:include href="IRSFormTStyle.xsl"/>
  <xsl:include href="IRSW2ASStyle.xsl"/>
  <xsl:include href="IRSW2GStyle.xsl"/>
  <xsl:include href="IRSW2GUStyle.xsl"/>
  <xsl:include href="IRSW2Style.xsl"/>
  <xsl:include href="IRSW2VIStyle.xsl"/>
  <xsl:include href="W2CMStyle.xsl"/>
  <!-- This template extracts the appropriate CSS style files and include them before the large HTML file which contains 
all PDF stylesheets that are selected for print. -->
  <xsl:template match="/">
    <html>
      <head>
        <title/>
        <link rel="stylesheet" type="text/css" name="HeaderStyleSheet" href="{$CSSPath}/header.css"/>
        <link rel="stylesheet" type="text/css" name="BodyStyleSheet" href="{$CSSPath}/body.css"/>
        <link rel="stylesheet" type="text/css" name="General" href="{$CSSPath}/general.css"/>
        <style type="text/css">
          <xsl:call-template name="AddOnStyle"/>
          <xsl:for-each select="/AppData/PrintDocuments/Document">
            <xsl:choose>
              <xsl:when test="@documentName='IRS1040A'">
                <xsl:call-template name="IRS1040AStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1040EZ'">
                <xsl:call-template name="IRS1040EZStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1040Schedule8812'">
                <xsl:call-template name="IRS1040Schedule8812Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1040ScheduleA'">
                <xsl:call-template name="IRS1040ScheduleAStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1040ScheduleB'">
                <xsl:call-template name="IRS1040ScheduleBStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1040ScheduleCEZ'">
                <xsl:call-template name="IRS1040ScheduleCEZStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1040ScheduleC'">
                <xsl:call-template name="IRS1040ScheduleCStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1040ScheduleD'">
                <xsl:call-template name="IRS1040ScheduleDStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1040ScheduleEIC'">
                <xsl:call-template name="IRS1040ScheduleEICStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1040ScheduleE'">
                <xsl:call-template name="IRS1040ScheduleEStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1040ScheduleF'">
                <xsl:call-template name="IRS1040ScheduleFStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1040ScheduleH'">
                <xsl:call-template name="IRS1040ScheduleHStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1040ScheduleJ'">
                <xsl:call-template name="IRS1040ScheduleJStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1040ScheduleM'">
                <xsl:call-template name="IRS1040ScheduleMStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1040ScheduleR'">
                <xsl:call-template name="IRS1040ScheduleRStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1040ScheduleSE'">
                <xsl:call-template name="IRS1040ScheduleSEStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1040SSPR'">
                <xsl:call-template name="IRS1040SSPRStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1040'">
                <xsl:call-template name="IRS1040Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1065BScheduleK1'">
                <xsl:call-template name="IRS1065BScheduleK1Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1065B'">
                <xsl:call-template name="IRS1065BStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1065ScheduleB1'">
                <xsl:call-template name="IRS1065ScheduleB1Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1065ScheduleC'">
                <xsl:call-template name="IRS1065ScheduleCStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1065ScheduleD'">
                <xsl:call-template name="IRS1065ScheduleDStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1065ScheduleK1'">
                <xsl:call-template name="IRS1065ScheduleK1Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1065ScheduleM3'">
                <xsl:call-template name="IRS1065ScheduleM3Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1065'">
                <xsl:call-template name="IRS1065Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1099R'">
                <xsl:call-template name="IRS1099RStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1116'">
                <xsl:call-template name="IRS1116Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1118AMT'">
                <xsl:call-template name="IRS1118AMTStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1118ScheduleI'">
                <xsl:call-template name="IRS1118ScheduleIStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1118ScheduleJ'">
                <xsl:call-template name="IRS1118ScheduleJStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1118ScheduleK'">
                <xsl:call-template name="IRS1118ScheduleKStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1118'">
                <xsl:call-template name="IRS1118Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120EliminationsOrAdj'">
                <xsl:call-template name="IRS1120EliminationsOrAdjStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120FScheduleH'">
                <xsl:call-template name="IRS1120FScheduleHStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120FScheduleI'">
                <xsl:call-template name="IRS1120FScheduleIStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120FScheduleM1M2'">
                <xsl:call-template name="IRS1120FScheduleM1M2Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120FScheduleM3'">
                <xsl:call-template name="IRS1120FScheduleM3Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120FScheduleP'">
                <xsl:call-template name="IRS1120FSchedulePStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120FScheduleS'">
                <xsl:call-template name="IRS1120FScheduleSStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120FScheduleV'">
                <xsl:call-template name="IRS1120FScheduleVStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120F'">
                <xsl:call-template name="IRS1120FStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120LEliminationsOrAdj'">
                <xsl:call-template name="IRS1120LEliminationsOrAdjStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120LScheduleM3'">
                <xsl:call-template name="IRS1120LScheduleM3Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120LSchM3EliminationsOrAdj'">
                <xsl:call-template name="IRS1120LSchM3EliminationsOrAdjStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120L'">
                <xsl:call-template name="IRS1120LStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120PCEliminationsOrAdj'">
                <xsl:call-template name="IRS1120PCEliminationsOrAdjStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120PCScheduleM3'">
                <xsl:call-template name="IRS1120PCScheduleM3Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120PCSchM3ElimOrAdj'">
                <xsl:call-template name="IRS1120PCSchM3ElimOrAdjStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120PC'">
                <xsl:call-template name="IRS1120PCStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120POL'">
                <xsl:call-template name="IRS1120POLStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120ScheduleB'">
                <xsl:call-template name="IRS1120ScheduleBStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120ScheduleD'">
                <xsl:call-template name="IRS1120ScheduleDStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120ScheduleG'">
                <xsl:call-template name="IRS1120ScheduleGStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120ScheduleH'">
                <xsl:call-template name="IRS1120ScheduleHStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120ScheduleM3'">
                <xsl:call-template name="IRS1120ScheduleM3Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120ScheduleN'">
                <xsl:call-template name="IRS1120ScheduleNStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120ScheduleO'">
                <xsl:call-template name="IRS1120ScheduleOStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120SchedulePH'">
                <xsl:call-template name="IRS1120SchedulePHStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120ScheduleUTP'">
                <xsl:call-template name="IRS1120ScheduleUTPStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120SchM3EliminationsOrAdj'">
                <xsl:call-template name="IRS1120SchM3EliminationsOrAdjStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120SScheduleD'">
                <xsl:call-template name="IRS1120SScheduleDStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120SScheduleK1'">
                <xsl:call-template name="IRS1120SScheduleK1Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120SScheduleM3'">
                <xsl:call-template name="IRS1120SScheduleM3Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120S'">
                <xsl:call-template name="IRS1120SStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120'">
                <xsl:call-template name="IRS1120Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1120X'">
                <xsl:call-template name="IRS1120XStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1122'">
                <xsl:call-template name="IRS1122Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1125A'">
                <xsl:call-template name="IRS1125AStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1125E'">
                <xsl:call-template name="IRS1125EStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS1310'">
                <xsl:call-template name="IRS1310Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS2106EZ'">
                <xsl:call-template name="IRS2106EZStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS2106'">
                <xsl:call-template name="IRS2106Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS2120'">
                <xsl:call-template name="IRS2120Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS2210F'">
                <xsl:call-template name="IRS2210FStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS2210'">
                <xsl:call-template name="IRS2210Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS2220'">
                <xsl:call-template name="IRS2220Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS2290Schedule1'">
                <xsl:call-template name="IRS2290Schedule1Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS2290'">
                <xsl:call-template name="IRS2290Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS2350'">
                <xsl:call-template name="IRS2350Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS2439'">
                <xsl:call-template name="IRS2439Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS2441'">
                <xsl:call-template name="IRS2441Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS2555EZ'">
                <xsl:call-template name="IRS2555EZStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS2555'">
                <xsl:call-template name="IRS2555Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS3115'">
                <xsl:call-template name="IRS3115Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS3468'">
                <xsl:call-template name="IRS3468Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS3800'">
                <xsl:call-template name="IRS3800Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS3903'">
                <xsl:call-template name="IRS3903Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS4136'">
                <xsl:call-template name="IRS4136Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS4137'">
                <xsl:call-template name="IRS4137Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS4255'">
                <xsl:call-template name="IRS4255Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS4466'">
                <xsl:call-template name="IRS4466Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS4562'">
                <xsl:call-template name="IRS4562Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS4563'">
                <xsl:call-template name="IRS4563Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS4626'">
                <xsl:call-template name="IRS4626Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS4684'">
                <xsl:call-template name="IRS4684Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS4797'">
                <xsl:call-template name="IRS4797Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS4835'">
                <xsl:call-template name="IRS4835Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS4868'">
                <xsl:call-template name="IRS4868Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS4952'">
                <xsl:call-template name="IRS4952Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS4970'">
                <xsl:call-template name="IRS4970Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS4972'">
                <xsl:call-template name="IRS4972Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS499W2PR'">
                <xsl:call-template name="IRS499W2PRStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS5074'">
                <xsl:call-template name="IRS5074Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS5329'">
                <xsl:call-template name="IRS5329Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS5405'">
                <xsl:call-template name="IRS5405Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS5452'">
                <xsl:call-template name="IRS5452Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS5471ScheduleJ'">
                <xsl:call-template name="IRS5471ScheduleJStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS5471ScheduleM'">
                <xsl:call-template name="IRS5471ScheduleMStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS5471ScheduleN'">
                <xsl:call-template name="IRS5471ScheduleNStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS5471ScheduleO'">
                <xsl:call-template name="IRS5471ScheduleOStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS5471'">
                <xsl:call-template name="IRS5471Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS5472'">
                <xsl:call-template name="IRS5472Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS5695'">
                <xsl:call-template name="IRS5695Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS56'">
                <xsl:call-template name="IRS56Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS5713ScheduleA'">
                <xsl:call-template name="IRS5713ScheduleAStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS5713ScheduleB'">
                <xsl:call-template name="IRS5713ScheduleBStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS5713ScheduleC'">
                <xsl:call-template name="IRS5713ScheduleCStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS5713'">
                <xsl:call-template name="IRS5713Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS5735'">
                <xsl:call-template name="IRS5735Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS5884A'">
                <xsl:call-template name="IRS5884AStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS5884B'">
                <xsl:call-template name="IRS5884BStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS5884'">
                <xsl:call-template name="IRS5884Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS6197'">
                <xsl:call-template name="IRS6197Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS6198'">
                <xsl:call-template name="IRS6198Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS6251'">
                <xsl:call-template name="IRS6251Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS6252'">
                <xsl:call-template name="IRS6252Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS6478'">
                <xsl:call-template name="IRS6478Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS6627'">
                <xsl:call-template name="IRS6627Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS6765'">
                <xsl:call-template name="IRS6765Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS6781'">
                <xsl:call-template name="IRS6781Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS7004'">
                <xsl:call-template name="IRS7004Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS720'">
                <xsl:call-template name="IRS720Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8050'">
                <xsl:call-template name="IRS8050Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8082'">
                <xsl:call-template name="IRS8082Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8275R'">
                <xsl:call-template name="IRS8275RStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8275'">
                <xsl:call-template name="IRS8275Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8283'">
                <xsl:call-template name="IRS8283Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8302'">
                <xsl:call-template name="IRS8302Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8308'">
                <xsl:call-template name="IRS8308Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8379'">
                <xsl:call-template name="IRS8379Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8396'">
                <xsl:call-template name="IRS8396Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS851'">
                <xsl:call-template name="IRS851Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8582CR'">
                <xsl:call-template name="IRS8582CRStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8582'">
                <xsl:call-template name="IRS8582Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8586'">
                <xsl:call-template name="IRS8586Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8594'">
                <xsl:call-template name="IRS8594Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8606'">
                <xsl:call-template name="IRS8606Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8609A'">
                <xsl:call-template name="IRS8609AStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8611'">
                <xsl:call-template name="IRS8611Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8615'">
                <xsl:call-template name="IRS8615Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8621'">
                <xsl:call-template name="IRS8621Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8689'">
                <xsl:call-template name="IRS8689Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8697'">
                <xsl:call-template name="IRS8697Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8716'">
                <xsl:call-template name="IRS8716Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8801'">
                <xsl:call-template name="IRS8801Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8810'">
                <xsl:call-template name="IRS8810Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8812'">
                <xsl:call-template name="IRS8812Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8814'">
                <xsl:call-template name="IRS8814Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8815'">
                <xsl:call-template name="IRS8815Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8816'">
                <xsl:call-template name="IRS8816Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8820'">
                <xsl:call-template name="IRS8820Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8824'">
                <xsl:call-template name="IRS8824Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8825'">
                <xsl:call-template name="IRS8825Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8826'">
                <xsl:call-template name="IRS8826Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8827'">
                <xsl:call-template name="IRS8827Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8828'">
                <xsl:call-template name="IRS8828Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8829'">
                <xsl:call-template name="IRS8829Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8832'">
                <xsl:call-template name="IRS8832Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8833'">
                <xsl:call-template name="IRS8833Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8834'">
                <xsl:call-template name="IRS8834Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8835'">
                <xsl:call-template name="IRS8835Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8838'">
                <xsl:call-template name="IRS8838Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8839'">
                <xsl:call-template name="IRS8839Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8844'">
                <xsl:call-template name="IRS8844Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8845'">
                <xsl:call-template name="IRS8845Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8846'">
                <xsl:call-template name="IRS8846Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8847'">
                <xsl:call-template name="IRS8847Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8849Schedule1'">
                <xsl:call-template name="IRS8849Schedule1Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8849Schedule2'">
                <xsl:call-template name="IRS8849Schedule2Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8849Schedule3'">
                <xsl:call-template name="IRS8849Schedule3Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8849Schedule5'">
                <xsl:call-template name="IRS8849Schedule5Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8849Schedule6'">
                <xsl:call-template name="IRS8849Schedule6Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8849Schedule8'">
                <xsl:call-template name="IRS8849Schedule8Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8849'">
                <xsl:call-template name="IRS8849Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8853'">
                <xsl:call-template name="IRS8853Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8854'">
                <xsl:call-template name="IRS8854Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8858ScheduleM'">
                <xsl:call-template name="IRS8858ScheduleMStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8858'">
                <xsl:call-template name="IRS8858Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8859'">
                <xsl:call-template name="IRS8859Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8861'">
                <xsl:call-template name="IRS8861Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8862'">
                <xsl:call-template name="IRS8862Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8863'">
                <xsl:call-template name="IRS8863Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8864'">
                <xsl:call-template name="IRS8864Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8865ScheduleK1'">
                <xsl:call-template name="IRS8865ScheduleK1Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8865ScheduleO'">
                <xsl:call-template name="IRS8865ScheduleOStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8865ScheduleP'">
                <xsl:call-template name="IRS8865SchedulePStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8865'">
                <xsl:call-template name="IRS8865Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8866'">
                <xsl:call-template name="IRS8866Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8867'">
                <xsl:call-template name="IRS8867Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8868'">
                <xsl:call-template name="IRS8868Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8873'">
                <xsl:call-template name="IRS8873Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8874'">
                <xsl:call-template name="IRS8874Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8880'">
                <xsl:call-template name="IRS8880Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8881'">
                <xsl:call-template name="IRS8881Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8882'">
                <xsl:call-template name="IRS8882Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8883'">
                <xsl:call-template name="IRS8883Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8885'">
                <xsl:call-template name="IRS8885Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8886'">
                <xsl:call-template name="IRS8886Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8888'">
                <xsl:call-template name="IRS8888Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8889'">
                <xsl:call-template name="IRS8889Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8896'">
                <xsl:call-template name="IRS8896Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8900'">
                <xsl:call-template name="IRS8900Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8902'">
                <xsl:call-template name="IRS8902Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8903'">
                <xsl:call-template name="IRS8903Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8906'">
                <xsl:call-template name="IRS8906Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8907'">
                <xsl:call-template name="IRS8907Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8908'">
                <xsl:call-template name="IRS8908Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8909'">
                <xsl:call-template name="IRS8909Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8910'">
                <xsl:call-template name="IRS8910Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8911'">
                <xsl:call-template name="IRS8911Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8912'">
                <xsl:call-template name="IRS8912Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8913'">
                <xsl:call-template name="IRS8913Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8916A'">
                <xsl:call-template name="IRS8916AStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8916'">
                <xsl:call-template name="IRS8916Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8919'">
                <xsl:call-template name="IRS8919Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8923'">
                <xsl:call-template name="IRS8923Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8925'">
                <xsl:call-template name="IRS8925Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8926'">
                <xsl:call-template name="IRS8926Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8930'">
                <xsl:call-template name="IRS8930Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8931'">
                <xsl:call-template name="IRS8931Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8932'">
                <xsl:call-template name="IRS8932Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8933'">
                <xsl:call-template name="IRS8933Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8936'">
                <xsl:call-template name="IRS8936Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8938'">
                <xsl:call-template name="IRS8938Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8941'">
                <xsl:call-template name="IRS8941Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8949'">
                <xsl:call-template name="IRS8949Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS8958'">
                <xsl:call-template name="IRS8958Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS926'">
                <xsl:call-template name="IRS926Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS9465'">
                <xsl:call-template name="IRS9465Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS970'">
                <xsl:call-template name="IRS970Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS972'">
                <xsl:call-template name="IRS972Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS973'">
                <xsl:call-template name="IRS973Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS982'">
                <xsl:call-template name="IRS982Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS990EZ'">
                <xsl:call-template name="IRS990EZStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS990N'">
                <xsl:call-template name="IRS990NStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS990PF'">
                <xsl:call-template name="IRS990PFStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS990ScheduleA'">
                <xsl:call-template name="IRS990ScheduleAStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS990ScheduleB'">
                <xsl:call-template name="IRS990ScheduleBStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS990ScheduleC'">
                <xsl:call-template name="IRS990ScheduleCStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS990ScheduleD'">
                <xsl:call-template name="IRS990ScheduleDStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS990ScheduleE'">
                <xsl:call-template name="IRS990ScheduleEStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS990ScheduleF'">
                <xsl:call-template name="IRS990ScheduleFStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS990ScheduleG'">
                <xsl:call-template name="IRS990ScheduleGStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS990ScheduleH'">
                <xsl:call-template name="IRS990ScheduleHStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS990ScheduleI'">
                <xsl:call-template name="IRS990ScheduleIStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS990ScheduleJ'">
                <xsl:call-template name="IRS990ScheduleJStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS990ScheduleK'">
                <xsl:call-template name="IRS990ScheduleKStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS990ScheduleL'">
                <xsl:call-template name="IRS990ScheduleLStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS990ScheduleM'">
                <xsl:call-template name="IRS990ScheduleMStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS990ScheduleN'">
                <xsl:call-template name="IRS990ScheduleNStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS990ScheduleO'">
                <xsl:call-template name="IRS990ScheduleOStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS990ScheduleR'">
                <xsl:call-template name="IRS990ScheduleRStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRS990'">
                <xsl:call-template name="IRS990Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRSFormT'">
                <xsl:call-template name="IRSFormTStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRSW2AS'">
                <xsl:call-template name="IRSW2ASStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRSW2G'">
                <xsl:call-template name="IRSW2GStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRSW2GU'">
                <xsl:call-template name="IRSW2GUStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='IRSW2'">
                <xsl:call-template name="IRSW2Style"/>
              </xsl:when>
              <xsl:when test="@documentName='IRSW2VI'">
                <xsl:call-template name="IRSW2VIStyle"/>
              </xsl:when>
              <xsl:when test="@documentName='W2CM'">
                <xsl:call-template name="W2CMStyle"/>
              </xsl:when>
              <xsl:otherwise/>
            </xsl:choose>
          </xsl:for-each>
        </style>
      </head>
      <body/>
    </html>
  </xsl:template>
</xsl:stylesheet>
