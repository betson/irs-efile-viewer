<?xml version="1.0" encoding="UTF-8" ?>
<!--Created by David Chang 4-10-2007-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS6627Style.xsl"/>
  
  <xsl:output method="html" indent="yes" />
  <xsl:strip-space elements="*" />
  
  <xsl:param name="FormData" select="$RtnDoc/IRS6627" />
  
  <xsl:template match="/">
  
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title><xsl:call-template name="FormTitle"><xsl:with-param name="RootElement" select="local-name($FormData)"></xsl:with-param></xsl:call-template></title>
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="Cache-Control" content="no-cache" />
        <meta http-equiv="Expires" content="0" />
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private" />
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
        <meta name="Description" content="IRS Form 6627" />
    
  
        <xsl:call-template name="InitJS"></xsl:call-template>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"></script>
  
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS6627Style"></xsl:call-template>  
            <xsl:call-template name="AddOnStyle"></xsl:call-template>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form6627">
          <xsl:call-template name="DocumentHeader"></xsl:call-template>
          
          <!--Begin Form Header-->
          <div class="styBB" style="width:187mm;">
            <div class="styFNBox" style="width:31mm;height:21mm;padding-top:2mm;">
              <span class="styFormText" style="font-size:7pt;padding-top:5mm;">Form</span>      
              <span class="styFormText" style="font-size:7pt;width:1mm;"></span>      
              <span class="styFormNumber" style="font-size:20pt;font-weight:bold;">6627</span>      
              <br/>      
              <span class="styAgency" style="font-weight:normal;padding-top:1.5mm;">(Rev. January 2009)<br/> Department of the Treasury</span><br /><span class="styAgency" style="font-weight:normal;padding-top:1.5mm;">Internal Revenue Service</span>
            </div>
            
            <div class="styFTBox" style="width:125mm;height:21mm;padding-top:3mm">
              <div class="styMainTitle" style="height:8mm;">Environmental Taxes</div>
              <div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
                <span style="text-align:center;font-weight:bold">
                  <img src="{$ImagePath}/6627_Bullet_Md.gif" alt="MediumBullet"/> 
                  See instructions on page 3. <span class="styBoldText" ></span>
                </span>
              </div>
              <div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
                <span style="text-align:center;font-weight:bold">
                  <img src="{$ImagePath}/6627_Bullet_Md.gif" alt="MediumBullet"/> 
                  Attach to Form 720. <span class="styBoldText" > </span> 
                </span>
              </div>
            </div>
            
            <div class="styTYBox" style="width:31mm;height:21mm;padding-top:8mm;text-align:center;">
              OMB No. 1545-0245
            </div>
          </div>
          
          <!--Begin Name and EIN-->
          <div style="width:187mm;">
            <div class="styNameAddr" style="width:118mm;height:10mm;border-left-width:0px;padding-left:1px;font-size:7pt;">
              Name (as shown on Form 720)<br/>
              <div  style="margin-left:1mm;font-size:6.373pt;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                </xsl:call-template><br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
                </xsl:call-template><br/>
              </div>
            </div>
            <div class="styNameAddr" style="font-size:6.5pt;width:23mm;height:10mm;border-left-width:1px;padding-right:1mm;">
              Quarter ending
              <span style="width:3mm;clear:none"></span>
              <xsl:call-template name="PopulateMonthDayYear">
                <xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEnding"></xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styNameAddr" style="font-size:6.5pt;width:46mm;height:10mm;border-left-width:1px;border-bottom-width:1px black solid;padding-left:2mm;">
              Employer identification number		
              <span style="width:4mm"></span>
              <xsl:if test="($RtnHdrData/Filer/EIN)">
                <xsl:call-template name="PopulateReturnHeaderFiler">        	
                  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template> 
              </xsl:if>
              <xsl:if test="($RtnHdrData/Filer/SSN)">
                <xsl:call-template name="PopulateReturnHeaderFiler">        	
                  <xsl:with-param name="TargetNode">SSN</xsl:with-param>
                </xsl:call-template> 
              </xsl:if>
            </div>
          </div>
          
          <!--Begin Part I-->
          <div style="width:187mm">
            <table cellpadding="0" cellspacing="0" style="width:187mm;border-color:black;font-size:7pt">
              <tbody>
                <tr>
                  <th class="styTableCell" style="width:98mm;border-right-width:0px" scope="col">
                    <div class="styPartName">Part I</div>
                    <div class="styPartDesc" style="width:82mm;text-align:left">Tax on Petroleum</div>
                  </th>
                  <th class="styTableCell" style="width:31mm;font-weight:bold;text-align:center;border-left-width:1px">
                    (a)<br />Barrels
                  </th>
                  <th class="styTableCell" style="width:20mm;font-weight:bold;text-align:center" scope="col">
                    (b)<br />Rate
                  </th>
                  <th class="styTableCell" style="width:40mm:font-weight:bold;border-right-width:0;text-align:center" scope="col">
                    (c)<br />Tax
                  </th>
                </tr>
                <tr style="padding-top:1mm">
                  <td class="styTableCell" style="width:98mm;border-right-width:0px;text-align:left">
                    <div class="styLNLeftNumBoxSD" style="height:5mm;padding-top:1mm">1</div>
                    <div style="width:50mm;height:5mm;float:left;clear:none;padding-top:1mm">Crude oil received at a U.S. refinery</div>
                    <div class="styDotLn" style="width:28mm;height:5mm;clear:none;padding-top:1mm">.........</div>
                  </td>
                  <td class="styTableCell" style="width:31mm;border-left-width:1px;padding-right:1mm;text-align:left;padding-left:1mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/USRefineryBarrels"></xsl:with-param>
                    </xsl:call-template>
                  </td>
                  <td class="styTableCell" style="width:20mm;background-color:lightgrey;text-align:center"><span style="width:1px" /></td>
                  <td class="styTableCell" style="width:40mm;background-color:lightgrey"><span style="width:1px" /></td>
                </tr>
                <tr style="padding-top:1mm">
                  <td class="styTableCell" style="width:98mm;border-right-width:0px;text-align:left">
                    <div class="styLNLeftNumBoxSD" style="height:5mm;padding-top:1mm">2</div>
                    <div style="width:55mm;height:5mm;float:left;clear:none;padding-top:1mm">Crude oil taxed before receipt at refinery</div>
                    <div class="styDotLn" style="width:26mm;height:5mm;clear:none;padding-top:1mm;padding-left:3mm">.......</div>
                  </td>
                  <td class="styTableCell" style="width:31mm;border-left-width:1px;padding-right:1mm;text-align:left;padding-left:1mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/USRefineryBarrelsTaxed"></xsl:with-param>
                    </xsl:call-template>
                  </td>
                  <td class="styTableCell" style="width:20mm;background-color:lightgrey"><span style="width:1px" /></td>
                  <td class="styTableCell" style="width:40mm;background-color:lightgrey"><span style="width:1px" /></td>
                </tr>
                <tr>
                  <td  class="styTableCell" style="width:98mm;border-right-width:0px;text-align:left;padding-bottom:0.5mm">
                    <div class="styLNLeftNumBoxSD" style="height:8mm;padding-top:1mm">3</div>
                    <div style="width:87mm;height:8mm;float:left;clear:none;padding-top:1mm;text-align:justify">
                      Taxable crude oil. Subtract line 2 from line 1. Multiply column (a) by column (b) and enter the amount of tax in column (c)
                      <span style="letter-spacing:3.3mm;font-weight:bold;skiplink:display:none;padding-left:4mm">...</span>
                    </div>
                  </td>
                  <td class="styTableCell" style="width:31mm;border-left-width:1px;padding-right:1mm;padding-top:4mm;text-align:left;padding-left:1mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/TaxableCrudeOil/TaxableCrudeOilBBL"></xsl:with-param>
                    </xsl:call-template>
                  </td>
                  <td class="styTableCell" style="width:20mm;text-align:center;padding-top:4mm">
                    <span style="padding-left:2mm;float:left;clear:none">$</span>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/TaxableCrudeOil/TaxableCrudeOilRate"></xsl:with-param>
                    </xsl:call-template>
                    <span> bbl.</span>
                  </td>
                  <td class="styTableCell" style="width:40mm;padding-top:4mm;border-right-width:0">
                    <span style="float:left;clear:none;padding-left:2mm">$</span>
                    <span style="text-align:right;padding-right:1mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/TaxableCrudeOil/TaxableCrudeOilTax"></xsl:with-param>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td  class="styTableCell" style="width:98mm;border-right-width:0px;text-align:left">
                    <div class="styLNLeftNumBoxSD" style="height:12mm;padding-top:1mm">4</div>
                    <div style="width:87mm;height:12mm;float:left;clear:none;padding-top:1mm;text-align:justify">
                      Crude oil used in or exported from the U.S. before the tax was imposed. Multiply column (a) by column (b) and enter the amount of tax in column (c)
                      <span style="letter-spacing:3.3mm;font-weight:bold;skiplink:display:none;padding-left:4mm">...............</span>
                    </div>
                  </td>
                  <td class="styTableCell" style="width:31mm;border-left-width:1px;padding-right:1mm;padding-top:7mm;text-align:left;padding-left:1mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/USCrudeB4Tax/USCrudeB4TaxBBL"></xsl:with-param>
                    </xsl:call-template>
                  </td>
                  <td class="styTableCell" style="width:20mm;text-align:center;padding-top:7mm">
                    <span style="padding-left:2mm;float:left;clear:none">$</span>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/USCrudeB4Tax/USCrudeB4TaxRate"></xsl:with-param>
                    </xsl:call-template>
                    <span> bbl.</span>
                  </td>
                  <td class="styTableCell" style="width:40mm;padding-top:7mm;border-right-width:0">
                    <span style="float:left;clear:none;padding-left:2mm">$</span>
                    <span style="text-align:right;padding-right:1mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/USCrudeB4Tax/USCrudeB4TaxTax"></xsl:with-param>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td  class="styTableCell" style="width:98mm;border-right-width:0px;text-align:left">
                    <div class="styLNLeftNumBoxSD" style="height:12mm;padding-top:1mm">5</div>
                    <div style="width:87mm;height:12mm;float:left;clear:none;padding-top:1mm;text-align:justify">
                      Total domestic petroleum oil spill tax. Add lines 3 and 4, column (c). Enter the total here and on Form 720 on the line for <b>IRS No. 18</b>
                      <span style="letter-spacing:3.3mm;font-weight:bold;skiplink:display:none;padding-left:3.5mm;padding-right:2mm">..................</span>
                      <img src="{$ImagePath}/6627_Bullet_Md.gif" alt="MediumBullet"/>
                    </div>
                  </td>
                  <td class="styTableCell" style="width:31mm;border-left-width:1px;background-color:lightgrey"><span style="width:1px" /></td>
                  <td class="styTableCell" style="width:20mm;background-color:lightgrey"><span style="width:1px" /></td>
                  <td class="styTableCell" style="width:40mm;padding-top:7mm;border-right-width:0">
                    <span style="float:left;clear:none;padding-left:2mm">$</span>
                    <span style="text-align:right;padding-right:1mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/DomOilSpillTax"></xsl:with-param>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
                <tr>
                  <td  class="styTableCell" style="width:98mm;border-right-width:0px;text-align:left">
                    <div class="styLNLeftNumBoxSD" style="height:16mm;padding-top:1mm">6</div>
                    <div style="width:87mm;height:12mm;float:left;clear:none;padding-top:1mm;text-align:justify">
                      Imported petroleum products oil spill tax. Enter the number of barrels imported in column (a). Multiply column (a) by column (b) and enter the amount of tax in column (c). Also enter the amount
                    </div>
                    <div style="width:87mm;height:4mm;float:left;clear:none;text-align:left">
                      on Form 720 on the line for <b>IRS No. 21</b>
                      <span style="letter-spacing:3.3mm;font-weight:bold;skiplink:display:none;padding-left:4.3mm;padding-right:2mm">......</span>
                      <img src="{$ImagePath}/6627_Bullet_Md.gif" alt="MediumBullet"/>
                    </div>
                  </td>
                  <td class="styTableCell" style="width:31mm;border-left-width:1px;padding-right:1mm;padding-top:10mm;text-align:left;padding-left:1mm">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$FormData/ImprtOilSpillTax/ImprtOilSpillTaxBBL"></xsl:with-param>
                    </xsl:call-template>
                  </td>
                  <td class="styTableCell" style="width:20mm;text-align:center;padding-top:10mm">
                    <span style="padding-left:2mm;float:left;clear:none">$</span>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$FormData/ImprtOilSpillTax/ImprtOilSpillTaxRate"></xsl:with-param>
                    </xsl:call-template>
                    <span> bbl.</span>
                  </td>
                  <td class="styTableCell" style="width:40mm;padding-top:10mm;border-right-width:0">
                    <span style="float:left;clear:none;padding-left:2mm">$</span>
                    <span style="text-align:right;padding-right:1mm">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/ImprtOilSpillTax/ImprtOilSpillTaxTax"></xsl:with-param>
                      </xsl:call-template>
                    </span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
  
  
          <!--Begin Part II-->
          
          <!--Part II Title-->
          <div class="styBB" style="width:187mm;border-top:1px black;height=8mm;">
            <div class="styLNDesc" style="width:187mm;height:8mm;font-size:8pt;font-weight:bold;padding-top:2mm;">
              <span style="width=1px;color:black;background-color:black;">.</span>
              <span style="width=12mm;color:white;background-color:black;text-align:right;float:inherit;margin:0;">Part II</span>
              <span style="width=1px;color:black;background-color:black;">.</span>
              <span style="width=160mm ;text-align:center;font-size:8pt;padding-right:50mm;">Tax on Ozone-Depleting Chemicals (ODCs), IRS No. 98</span>
            </div>      
          </div>
          
          <!--Part II Elections Instructions-->
          <div class="styLNDesc" style="width:187mm;height:4.5mm;font-size:7pt">
            <span class="styText" style="font-weight:bold;" >
              Elections. 
            </span>
            <span style="width:1mm;clear:none"></span>
            <span class="styText"   >
              If you elect to report the tax on post-1989 ODCs at the time you sell or use a mixture containing such chemicals instead of<br/>
              when you make the mixture, check the box (the 1990 election)
            </span>
            <!--Dotted Line-->
            <span class="styBoldText">
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
            </span>
            <span class="styBoldText" style="padding-left:2.8mm;"><img src="{$ImagePath}/6627_Bullet_Md.gif" alt="MediumBullet"/> 
            </span>     
            <span style="width:3mm;clear:none"></span>
            <input type="checkbox" class="styCkbox" style="padding-left:4mm;">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/Election1990" />
                <xsl:with-param name="BackupName"></xsl:with-param>
              </xsl:call-template>
            </input>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$FormData/Election1990" />
                <xsl:with-param name="BackupName"></xsl:with-param>
              </xsl:call-template>
            </label>
          </div>
          
          <div class="styLNDesc" style="width:187mm;height:4.5mm;font-size:7pt">
            <span style="width:12mm;" >
            </span>
            <span class="styText"   >
              If you elect to report the tax on post-1990 ODCs at the time you sell or use a mixture containing such chemicals instead of when<br/>
              you make the mixture, check the box (the 1991 election)
            </span>
            <!--Dotted Line-->
            <span class="styBoldText">
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
              <span style="width:16px"></span>.
            </span>
            <span class="styBoldText" style="padding-left:4.5mm;"><img src="{$ImagePath}/6627_Bullet_Md.gif" alt="MediumBullet"/> 
            </span>     
            <span style="width:3mm;clear:none"></span>
            <input type="checkbox" class="styCkbox" style="padding-left:5.5mm;">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/Election1991" />
                <xsl:with-param name="BackupName"></xsl:with-param>
              </xsl:call-template>
            </input>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$FormData/Election1991" />
                <xsl:with-param name="BackupName"></xsl:with-param>
              </xsl:call-template>
            </label>
            <span style="width:1mm;clear:none"></span>
            <!-- button display logic -->
            <xsl:call-template name="SetDynamicTableToggleButton" >
              <xsl:with-param name="TargetNode" select="$FormData/IRS98"/>
              <xsl:with-param name="containerHeight" select="3"/>
              <xsl:with-param name="containerID" select=" 'PSOctn' "/>
            </xsl:call-template>
            <!-- end button display logic -->
          </div>
          
          <!--Part II Table-->
          <div class="styTableContainer" style="height:25.5mm;" id="PSOctn">
            <xsl:call-template name="SetInitialState"/>
            <table style="font-size:7pt;border-collapse:collapse;">
              <tbody>
                <tr>
                  <th colspan= "2" style="width=64mm;height:12mm;font-size:8pt;border-top:1px black solid;">
                    (a)<br/>ODC<br/>
                  </th>
                  <th style="width=33mm;height:12mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;" scope="col">(b) <br/>Number of pounds<br/></th>
                  <th style="width=45mm;height:12mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;" scope="col">(c) <br/>Tax per pound<br/>(see Part II instructions)<br/></th>
                  <th style="width=45mm;height:12mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;" scope="col">(d) <br/>Tax (multiply column (b) <br/>by column (c))<br/>
                  </th>
                </tr>
                <xsl:if test="($Print != $Separated) or (count($FormData/IRS98) &lt;= 3)" > 
                  <xsl:for-each select="$FormData/IRS98">
                    <tr>
                      <td style="height:8mm;width:6mm;text-align:center;font-weight=bold;border-bottom:1px black solid;border-top:1px black solid">
                        <xsl:value-of select="position()">
                        </xsl:value-of>
                      </td>
                      <td  style="height:8mm;width:58mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid">
                        <span style="clear:none;">   
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="IRS98ODC"></xsl:with-param>
                          </xsl:call-template> 
                        </span>
                      </td>
                      <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;padding-top:5mm;text-align:right;">
                        <span style="clear:none">   
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="IRS98NbrPounds"></xsl:with-param>
                          </xsl:call-template> 
                        </span>
                      </td>
                      <td style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:1px;">
                        <span style="width:0.5mm;clear:none;"></span>
                        <span style="height:8mm;width:2mm;text-align:left;padding-top:4.5mm;padding-right:4mm;"></span>
                        <span style="width:0.5mm;clear:none;"></span>
                        <span style="height:8mm;width:35mm;padding-top:5mm;text-align:right;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="IRS98TaxPerPound"></xsl:with-param>
                          </xsl:call-template> 
                        </span>
                      </td>
                      <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                        <span style="height:8mm;width:2mm;text-align:left;padding-top:5mm;padding-right:4mm;"></span>
                        <span style="width:36mm;padding-top:5mm;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="IRS98Tax"></xsl:with-param>
                          </xsl:call-template> 
                        </span>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--empty lines-->
                
                <xsl:if test="(count($FormData/IRS98) = 0) or ( (count($FormData/IRS98) &gt; 3) and ($Print = $Separated) )" >
                  <tr>
                    <td style="height:8mm;width:6mm;text-align:center;font-weight=bold;border-bottom:1px black solid;border-top:1px black solid">
                      <xsl:value-of select="1">
                      </xsl:value-of>
                    </td>
                    <td  style="height:8mm;width:58mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid;padding-top:5mm;">
                      <xsl:if test="((count($FormData/IRS98) &gt;3) and ($Print = $Separated))">
                        <span style="font-size:7pt">
                          <xsl:call-template name="PopulateAdditionalDataTableMessage">
                            <xsl:with-param name="TargetNode" select="$FormData/IRS98"/>
                          </xsl:call-template>
                        </span>
                      </xsl:if>  												
                    </td>
                    <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;padding-top:5mm;text-align:right;"></td>
                    <td style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:1px;"></td>
                    <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;"></td>
                  </tr>
                </xsl:if>
                <xsl:if test="(count($FormData/IRS98) &lt; 2) or ( (count($FormData/IRS98) &gt; 3) and ($Print = $Separated) )" >
                  <tr>
                    <td style="height:8mm;width:6mm;text-align:center;font-weight=bold;border-bottom:1px black solid;border-top:1px black solid">
                      <xsl:value-of select="2">
                      </xsl:value-of>
                    </td>
                    <td  style="height:8mm;width:58mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid;padding-top:5mm;"></td>
                    <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;padding-top:5mm;text-align:right;"></td>
                    <td style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:1px;"></td>
                    <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;"></td>
                  </tr>
                </xsl:if>
                <xsl:if test="(count($FormData/IRS98) &lt; 3) or ( (count($FormData/IRS98) &gt; 3) and ($Print = $Separated) )" >
                  <tr>
                    <td style="height:8mm;width:6mm;text-align:center;font-weight=bold;border-bottom:1px black solid;border-top:1px black solid">
                      <xsl:value-of select="3">
                      </xsl:value-of>
                    </td>
                    <td  style="height:8mm;width:58mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid;padding-top:5mm;"></td>
                    <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;padding-top:5mm;text-align:right;"></td>
                    <td style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:1px;"></td>
                    <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;"></td>
                  </tr>
                </xsl:if>
                <!--sum-->
                <tr>
                  <td style="height:8mm;width:6mm;text-align:center;font-weight=bold;border-bottom:1px black solid;border-top:1px black solid;padding-bottom:3.5mm;">
                    <xsl:if test="(count($FormData/IRS98) &lt; 4) or ($Print = $Separated)" >
                      <xsl:value-of select="4">
                      </xsl:value-of>
                    </xsl:if>
                    <xsl:if test="(count($FormData/IRS98) &gt;= 4) and  ($Print != $Separated)" >
                      <xsl:value-of select="count($FormData/IRS98) +1">
                      </xsl:value-of>
                    </xsl:if>
                  </td>
                  <td  colspan="3" style="height:8mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid;">	
                    <span style="font-weight:bold;">Total ozone-depleting chemicals tax.</span>
                    <span style="width:3px;clear:none;"></span>
                    <span style="clear:none;font-weight:normal;">Add all amounts in column (d), include amounts from any<br/>additional sheets. Enter the total here and on Form 720 on the line for</span>
                    <span style="width:4px;clear:none;"></span>
                    <span style="font-weight:bold;">IRS No. 98</span>
                    <span class="styBoldText">
                      <span style="width:16px"></span>.
                      <span style="width:16px"></span>.
                    </span>
                    <span style="width:4px;clear:none"></span>
                    <span class="styBoldText" style="padding-left:5.5mm;"><img src="{$ImagePath}/6627_Bullet_Md.gif" alt="MediumBullet"/> 
                    </span>     
                  </td>
                  <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="width:1mm;clear:none;"></span>
                    <span style="height:8mm;width:2mm;text-align:bottom;padding-top:4mm;padding-right:4mm;">$</span>
                    <span style="width:36mm;height:8mm;padding-top:5mm;">
                      <xsl:choose>
                        <xsl:when test="(count($FormData/IRS98) = 0) or (($Print = $Separated) and (count($FormData/IRS98) &gt; 3))">
                          <span style="width:1px" />
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/IRS98ODCTotalTax"></xsl:with-param>
                          </xsl:call-template>
                        </xsl:otherwise>
                      </xsl:choose>
                    </span>
                  </td>
                </tr>
              </tbody>
            </table>
            <!-- Set Initial Height of Above Table -->
            <xsl:call-template name="SetInitialDynamicTableHeight">
              <xsl:with-param name="TargetNode" select="$FormData/IRS98"/>
              <xsl:with-param name="containerHeight" select="3"/>
              <xsl:with-param name="containerID" select=" 'PSOctn' "/>
            </xsl:call-template>
            <!-- End Set Initial Height of Above Table -->
          </div>      
  
          
          <!--Begin Page 1 Footer-->
          <div  style="width:187mm">
            <span style="width:105mm;font-weight:bold;text-align:left;font-size:6pt;"> 
              For Privacy Act and Paperwork Reduction Act Notice, see Form 720 instructions.
            </span>
            <span style="width:10mm;"></span>  
            <span style="width:19mm;font-weight:normal;font-size:6pt;">
            Cat. No. 43490I</span> 
            <span style="width:19mm;"></span>  
            <span style="text-align:right;width:7mm;font-weight:normal;font-size:6pt;">
            Form</span> 
            <span style="width:1mm;"></span>  
            <span style="text-align:center;width:7mm;font-weight:bold;font-size:7pt;">
            6627</span> 
            <span style="text-align:right;width:18mm;font-weight:normal;font-size:6pt;padding-right:1mm;">
            (Rev. 1-2009)</span> 
          </div>
          <br class="pageEnd"/>
  
          <!--Begin Page 2-->
  
          <!--Page to Header-->
          <div  style="width:187mm;border-bottom:1px black solid;">
            <span style="width:104mm;font-weight:normal;text-align:left;font-size:7pt;"> 
              Form 6627 (Rev. 1-2009)
            </span>
            <span style="width:5mm;"></span>  
            <span style="width:18mm;font-weight:normal;font-size:7pt;">
            </span> 
            <span style="width:7mm;"></span>  
            <span style="text-align:right;width:20mm;font-weight:bold;font-size:7pt;"></span> 
            <span style="text-align:right;width:30mm;font-weight:normal;font-size:7pt;">
              Page
            </span> 
            <span style="width:4px"></span> 
            <span style="text-align:right;width:1mm;font-weight:bold;font-size:7pt;">
              2
            </span> 
          </div>
  
  
          <!--Begin Part III-->
          <div class="styBB" style="width:187mm;height:8mm">
            <div class="styPartName" style="margin-top:2mm;margin-bottom:2mm">Part III</div>
            <div class="styPartDesc" style="padding-top:2mm">
              ODC Tax on Imported Products, IRS No. 19
            </div>
          </div>
          
          <!--Part III Explanation-->
          <div class="styBB" style="width:187mm">
            <div style="float:right;clear:none;padding-top:2mm">
              <!-- button display logic -->
              <xsl:call-template name="SetDynamicTableToggleButton" >
              <xsl:with-param name="TargetNode" select="$FormData/IRS19"/>
              <xsl:with-param name="containerHeight" select="3"/>
              <xsl:with-param name="containerID" select=" 'ODC19ctn' "/>
              </xsl:call-template>
              <!-- end button display logic -->
            </div>
            Election. If you elect to report the tax on imported products at the time you import the products instead of when you sell or use<br />
            the products, check this box <span class="styDotLn" style="float:none;padding-left:2mm;padding-right:0.5mm">..................................</span>
            <input type="checkbox" class="styCkbox">
             <xsl:call-template name="PopulateCheckbox">
               <xsl:with-param name="TargetNode" select="$FormData/IRS19Election" />
               <xsl:with-param name="BackupName">IRS6627IRS19Election</xsl:with-param>
             </xsl:call-template>
           </input>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$FormData/IRS19Election" />
                <xsl:with-param name="BackupName">IRS6627IRS19Election</xsl:with-param>
              </xsl:call-template>
            </label>
          </div>
          
          <!--Part III Table-->
          <div class="styTableContainer" style="height:25.5mm;" id="ODC19ctn">
            <!-- print logic -->
            <xsl:call-template name="SetInitialState"/>
            <table class="styTable" cellspacing="0" cellpadding="0">
              <tbody>
                <tr style="height:12mm">
                  <th class="styTableCellHeader" style="width:58mm;font-weight:bold;border-color:black" scope="col">(a)<br />Imported product and the<br />applicable ODC</th>
                  <th class="styTableCellHeader" style="width:23mm;font-weight:bold;border-color:black" scope="col">(b)<br />Number of<br />products</th>
                  <th class="styTableCellHeader" style="width:26mm;font-weight:bold;border-color:black" scope="col">(c)<br />ODC weight of<br />product</th>
                  <th class="styTableCellHeader" style="width:26mm;font-weight:bold;border-color:black" scope="col">(d)<br />Tax per pound</th>
                  <th class="styTableCellHeader" style="width:26mm;font-weight:bold;border-color:black" scope="col">(e)<br />Entry value</th>
                  <th class="styTableCellHeader" style="width:28mm;font-weight:bold;border-color:black;border-right-width:0px" scope="col">(f)<br />Tax<br />(see Part III instructions)</th>
                </tr>
                <!--If inline print or if there is 3 or less rows of data-->
                <xsl:if test="($Print != $Separated) or (count($FormData/IRS19) &lt;= 3)">
                  <xsl:for-each select="$FormData/IRS19">
                    <tr style="height:8mm">
                      <td class="styTableCellText" style="width:58mm;border-color:black">
                        <div style="width:4mm;font-weight:bold;padding-top:2mm;padding:left:1mm;float:left;clear:none;font-size:7pt;text-align:center">
                          <xsl:value-of select="position()"></xsl:value-of>
                        </div>
                        <div style="float:left;clear:none">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="IRS19ProdODC"></xsl:with-param>
                          </xsl:call-template>
                        </div>
                      </td>
                      <td class="styTableCell" style="width:23mm;border-color:black;padding-right:1mm;padding-top:4mm">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IRS19NbrProd"></xsl:with-param>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm;padding-top:4mm">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IRS19ODCWt"></xsl:with-param>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm;padding-top:4mm">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IRS19TaxPerPound"></xsl:with-param>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm;padding-top:4mm">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IRS19EntryValue"></xsl:with-param>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="width:28mm;border-color:black;border-right-width:0px;padding-right:1mm;padding-top:4mm">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IRS19Tax"></xsl:with-param>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--Print blank row or see additional data message-->
                <xsl:if test="(count($FormData/IRS19) = 0) or ( (count($FormData/IRS19) &gt; 3) and ($Print = $Separated) )">
                  <tr style="height:8mm">
                    <td class="styTableCellText" style="width:58mm;border-color:black">
                      <div style="width:4mm;font-weight:bold;padding-top:2mm;padding:left:1mm;float:left;clear:none;font-size:7pt;text-align:center">1</div>
                      <div style="float:left;clear:none;padding-top:2mm">
                        <xsl:if test="((count($FormData/IRS19) &gt;3) and ($Print = $Separated))">
                          <span style="font-size:7pt">
                            <xsl:call-template name="PopulateAdditionalDataTableMessage">
                              <xsl:with-param name="TargetNode" select="$FormData/IRS19"/>
                            </xsl:call-template>
                          </span>
                        </xsl:if>
                        <span style="width:1px" />
                      </div>
                    </td>
                    <td class="styTableCell" style="width:23mm;font-weight:bold;border-color:black;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:28mm;border-color:black;border-right-width:0px;padding-right:1mm"><span style="width:1px" /></td>
                  </tr>
                </xsl:if>
                <xsl:if test="(count($FormData/IRS19) &lt; 2) or ( (count($FormData/IRS19) &gt; 3) and ($Print = $Separated) )">
                  <tr style="height:8mm">
                    <td class="styTableCellText" style="width:58mm;border-color:black">
                      <div style="width:4mm;font-weight:bold;padding-top:2mm;padding:left:1mm;float:left;clear:none;font-size:7pt;text-align:center">2</div>
                      <div style="float:left;clear:none">
                        <span style="width:1px" />
                      </div>
                    </td>
                    <td class="styTableCell" style="width:23mm;font-weight:bold;border-color:black;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:28mm;border-color:black;border-right-width:0px;padding-right:1mm"><span style="width:1px" /></td>
                  </tr>
                </xsl:if>
                <xsl:if test="(count($FormData/IRS19) &lt; 3) or ( (count($FormData/IRS19) &gt; 3) and ($Print = $Separated) )">
                  <tr style="height:8mm">
                    <td class="styTableCellText" style="width:58mm;border-color:black">
                      <div style="width:4mm;font-weight:bold;padding-top:2mm;padding:left:1mm;float:left;clear:none;font-size:7pt;text-align:center">3</div>
                      <div style="float:left;clear:none">
                        <span style="width:1px" />
                      </div>
                    </td>
                    <td class="styTableCell" style="width:23mm;font-weight:bold;border-color:black;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:28mm;border-color:black;border-right-width:0px;padding-right:1mm"><span style="width:1px" /></td>
                  </tr>
                </xsl:if>
                <tr style="height:8mm">
                  <td class="styTableCellText" colspan="5" style="width:159mm;font-size:7pt;border-color:black;border-bottom-width:0">
                    <xsl:choose>
                      <xsl:when test="($Print != $Separated) and (count($FormData/IRS19) &gt; 3)">
                        <div style="width:4mm;font-size:7pt;text-align:center;font-weight:bold;padding-bottom:2mm;padding:left:1mm;float:left;clear:none">
                          <xsl:value-of select="(count($FormData/IRS19) + 1)"></xsl:value-of>
                        </div>
                      </xsl:when>
                      <xsl:otherwise>
                        <div style="width:4mm;font-size:7pt;text-align:center;font-weight:bold;padding-bottom:2mm;padding:left:1mm;float:left;clear:none">4</div>
                      </xsl:otherwise>
                    </xsl:choose>
                    <div style="float:left;clear:none">
                      <b>Total ODC tax on imported products.</b> Add all amounts in column (f), include amounts from any
                      additional sheets. Enter the total here and on Form 720 on the line for <b>IRS No. 19</b>
                      <span class="styDotLn" style="float:none;padding-left:2mm;padding-right:0.5mm">...............</span>
                      <img src="{$ImagePath}/6627_Bullet_Md.gif" alt="MediumBullet"/>
                    </div>
                  </td>
                  <td class="styTableCell" style="width:28mm;border-color:black;border-right-width:0;border-bottom-width:0;padding-right:1mm">
                    <div style="width:2mm;float:left;clear:none;font-size:7pt;padding-top:3.5mm">$</div>
                    <div style="width:26mm;float:left;clear:none;padding-left:1mm;padding-right:0.3mm;padding-top:4mm">
                      <xsl:choose>
                        <xsl:when test="(count($FormData/IRS19) = 0) or (($Print = $Separated) and (count($FormData/IRS19) &gt; 3))">
                          <span style="width:1px" />
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/IRS19ODCTotalTax"></xsl:with-param>
                          </xsl:call-template>
                        </xsl:otherwise>
                      </xsl:choose>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          
          <!-- Set Initial Height of Above Table -->
          <xsl:call-template name="SetInitialDynamicTableHeight">
          	<xsl:with-param name="TargetNode" select="$FormData/IRS19"/>
          	<xsl:with-param name="containerHeight" select="3"/>
          	<xsl:with-param name="containerID" select=" 'ODC19ctn' "/>
          </xsl:call-template>
          <!-- End Set Initial Height of Above Table -->
  
  
          <!--BEGIN PART IV-->
          
          <!--Part IV Header-->
          <div class="styBB" style="width:187mm;border-top:1px black;height:8mm;">
            <div class="styLNDesc" style="width:187mm;height:8mm;font-size:8pt;font-weight:bold;padding-top:2mm;">
              <span style="width=1px;color:black;background-color:black;">.</span>
              <span style="width=12mm;color:white;background-color:black;text-align:right;float:inherit;margin:0;">Part IV</span>
              <span style="width=1px;color:black;background-color:black;">.</span>
              <span style="width=155mm ;text-align:center;font-size:8pt;padding-right:68.5mm;">Tax on Floor Stocks of  ODCs, IRS No. 20</span>
              <span style="width:13.4mm;clear:none;"></span>
              <span style="padding-top:8mm;">
                <!-- button display logic -->
                <xsl:call-template name="SetDynamicTableToggleButton" >
                <xsl:with-param name="TargetNode" select="$FormData/IRS20"/>
                <xsl:with-param name="containerHeight" select="3"/>
                <xsl:with-param name="containerID" select=" 'PSOctn3' "/>
                </xsl:call-template>
                <!-- end button display logic -->
              </span>
            </div>      
          </div>
              
          <!--Part IV Table-->
          <div class="styTableContainer" id="PSOctn3">
            <xsl:call-template name="SetInitialState"/>
            <table style="font-size:7pt;border-collapse:collapse;">
              <tbody>
                <tr>							
                  <th colspan= "2" style="width:64mm;height:12mm;font-size:8pt;border-top:1px black solid;">
                    (a)<br/>ODC<br/>
                  </th>
                  <th style="width:33mm;height:12mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;" scope="col">(b) <br/>Number of pounds<br/></th>
                  <th style="width:45mm;height:12mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;" scope="col">(c) <br/>Tax per pound<br/>(see Part IV instructions)<br/></th>
                  <th style="width:45mm;height:12mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;" scope="col">(d) <br/>Tax (multiply column (b) <br/>by column (c))<br/></th>
                </tr>
                <xsl:if test="($Print != $Separated) or (count($FormData/IRS20) &lt;= 3)"> 
                  <xsl:for-each select="$FormData/IRS20">
                    <tr>
                      <td style="height:8mm;width:6mm;text-align:center;font-weight:bold;border-bottom:1px black solid;border-top:1px black solid">
                        <xsl:value-of select="position()">
                        </xsl:value-of>
                      </td>
                      <td  style="height:8mm;width:58mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid">
                        <span style="clear:none;">   
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="IRS20ODC"></xsl:with-param>
                          </xsl:call-template> 
                        </span>
                      </td>
                      <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;padding-top:5mm;text-align:right;">        
                        <span style="clear:none">           
                          <xsl:call-template name="PopulateAmount">       
                            <xsl:with-param name="TargetNode" select="IRS20NbrPounds"></xsl:with-param>
                          </xsl:call-template> 
                        </span>        	
                      </td>       
                      <td style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:1px;">        
                        <span style="width:0.5mm;clear:none;"></span>
                        <span style="height:8mm;width:2mm;text-align:left;padding-top:4.5mm;padding-right:4mm;"></span>
                        <span style="width:0.5mm;clear:none;"></span>        
                        <span style="height:8mm;width:35mm;padding-top:5mm;text-align:right;">       
                          <xsl:call-template name="PopulateAmount">        
                            <xsl:with-param name="TargetNode" select="IRS20TaxPerPound"></xsl:with-param>
                          </xsl:call-template>        
                        </span>       
                      </td>       		        
                      <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">       
                        <span style="height:8mm;width:2mm;text-align:left;padding-top:5mm;padding-right:4mm;"></span>       
                        <span style="width:36mm;padding-top:5mm;">              
                          <xsl:call-template name="PopulateAmount">                 
                            <xsl:with-param name="TargetNode" select="IRS20Tax"></xsl:with-param>
                          </xsl:call-template>                   
                        </span>
                      </td>     
                    </tr>       
                  </xsl:for-each>
                </xsl:if>
                <!-- empty lines-->       
                <xsl:if test="(count($FormData/IRS20) &lt; 1) or ( (count($FormData/IRS20) &gt; 3) and ($Print = $Separated) )">
                  <tr>
                    <td style="height:8mm;width:6mm;text-align:center;font-weight=bold;border-bottom:1px black solid;border-top:1px black solid">1</td>
                    <td  style="height:8mm;width:58mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid;padding-top:5mm;">
                      <xsl:if test="((count($FormData/IRS20) &gt;3) and ($Print = $Separated))">
                        <span style="font-size:7pt">
                          <xsl:call-template name="PopulateAdditionalDataTableMessage">
                            <xsl:with-param name="TargetNode" select="$FormData/IRS20"/>
                          </xsl:call-template>
                        </span>
                      </xsl:if>  										
                    </td>
                    <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;padding-top:5mm;text-align:right;"></td>           
                    <td style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:1px;"></td>             
                    <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;"></td>       
                  </tr>     
                </xsl:if>
                <xsl:if test="(count($FormData/IRS20) &lt; 2) or ( (count($FormData/IRS20) &gt; 3) and ($Print = $Separated) )">
                  <tr>
                    <td style="height:8mm;width:6mm;text-align:center;font-weight=bold;border-bottom:1px black solid;border-top:1px black solid">2</td>
                    <td  style="height:8mm;width:58mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid;padding-top:5mm;"></td>
                    <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;padding-top:5mm;text-align:right;"></td>
                    <td style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:1px;"></td>
                    <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;"></td> 
                  </tr>
                </xsl:if>
                <xsl:if test="(count($FormData/IRS20) &lt; 3) or ( (count($FormData/IRS20) &gt; 3) and ($Print = $Separated) )" >
                  <tr>
                    <td style="height:8mm;width:6mm;text-align:center;font-weight=bold;border-bottom:1px black solid;border-top:1px black solid">3</td>
                    <td  style="height:8mm;width:58mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid;padding-top:5mm;"></td>
                    <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;padding-top:5mm;text-align:right;"></td>
                    <td style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:1px;"></td>
                    <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;"></td>
                  </tr>
                </xsl:if>
                <!--END empty lines-->
                <tr>
                  <td style="height:8mm;width:6mm;text-align:center;font-weight=bold;border-bottom:1px black solid;border-top:1px black solid;padding-bottom:3.5mm;">
                    <xsl:if test="(count($FormData/IRS20) &lt; 4) or ($Print = $Separated)" >
                      <xsl:value-of select="4">
                      </xsl:value-of>
                    </xsl:if>
                    <xsl:if test="(count($FormData/IRS20) &gt;= 4) and  ($Print != $Separated)" >
                      <xsl:value-of select="count($FormData/IRS20) +1">
                      </xsl:value-of>
                    </xsl:if>
                  </td>
                  <td  colspan="3" style="height:8mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid;">	
                    <span style="font-weight:bold;">Total floor stocks tax.</span>
                    <span style="width:3px;clear:none;"></span>
                    <span style="clear:none;font-weight:normal;">Add all amounts in column (d), include amounts from any additional <br/>sheets. Enter the total here and on Form 720 on the line for</span>
                    <span style="width:4px;clear:none;"></span>
                    <span style="font-weight:bold;">IRS No. 20</span>
                    <span class="styBoldText">
                      <span style="width:16px"></span>.
                      <span style="width:16px"></span>.
                      <span style="width:16px"></span>.
                      <span style="width:16px"></span>.
                    </span>
                    <span style="width:4px;clear:none"></span>
                    <span class="styBoldText" style="padding-left:5.5mm;"><img src="{$ImagePath}/6627_Bullet_Md.gif" alt="MediumBullet"/> 
                    </span>     
                  </td>
                  <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="width:1mm;clear:none;"></span>
                    <span style="height:8mm;width:2mm;text-align:bottom;padding-top:5mm;padding-right:4mm;">$</span>
                    <span style="width:36mm;height:8mm;padding-top:5mm;">
                      <xsl:choose>
                        <xsl:when test="(count($FormData/IRS20) = 0) or (($Print = $Separated) and (count($FormData/IRS20) &gt; 3))">
                          <span style="width:1px" />
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/IRS20FloorStkTotalTax"></xsl:with-param>
                          </xsl:call-template>
                        </xsl:otherwise>
                      </xsl:choose>
                    </span>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>      
          
          <!-- Set Initial Height of Above Table -->
          <xsl:call-template name="SetInitialDynamicTableHeight">
          <xsl:with-param name="TargetNode" select="$FormData/IRS20"/>
          <xsl:with-param name="containerHeight" select="3"/>
          <xsl:with-param name="containerID" select=" 'PSOctn3' "/>
          </xsl:call-template>
          <!-- End Set Initial Height of Above Table -->
          
          <!--END Part IVTable-->
       
          <div  style="width:187mm">  
            <span style="width:104mm;font-weight:bold;text-align:left;font-size:6pt;">   
            </span>
            <span style="width:5mm;"></span>      
            <span style="width:25mm;font-weight:normal;font-size:6pt;">
            </span>   
            <span style="width:21mm;"></span>      
            <span style="text-align:right;width:7mm;font-weight:normal;font-size:6pt;">
            Form</span> 
            <span style="text-align:center;width:7mm;font-weight:bold;font-size:7pt;">
            6627</span> 
            <span style="text-align:right;width:18mm;font-weight:normal;font-size:6pt;padding-right:1mm;">
            (Rev. 1-2009</span>       
          </div>
          <br class="pageEnd"/>
            
    	  <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData">
            <div class="styLeftOverTitle">
              Additional Data        
            </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" TabIndex="1"  type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>      
          </div>
          <!-- Additional Data Table -->
  
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$FormData" />
              <xsl:with-param name="DescWidth" select="100"/>
            </xsl:call-template>          
          </table>
  
          <!--Begin Table Part I-->
          
          <xsl:if test="(count($FormData/IRS98) &gt; 3 and ($Print = $Separated))" >
            <div style="width:187mm;">
              <div class="styLNDesc" style="width:187mm;height:4mm;">    
                <span class="styText" style="font-weight:bold"  >
                  Form 6627, Part II, Tax on Ozone-Depleting Chemicals (ODCs),  IRS No. 98
                </span>
              </div>
              <table class="styDepTbl" style="font-size:7pt;border-collapse:collapse;">
                <thead class="styTableThead">
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell" colspan= "2" style="width=64mm;height:12mm;font-size:8pt;border-top:1px black solid;" scope="col">(a)<br/>ODC<br/></th>
                    <th class="styDepTblCell" style="width=33mm;height:12mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;" scope="col">(b) <br/>Number of pounds<br/></th>
                    <th class="styDepTblCell" style="width=45mm;height:12mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;" scope="col">(c) <br/>Tax per pound<br/>(see Part II instructions)<br/></th>
                    <th class="styDepTblCell" style="width=45mm;height:12mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;" scope="col">(d) <br/>Tax (multiply column (b) <br/>by column (c))<br/>
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="$FormData/IRS98">
                    <tr>
                      <xsl:attribute name="class">
                        <xsl:choose>
                          <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                          <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                        </xsl:choose>
                      </xsl:attribute>
                      <td style="height:8mm;width:6mm;text-align:center;font-weight=bold;border-bottom:1px black solid;border-top:1px black solid;padding-top:5mm;">
                        <xsl:value-of select="position()">
                        </xsl:value-of>
                      </td>
                      <td  style="height:8mm;width:58mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid">
                        <span style="clear:none;">   
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="IRS98ODC"></xsl:with-param>
                          </xsl:call-template> 
                        </span>
                      </td>
                      <td class="styDepTblCell" style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;padding-top:6mm;text-align:right;">
                        <span style="clear:none">   
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="IRS98NbrPounds"></xsl:with-param>
                          </xsl:call-template> 
                        </span>
                      </td>
                      <td style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:1px;">
                        <span style="width:0.5mm;clear:none;"></span>
                        <span style="height:8mm;width:2mm;text-align:left;padding-top:5mm;padding-right:5mm;">$</span>
                        <span style="width:0.5mm;clear:none;"></span>
                        <span style="height:8mm;width:35mm;padding-top:5mm;text-align:right;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="IRS98TaxPerPound"></xsl:with-param>
                          </xsl:call-template> 
                        </span>          
                        <span style="width:1px;clear:none;"></span>
                      </td>
                      <td class="styDepTblCell" style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                        <span style="height:8mm;width:2mm;text-align:left;padding-top:5mm;padding-right:4mm;">$</span>
                        <span style="width:36mm;padding-top:5mm;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="IRS98Tax"></xsl:with-param>
                          </xsl:call-template> 
                        </span>
                      </td>            
                    </tr>
                  </xsl:for-each>
                  <tr>
                    <xsl:attribute name="class">
                      <xsl:choose>
                        <xsl:when test="(count($FormData/IRS98)+1) mod 2 = 1">styDepTblRow1</xsl:when>
                        <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                    <td style="height:8mm;width:6mm;text-align:center;font-weight=bold;border-bottom:1px black solid;border-top:1px black solid;padding-bottom:3.5mm;">
                      <xsl:value-of select="count($FormData/IRS98) + 1">
                      </xsl:value-of>
                    </td>
                    <td  colspan="3" style="height:8mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid;">	
                      <span style="font-weight:bold;">Total ozone-depleting chemicals tax.</span>
                      <span style="width:3px;clear:none;"></span>
                      <span style="clear:none;font-weight:normal;">Add all amounts in column (d), include amounts from any<br/>additional sheets. Enter the total here and on Form 720 on the line for</span>
                      <span style="width:4px;clear:none;"></span>
                      <span style="font-weight:bold;">IRS No. 98</span>
                      <span class="styBoldText">
                        <span style="width:16px"></span>.
                        <span style="width:16px"></span>.
                      </span>
                      <span style="width:1mm;clear:none"></span>
                      <span class="styBoldText" style="padding-left:5.5mm;"><img src="{$ImagePath}/6627_Bullet_Md.gif" alt="MediumBullet"/> 
                      </span>     
                      <span style="width:4mm;clear:none"></span>
                    </td>							
                    <td class="styDepTblCell" style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                      <span style="width:1mm;clear:none;"></span>
                      <span style="height:8mm;width:2mm;text-align:bottom;padding-top:5mm;padding-right:4mm;">$</span>
                      <span style="width:36mm;padding-top:5mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/IRS98ODCTotalTax"></xsl:with-param>
                        </xsl:call-template> 
                      </span>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </xsl:if>
          
          <br/>
          <br/>
   
          <!--Table Part III-->
          <xsl:if test="(count($FormData/IRS19) &gt; 3 and ($Print = $Separated))" >
            <div style="width:187mm;">
              <div class="styLNDesc" style="width:187mm;height:4mm;">
                <span class="styText" style="font-weight:bold"  >
                  Form 6627,  Part III,  ODC Tax on Imported Products,  IRS No. 19
                </span>    
              </div>
              <table class="styDepTbl" style="font-size:6pt">
                <thead class="styTableThead">
                  <tr class="styDepTblHdr" style="height:12mm">
                    <th class="styTableCellHeader" style="width:58mm;font-weight:bold;border-color:black;color:white" scope="col">(a)<br />Imported product and the<br />applicable ODC</th>
                    <th class="styTableCellHeader" style="width:23mm;font-weight:bold;border-color:black;color:white" scope="col">(b)<br />Number of<br />products</th>
                    <th class="styTableCellHeader" style="width:26mm;font-weight:bold;border-color:black;color:white" scope="col">(c)<br />ODC weight of<br />product</th>
                    <th class="styTableCellHeader" style="width:26mm;font-weight:bold;border-color:black;color:white" scope="col">(d)<br />Tax per pound</th>
                    <th class="styTableCellHeader" style="width:26mm;font-weight:bold;border-color:black;color:white" scope="col">(e)<br />Entry value</th>
                    <th class="styTableCellHeader" style="width:28mm;font-weight:bold;border-color:black;color:white;border-right-width:0px" scope="col">(f)<br />Tax<br />(see Part III instructions)</th>	
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="$FormData/IRS19">
                    <tr>
                      <xsl:attribute name="class">
                        <xsl:choose>
                          <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                          <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                        </xsl:choose>
                      </xsl:attribute>	
                      <td class="styTableCellText" style="width:58mm;border-color:black">
                        <div style="width:4mm;font-weight:bold;padding-top:2mm;padding:left:1mm;float:left;clear:none;font-size:7pt;text-align:center">
                          <xsl:value-of select="position()"></xsl:value-of>
                        </div>
                        <div style="float:left;clear:none">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="IRS19ProdODC"></xsl:with-param>
                          </xsl:call-template>
                        </div>
                      </td>
                      <td class="styTableCell" style="width:23mm;border-color:black;padding-right:1mm;padding-top:4mm">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IRS19NbrProd"></xsl:with-param>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm;padding-top:4mm">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IRS19ODCWt"></xsl:with-param>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm;padding-top:4mm">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IRS19TaxPerPound"></xsl:with-param>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm;padding-top:4mm">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IRS19EntryValue"></xsl:with-param>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="width:28mm;border-color:black;border-right-width:0px;padding-right:1mm;padding-top:4mm">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IRS19Tax"></xsl:with-param>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:for-each>
                  <tr style="height:10mm">
                    <xsl:attribute name="class">
                      <xsl:choose>
                        <xsl:when test="(count($FormData/IRS19)+1) mod 2 = 1">styDepTblRow1</xsl:when>
                        <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                    <td class="styTableCellText" colspan="5" style="width:159mm;font-size:7pt;border-color:black;border-bottom-width:0">
                      <div style="width:4mm;font-size:7pt;text-align:center;font-weight:bold;padding:left:1mm;float:left;clear:none;padding-bottom:2mm">
                        <xsl:value-of select="(count($FormData/IRS19) + 1)"></xsl:value-of>
                      </div>
                      <div style="float:left;clear:none">
                        <b>Total ODC tax on imported products.</b> Add all amounts in column (f), include amounts from any
                        additional sheets. Enter the total here and on Form 720 on the line for <b>IRS No. 19</b>
                        <span class="styDotLn" style="float:none;padding-left:2mm;padding-right:0.5mm">...............</span>
                        <img src="{$ImagePath}/6627_Bullet_Md.gif" alt="MediumBullet"/>
                      </div>
                    </td>
                    <td class="styTableCell" style="width:28mm;border-color:black;border-right-width:0;border-bottom-width:0;padding-right:1mm;padding-top:5mm">
                      <div style="width:2mm;float:left;clear:none;font-size:7pt">$</div>
                      <div style="width:26mm;float:left;clear:none;padding-left:1mm;padding-right:0.3mm;padding-top:0.5mm">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/IRS19ODCTotalTax"></xsl:with-param>
                        </xsl:call-template>
                      </div>
                    </td>
                  </tr>
                </tbody>						
              </table>
            </div>
          </xsl:if>
          
          <br/>
          <br/>
   
         <!--Part IV Table-->
          <xsl:if test="(count($FormData/IRS20) &gt; 3 and ($Print = $Separated))" >
            <div style="width:187mm;">
              <div class="styLNDesc" style="width:187mm;height:4mm;">
                <span class="styText" style="font-weight:bold"  >
                Form 6627, Part IV, Tax on Floor Stocks of ODCs,  IRS No. 20</span>
              </div>
              <table class="styDepTbl" style="font-size:7pt;border-collapse:collapse;">
                <thead class="styTableThead">
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell" colspan= "2" style="width=64mm;height:12mm;font-size:8pt;border-top:1px black solid;" scope="col">(a)<br/>ODC<br/></th>
                    <th class="styDepTblCell" style="width=33mm;height:12mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;" scope="col">(b) <br/>Number of pounds<br/></th>
                    <th class="styDepTblCell" style="width=45mm;height:12mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;" scope="col">(c) <br/>Tax per pound<br/>(see Part II instructions)<br/></th>
                    <th class="styDepTblCell" style="width=45mm;height:12mm;border-left:1px black solid;border-bottom:1px black solid;border-top:1px black solid;" scope="col">(d) <br/>Tax (multiply column (b) <br/>by column (c))<br/>
                    </th>
                  </tr>
                </thead>
                <tbody>
                <xsl:for-each select="$FormData/IRS20">
                  <tr>
                    <xsl:attribute name="class">
                      <xsl:choose>
                        <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                        <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                    <td style="height:8mm;width:6mm;text-align:center;font-weight=bold;border-bottom:1px black solid;border-top:1px black solid;padding-top:5mm;">
                      <xsl:value-of select="position()">
                      </xsl:value-of>
                    </td>
                    <td  style="height:8mm;width:58mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid">
                      <span style="clear:none;">   
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="IRS20ODC"></xsl:with-param>
                        </xsl:call-template> 
                      </span>
                    </td>
                    <td class="styDepTblCell" style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;padding-top:6mm;text-align:right;">
                      <span style="clear:none">   
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IRS20NbrPounds"></xsl:with-param>
                        </xsl:call-template> 
                      </span>
                    </td>
                    <td style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:1px;">
                      <span style="width:0.5mm;clear:none;"></span>
                      <span style="height:8mm;width:2mm;text-align:left;padding-top:5mm;padding-right:5mm;">$</span>
                      <span style="width:0.5mm;clear:none;"></span>
                      <span style="height:8mm;width:35mm;padding-top:5mm;text-align:right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IRS20TaxPerPound"></xsl:with-param>
                        </xsl:call-template> 
                      </span>
                      <span style="width:1px;clear:none;"></span>
                    </td>
                    <td class="styDepTblCell" style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                      <span style="height:8mm;width:2mm;text-align:left;padding-top:5mm;padding-right:4mm;">$</span>
                      <span style="width:36mm;padding-top:5mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IRS20Tax"></xsl:with-param>
                        </xsl:call-template> 
                      </span>
                    </td>
                  </tr>
                </xsl:for-each>
                <tr>
                  <xsl:attribute name="class">
                    <xsl:choose>
                      <xsl:when test="(count($FormData/IRS20)+1) mod 2 = 1">styDepTblRow1</xsl:when>
                      <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                  <td style="height:8mm;width:6mm;text-align:center;font-weight=bold;border-bottom:1px black solid;border-top:1px black solid;padding-bottom:3.5mm;">
                    <xsl:value-of select="count($FormData/IRS20) + 1">
                    </xsl:value-of>
                  </td>
                  <td  colspan="3" style="height:8mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid;">	
                    <span style="font-weight:bold;">Total floor stocks tax.</span>
                    <span style="width:3px;clear:none;"></span>
                    <span style="clear:none;font-weight:normal;">Add all amounts in column (d), include amounts from any additional <br/>sheets. Enter the total here and on Form 720 on the line for</span>
                    <span style="width:4px;clear:none;"></span>
                    <span style="font-weight:bold;">IRS No. 20</span>
                    <span class="styBoldText">
                      <span style="width:16px"></span>.
                      <span style="width:16px"></span>.
                      <span style="width:16px"></span>.
                      <span style="width:16px"></span>.
                    </span>
                    <span style="width:4px;clear:none"></span>
                    <span class="styBoldText" style="padding-left:5.5mm;"><img src="{$ImagePath}/6627_Bullet_Md.gif" alt="MediumBullet"/> 
                    </span>     
                  </td>
                  <td class="styDepTblCell" style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                    <span style="width:1mm;clear:none;"></span>
                    <span style="height:8mm;width:2mm;text-align:bottom;padding-top:5mm;padding-right:4mm;">$</span>
                    <span style="width:36mm;padding-top:5mm;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/IRS20FloorStkTotalTax"></xsl:with-param>
                      </xsl:call-template> 
                    </span>
                  </td>
                </tr>
                </tbody>
              </table>
            </div>
          </xsl:if>
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
