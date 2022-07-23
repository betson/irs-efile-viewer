<?xml version="1.0" encoding="UTF-8" ?>
<!-- 05/29/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<!-- 06/24/2015 - Changes made per UWR #159846 - Jeremy Nichols -->
<!-- 12/16/2016 - Changes made per defect 47601 - Jeremy Nichols -->
<!-- 01/05/2017 - Changes made per defect 47676 - Jeremy Nichols -->
<!-- 01/09/2017 - Changes made per defect 47677 - Jeremy Nichols -->
<!-- 10/10/2018 - Changes made per defect 126818 - Jeremy Nichols -->
<!-- 10/11/2018 - Changes made per defect 126819 - Jeremy Nichols -->
<!-- 12/13/2018 - Additional changes made per defect 126818 - Jeremy Nichols -->
<!-- 12/13/2018 - Additional changes made per defect 126819 - Jeremy Nichols -->
<!-- 01/22/2019 - Additional changes made per defect 126838 - Jeremy Nichols -->
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
        <!-- Define Character Set   -->
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
          <div class="styBB" style="width:187mm;border-bottom-width:2px solid black;">
            <div class="styFNBox" style="width:31mm;height:21mm;padding-top:2mm;border-bottom-width:2px solid black;">
              <span class="styFormText" style="font-size:7pt;padding-top:5mm;">Form</span>      
              <span class="styFormText" style="font-size:7pt;width:1mm;"></span>      
              <span class="styFormNumber" style="font-size:20pt;font-weight:bold;">6627</span>      
              <br/>      
              <span class="styAgency" style="font-weight:normal;">(Rev. January 2019)</span><br/> 
              <span class="styAgency" style="font-weight:normal;padding-top:0.5mm;">Department of the Treasury</span><br />
              <span class="styAgency" style="font-weight:normal;">Internal Revenue Service</span>
            </div>
            
            <div class="styFTBox" style="width:125mm;height:21mm;padding-top:3mm;border-bottom-width:2px solid black;">
              <div class="styMainTitle" style="height:8mm;">Environmental Taxes</div><br/>
              <div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
                <span style="text-align:center;font-weight:bold">
                  <img src="{$ImagePath}/6627_Bullet_Md.gif" alt="MediumBullet"/> 
                  Attach to Form 720. <span class="styBoldText" > </span> 
                </span>
              </div><br/>
              <div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
                <span style="text-align:center;font-weight:bold">
                  <img src="{$ImagePath}/6627_Bullet_Md.gif" alt="MediumBullet"/> 
                  Go to <i>www.irs.gov/Form6627</i> for the latest information.
                </span>
              </div>
            </div>
            
            <div class="styTYBox" style="width:31mm;height:21mm;padding-top:8mm;text-align:center;border-bottom-width:2px solid black;">
              OMB No. 1545-0123
            </div>
          </div>
          
          <!--Begin Name and EIN-->
          <div style="width:187mm;">
            <div class="styNameAddr" style="width:112mm;height:9mm;border-left-width:0px;padding-left:1px;font-size:7pt;">
              Name (as shown on Form 720)<br/>
              <div  style="margin-left:1mm;font-size:6.373pt;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
                </xsl:call-template><br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
                </xsl:call-template><br/>
              </div>
            </div>
            <div class="styNameAddr" style="font-size:6.5pt;width:23mm;height:9mm;border-left-width:1px;padding-right:1mm;">
              Quarter ending
              <br/><br/>
              <xsl:call-template name="PopulateMonthDayYear">
                <xsl:with-param name="TargetNode" select="$RtnHdrData/QuarterEndingDt"></xsl:with-param>
              </xsl:call-template>
            </div>
            <div class="styNameAddr" style="font-size:6.5pt;width:52mm;height:9mm;border-left-width:1px;border-bottom-width:1px black solid;padding-left:2mm;">
              <b>Employer identification number (EIN)</b>
              <br/><br/>
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
                  <th class="styTableCell" style="width:94mm;border-right-width:0px;" scope="col">
                    <div class="styPartName">Part I</div>
                    <div class="styPartDesc" style="width:70mm;text-align:left;"><span style="width:4mm;"/>Reserved for future use</div>
                  </th>
                  <th class="styTableCell" style="width:38mm;font-weight:bold;text-align:center;border-left-width:1px">
                    (a)<br />Barrels
                  </th>
                  <th class="styTableCell" style="width:17mm;font-weight:bold;text-align:center" scope="col">
                    (b)<br />Rate
                  </th>
                  <th class="styTableCell" style="width:38mm:font-weight:bold;border-right-width:0;text-align:center" scope="col">
                    (c)<br />Tax
                  </th>
                </tr>
                <tr style="padding-top:1mm">
                  <td class="styTableCell" style="width:94mm;height:8mm;border-right-width:0px;text-align:left">
                    <div class="styLNLeftNumBoxSD" style="height:5mm;padding-top:1mm">1</div>
                    <div style="width:84mm;height:5mm;float:left;clear:none;padding-top:1mm">Reserved for future use
                    <span style="letter-spacing:3.3mm;font-weight:bold;skiplink:display:none;padding-left:mm">............</span>
                  </div></td>
                  <td class="styTableCell" style="width:38mm;border-left-width:1px;valign:bottom;background-color:lightgrey;"><span style="width:1px" /></td>
                  <td class="styTableCell" style="width:17mm;background-color:lightgrey;text-align:center"><span style="width:1px" /></td>
                  <td class="styTableCell" style="width:38mm;background-color:lightgrey;border-right:0px"><span style="width:1px" /></td>
                </tr>
                <tr style="padding-top:1mm">
                  <td class="styTableCell" style="width:94mm;height:8mm;border-right-width:0px;text-align:left">
                    <div class="styLNLeftNumBoxSD" style="height:5mm;padding-top:1mm">2</div>
                    <div style="width:84mm;height:5mm;float:left;clear:none;padding-top:1mm">Reserved for future use
                    <span style="letter-spacing:3.3mm;font-weight:bold;skiplink:display:none;padding-left:mm">............</span>
                  </div></td>
                  <td class="styTableCell" style="width:38mm;border-left-width:1px;valign:bottom;background-color:lightgrey;"><span style="width:1px" /></td>
                  <td class="styTableCell" style="width:17mm;background-color:lightgrey"><span style="width:1px" /></td>
                  <td class="styTableCell" style="width:38mm;background-color:lightgrey;border-right:0px"><span style="width:1px" /></td>
                </tr>
                <tr>
                  <td class="styTableCell" style="width:94mm;height:8mm;border-right-width:0px;text-align:left">
                    <div class="styLNLeftNumBoxSD" style="height:5mm;padding-top:1mm">3</div>
                    <div style="width:84mm;height:5mm;float:left;clear:none;padding-top:1mm">Reserved for future use
                    <span style="letter-spacing:3.3mm;font-weight:bold;skiplink:display:none;padding-left:mm">............</span>
                  </div></td>
				  <td class="styTableCell" style="width:38mm;border-left-width:1px;vertical-align:bottom;padding-bottom:1mm;background-color:lightgrey;"><span style="width:1px" /></td>
                  <td class="styTableCell" style="width:17mm;text-align:center;background-color:lightgrey;"><span style="width:1px" /></td>
                  <td class="styTableCell" style="width:38mm;border-right-width:0;background-color:lightgrey;"><span style="width:1px" /></td>
                </tr>
                <tr>
                  <td class="styTableCell" style="width:94mm;height:8mm;border-right-width:0px;text-align:left">
                    <div class="styLNLeftNumBoxSD" style="height:5mm;padding-top:1mm">4</div>
                    <div style="width:84mm;height:5mm;float:left;clear:none;padding-top:1mm">Reserved for future use
                    <span style="letter-spacing:3.3mm;font-weight:bold;skiplink:display:none;padding-left:mm">............</span>
                  </div></td>
                  <td class="styTableCell" style="width:38mm;border-left-width:1px;vertical-align:bottom;padding-bottom:1mm;background-color:lightgrey;"><span style="width:1px" /></td>
                  <td class="styTableCell" style="width:17mm;text-align:center;background-color:lightgrey;"><span style="width:1px" /></td>
                  <td class="styTableCell" style="width:38mm;border-right-width:0;background-color:lightgrey;"><span style="width:1px" /></td>
                </tr>
                <tr>
                  <td class="styTableCell" style="width:94mm;height:8mm;border-right-width:0px;text-align:left">
                    <div class="styLNLeftNumBoxSD" style="height:5mm;padding-top:1mm">5</div>
                    <div style="width:84mm;height:5mm;float:left;clear:none;padding-top:1mm">Reserved for future use
                    <span style="letter-spacing:3.3mm;font-weight:bold;skiplink:display:none;padding-left:mm">............</span>
                  </div></td>
                  <td class="styTableCell" style="width:38mm;border-left-width:1px;background-color:lightgrey"><span style="width:1px" /></td>
                  <td class="styTableCell" style="width:17mm;background-color:lightgrey"><span style="width:1px" /></td>
                  <td class="styTableCell" style="width:38mm;border-right-width:0;background-color:lightgrey;"><span style="width:1px" /></td>
                </tr>
                <tr>
                  <td class="styTableCell" style="width:94mm;height:8mm;border-right-width:0px;text-align:left">
                    <div class="styLNLeftNumBoxSD" style="height:5mm;padding-top:1mm">6</div>
                    <div style="width:84mm;height:5mm;float:left;clear:none;padding-top:1mm">Reserved for future use
                    <span style="letter-spacing:3.3mm;font-weight:bold;skiplink:display:none;padding-left:mm">............</span>
                  </div></td>
                  <td class="styTableCell" style="width:38mm;border-left-width:1px;vertical-align:bottom;padding-bottom:1mm;background-color:lightgrey;"><span style="width:1px" /></td>
                  <td class="styTableCell" style="width:17mm;text-align:center;background-color:lightgrey;"><span style="width:1px" /></td>
                  <td class="styTableCell" style="width:38mm;border-right-width:0;background-color:lightgrey;"><span style="width:1px" /></td>
                </tr>
              </tbody>
            </table>
          </div>
  
  
          <!--Begin Part II-->
          
          <!--Part II Title-->
          <div class="styBB" style="width:187mm;border-top:1px black;height=8mm;">
            <div class="styLNDesc" style="width:187mm;height:8mm;font-size:8pt;font-weight:bold;padding-top:2mm;">
              <span style="height:4.5mm;width:14mm;padding-top:0.5mm;padding-right:1.5mm;color:white;background-color:black;text-align:right;float:inherit;margin:0;">Part II</span>
              <span style="width:160mm ;font-size:8pt;;"><span style="width:4mm;"/>Tax on Ozone-Depleting Chemicals (ODCs), IRS No. 98</span>
            </div>      
          </div>
          
          <!--Part II Elections Instructions-->
          <div class="styLNDesc" style="width:187mm;height:9mm;font-size:7pt">
            <span class="styText" style="font-weight:bold;" >
              Elections. 
            </span>
            <span style="width:1mm;clear:none"></span>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$FormData/Election1990Ind" />
                <xsl:with-param name="BackupName">IRS6627Election1990Ind</xsl:with-param>
              </xsl:call-template>
				<span class="styText">If you elect to report the tax on post-1989 ODCs at the time you sell or use a mixture containing such chemicals instead of</span><br/>
				<span class="styText">when you make the mixture, check the box (the 1990 election)</span>
            </label>
            <!--Dotted Line-->
            <span class="styBoldText">.
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
            <input type="checkbox" class="styCkbox" style="padding-left:4mm;" alt="IRS6627Election1990Ind" >
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/Election1990Ind" />
                <xsl:with-param name="BackupName">IRS6627Election1990Ind</xsl:with-param>
              </xsl:call-template>
            </input>
          </div>
          
          <div class="styLNDesc" style="width:187mm;height:9mm;font-size:7pt">
           
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$FormData/Election1991Ind" />
                <xsl:with-param name="BackupName">IRS6627Election1991Ind</xsl:with-param>
              </xsl:call-template>
				<span class="styText">If you elect to report the tax on post-1990 ODCs at the time you sell or use a mixture containing such chemicals instead of when</span><br/>
				<span class="styText">you make the mixture, check the box (the 1991 election)</span>
            </label>
            <!--Dotted Line-->
            <span class="styBoldText">
              <span style="width:6px"></span>.
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
            <span style="width:3.5mm;clear:none"></span>
            <input type="checkbox" class="styCkbox" style="padding-left:5.5mm;" alt="IRS6627Election1991Ind">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="$FormData/Election1991Ind" />
                <xsl:with-param name="BackupName">IRS6627Election1991Ind</xsl:with-param>
              </xsl:call-template>
            </input>
            <span style="width:1mm;clear:none"></span>
            <!-- button display logic -->
            <xsl:call-template name="SetDynamicTableToggleButton" >
              <xsl:with-param name="TargetNode" select="$FormData/TxOnOzoneDepletingChemicalsGrp"/>
              <xsl:with-param name="containerHeight" select="3"/>
              <xsl:with-param name="containerID" select=" 'PSOctn' "/>
            </xsl:call-template>
            <!-- end button display logic -->
          </div>
          
          <!--Part II Table-->
          <div class="styTableContainer" style="height:auto;width:187mm;border-bottom-width:0px;display:block;" id="PSOctn">
            <xsl:call-template name="SetInitialState"/>
            <table style="height:auto;width:187mm;font-size:7pt;border-collapse:collapse;">
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
                <xsl:if test="($Print != $Separated) or (count($FormData/TxOnOzoneDepletingChemicalsGrp) &lt;= 3)" > 
                  <xsl:for-each select="$FormData/TxOnOzoneDepletingChemicalsGrp">
                    <tr>
                      <td style="height:8mm;width:6mm;text-align:center;font-weight:bold;border-bottom:1px black solid;border-top:1px black solid">
                        <xsl:value-of select="position()">
                        </xsl:value-of>
                      </td>
                      <td  style="height:8mm;width:58mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid">
                        <span style="clear:none;">   
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="IRSOzoneDepletingChemicalDesc"></xsl:with-param>
                          </xsl:call-template> 
                        </span>
                      </td>
                      <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;padding-top:5mm;text-align:right;">
                        <span style="clear:none">   
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="PoundsQty"></xsl:with-param>
                          </xsl:call-template> 
                        </span>
                      </td>
                      <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:5mm;">
                        <span style="clear:none;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="IRSTaxPerPoundAmt"></xsl:with-param>
                          </xsl:call-template> 
                        </span>
                      </td>
                      <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                        <span style="height:8mm;width:2mm;text-align:left;padding-top:5mm;padding-right:4mm;"></span>
                        <span style="width:36mm;padding-top:5mm;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="TaxAmt"></xsl:with-param>
                          </xsl:call-template> 
                        </span>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--empty lines-->
                
                <xsl:if test="(count($FormData/TxOnOzoneDepletingChemicalsGrp) = 0) or ( (count($FormData/TxOnOzoneDepletingChemicalsGrp) &gt; 3) and ($Print = $Separated) )" >
                  <tr>
                    <td style="height:8mm;width:6mm;text-align:center;font-weight:bold;border-bottom:1px black solid;border-top:1px black solid">
                      <xsl:value-of select="1">
                      </xsl:value-of>
                    </td>
                    <td  style="height:8mm;width:58mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid;padding-top:5mm;">
                      <xsl:if test="((count($FormData/TxOnOzoneDepletingChemicalsGrp) &gt;3) and ($Print = $Separated))">
                        <span style="font-size:7pt">
                          <xsl:call-template name="PopulateAdditionalDataTableMessage">
                            <xsl:with-param name="TargetNode" select="$FormData/TxOnOzoneDepletingChemicalsGrp"/>
                          </xsl:call-template>
                        </span>
                      </xsl:if>  												
                    </td>
                    <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;padding-top:5mm;text-align:right;"></td>
                    <td style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:1px;"></td>
                    <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;"></td>
                  </tr>
                </xsl:if>
                <xsl:if test="(count($FormData/TxOnOzoneDepletingChemicalsGrp) &lt; 2) or ( (count($FormData/TxOnOzoneDepletingChemicalsGrp) &gt; 3) and ($Print = $Separated) )" >
                  <tr>
                    <td style="height:8mm;width:6mm;text-align:center;font-weight:bold;border-bottom:1px black solid;border-top:1px black solid">
                      <xsl:value-of select="2">
                      </xsl:value-of>
                    </td>
                    <td  style="height:8mm;width:58mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid;padding-top:5mm;"></td>
                    <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;padding-top:5mm;text-align:right;"></td>
                    <td style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:1px;"></td>
                    <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;"></td>
                  </tr>
                </xsl:if>
                <xsl:if test="(count($FormData/TxOnOzoneDepletingChemicalsGrp) &lt; 3) or ( (count($FormData/TxOnOzoneDepletingChemicalsGrp) &gt; 3) and ($Print = $Separated) )" >
                  <tr>
                    <td style="height:8mm;width:6mm;text-align:center;font-weight:bold;border-bottom:1px black solid;border-top:1px black solid">
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
                <tr style="display:inlline;">
                  <td style="height:8mm;width:6mm;text-align:center;font-weight:bold;border-bottom:1px black solid;border-top:1px black solid;padding-bottom:3.5mm;">
                    <xsl:if test="(count($FormData/TxOnOzoneDepletingChemicalsGrp) &lt; 4) or ($Print = $Separated)" >
                      <xsl:value-of select="4">
                      </xsl:value-of>
                    </xsl:if>
                    <xsl:if test="(count($FormData/TxOnOzoneDepletingChemicalsGrp) &gt;= 4) and  ($Print != $Separated)" >
                      <xsl:value-of select="count($FormData/TxOnOzoneDepletingChemicalsGrp) +1">
                      </xsl:value-of>
                    </xsl:if>
                  </td>
                  <td  colspan="3" style="height:8mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid;">	
                    <span style="font-weight:bold;">Total ozone-depleting chemicals tax.</span>
                    <span style="width:3px;clear:none;"></span>
                    <span style="clear:none;font-weight:normal;">Add all amounts in column (d), include amounts from any</span><br/>
                    <span style="clear:none;font-weight:normal;">additional sheets. Enter the total here and on Form 720 on the line for</span>
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
                        <xsl:when test="(count($FormData/TxOnOzoneDepletingChemicalsGrp) = 0) or (($Print = $Separated) and (count($FormData/TxOnOzoneDepletingChemicalsGrp) &gt; 3))">
                          <span style="width:1px" />
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/TotOzoneDepletingChemicalTxAmt"></xsl:with-param>
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
              <xsl:with-param name="TargetNode" select="$FormData/TxOnOzoneDepletingChemicalsGrp"/>
              <xsl:with-param name="containerHeight" select="3"/>
              <xsl:with-param name="containerID" select=" 'PSOctn' "/>
            </xsl:call-template>
            <!-- End Set Initial Height of Above Table -->
          </div>      
          
          <xsl:if test="(count($FormData/TxOnOzoneDepletingChemicalsGrp) &gt; 0) and  ($Print = $Separated)" >
			<span style="height:10mm;"/>
		  </xsl:if>
		  
          <!--Begin Page 1 Footer-->
          <div  style="width:187mm">
            <span style="width:100mm;font-weight:bold;text-align:left;font-size:6pt;"> 
              For Privacy Act and Paperwork Reduction Act Notice, see Form 720 instructions.
            </span>
            <span style="width:10mm;"></span>  
            <span style="width:19mm;font-weight:normal;font-size:6pt;">
            Cat. No. 43490I</span> 
            <span style="width:19mm;"></span>  
            <span style="text-align:right;width:7mm;font-weight:normal;font-size:6pt;">
            Form</span> 
            <span style="width:1mm;"></span>  
            <span style="text-align:center;width:6mm;font-weight:bold;font-size:7pt;">
            6627</span> 
            <span style="text-align:right;width:18.5mm;font-weight:normal;font-size:6pt;padding-right:1mm;">
            (Rev. 1-2019)</span> 
          </div>
          <div class="pageEnd"/>
  
          <!--Begin Page 2-->
  
          <!--Page to Header-->
          <div  style="width:187mm;border-bottom:1px black solid;">
            <span style="width:140mm;font-weight:normal;text-align:left;font-size:7pt;display:inline;"> 
              Form 6627 (Rev. 1-2019)<span style="width:140mm;"/>
            </span>
            <span style="text-align:right;width:40mm;font-weight:normal;font-size:7pt;display:inline;">
              Page
            </span> 
            <span style="width:4px"></span> 
            <span style="text-align:right;width:1mm;font-weight:bold;font-size:7pt;display:inline;">
              2
            </span> 
          </div>
  
  
          <!--Begin Part III-->
          <div class="styBB" style="width:187mm;height:8mm;padding-top:1mm;">
            <div class="styPartName" style="height:4.5mm;width:14mm;padding-top:0.5mm;">Part III</div>
            <div class="styPartDesc" style="padding-top:1mm"><span style="width:4mm;"/>
              ODC Tax on Imported Products, IRS No. 19
            </div>
          </div>
          
          <!--Part III Explanation-->
          <div class="styBB" style="width:187mm">
            <div style="float:right;clear:none;padding-top:2mm">
              <!-- button display logic -->
              <xsl:call-template name="SetDynamicTableToggleButton" >
              <xsl:with-param name="TargetNode" select="$FormData/ODCTaxOnImportedProductsGrp"/>
              <xsl:with-param name="containerHeight" select="3"/>
              <xsl:with-param name="containerID" select=" 'ODC19ctn' "/>
              </xsl:call-template>
              <!-- end button display logic -->
            </div>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="$FormData/TaxOnImpProductsElectionInd" />
                <xsl:with-param name="BackupName">IRS6627TaxOnImpProductsElectionInd</xsl:with-param>
              </xsl:call-template>
				Election. If you elect to report the tax on imported products at the time you import the products instead of when you sell or use<br />
				the products, check this box 
            </label>
            <span class="styDotLn" style="float:none;padding-left:2mm;padding-right:0.5mm">.................................</span>
            <img src="{$ImagePath}/6627_Bullet_Md.gif" alt="MediumBullet"/>
            <input type="checkbox" class="styCkbox" alt="IRS6627TaxOnImpProductsElectionInd">
             <xsl:call-template name="PopulateCheckbox">
               <xsl:with-param name="TargetNode" select="$FormData/TaxOnImpProductsElectionInd" />
               <xsl:with-param name="BackupName">IRS6627TaxOnImpProductsElectionInd</xsl:with-param>
             </xsl:call-template>
           </input>
          </div>
          
          <!--Part III Table-->
          <div class="styTableContainer" style="height:auto;display:block;" id="ODC19ctn">
            <!-- print logic -->
            <xsl:call-template name="SetInitialState"/>
            <table class="styTable" cellspacing="0" cellpadding="0" style="height:auto;width:187mm;">
              <tbody>
                <tr style="height:12mm">
                  <th class="styTableCellHeader" style="width:55mm;font-weight:bold;border-color:black" scope="col" colspan="2">(a)<br />Imported product and the<br />applicable ODC</th>
                  <th class="styTableCellHeader" style="width:23mm;font-weight:bold;border-color:black" scope="col">(b)<br />Number of<br />products</th>
                  <th class="styTableCellHeader" style="width:26mm;font-weight:bold;border-color:black" scope="col">(c)<br />ODC weight of<br />product</th>
                  <th class="styTableCellHeader" style="width:26mm;font-weight:bold;border-color:black" scope="col">(d)<br />Tax per pound</th>
                  <th class="styTableCellHeader" style="width:26mm;font-weight:bold;border-color:black" scope="col">(e)<br />Entry value</th>
                  <th class="styTableCellHeader" style="width:31mm;font-weight:bold;border-color:black;border-right-width:0px" scope="col">(f)<br />Tax<br />(see Part III instructions)</th>
                </tr>
                <!--If inline print or if there is 3 or less rows of data-->
                <xsl:if test="($Print != $Separated) or (count($FormData/ODCTaxOnImportedProductsGrp) &lt;= 3)">
                  <xsl:for-each select="$FormData/ODCTaxOnImportedProductsGrp">
                    <tr style="height:8mm">
                      <td class="styTableCellText" style="width:4mm;font-size:7pt;font-weight:bold;border-color:black;border-right-width:0px;">
                          <xsl:value-of select="position()"></xsl:value-of>
                      </td>
                      <td class="styTableCellText" style="width:51mm;border-color:black">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="IRSOzoneDepletingChemicalDesc"></xsl:with-param>
                          </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="width:23mm;border-color:black;padding-right:1mm;padding-top:4mm">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="TaxableProductCnt"></xsl:with-param>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm;padding-top:4mm">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IRSOzoneDepletingChmclWghtQty"></xsl:with-param>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm;padding-top:4mm">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IRSTaxPerPoundAmt"></xsl:with-param>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm;padding-top:4mm">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="EntryValueAmt"></xsl:with-param>
                        </xsl:call-template>
                      </td>
                      <td class="styTableCell" style="width:31mm;border-color:black;border-right-width:0px;padding-right:1mm;padding-top:4mm">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="TaxAmt"></xsl:with-param>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--Print blank row or see additional data message-->
                <xsl:if test="(count($FormData/ODCTaxOnImportedProductsGrp) = 0) or ( (count($FormData/ODCTaxOnImportedProductsGrp) &gt; 3) and ($Print = $Separated) )">
                  <tr style="height:8mm">
                    <td class="styTableCellText" style="width:4mm;font-size:7pt;font-weight:bold;border-color:black;border-right-width:0px;">
                      1
                    </td>
                    <td class="styTableCellText" style="width:51mm;border-color:black">
                        <xsl:if test="((count($FormData/ODCTaxOnImportedProductsGrp) &gt;3) and ($Print = $Separated))">
                          <span style="font-size:7pt">
                            <xsl:call-template name="PopulateAdditionalDataTableMessage">
                              <xsl:with-param name="TargetNode" select="$FormData/ODCTaxOnImportedProductsGrp"/>
                            </xsl:call-template>
                          </span>
                        </xsl:if>
                        <span style="width:1px" />
                    </td>
                    <td class="styTableCell" style="width:23mm;font-weight:bold;border-color:black;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:31mm;border-color:black;border-right-width:0px;padding-right:1mm"><span style="width:1px" /></td>
                  </tr>
                </xsl:if>
                <xsl:if test="(count($FormData/ODCTaxOnImportedProductsGrp) &lt; 2) or ( (count($FormData/ODCTaxOnImportedProductsGrp) &gt; 3) and ($Print = $Separated) )">
                  <tr style="height:8mm">
                    <td class="styTableCellText" style="width:4mm;font-size:7pt;font-weight:bold;border-color:black;border-right-width:0px;">
                      2
                    </td>
                    <td class="styTableCellText" style="width:51mm;border-color:black">
                      <span style="width:1px" />
                    </td>
                    <td class="styTableCell" style="width:23mm;font-weight:bold;border-color:black;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:26mm;border-color:black;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:31mm;border-color:black;border-right-width:0px;padding-right:1mm"><span style="width:1px" /></td>
                  </tr>
                </xsl:if>
                <xsl:if test="(count($FormData/ODCTaxOnImportedProductsGrp) &lt; 3) or ( (count($FormData/ODCTaxOnImportedProductsGrp) &gt; 3) and ($Print = $Separated) )">
                  <tr style="height:8mm">
                    <td class="styTableCellText" style="width:4mm;font-size:7pt;font-weight:bold;border-color:black;border-bottom-width:0;border-right-width:0px;">
                      3
                    </td>
                    <td class="styTableCellText" style="width:51mm;border-color:black;border-bottom-width:0;">
                      <span style="width:1px" />
                    </td>
                    <td class="styTableCell" style="width:23mm;font-weight:bold;border-color:black;border-bottom-width:0;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:26mm;border-color:black;border-bottom-width:0;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:26mm;border-color:black;border-bottom-width:0;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:26mm;border-color:black;border-bottom-width:0;padding-right:1mm"><span style="width:1px" /></td>
                    <td class="styTableCell" style="width:31mm;border-color:black;border-bottom-width:0;border-right-width:0px;padding-right:1mm"><span style="width:1px" /></td>
                  </tr>
                </xsl:if>
                <tr>
                  <td class="styTableCellText" style="width:4mm;font-size:7pt;font-weight:bold;vertical-align:top;padding-top:1mm;border-color:black;border-top-width:0;border-bottom-width:0;border-right-width:0px;">
                    <xsl:choose>
                      <xsl:when test="($Print != $Separated) and (count($FormData/ODCTaxOnImportedProductsGrp) &gt; 3)">
                        <xsl:value-of select="(count($FormData/ODCTaxOnImportedProductsGrp) + 1)"></xsl:value-of>
                      </xsl:when>
                      <xsl:otherwise>
                        4
                      </xsl:otherwise>
                    </xsl:choose>
                  </td>
                  <td class="styTableCellText" colspan="5" style="width:152mm;font-size:7pt;border-color:black;border-top-width:0;border-bottom-width:0">
                      <b>Total ODC tax on imported products.</b> Add all amounts in column (f), include amounts from any
                      additional sheets. Enter the total here and on Form 720 on the line for <b>IRS No. 19</b>
                      <span class="styDotLn" style="float:none;padding-left:2mm;padding-right:0.5mm">...............</span>
                      <img src="{$ImagePath}/6627_Bullet_Md.gif" alt="MediumBullet"/>
                  </td>
                  <td class="styTableCell" style="height:8mm;width:31mm;vertical-align:bottom;padding-bottom:1mm;border-color:black;border-right-width:0;border-top-width:0;border-bottom-width:0;padding-top:3.5mm;">
                    <div style="width:2mm;float:left;clear:none;font-size:7pt;display:inline;">$</div>
                    <div style="width:26mm;font-size:7pt;display:inline;">
                      <xsl:choose>
                        <xsl:when test="(count($FormData/ODCTaxOnImportedProductsGrp) = 0) or (($Print = $Separated) and (count($FormData/ODCTaxOnImportedProductsGrp) &gt; 3))">
                          <span style="width:1px" />
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/TotalODCTaxOnImpProductsAmt"></xsl:with-param>
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
          	<xsl:with-param name="TargetNode" select="$FormData/ODCTaxOnImportedProductsGrp"/>
          	<xsl:with-param name="containerHeight" select="3"/>
          	<xsl:with-param name="containerID" select=" 'ODC19ctn' "/>
          </xsl:call-template>
          <!-- End Set Initial Height of Above Table -->
  
		  <xsl:if test="($Print = $Separated)" >
				<span style="height:8mm;"></span>
		  </xsl:if>
  
          <!--BEGIN PART IV-->
	
          <!--Part IV Header-->
          <div style="width:187mm;border-top:1px solid black;border-bottom-width:0px;height:8mm;">
            <div class="styLNDesc" style="width:187mm;height:8mm;font-size:8pt;font-weight:bold;padding-top:1mm;">
              <span style="height:4.5mm;width:14mm;color:white;background-color:black;text-align:right;float:inherit;padding-top:1mm;padding-left:0.5mm;padding-right:1mm;margin:0;display:inline;">Part IV </span>
              <span style="width:155mm ;padding-top:1mm;font-size:8pt;float:inherit;display:inline;"><span style="width:4mm;"/>Tax on Floor Stocks of  ODCs, IRS No. 20</span>
              <span style="width:13mm;clear:none;"></span>
              <span style="display:inline;">
                <!-- button display logic -->
                <xsl:call-template name="SetDynamicTableToggleButton" >
                <xsl:with-param name="TargetNode" select="$FormData/TaxOnFloorStocksOfODCGrp"/>
                <xsl:with-param name="containerHeight" select="3"/>
                <xsl:with-param name="containerID" select=" 'PSOctn3' "/>
                </xsl:call-template>
                <!-- end button display logic -->
              </span>
            </div>      
          </div>
              
          <!--Part IV Table-->
          <div class="styTableContainer" id="PSOctn3" style="border-bottom-width:1px;display:block;">
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
                <xsl:if test="($Print != $Separated) or (count($FormData/TaxOnFloorStocksOfODCGrp) &lt;= 3)"> 
                  <xsl:for-each select="$FormData/TaxOnFloorStocksOfODCGrp">
                    <tr>
                      <td style="height:8mm;width:6mm;text-align:center;font-weight:bold;border-bottom:1px black solid;border-top:1px black solid">
                        <xsl:value-of select="position()">
                        </xsl:value-of>
                      </td>
                      <td  style="height:8mm;width:58mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid">
                        <span style="clear:none;">   
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="IRSOzoneDepletingChemicalDesc"></xsl:with-param>
                          </xsl:call-template> 
                        </span>
                      </td>
                      <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;padding-top:5mm;text-align:right;">        
                        <span style="clear:none">           
                          <xsl:call-template name="PopulateAmount">       
                            <xsl:with-param name="TargetNode" select="PoundsQty"></xsl:with-param>
                          </xsl:call-template> 
                        </span>        	
                      </td>       
                      <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:5mm;">        
                        <span style="clear:none;">       
                          <xsl:call-template name="PopulateAmount">        
                            <xsl:with-param name="TargetNode" select="IRSTaxPerPoundAmt"></xsl:with-param>
                          </xsl:call-template>        
                        </span>       
                      </td>       		        
                      <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">       
                        <span style="height:8mm;width:2mm;text-align:left;padding-top:5mm;padding-right:4mm;"></span>       
                        <span style="width:36mm;padding-top:5mm;">              
                          <xsl:call-template name="PopulateAmount">                 
                            <xsl:with-param name="TargetNode" select="TaxAmt"></xsl:with-param>
                          </xsl:call-template>                   
                        </span>
                      </td>     
                    </tr>       
                  </xsl:for-each>
                </xsl:if>
                <!-- empty lines-->       
                <xsl:if test="(count($FormData/TaxOnFloorStocksOfODCGrp) &lt; 1) or ( (count($FormData/TaxOnFloorStocksOfODCGrp) &gt; 3) and ($Print = $Separated) )">
                  <tr>
                    <td style="height:8mm;width:6mm;text-align:center;font-weight:bold;border-bottom:1px black solid;border-top:1px black solid">1</td>
                    <td  style="height:8mm;width:58mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid;padding-top:5mm;">
                      <xsl:if test="((count($FormData/TaxOnFloorStocksOfODCGrp) &gt;3) and ($Print = $Separated))">
                        <span style="font-size:7pt">
                          <xsl:call-template name="PopulateAdditionalDataTableMessage">
                            <xsl:with-param name="TargetNode" select="$FormData/TaxOnFloorStocksOfODCGrp"/>
                          </xsl:call-template>
                        </span>
                      </xsl:if>  										
                    </td>
                    <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;padding-top:5mm;text-align:right;"></td>           
                    <td style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:1px;"></td>             
                    <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;"></td>       
                  </tr>     
                </xsl:if>
                <xsl:if test="(count($FormData/TaxOnFloorStocksOfODCGrp) &lt; 2) or ( (count($FormData/TaxOnFloorStocksOfODCGrp) &gt; 3) and ($Print = $Separated) )">
                  <tr>
                    <td style="height:8mm;width:6mm;text-align:center;font-weight:bold;border-bottom:1px black solid;border-top:1px black solid">2</td>
                    <td  style="height:8mm;width:58mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid;padding-top:5mm;"></td>
                    <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;padding-top:5mm;text-align:right;"></td>
                    <td style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:1px;"></td>
                    <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;"></td> 
                  </tr>
                </xsl:if>
                <xsl:if test="(count($FormData/TaxOnFloorStocksOfODCGrp) &lt; 3) or ( (count($FormData/TaxOnFloorStocksOfODCGrp) &gt; 3) and ($Print = $Separated) )" >
                  <tr>
                    <td style="height:8mm;width:6mm;text-align:center;font-weight:bold;border-bottom:1px black solid;border-top:1px black solid">3</td>
                    <td  style="height:8mm;width:58mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid;padding-top:5mm;"></td>
                    <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;padding-top:5mm;text-align:right;"></td>
                    <td style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:1px;"></td>
                    <td style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;"></td>
                  </tr>
                </xsl:if>
                <!--END empty lines-->
                <tr>
                  <td style="height:8mm;width:6mm;text-align:center;font-weight:bold;border-bottom:1px black solid;border-top:1px black solid;padding-bottom:3.5mm;">
                    <xsl:if test="(count($FormData/TaxOnFloorStocksOfODCGrp) &lt; 4) or ($Print = $Separated)" >
                      <xsl:value-of select="4">
                      </xsl:value-of>
                    </xsl:if>
                    <xsl:if test="(count($FormData/TaxOnFloorStocksOfODCGrp) &gt;= 4) and  ($Print != $Separated)" >
                      <xsl:value-of select="count($FormData/TaxOnFloorStocksOfODCGrp) +1">
                      </xsl:value-of>
                    </xsl:if>
                  </td>
                  <td  colspan="3" style="height:8mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid;">	
                    <span style="font-weight:bold;">Total floor stocks tax.</span>
                    <span style="width:3px;clear:none;"></span>
                    <span style="clear:none;font-weight:normal;">Add all amounts in column (d), include amounts from any additional</span><br/>
                    <span style="clear:none;font-weight:normal;">sheets. Enter the total here and on Form 720 on the line for</span>
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
                        <xsl:when test="(count($FormData/TaxOnFloorStocksOfODCGrp) = 0) or (($Print = $Separated) and (count($FormData/TaxOnFloorStocksOfODCGrp) &gt; 3))">
                          <span style="width:1px" />
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="$FormData/TotalFloorStocksTaxAmt"></xsl:with-param>
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
          <xsl:with-param name="TargetNode" select="$FormData/TaxOnFloorStocksOfODCGrp"/>
          <xsl:with-param name="containerHeight" select="3"/>
          <xsl:with-param name="containerID" select=" 'PSOctn3' "/>
          </xsl:call-template>
          <!-- End Set Initial Height of Above Table -->
          
          <xsl:if test="($Print = $Separated)" >
				<span style="height:9mm;"></span>
		  </xsl:if>
					
          <!--END Part IVTable-->
       
          <div  style="width:187mm">  
            <span style="width:104mm;font-weight:bold;text-align:left;font-size:6pt;">   
            </span>
            <span style="width:5mm;"></span>      
            <span style="width:25mm;font-weight:normal;font-size:6pt;">
            </span>   
            <span style="width:15mm;"></span>      
            <span style="text-align:right;width:7mm;font-weight:normal;font-size:6pt;">
            Form</span> 
            <span style="text-align:center;width:7mm;font-weight:bold;font-size:7pt;">
            6627</span> 
            <span style="text-align:right;width:18mm;font-weight:normal;font-size:6pt;padding-right:1mm;">
            (Rev. 1-2019)</span>       
          </div>
          <div class="pageEnd"/>
            
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
          
          <xsl:if test="(count($FormData/TxOnOzoneDepletingChemicalsGrp) &gt; 3 and ($Print = $Separated))" >
            <div style="width:187mm;display:block;">
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
                  <xsl:for-each select="$FormData/TxOnOzoneDepletingChemicalsGrp">
                    <tr>
                      <xsl:attribute name="class">
                        <xsl:choose>
                          <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                          <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                        </xsl:choose>
                      </xsl:attribute>
                      <td style="height:8mm;width:6mm;text-align:center;font-weight:bold;border-bottom:0px black solid;border-top:1px black solid;padding-top:5mm;">
                        <xsl:value-of select="position()">
                        </xsl:value-of>
                      </td>
                      <td  style="height:8mm;width:58mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid">
                        <span style="clear:none;">   
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="IRSOzoneDepletingChemicalDesc"></xsl:with-param>
                          </xsl:call-template> 
                        </span>
                      </td>
                      <td class="styDepTblCell" style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;padding-top:6mm;text-align:right;">
                        <span style="clear:none">   
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="PoundsQty"></xsl:with-param>
                          </xsl:call-template> 
                        </span>
                      </td>
                      <td class="styDepTblCell" style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:1px;">
                       <span style="height:8mm;width:35mm;padding-top:5mm;text-align:right;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="IRSTaxPerPoundAmt"></xsl:with-param>
                          </xsl:call-template> 
                        </span>          
                        <span style="width:1px;clear:none;"></span>
                      </td>
                      <td class="styDepTblCell" style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                        <span style="width:36mm;padding-top:5mm;">
                          <xsl:call-template name="PopulateAmount">
                            <xsl:with-param name="TargetNode" select="TaxAmt"></xsl:with-param>
                          </xsl:call-template> 
                        </span>
                      </td>            
                    </tr>
                  </xsl:for-each>
                  <tr>
                    <xsl:attribute name="class">
                      <xsl:choose>
                        <xsl:when test="(count($FormData/TxOnOzoneDepletingChemicalsGrp)+1) mod 2 = 1">styDepTblRow1</xsl:when>
                        <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                    <td style="height:8mm;width:6mm;text-align:center;vertical-align:top;padding-top:2.25mm;font-weight:bold;border-bottom:1px black solid;border-top:1px black solid;">
                      <xsl:value-of select="count($FormData/TxOnOzoneDepletingChemicalsGrp) + 1">
                      </xsl:value-of>
                    </td>
                    <td  colspan="3" style="height:8mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid;">	
                      <span style="font-weight:bold;display:inline;">Total ozone-depleting chemicals tax.</span>
                      <span style="width:3px;clear:none;display:inline;"></span>
                      <span style="clear:none;font-weight:normal;display:inline;">Add all amounts in column (d), include amounts from any<br/>additional sheets. Enter the total here and on Form 720 on the line for</span>
                      <span style="width:4px;clear:none;display:inline;"></span>
                      <span style="font-weight:bold;display:inline;">IRS No. 98</span>
                      <span class="styBoldText;display:inline;">
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
                      <span style="height:8mm;width:2mm;text-align:bottom;padding-top:4.5mm;float:left;">$</span>
                      <span style="width:36mm;padding-top:4.5mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/TotOzoneDepletingChemicalTxAmt"></xsl:with-param>
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
          <xsl:if test="(count($FormData/ODCTaxOnImportedProductsGrp) &gt; 3 and ($Print = $Separated))" >
            <div style="width:187mm;">
              <div class="styLNDesc" style="width:187mm;height:4mm;">
                <span class="styText" style="font-weight:bold"  >
                  Form 6627,  Part III,  ODC Tax on Imported Products,  IRS No. 19
                </span>    
              </div>
              <table class="styDepTbl" style="font-size:6pt">
                <thead class="styTableThead">
                  <tr class="styDepTblHdr" style="height:12mm">
                    <th class="styTableCellHeader" style="width:55mm;font-weight:bold;border-color:black;color:white" scope="col" colspan="2">(a)<br />Imported product and the<br />applicable ODC</th>
                    <th class="styTableCellHeader" style="width:23mm;font-weight:bold;border-color:black;color:white" scope="col">(b)<br />Number of<br />products</th>
                    <th class="styTableCellHeader" style="width:26mm;font-weight:bold;border-color:black;color:white" scope="col">(c)<br />ODC weight of<br />product</th>
                    <th class="styTableCellHeader" style="width:26mm;font-weight:bold;border-color:black;color:white" scope="col">(d)<br />Tax per pound</th>
                    <th class="styTableCellHeader" style="width:26mm;font-weight:bold;border-color:black;color:white" scope="col">(e)<br />Entry value</th>
                    <th class="styTableCellHeader" style="width:31mm;font-weight:bold;border-color:black;color:white;border-right-width:0px" scope="col">(f)<br />Tax<br />(see Part III instructions)</th>	
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="$FormData/ODCTaxOnImportedProductsGrp">
                    <tr>
                      <xsl:attribute name="class">
                        <xsl:choose>
                          <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                          <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                        </xsl:choose>
                      </xsl:attribute>	
                      <td class="styTableCellText" style="width:4mm;font-size:7pt;font-weight:bold;border-color:black;border-right-width:0px;">
                          <xsl:value-of select="position()"></xsl:value-of>
                      </td>
                      <td class="styTableCellText" style="width:51mm;border-color:black">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="IRSOzoneDepletingChemicalDesc"></xsl:with-param>
                          </xsl:call-template>
                      </td>
                      <td class="styDepTblCell" style="width:23mm;border-color:black;padding-right:1mm;padding-top:4mm">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="TaxableProductCnt"></xsl:with-param>
                        </xsl:call-template>
                      </td>
                      <td class="styDepTblCell" style="width:26mm;border-color:black;padding-right:1mm;padding-top:4mm">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IRSOzoneDepletingChmclWghtQty"></xsl:with-param>
                        </xsl:call-template>
                      </td>
                      <td class="styDepTblCell" style="width:26mm;border-color:black;padding-right:1mm;padding-top:4mm">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IRSTaxPerPoundAmt"></xsl:with-param>
                        </xsl:call-template>
                      </td>
                      <td class="styDepTblCell" style="width:26mm;border-color:black;padding-right:1mm;padding-top:4mm">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="EntryValueAmt"></xsl:with-param>
                        </xsl:call-template>
                      </td>
                      <td class="styDepTblCell" style="width:31mm;border-color:black;border-right-width:0px;padding-right:1mm;padding-top:4mm">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="TaxAmt"></xsl:with-param>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:for-each>
                  <tr style="height:10mm">
                    <xsl:attribute name="class">
                      <xsl:choose>
                        <xsl:when test="(count($FormData/ODCTaxOnImportedProductsGrp)+1) mod 2 = 1">styDepTblRow1</xsl:when>
                        <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                    <td class="styTableCellText" style="width:4mm;font-size:7pt;font-weight:bold;vertical-align:top;padding-top:1.5mm;border-color:black;border-bottom-width:0;border-right-width:0px;">
                        <xsl:value-of select="(count($FormData/ODCTaxOnImportedProductsGrp) + 1)"></xsl:value-of>
                    </td>
                    <td class="styTableCellText" colspan="5" style="width:152mm;font-size:7pt;border-color:black;border-bottom-width:0">
                      <b>Total ODC tax on imported products.</b> Add all amounts in column (f), include amounts from any
                        additional sheets. Enter the total here and on Form 720 on the line for <b>IRS No. 19</b>
                        <span class="styDotLn" style="float:none;padding-left:2mm;padding-right:0.5mm">...............</span>
                        <img src="{$ImagePath}/6627_Bullet_Md.gif" alt="MediumBullet"/>
                    </td>
                    <td class="styTableCell" style="width:31mm;border-color:black;border-right-width:0;border-bottom-width:0;vertical-align:bottom;padding-bottom:1mm;">
                      <div style="width:2mm;float:left;clear:none;font-size:7pt">$</div>
                      <div style="width:26mm;display:inline;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="$FormData/TotalODCTaxOnImpProductsAmt"></xsl:with-param>
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
          <xsl:if test="(count($FormData/TaxOnFloorStocksOfODCGrp) &gt; 3 and ($Print = $Separated))" >
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
                <xsl:for-each select="$FormData/TaxOnFloorStocksOfODCGrp">
                  <tr>
                    <xsl:attribute name="class">
                      <xsl:choose>
                        <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                        <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                      </xsl:choose>
                    </xsl:attribute>
                    <td style="height:8mm;width:6mm;text-align:center;font-weight:bold;border-bottom:1px black solid;border-top:1px black solid;padding-top:5mm;">
                      <xsl:value-of select="position()">
                      </xsl:value-of>
                    </td>
                    <td  style="height:8mm;width:58mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid">
                      <span style="clear:none;">   
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="IRSOzoneDepletingChemicalDesc"></xsl:with-param>
                        </xsl:call-template> 
                      </span>
                    </td>
                    <td class="styDepTblCell" style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;padding-top:6mm;text-align:right;">
                      <span style="clear:none">   
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="PoundsQty"></xsl:with-param>
                        </xsl:call-template> 
                      </span>
                    </td>
                    <td class="styDepTblCell" style="height:8mm;text-align:center;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:1px;">
                      <span style="height:8mm;width:35mm;padding-top:5mm;text-align:right;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IRSTaxPerPoundAmt"></xsl:with-param>
                        </xsl:call-template> 
                      </span>
                      <span style="width:1px;clear:none;"></span>
                    </td>
                    <td class="styDepTblCell" style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;">
                      <span style="width:36mm;padding-top:5mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="TaxAmt"></xsl:with-param>
                        </xsl:call-template> 
                      </span>
                    </td>
                  </tr>
                </xsl:for-each>
                <tr>
                  <xsl:attribute name="class">
                    <xsl:choose>
                      <xsl:when test="(count($FormData/TaxOnFloorStocksOfODCGrp)+1) mod 2 = 1">styDepTblRow1</xsl:when>
                      <xsl:otherwise>styDepTblRow2</xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                  <td style="height:8mm;width:6mm;text-align:center;font-weight:bold;border-bottom:1px black solid;border-top:1px black solid;padding-bottom:3.5mm;">
                    <xsl:value-of select="count($FormData/TaxOnFloorStocksOfODCGrp) + 1">
                    </xsl:value-of>
                  </td>
                  <td  colspan="3" style="height:8mm;text-align:left;border-bottom:1px black solid;border-top:1px black solid;">	
                    <span style="font-weight:bold;display:inline;">Total floor stocks tax.</span>
                    <span style="width:3px;clear:none;display:inline;"></span>
                    <span style="clear:none;font-weight:normal;display:inline;">Add all amounts in column (d), include amounts from any additional <br/>sheets. Enter the total here and on Form 720 on the line for</span>
                    <span style="width:4px;clear:none;display:inline;"></span>
                    <span style="font-weight:bold;display:inline;">IRS No. 20</span>
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
                  <td class="styDepTblCell" style="height:8mm;border-left:1px black solid;border-bottom:1px black solid;text-align:right;padding-top:5mm;">
                    <span style="width:2mm;float:left;display:inline;">$</span>
                    <span style="width:36mm;display:inline;">
                      <xsl:call-template name="PopulateAmount">
                        <xsl:with-param name="TargetNode" select="$FormData/TotalFloorStocksTaxAmt"></xsl:with-param>
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
