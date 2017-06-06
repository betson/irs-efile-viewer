<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>
<!--Updated per UWR 36537 on 06/16/2011 Changed revision date By Robert Jones -->
<!--Updated per UWR 46722 on 08/10/2011 Changed revision date and other verbiage - By Robert Jones -->
<!--Updated per Defect 430084 on 10/18/2011 No Problems Found at 1b, 1c, Line 13 Pushpin - By Robert Jones -->
<!--Updated per UWR  82576 line 4b and Revision Date to 12/2013- By Robert Jones -->
<!--Did the above changes per Defect 37897. Although there were no changes to Schema in Part III it doesn't populate with the new Schema-->
<!--Did the above changes per PDF Review Package 1 Robert Jones-->
<!--Did changes per PDF Review Package 2 11/22/2013 -  Robert Jones-->
<!--Did changes per IBM Defect #39267 11/27/2013 - Aligned 4a with 4b Robert Jones-->
<!--Did changes per IBM Defect #39229 12/03/2013 Robert Jones-->
<!--Did changes per IBM Defect #39237 12/05/2013 Robert Jones-->
<!--Did changes per FIT Defect #39461 12/05/2013 Robert Jones-->
<!--Updated per UWR  107348 and Revision Date to July/2014- By Robert Jones -->
<!--Did changes per IBM Defect #40742 6/24/2014 Robert Jones-->
<!--Did changes per IBM Defect #41290 8/8/2014 Robert Jones-->
<!--Did changes per IBM Defect #41295 8/8/2014 Robert Jones-->
<!--Did changes per IBM Defect #41415 8/20/2014 Robert Jones 508 added scope to several "th" lines -->
<!--Updated per Kisams IM01817803 and Revision Date back to December/2013- By Robert Jones -->
<!--Updated per Kisams IM01467430 11/18/2014 Transferor not populating. Schema element mis-spelled (Tranferor)- By Robert Jones -->
<!--Did changes per IBM Defect #43153 6/30/2015 by Robert Jones IE11 Related-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS926Style.xsl"/>
  <xsl:output method="html" indent="yes" encoding="iso-8859-1"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form926Data" select="$RtnDoc/IRS926"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form926Data)"/>
          </xsl:call-template>
        </title>
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <meta name="Description" content="Form 926"/>
        <meta name="GENERATOR" content="IBM WebSphere Studio"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
    <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS926Style"/>
            <xsl:call-template name="AddOnStyle"/>
       </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form926Data">
          <xsl:call-template name="DocumentHeader"/>
          <div class="styBB" style="width:187mm;">
            <div class="styFNBox" style="height:19mm; width:31mm;">
              <div>
            Form <span class="styFormNumber">926</span>
            <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form926Data"/>
								</xsl:call-template>
                <br/>(Rev. December 2013)<br/>
                <div style="font-size:6pt; padding-top:1.8mm">
              Department of the Treasury<br/>Internal Revenue Service
            </div>
              </div>
            </div>
            <div class="styFTBox" style="width:125mm">
              <div class="styMainTitle" style="padding-top:1mm">Return by a U.S. Transferor of Property<br/>to a Foreign Corporation</div>
              <div class="styFBT" style="margin-top:1mm;">
                <img src="{$ImagePath}/926_Bullet_Title.gif" alt="Arrow Bullet"/> Information about Form 926 and its separate instructions is at <a href="http://www.irs.gov/form926" title="Link to IRS.gov">
                <i>www.irs.gov/form926</i>
            </a>.
                <img src="{$ImagePath}/926_Bullet_Title.gif" alt="Arrow Bullet"/> Attach to your income tax return for the year of the transfer or distribution.
          </div>
          
              
        
            </div>
            <div class="styTYBox" style="width:31mm; height:19mm">
              <div style="padding-top:5mm">OMB No. 1545-0026</div>
              <div style="padding-left:5mm; text-align:left; margin-top:3mm; padding-bottom:2mm; line-height: 100%;">Attachment<br/>Sequence No. <b style="font-size:8pt">128</b>
              </div>
            </div>
          </div>
          <!-- BEGIN Part I Title -->
          <div class="styBB" style="width:187mm;display:table;">
            <div class="styPartName">Part I</div>
            <div class="styLNDesc" style="height:auto;font-size:7pt"><b>   <span style="width:2px;"/>U.S. Transferor Information </b>(see instructions)
            </div>
          </div>
          <!-- END Part I Title -->
          <div class="styBB" style="width:187mm">
            <div class="styFNBox" style="width:127mm; height:auto;display:table">          
          Name of transferor<br></br>
          
            <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form926Data/BusinessTranferorName/BusinessNameLine1Txt"/>
                </xsl:call-template>
                <xsl:if test="normalize-space($Form926Data/BusinessTranferorName/BusinessNameLine2Txt)!=''">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form926Data/BusinessTranferorName/BusinessNameLine2Txt"/>
                  </xsl:call-template>
                </xsl:if>
               <!-- <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form926Data/PersonTranferorNm"/>
                </xsl:call-template>    -->      
              </div>
            
            <div style="float:right; padding-left:1mm;height:auto;display:table">
              <b>Identifying number</b> (see instructions)<br></br>
          <div style="text-align:left; padding-top:2mm">
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="$Form926Data/TransferorEIN"/>
                </xsl:call-template>
              </div>
              <xsl:if test="$Form926Data/TransferorMissingEINReasonCd !=' '">
                <span style="font-weight:normal;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferorMissingEINReasonCd"/>
                  </xsl:call-template>
                </span>
              </xsl:if>
            </div>
          </div>
          <!--L1-->
          <div style="padding-top:1mm; width:187mm;height:auto;">
            <div class="styIRS926OL">&nbsp;1</div>
           
          If the transferor was a corporation, complete questions 1a through 1d.    
        </div>
         
          <!--1a-->
          <div style="padding-top:1mm; width:187mm;height:auto;">
            <div class="styIRS926OL" style="text-align:right">a</div>
            <div style="float:left">
          If the transfer was a section 361(a) or (b) transfer, was the transferor controlled (under section 368(c)) by                  
        </div>
          </div>
          <div style="width:187mm;height:auto;">
            <div class="styIRS926OL"/>
            <div style="float:left;padding-left:8mm;">
          5 or fewer domestic corporations?                    
        </div>
            <div style="float:right; padding-right:0.5mm">
              <span class="styIRS926DotLn">
            ...........                       
          </span>
              <div class="styLNDesc" style="height:auto;width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ControlledBy5OrFewerDomCorpInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/ControlledBy5OrFewerDomCorpInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ControlledBy5OrFewerDomCorpInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="height:auto;width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ControlledBy5OrFewerDomCorpInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/ControlledBy5OrFewerDomCorpInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
          <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ControlledBy5OrFewerDomCorpInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!--1b-->
          <div style="padding-top:1mm; width:187mm;height:auto;">
            <div class="styIRS926OL" style="text-align:right">b</div>
            <div style="float:left">
          Did the transferor remain in existence after the transfer?                    
        </div>
            <div style="float:right; padding-right:0.5mm">
              <span class="styIRS926DotLn">
            ..................                                      
          </span>
              <div class="styLNDesc" style="height:auto;width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ExistedAfterTransferInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/ExistedAfterTransferInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ExistedAfterTransferInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="height:auto;width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ExistedAfterTransferInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/ExistedAfterTransferInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
          <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ExistedAfterTransferInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!--b r2 -->
          <div class="styBB" style="width:187mm;height:auto;display:table">
            <div style="float:left; clear:none; ">
              <div style="width:180mm;padding-left:8mm;height:auto;">
            If not, list the controlling shareholder(s) and their identifying number(s):
          </div>
              <div style="width:0mm;">
                <!-- button display logic -->
              <!--  <xsl:call-template name="SetDynamicTableToggleButton">
                  <xsl:with-param name="TargetNode" select="$Form926Data/ControllingShareholder"/>
                  <xsl:with-param name="containerHeight" select="6"/>
                  <xsl:with-param name="containerID" select="'part1TPctn'"/>
                </xsl:call-template>-->
                <!-- end button display logic -->
              </div>
            </div>
          </div>
          <!-- -->
          <div class="styIRS926TableContainer" id="part1TPctn" style="display:table;">
            <xsl:attribute name="style">
            <xsl:if test="count($Form926Data/ControllingShareholder) &gt;6">
              
          </xsl:if>
          </xsl:attribute>
            <!-- print logic -->
            <xsl:call-template name="SetInitialState"/>
            <!-- end -->
            <table class="styIRS926Table" cellspacing="0" cellpadding="0" border="0" style="display:table;">
              <thead class="styTableThead">
                <tr align="center" style="height:8mm">
                  <th class="styIRS926TblRB" scope="col">Controlling shareholder</th>
                  <th class="styIRS926TblCell" scope="col">Identifying number</th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
             
                <!--Check if separated print is not checked and count of Controlling Shareholder data is less than and equal to 6 -->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/ControllingShareholder) &lt;=6)">
                 <xsl:for-each select="$Form926Data/ControllingShareholder">
                    <tr style="height:8mm; font-size: 7pt;">
                      <!-- Controlling Shareholder column -->
                      <td class="styIRS926TblRB" style="font-family:verdana;font-size:6pt;border-right:1px solid black;border-top:1px solid black;border-bottom:1px solid black;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ControllingShareholderName/BusinessNameLine1Txt"/>
                        </xsl:call-template>
                        <xsl:if test="normalize-space(ControllingShareholderName/BusinessNameLine2Txt)!=''">
                          <br/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="ControllingShareholderName/BusinessNameLine2Txt"/>
                          </xsl:call-template>
                        </xsl:if>
                        <span style="width: 2px"/>
                      </td>
                      <!-- Identifying Column -->
                      <td class="styIRS926TblCell" align="center" style="border-bottom:1px solid black;border-top:1px solid black;width:90mm;">
                        <xsl:choose>
                          <xsl:when test="normalize-space(ControllingShareholderEIN)">
                            <xsl:call-template name="PopulateEIN">
                              <xsl:with-param name="TargetNode" select="ControllingShareholderEIN"/>
                            </xsl:call-template>
                            <span style="width: 2px"/>
                          </xsl:when>
                          <xsl:when test="normalize-space(EINMissingReasonCd)">
                            <xsl:call-template name="PopulateText">
                              <xsl:with-param name="TargetNode" select="EINMissingReasonCd"/>
                            </xsl:call-template>
                            <span style="width: 2px"/>
                          </xsl:when>
                          <xsl:otherwise>
                            <xsl:call-template name="PopulateSSN">
                              <xsl:with-param name="TargetNode" select="ControllingShareholderSSN"/>
                            </xsl:call-template>
                            <span style="width: 2px"/>
                          </xsl:otherwise>
                        </xsl:choose>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                    <!-- Empty Table for line 1b  -->
                <!-- Table Filler Rows -->
                <xsl:if test="count($Form926Data/ControllingShareholder) &lt; 1 or ((count($Form926Data/ControllingShareholder) &gt;6) and ($Print = $Separated))">
                  <tr style="font-size: 7pt">
                    <td class="styIRS926TblCell" style="border-right:1px solid black;font- family:verdana;font-size:6pt">
                      <xsl:if test="((count($Form926Data/ControllingShareholder) &gt;6) and ($Print = $Separated))">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$Form926Data/ControllingShareholder"/>
                        </xsl:call-template>
                      </xsl:if>
                      <span style="width: 2px"/>
                    </td>
                    <td class="styIRS926TblCell">
                      <span style="width:4px"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Empty table check for line 2 -->
                <xsl:if test="count($Form926Data/ControllingShareholder) &lt; 2 or ((count($Form926Data/ControllingShareholder) &gt;6) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TblCell" style="width:50mm;  border-right:1px solid black;">
                      <span style="width:4px"/>
                    </td>
                    <td class="styIRS926TblCell">
                      <span style="width:4px"/>
                      <br/>
                      <span style="width:4px"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Empty Table check for line 3 -->
                <xsl:if test="count($Form926Data/ControllingShareholder) &lt; 3 or ((count($Form926Data/ControllingShareholder) &gt;6) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TblCell" style="width:50mm;  border-right:1px solid black;">
                      <span style="width:4px"/>
                    </td>
                    <td class="styIRS926TblCell">
                      <span style="width:4px"/>
                      <br/>
                      <span style="width:4px"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Empty table check for line 4 -->
                <xsl:if test="count($Form926Data/ControllingShareholder) &lt; 4 or ((count($Form926Data/ControllingShareholder) &gt;6) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TblCell" style="width:50mm;  border-right:1px solid black;">
                      <span style="width:4px"/>
                    </td>
                    <td class="styIRS926TblCell">
                      <span style="width:4px"/>
                      <br/>
                      <span style="width:4px"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Empty table check for line 5 -->
                <xsl:if test="count($Form926Data/ControllingShareholder) &lt; 5 or ((count($Form926Data/ControllingShareholder) &gt;6) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TblCell" style="width:50mm;  border-right:1px solid black;">
                      <span style="width:4px"/>
                    </td>
                    <td class="styIRS926TblCell">
                      <span style="width:4px"/>
                      <br/>
                      <span style="width:4px"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Empty table check for line 6 -->
                <xsl:if test="count($Form926Data/ControllingShareholder) &lt; 6 or ((count($Form926Data/ControllingShareholder) &gt;6) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TblCell" style="width:50mm;  border-right:1px solid black;">
                      <span style="width:4px"/>
                    </td>
                    <td class="styIRS926TblCell">
                      <span style="width:4px"/>
                      <br/>
                      <span style="width:4px"/>
                    </td>
                  </tr>
                </xsl:if>
              </tbody>
            </table>
          </div>
          <!-- 1c -->
          <div style="width:187mm; padding-top:1mm;display:table">
            <div class="styIRS926OL" style="text-align:right">c</div>
            <div style="float:left">
          If the transferor was a member of an affiliated group filing a consolidated return, was it the parent                  
        </div>
          </div>
          <!-- 1c row 2 -->
          <div style="width:187mm">
            <div class="styIRS926OL"/>
            <div style="float:left;padding-left:8mm;">
          corporation?              
        </div>
            <div style="float:right; padding-right:0.5mm">
              <span class="styIRS926DotLn">
            ..............................                      
          </span>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;height:auto;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ParentCorporationInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/ParentCorporationInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ParentCorporationInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;height:auto;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ParentCorporationInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/ParentCorporationInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
          <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ParentCorporationInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!-- 1c Row3 -->
          <div style="width:184mm; padding-top:2mm; padding-bottom:2mm;display:table">
            <div style="float:left; padding-left:8mm">
          If not, list the name and employer identification number (EIN) of the parent corporation:        
        </div>
          </div>
          <!-- Begin 1c table -->
          <table class="styIRS926InerTable" cellpadding="0" cellspacing="0" border="0" style="display:table">
            <tr>
              <th class="styIRS926TblRB" scope="col" style="border-bottom:1px solid black;border-top:1px solid black;">Name of parent corporation</th>
              <th class="styIRS926TblCell" scope="col" style="border-bottom:1px solid black;border-top:1px solid black;">EIN of parent corporation</th>
            </tr>
            <tr style="height:8mm">
              <td class="styIRS926TblRB" style="font-size: 6pt;font-family:verdana;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form926Data/ParentCorporationName/BusinessNameLine1Txt"/>
                </xsl:call-template>
                <xsl:if test="normalize-space($Form926Data/ParentCorporationName/BusinessNameLine2Txt)!=''">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ParentCorporationName/BusinessNameLine2Txt"/>
                  </xsl:call-template>
                </xsl:if>&nbsp;   
          </td>
              <td align="center" class="styIRS926TblCell" style="font-size: 7pt;border-bottom:1px solid black;">
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="$Form926Data/ParentCorporationEIN"/>
                </xsl:call-template>&nbsp;
           <!--Checkf for Missing EIN Reason -->
                <xsl:if test="$Form926Data/MissingEINReasonCd !=' '">
                  <span style="font-weight:normal;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form926Data/MissingEINReasonCd"/>
                    </xsl:call-template>
                  </span>
                </xsl:if>
              </td>
            </tr>
          </table>
          <!--d-->
          <div style="padding-top:1mm; width:187mm">
            <div class="styIRS926OL" style="text-align:right">d</div>
            <div style="float:left">
          Have basis adjustments under section 367(a)(5) been made?                    
        </div>
            <div style="float:right; padding-right:0.5mm">
              <span class="styIRS926DotLn">......   
              <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form926Data/BasicAdjusmentsSect367a5Ind"/>
								</xsl:call-template>                                  
          </span>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/BasicAdjusmentsSect367a5Ind"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/BasicAdjusmentsSect367a5Ind"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/BasicAdjusmentsSect367a5Ind"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/BasicAdjusmentsSect367a5Ind"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/BasicAdjusmentsSect367a5Ind"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
          <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/BasicAdjusmentsSect367a5Ind"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!--blank line -->
          <div style="width:187mm"/>
          <!--L2-->
          <div style="width:187mm">
            <div class="styIRS926OL">&nbsp;2</div>
            <div style="float:left">
          If the transferor was a partner in a partnership that was the actual transferor (but is not treated as such under section 367), complete <br></br>questions 2a through 2d.
        </div>
          </div>
          <!--a-->
          <div style=" width:187mm; padding-top:1mm;">
            <div class="styIRS926OL" style="text-align:right">a</div>
            <div class="styLNDesc" style="padding-top:0mm;padding-bottom:0mm;">List the name and EIN of the transferor’s partnership: 
        </div>
          </div>
          <!--L2a table -->
          <table class="styIRS926InerTable" cellpadding="0" cellspacing="0" border="0" style="display:table;height:auto;">
            <tr>
              <th class="styIRS926TblRB" scope="col" style="border-bottom:1px solid black;border-top:1px solid black;">Name of partnership</th>
              <th class="styIRS926TblCell" scope="col" style="border-bottom:1px solid black;border-top:1px solid black;">EIN of partnership</th>
            </tr>
            <tr style="height:8mm;">
             <!-- <td class="styIRS926TblRB" style="border-right:1px solid black; padding-left:2mm;font-family:verdana;font-size:6pt;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form926Data/PartnershipName/BusinessNameLine1Txt"/>
                </xsl:call-template>
                <xsl:if test="normalize-space($Form926Data/NameOfPartnership/BusinessNameLine2Txt)!=''">
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PartnershipName/BusinessNameLine2Txt"/>
                  </xsl:call-template>
                </xsl:if>&nbsp;    
          </td>-->
           <td class="styIRS926TblRB" style="font-size: 6pt;font-family:verdana; border-bottom:1px solid black;">
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form926Data/PartnershipName/BusinessNameLine1Txt"/>
                </xsl:call-template>
               <!-- <xsl:if test="normalize-space($Form926Data/NameOfPartnership/BusinessNameLine2Txt)!=''"> Doesn't work here-->
                  <br/>
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PartnershipName/BusinessNameLine2Txt"/>
                  </xsl:call-template>
               <!-- </xsl:if>&nbsp;   -->
          </td>
 <xsl:choose>
                  <xsl:when test="$Form926Data/PartnershipEIN">  
              <td class="styIRS926TblCell" align="center" style="border-bottom:1px solid black;font-size: 7pt;">
                <xsl:call-template name="PopulateEIN">
                  <xsl:with-param name="TargetNode" select="$Form926Data/PartnershipEIN"/>
                </xsl:call-template>
                </td>
            <!-- Check for EIN of Partnership Missing Reason -->
              </xsl:when>
               <xsl:otherwise>
                  <td class="styIRS926TblCell" align="center" style="border-bottom:1px solid black;font-size: 7pt;">
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form926Data/PartnershipMissingEINReasonCd"/>
                    </xsl:call-template>
                  </td>
                  
                
             
                </xsl:otherwise>  
                </xsl:choose>
            </tr>
          </table>
          <!--2b-->
          <div style="width:187mm;padding-top:1mm; ">
            <div class="styIRS926OL" style="text-align:right">b</div>
            <div style="float:left">
          Did the partner pick up its pro rata share of gain on the transfer of partnership assets?                   
        </div>
            <div style="float:right; padding-right:0.5mm">
              <span class="styIRS926DotLn">
            ........                                    
          </span>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrPickProRataShrGnTrnsfrInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrPickProRataShrGnTrnsfrInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrPickProRataShrGnTrnsfrInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrPickProRataShrGnTrnsfrInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrPickProRataShrGnTrnsfrInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
          <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrPickProRataShrGnTrnsfrInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!-- 2c -->
          <div style="padding-top:1mm; width:187mm">
            <div class="styIRS926OL" style="text-align:right">c</div>
            <div style="float:left">
          Is the partner disposing of its <b>entire </b>interest in the partnership?                    
        </div>
            <div style="float:right; padding-right:0.5mm">
              <span class="styIRS926DotLn">
            ...............                                     
          </span>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrDispsngEntireIntPrtshpInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrDispsngEntireIntPrtshpInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrDispsngEntireIntPrtshpInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrDispsngEntireIntPrtshpInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrDispsngEntireIntPrtshpInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
          <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrDispsngEntireIntPrtshpInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!-- 2d R1-->
          <div style="padding-top:1mm; width:187mm">
            <div class="styIRS926OL" style="text-align:right">d</div>
            <div class="styLNDesc">
         Is the partner disposing of an interest in a limited partnership that is regularly traded on an established                     
        </div>
          </div>
          <!-- 2d R2 -->
          <div style="width:187mm">
            <div class="styIRS926OL" style="text-align:right"/>
            <div style="float:left">
         securities market?                    
        </div>
            <div style="float:right; padding-right:0.5mm">
              <span class="styIRS926DotLn">
            ..............................                                    
          </span>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrDisposingIntLtdPrtshpInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrDisposingIntLtdPrtshpInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrDisposingIntLtdPrtshpInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrDisposingIntLtdPrtshpInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrDisposingIntLtdPrtshpInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
          <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrDisposingIntLtdPrtshpInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!-- END Part I Line Items -->
          <!-- BEGIN Part II Title -->
          <div class="styIRS926Part2BB" style="border-top-width:1px;">
            <div class="styPartName">Part II</div>
            <div class="styPartDesc">Transferee Foreign Corporation Information <span class="styNormalText">(see instructions)</span>
            </div>
          </div>
          <!-- END Part II Title -->
          <!-- BEGIN Part II Line Items -->
          <div class="styIRS926Part2BB">
            <div class="styFNBox" style="width:100mm; height:10mm">
              <!-- 3<div style="float:right; padding-left:1mm;height:auto;">
              <b>Identifying number</b> (see instructions)<br></br>
          <div style="text-align:left; padding-top:2mm"> -->
              <div class="styIRS926OL">&nbsp;3</div>
              <div class="styIRS926OL" style="width:70mm;font-weight:normal;">Name of transferee (foreign corporation)</div><br></br>
            <div style="font-family:verdana;font-size:6pt;">
                  <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransfereeName/BusinessNameLine1Txt"/>
                  </xsl:call-template>
                  <xsl:if test="normalize-space($Form926Data/TransfereeName/BusinessNameLine2Txt)!=''">
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransfereeName/BusinessNameLine2Txt"/>
                    </xsl:call-template>
                  </xsl:if>
                </div>
              </div>
            
            <div style="float:left">
              <!-- 4a Replaces 4 from prior years in 2013 -->
              <div class="styIRS926OL" style="">4a</div>
              <div class="styIRS926OL" style="width:70mm;font-weight:normal;"><b>Identifying number</b>, if any</div><br></br>
             
            <div style="padding-top: 2mm;padding-left: 7mm;">
                  <xsl:call-template name="PopulateEIN">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransfereeEIN"/>
                  </xsl:call-template>
                  <!-- Check for EIN Missing Reason -->
                  <xsl:if test="$Form926Data/EINMissingReasonCd !=' '">
                    <span style="font-weight:normal;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="$Form926Data/EINMissingReasonCd"/>
                      </xsl:call-template>
                    </span>
                  </xsl:if>
               
              </div>
            </div>
          </div>
         
          <div class="styIRS926Part2BB">
            <div class="styFNBox" style="width:100mm; height:auto;">
              <!-- 5 -->
              <div class="styIRS926OL">&nbsp;5</div>
              <div class="styIRS926OL" style="width:40mm;font-weight:normal;">Address (including country)</div><br></br>
            
            
                     <!-- Check for Transferee US Address -->
              <xsl:if test="$Form926Data/TransfereeUSAddress">
                <xsl:call-template name="PopulateUSAddressTemplate">
                  <xsl:with-param name="TargetNode" select="$Form926Data/TransfereeUSAddress"/>
                </xsl:call-template>
              </xsl:if>
              <!-- Check for Transferee Foreign Address -->
              <xsl:if test="$Form926Data/TransfereeForeignAddress">
                <xsl:call-template name="PopulateForeignAddressTemplate">
                  <xsl:with-param name="TargetNode" select="$Form926Data/TransfereeForeignAddress"/>
                </xsl:call-template>
              </xsl:if>
            </div>
            
           
            <!--<div style="float:left">-->
   <!-- 4b New for 2013  There must be a problem with the Schema because this field will not populate with the element for this line. I can make the field populate-->
              <div class="styIRS926OL" style="width:70mm;font-weight:normal;"><b>&nbsp;4b </b> Reference ID number (see instructions)</div>
          <div class="styIRS926OL" style="width:70mm;font-weight:normal;padding-left:2mm;border-left:1px solid grey;">
    <xsl:if test="($Print!=$Separated) or (($Print=$Separated) and (count($Form926Data/ForeignEntityIdentificationGrp) &lt;20))">
      <xsl:for-each select="$Form926Data/ForeignEntityIdentificationGrp">
                     <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
                  </xsl:call-template>
                 </xsl:for-each>
           </xsl:if>
  </div>
</div>
              <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
          
         <!--
                <xsl:if test="$Form926Data/ForeignEntityIdentificationGrp = 0 or ((count($Form926Data/ForeignEntityIdentificationGrp) &gt; 1) and ($Print = $Separated))">
                
                  <tr>
                    <td class="styIRS926OL " style="">&nbsp;4b</td>
                    <td class="styIRS926OL " style="width:70mm;">Reference ID number (see instructions)
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$Form926Data/ForeignEntityIdentificationGrp"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    </tr>
                </xsl:if>
                           
             
               
                <xsl:if test="($Print != $Separated) or (count($Form926Data/ForeignEntityIdentificationGrp) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/ForeignEntityIdentificationGrp">
                    <tr>
                      
                        <td class="styIRS926OL " style="width:70mm;vertical-align:middle;border-bottom-width: 0px;">
                          
                 
              </td>
                 
                      </tr>
                      </xsl:for-each>
                       </xsl:if>-->
          <!-- 5***********************Changed in 2013****************************************************************************************************************************
          <div class="styIRS926Part2BB" style="height:14mm;">
            <div class="styIRS926OL">&nbsp;5</div>
            <div style="float:left">
          Address (including country)    
        </div>
            <div style="margin-left:6mm">
              <br/>
              Check for Transferee US Address 
              <xsl:if test="$Form926Data/TransfereeUSAddress">
                <xsl:call-template name="PopulateUSAddressTemplate">
                  <xsl:with-param name="TargetNode" select="$Form926Data/TransfereeUSAddress"/>
                </xsl:call-template>
              </xsl:if>
             Check for Transferee Foreign Address
              <xsl:if test="$Form926Data/TransfereeForeignAddress">
                <xsl:call-template name="PopulateForeignAddressTemplate">
                  <xsl:with-param name="TargetNode" select="$Form926Data/TransfereeForeignAddress"/>
                </xsl:call-template>
              </xsl:if>
            </div>
          </div>
          -->
          <!-- 6 -->
          <div class="styIRS926Part2BB" style="height:7.5mm;">
            <div class="styIRS926OL" style="clear:none">&nbsp;6</div>
            <div class="styGenericDiv" style="width:178mm;">
          Country code of country of incorporation or organization (see instructions)
          <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form926Data/TransfereeCountryOfIncorpCd"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- 7 -->
          <div class="styIRS926Part2BB" style="height:7.5mm;">
            <div class="styIRS926OL" style="clear:none">&nbsp;7</div>
            <div class="styGenericDiv" style="width:178mm;">
          Foreign law characterization (see instructions)
          <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form926Data/ForeignLawCharacterizationTxt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- 8 -->
          <div class="styIRS926Part2BB">
            <div class="styIRS926OL">&nbsp;8</div>
            <div style="float:left">
          Is the transferee foreign corporation a controlled foreign corporation?                
        </div>
            <div style="float:right; padding-right:0.5mm">
              <span class="styIRS926DotLn">
            ..............                          
          </span>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransfereeForeignCorpInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransfereeForeignCorpInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransfereeForeignCorpInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransfereeForeignCorpInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransfereeForeignCorpInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
          <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransfereeForeignCorpInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!-- Page 1 END  -->
          <div class="pageEnd" style="padding-top:1mm; width:187mm; border-top:1px solid black">
            <div style="float:left;">
              <b>For Paperwork Reduction Act Notice, see separate instructions.</b>
            </div>
            <div style="float:right;">
      Cat No. 16982D
      <span style="width:35mm"/>
      Form <b style="font-size:8pt">926</b> (Rev. 12-2013)
      </div>
          </div>
     
          <!-- Begin page 2 Header-->
          <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
            <div style="width:90mm;" class="styGenericDiv">Form 926 (Rev. 12-2013)</div>
            <div style="width:55mm;text-align:center;" class="styGenericDiv"/>
            <div style="float:right;" class="styGenericDiv">Page <span class="styBoldText" style="font-size:8pt;">2</span>
            </div>
          </div>
          
        <!--  <div class="styBB" style="width:187mm; display:table;">
            <div style="float:left">
        Form 926 (Rev. 12-2013)
      </div>
            <div style="float:right">
        Page <b style="font-size:8pt">2</b>
            </div>
          </div>-->
          <!-- BEGIN Part III Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartName">Part III</div>
            <div class="styPartDesc" style="padding-top:.5mm;">Information Regarding Transfer of Property <span class="styNormalText">(see instructions)</span>
            </div>
       
          <!-- END Part III Title -->
          <xsl:variable name="RowCount11" select="count($Form926Data/OtherNontaxableUse)"/>
          <div>
       <span style="width:7mm;text-align:right;float:right; clear: none">
    <xsl:call-template name="SetDynamicTableToggleRowCount">
      <xsl:with-param name="DataRowCount" select="$RowCount11 + 2"/>
      <xsl:with-param name="containerHeight" select="3"/>
      <xsl:with-param name="containerID" select=" 'IRTP' "/>
    </xsl:call-template>
 </span>
    </div>
       </div>
          <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
 @@@@@@@@@@@@@-->
          <!-- Part III Table -->
          <div style="width:187mm;float:left;clear:left;" id="IRTP">
            <table class="styTable" id="IRS926PartIII" summary="Information Regarding Transfer of Property" cellspacing="0" >
              <thead class="styIRS926TableThead">
                <tr>
                  <th class="styIRS926TableCellLine " scope="col" style="width:34mm;text-align:center;border-bottom-width: 0px; border-top-width: 0px;vertical-align:top; ">Type of<br/> property</th>
                  <th class="styIRS926TableCellA " scope="col" style="width:24mm;text-align:center;vertical-align:top;">
                    <span class="styBoldText">(a)</span>
                    <br/> Date of <br/>transfer
              </th>
                  <th class="styIRS926TableCellB" scope="col" style="width:51mm;text-align:center;vertical-align:top;">
                    <span class="styBoldText">(b)</span>
                    <br/> Description of<br/> property
              </th>
                  <th class="styIRS926TableCellC " scope="col" style="width:26mm;text-align:center;vertical-align:top;">
                    <span class="styBoldText">(c)</span>
                    <br/> Fair market value<br/> on date <br/>of transfer
              </th>
                  <th class="styIRS926TableCellD " scope="col" style="width:26mm;text-align:center;vertical-align:top;">
                    <span class="styBoldText">(d)</span>
                    <br/> Cost or other<br/> basis
              </th>
                  <th class="styIRS926TableCellE" scope="col" style="width:26mm;text-align:center;vertical-align:top;">
                    <span class="styBoldText">(e)</span>
                    <br/> Gain recognized on<br/> transfer
              </th>
              
                </tr>
                
              </thead>
              
              <tfoot/>
              <tbody>
              
              <!--Begin Part III Table - Cash line -->
                <!-- Part III table L1 -->
            <xsl:variable name="AGRowCount1" select="count($Form926Data/Cash/TransferDt)"/>
                <xsl:if test="$AGRowCount1 = 0 or ((count($Form926Data/Cash/TransferDt) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">Cash</td>
                    <td class="styIRS926TableCellA " style="width:24mm;">
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$Form926Data/Cash"/>
                      </xsl:call-template>
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellB" style="width:51mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellC " style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellD" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellE" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                           
                <!-- Adding check for the SRD -->
                <!-- Part III table L1-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/Cash/TransferDt) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/Cash">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount1"/></xsl:attribute>
                  Cash
              </td>
                      </xsl:if>
                      <td class="styIRS926TableCellA " style="width:24mm;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellB" style="width:51mm;background-color:gray;">
                        
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellC " style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellD" style="width:26mm;background-color:gray;">
                        
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellE" style="width:26mm;background-color:gray;">
                        
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                
                  <!--Loop -->
                <!-- Part III table L2-->
                <xsl:variable name="AGRowCount2" select="count($Form926Data/StocksAndSecurities)"/>
                <xsl:if test="$AGRowCount2 = 0 or ((count($Form926Data/StocksAndSecurities) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">Stock and <br/>securities</td>
                    <td class="styIRS926TableCellA " style="width:24mm;">
                      
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellB" style="width:51mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellC " style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellD" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellE" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                           
                <!-- Adding check for the SRD -->
                <!-- Part III table L2-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/StocksAndSecurities) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/StocksAndSecurities">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-top-width: 0px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount2"/></xsl:attribute>
                  Stock and <br/>securities
              </td>
                      </xsl:if>
                      <td class="styIRS926TableCellA " style="width:24mm;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellB" style="width:51mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellC " style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellD" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellE" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GainRecognizedOnTransferAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--End Part III Table - Stock and securities line -->
                <!--Begin Part III Table - Installment Obligations -->
                <!--Loop -->
                <!-- Part III table L3-->
                <xsl:variable name="AGRowCount3" select="count($Form926Data/InstallmentObligations)"/>
                <xsl:if test="$AGRowCount3 = 0 or ((count($Form926Data/InstallmentObligations) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">Installment<br/>obligations,<br/>account<br/>receivables or<br/>similar property</td>
                    <td class="styIRS926TableCellA " style="width:24mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellB" style="width:51mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellC " style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellD" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellE" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <!-- Part III table L3-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/InstallmentObligations) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/InstallmentObligations">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount3"/></xsl:attribute>Installment<br/>obligations,<br/>account<br/>receivables or<br/>similar property</td>
                      </xsl:if>
                      <td class="styIRS926TableCellA" style="width:24mm;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellB" style="width:51mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellC " style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellD" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellE" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GainRecognizedOnTransferAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--End Part III Table - Installment obligations -->
                <!--Begin Part III Table - Foreign currency -->
                <!--Loop -->
                <!-- Part III table L4-->
                <xsl:variable name="AGRowCount4" select="count($Form926Data/FrgnCurOtherPropDenominated)"/>
                <xsl:if test="$AGRowCount4 = 0 or ((count($Form926Data/FrgnCurOtherPropDenominated) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">Foreign currency<br/>or other property<br/>denominated in<br/>foreign currency</td>
                    <td class="styIRS926TableCellA " style="width:24mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellB" style="width:51mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellC " style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellD" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellE" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <!-- Part III table L4-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/FrgnCurOtherPropDenominated) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/FrgnCurOtherPropDenominated">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount4"/></xsl:attribute>Foreign currency<br/>or other property<br/>denominated in<br/>foreign currency</td>
                      </xsl:if>
                      <td class="styIRS926TableCellA" style="width:24mm;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellB" style="width:51mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellC " style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellD" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellE" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GainRecognizedOnTransferAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--End Part III Table - Foreign Currency -->
                <!--Begin Part III Table - Inventory -->
                <!--Loop -->
                <!-- Part III table L5-->
                <xsl:variable name="AGRowCount5" select="count($Form926Data/TranferOfPropertyInventory)"/>
                <xsl:if test="$AGRowCount5 = 0 or ((count($Form926Data/TranferOfPropertyInventory) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">Inventory</td>
                    <td class="styIRS926TableCellA " style="width:24mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellB" style="width:51mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellC " style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellD" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellE" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <!-- Part III table L5-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/TranferOfPropertyInventory) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/TranferOfPropertyInventory">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount5"/></xsl:attribute>Inventory</td>
                      </xsl:if>
                      <td class="styIRS926TableCellA " style="width:24mm;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellB" style="width:51mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellC " style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellD" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellE" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GainRecognizedOnTransferAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--End Part III Table -Inventory -->
                <!--Begin Part III Table - Assets subject -->
                <!--Loop -->
                <!-- Part III table L6-->
                <xsl:variable name="AGRowCount6" select="count($Form926Data/AssetsSubjectDeprecRecapture)"/>
                <xsl:if test="$AGRowCount6 = 0 or ((count($Form926Data/AssetsSubjectDeprecRecapture) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">Assets subject to<br/>depreciation<br/>recapture (see<br/>Temp. Regs. sec.<br/>1.367(a)-4T(b))</td>
                    <td class="styIRS926TableCellA " style="width:24mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellB" style="width:51mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellC " style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellD" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellE" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <!-- Part III table L6-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/AssetsSubjectDeprecRecapture) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/AssetsSubjectDeprecRecapture">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount6"/></xsl:attribute>Assets subject to<br/>depreciation<br/>recapture (see<br/>Temp. Regs. sec.<br/>1.367(a)-4T(b))</td>
                      </xsl:if>
                      <td class="styIRS926TableCellA " style="width:24mm;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellB" style="width:51mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellC " style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellD" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellE" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GainRecognizedOnTransferAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--End Part III Table -Assets subject -->
                <!--Begin Part III Table - Tangible property -->
                <!--Loop -->
                <!-- Part III table L7-->
                <xsl:variable name="AGRowCount7" select="count($Form926Data/TangibleProperty)"/>
                <xsl:if test="$AGRowCount7 = 0 or ((count($Form926Data/TangibleProperty) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">Tangible property<br/>used in trade or<br/>business not listed<br/>under another<br/>category</td>
                    <td class="styIRS926TableCellA " style="width:24mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellB" style="width:51mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellC " style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellD" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellE" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <!-- Part III table L7-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/TangibleProperty) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/TangibleProperty">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount7"/></xsl:attribute>Tangible property<br/>used in trade or<br/>business not listed<br/>under another<br/>category</td>
                      </xsl:if>
                      <td class="styIRS926TableCellA " style="width:24mm;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellB" style="width:51mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellC " style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellD" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellE" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GainRecognizedOnTransferAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--End Part III Table - Tangible property -->
                <!--Begin Part III Table - Intangible Property -->
                <!--Loop -->
                <!-- Part III table L8-->
                <xsl:variable name="AGRowCount8" select="count($Form926Data/IntangibleProperty)"/>
                <xsl:if test="$AGRowCount8 = 0 or ((count($Form926Data/IntangibleProperty) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">Intangible<br/>property</td>
                    <td class="styIRS926TableCellA " style="width:24mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellB" style="width:51mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellC " style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellD" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellE" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <!-- Part III table L8-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/AssetsSubjectDeprecRecapture) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/IntangibleProperty">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount8"/></xsl:attribute>Intangible<br/>property</td>
                      </xsl:if>
                      <td class="styIRS926TableCellA " style="width:24mm;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellB" style="width:51mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellC " style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellD" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellE" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GainRecognizedOnTransferAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--End Part III Table -Intangible property -->
                <!--Begin Part III Table - Property to be leased -->
                <!--Loop -->
                <!-- Part III table L9-->
                <xsl:variable name="AGRowCount9" select="count($Form926Data/PropertyLeased)"/>
                <xsl:if test="$AGRowCount9 = 0 or ((count($Form926Data/PropertyLeased) &gt; 1) and ($Print = $Separated))">
                  <tr>
                  <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">Property to be<br/>leased (as<br/>described in <br/>final and temp. Regs. sec.<br/>1.367(a)-4(c)</td>
                    <td class="styIRS926TableCellA " style="width:24mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellB" style="width:51mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellC " style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellD" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellE" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <!-- Part III table L9-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/PropertyLeased) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/PropertyLeased">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
             <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount9"/></xsl:attribute>Property to be<br/>leased (as<br/>described in <br/>final and temp. Regs. sec.<br/>1.367(a)-4(c))</td>
                      </xsl:if>
                      <td class="styIRS926TableCellA " style="width:24mm;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellB" style="width:51mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellC " style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellD" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellE" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GainRecognizedOnTransferAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--End Part III Table - Property to be leased -->
                <!--Begin Part III Table - Property to be sold -->
                <!--Loop -->
                <!-- Part III table L10-->
                <xsl:variable name="AGRowCount10" select="count($Form926Data/PropertySold)"/>
                <xsl:if test="$AGRowCount10 = 0 or ((count($Form926Data/PropertySold) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">Property to be<br/>sold (as<br/>described in <br/>Temp. Regs. sec.<br/>1.367(a)-4(d))</td>
                    <td class="styIRS926TableCellA " style="width:24mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellB" style="width:51mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellC " style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellD" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellE" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <!-- Part III table L10-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/PropertySold) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/PropertySold">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount10"/></xsl:attribute>Property to be<br/>sold (as<br/>described in <br/>Temp. Regs. sec.<br/>1.367(a)-4T(d))</td>
                      </xsl:if>
                      <td class="styIRS926TableCellA " style="width:24mm;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellB" style="width:51mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellC " style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellD" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellE" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GainRecognizedOnTransferAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--End Part III Table - Property to be sold -->
                <!--Begin Part III Table - Transfers of oil -->
                <!--Loop -->
                <!-- Part III table L11-->
                <xsl:variable name="AGRowCount11" select="count($Form926Data/TransfersOilGasWorkingInterest)"/>
                <xsl:if test="$AGRowCount11 = 0 or ((count($Form926Data/TransfersOilGasWorkingInterest) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">Transfers of oil and<br/>gas working<br/>interests (as<br/>described in <br/>Temp. Regs. sec.<br/>1.367(a)-4T(e))</td>
                    <td class="styIRS926TableCellA " style="width:24mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellB" style="width:51mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellC " style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellD" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellE" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <!-- Part III table L11-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/TransfersOilGasWorkingInterest) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/TransfersOilGasWorkingInterest">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount11"/></xsl:attribute>Transfers of oil and<br/>gas working<br/>interests (as<br/>described in <br/>Temp. Regs. sec.<br/>1.367(a)-4T(e))</td>
                      </xsl:if>
                      <td class="styIRS926TableCellA " style="width:24mm;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellB" style="width:51mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellC " style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellD" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellE" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GainRecognizedOnTransferAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--End Part III Table - Transfer of oil -->
                <!--Begin Part III Table - Other property -->
                <!--Loop -->
                <!-- Part III table L12-->
                <xsl:variable name="AGRowCount12" select="count($Form926Data/OtherProperty)"/>
                <xsl:if test="$AGRowCount12 = 0 or ((count($Form926Data/OtherProperty) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 1px;">Other<br/>property</td>
                    <td class="styIRS926TableCellA " style="width:24mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellB" style="width:51mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellC " style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellD" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellE" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Adding check for the SRD -->
                <!-- Part III table L12-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/OtherProperty) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/OtherProperty">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount12"/></xsl:attribute>Other<br/>property</td>
                      </xsl:if>
                      <td class="styIRS926TableCellA " style="width:24mm;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellB" style="width:51mm;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellC " style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellD" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellE" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GainRecognizedOnTransferAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!--End Part III Table - Other property -->
              </tbody>
            </table>
          </div>
          <!-- separated format************************************************* -->
          <!-- Part III Bottom Heading-->
          <div style="width:187mm;">
            <div class="styLNDesc" style="width: 128mm;">
              <span style="font-weight: bold">Supplemental Information Required To Be Reported </span>(see instructions):
        </div>
          </div>
          <div>
            <!-- A straight Line -->
            <span style="width:187mm;border-bottom:solid 1px;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form926Data/SupplementalInformationTxt"/>
              </xsl:call-template>
            </span>
            <br/>
          </div>
          <!-- END Part III Line Items -->
          <div style="padding-top:1mm; width:187mm; border-top:1px solid black" class="pageEnd">
            <div style="float:left">
              <b/>
            </div>
            <div style="float:right">
              <span style="width:45mm"/>
      Form <b style="font-size:8pt">926</b> (Rev. 12-2013)
      </div>
          </div>
          <p style="page-break-before: always"/>
          <!-- Begin Page 3 -->
          <div style="width:187mm; border-bottom:1px solid black; page-break-before:always">
            <div style="float:left">
        Form 926 (Rev. 12-2013)
      </div>
            <div style="float:right">
        Page <b style="font-size:8pt">3</b>
            </div>
          </div>
          <!-- BEGIN Part IV Title -->
          <div class="styBB" style="width:187mm">
            <div class="styPartName">Part IV</div>
            <div class="styPartDesc">Additional Information Regarding Transfer of Property <span class="styNormalText">(see instructions)</span>
            </div>
          </div>
          <!-- END Part IV Title -->
          <!-- BEGIN Part IV Line Items -->
          <!-- L9 R1-->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD">9</div>
            <div class="styLNDesc" style="width: 128mm;">Enter the transferor’s interest in the foreign transferee corporation before and after the transfer:
        </div>
            <!--<img src="{$ImagePath}/926_Bullet_Title.gif" alt="Arrow Bullet"/>-->
          </div>
          <!-- L9 R2-->
          <div style="width:187mm">
            <div class="styLNLeftNumBoxSD"/>
            <div class="styLNDesc" style="width:179mm;">
              <b>(a)</b> Before 
             <!-- A straight Line -->
              <span style="width:25mm;border-bottom:solid 1px;">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form926Data/TransferorsBeforeTransferIntRt"/>
                </xsl:call-template>
              </span>
              <span style="width:5mm;"/>
              <b>(b)</b> After
             <span style="width:25mm;border-bottom:solid 1px;">
                <xsl:call-template name="PopulatePercent">
                  <xsl:with-param name="TargetNode" select="$Form926Data/TransferorsAfterTransferIntRt"/>
                </xsl:call-template>
              </span>
            </div>
          </div>
           <br></br>
            <br></br>
          <!-- L10-->
          <div style="width:187mm">
            <div class="styLNLeftNumBox">10</div>
            <div class="styLNDesc" style="width:74mm;">
            Type of nonrecognition transaction (see instructions)
          </div>
            <img src="{$ImagePath}/926_Bullet_Title.gif" alt="Arrow Bullet"/>
            <!-- A straight Line -->
            <span style="width:75mm;border-bottom:solid 1px;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form926Data/NonrecognitionTransactionTxt"/>
              </xsl:call-template>
            </span>
          </div>
          <br></br>
           <br></br>
          <!-- L11-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox">11</div>
            <div class="styLNDesc">Indicate whether any transfer reported in Part III on this schedule is subject to any of the following:          
          </div>
          </div>
          <!--11a-->
          <div style="width:187mm">
            <div style="float:left;clear:none">
              <div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
              <div class="styLNDesc" style="width:54mm;">Gain recognition under section 904(f)(3)</div>
              <div class="styIRS926DotLn" style="width:94mm;">
              ..........        
              <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f3Ind"/>
								</xsl:call-template>                      
            </div>
            </div>
            <div style="float:right;clear:none">
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f3Ind"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f3Ind"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
              <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f3Ind"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f3Ind"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f3Ind"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
              <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f3Ind"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!--11b-->
          <div style="width:187mm">
            <div style="float:left;clear:none">
              <div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
              <div class="styLNDesc" style="width:58mm;">Gain recognition under section 904(f)(5)(F)</div>
              <div class="styIRS926DotLn" style="width:88mm;">
              ...............   
              <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f5FInd"/>
								</xsl:call-template>                            
            </div>
            </div>
            <div style="float:right;clear:none">
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f5FInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f5FInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
              <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f5FInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f5FInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f5FInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
              <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f5FInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!--11c-->
          <div style="width:187mm">
            <div style="float:left; clear:none;">
              <div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
              <div class="styLNDesc" style="width:46mm;">
            Recapture under section 1503(d)                   
          </div>
              <span class="styIRS926DotLn" style="width:102mm;">
              ...............
              <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form926Data/TransferRcptrUndSect1503dInd"/>
								</xsl:call-template>                                  
            </span>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferRcptrUndSect1503dInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferRcptrUndSect1503dInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
             <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferRcptrUndSect1503dInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferRcptrUndSect1503dInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferRcptrUndSect1503dInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
             <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferRcptrUndSect1503dInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!--11d-->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
              <div class="styLNDesc" style="width:49mm;">
            Exchange gain under section 987                  
          </div>
              <span class="styIRS926DotLn" style="width:99mm;">
             ..............
             <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form926Data/TrnsfrExchGainUndSect987Ind"/>
								</xsl:call-template>                                   
          </span>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TrnsfrExchGainUndSect987Ind"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TrnsfrExchGainUndSect987Ind"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
                <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TrnsfrExchGainUndSect987Ind"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TrnsfrExchGainUndSect987Ind"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TrnsfrExchGainUndSect987Ind"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
              <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TrnsfrExchGainUndSect987Ind"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
           <br></br>
            <br></br>
          <!-- L12-->
          <div style="width:187mm">
            <div class="styLNLeftNumBox">12</div>
            <div class="styLNDesc" style="width:149mm;">
          Did this transfer result from a change in the classification of the transferee to that of a foreign corporation?                  
       </div>
            <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form926Data/ResultedInChangeClsfInd"/>
                </xsl:call-template>
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ResultedInChangeClsfInd"/>
                  </xsl:call-template>
                </input>
              </span> &nbsp;
           <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form926Data/ResultedInChangeClsfInd"/>
                </xsl:call-template>
                <b>Yes</b>
              </label>
              <span style="width:2px;"/>
            </div>
            <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form926Data/ResultedInChangeClsfInd"/>
                </xsl:call-template>
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ResultedInChangeClsfInd"/>
                  </xsl:call-template>
                </input>
              </span> &nbsp;
            <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form926Data/ResultedInChangeClsfInd"/>
                </xsl:call-template>
                <b>No</b>
              </label>
            </div>
          </div>
          <!-- L13-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox">13</div>
            <div class="styLNDesc" style="width:179mm;height:auto;">Indicate whether the transferor was required to recognize income under final and temporary Regulations sections 
            <br/>1.367(a)-4 through 1.367(a)-6 for any of the following:  
          <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome"/>
              </xsl:call-template>
            </div>
          </div>
          <!--13a-->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-left:4mm;">a</div>
              <div class="styLNDesc" style="width:25mm;">
              Tainted property                 
            </div>
              <span class="styIRS926DotLn" style="width:123mm;">
               .............................                                
            </span>
            </div>
            <div style="float:right;clear;none;">
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RqrRcgnzIncmTaintedPropInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RqrRcgnzIncmTaintedPropInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RqrRcgnzIncmTaintedPropInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RqrRcgnzIncmTaintedPropInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RqrRcgnzIncmTaintedPropInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RqrRcgnzIncmTaintedPropInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!--13b-->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
              <div class="styLNDesc" style="width:33mm;">
              Depreciation recapture                
            </div>
              <span class="styIRS926DotLn" style="width:115mm;">
               ..........................                                
            </span>
            </div>
            <div style="float:right;clear;none;">
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RqrRcgnzIncmDeprecRcptrInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RqrRcgnzIncmDeprecRcptrInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RqrRcgnzIncmDeprecRcptrInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RqrRcgnzIncmDeprecRcptrInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RqrRcgnzIncmDeprecRcptrInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RqrRcgnzIncmDeprecRcptrInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!--13c-->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-left:4mm;">c</div>
              <div class="styLNDesc" style="width:31mm;">
            Branch loss recapture                   
          </div>
              <span class="styIRS926DotLn" style="width:117mm;">
            ............................                                    
          </span>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RqrRcgnzIncmBrLossRcptrInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RqrRcgnzIncmBrLossRcptrInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RqrRcgnzIncmBrLossRcptrInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RqrRcgnzIncmBrLossRcptrInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RqrRcgnzIncmBrLossRcptrInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RqrRcgnzIncmBrLossRcptrInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!--13d-->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox" style="padding-left:4mm;">d</div>
              <div class="styLNDesc" style="width:115mm;">
            Any other income recognition provision contained in the above-referenced regulations                  
          </div>
              <span class="styIRS926DotLn" style="width:33mm;">
            .......                                    
          </span>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RequiredRcgnzIncmAboveRegsInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RequiredRcgnzIncmAboveRegsInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
           <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RequiredRcgnzIncmAboveRegsInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RequiredRcgnzIncmAboveRegsInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RequiredRcgnzIncmAboveRegsInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome/RequiredRcgnzIncmAboveRegsInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
           <br></br>
            <br></br>
          <!-- L14-->
          <div style="width:187mm">
            <div class="styLNLeftNumBox">14</div>
            <div class="styLNDesc" style="width:149mm;">
            Did the transferor transfer assets which qualify for the trade or business exception under section 367(a)(3)?                  
          </div>
            <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form926Data/TransferAssetsUndSect367a3Ind"/>
                </xsl:call-template>
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferAssetsUndSect367a3Ind"/>
                  </xsl:call-template>
                </input>
              </span> &nbsp;
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form926Data/TransferAssetsUndSect367a3Ind"/>
                </xsl:call-template>
                <b>Yes</b>
              </label>
              <span style="width:2px;"/>
            </div>
            <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form926Data/TransferAssetsUndSect367a3Ind"/>
                </xsl:call-template>
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferAssetsUndSect367a3Ind"/>
                  </xsl:call-template>
                </input>
              </span> &nbsp;
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form926Data/TransferAssetsUndSect367a3Ind"/>
                </xsl:call-template>
                <b>No</b>
              </label>
            </div>
          </div>
          <!-- L15a R1-->
          <div style="width:187mm; ">
            <div class="styLNLeftNumBox">15a</div>
            <div class="styLNDesc" style="width:179mm;">
          Did the transferor transfer foreign goodwill or going concern value as defined in Temporary Regulations section                        
        </div>
          </div>
          <!-- L15a R2-->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox"/>
              <div class="styLNDesc" style="width:33mm;">
            1.367(a)-1T(d)(5)(iii)?                        
          </div>
              <span class="styIRS926DotLn" style="width:115mm;">
            ...........................                                          
          </span>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferForeignGoodwillInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferForeignGoodwillInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferForeignGoodwillInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferForeignGoodwillInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferForeignGoodwillInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferForeignGoodwillInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!-- L15b-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:139mm;">If the answer to line 15a is “Yes,” enter the amount of foreign goodwill or going concern value     
        </div>
        </div>
            <div style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:0mm;"></div>
            <div class="styLNDesc" style="width:15mm;">transferred      
        </div>
        
        
        
            <img src="{$ImagePath}/926_Bullet_Title.gif" alt="Arrow Bullet"/>
            <span style="width:1mm;">$</span>
            <!-- A straight Line -->
            <span style="width:34mm;border-bottom:solid 1px;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$Form926Data/TransferredAmt"/>
              </xsl:call-template>
            </span>
          </div>
          <!-- L16-->
          <div style="width:187mm">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox">16</div>
              <div class="styLNDesc" style="width:55mm;">
            Was cash the only property transferred?                  
          </div>
              <span class="styIRS926DotLn" style="width:93mm;">
            .....................                                    
          </span>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/CashOnlyPropertyTransferredInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/CashOnlyPropertyTransferredInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/CashOnlyPropertyTransferredInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/CashOnlyPropertyTransferredInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/CashOnlyPropertyTransferredInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/CashOnlyPropertyTransferredInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!-- L17a -->
          <div style="width:187mm; ">
            <div class="styLNLeftNumBox">17a</div>
            <div class="styLNDesc" style="width:149mm;">
          Was intangible property (within the meaning of section 936(h)(3)(B)) transferred as a result of the  transaction?   
          <xsl:call-template name="SetFormLinkInline">
									<xsl:with-param name="TargetNode" select="$Form926Data/IntangiblePropertyTrnsfrInd"/>
								</xsl:call-template>                    
        </div>
            <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form926Data/IntangiblePropertyTrnsfrInd"/>
                </xsl:call-template>
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateYesCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form926Data/IntangiblePropertyTrnsfrInd"/>
                  </xsl:call-template>
                </input>
              </span> &nbsp;
          <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form926Data/IntangiblePropertyTrnsfrInd"/>
                </xsl:call-template>
                <b>Yes</b>
              </label>
              <span style="width:2px;"/>
            </div>
            <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Form926Data/IntangiblePropertyTrnsfrInd"/>
                </xsl:call-template>
                <input type="Checkbox" class="styCkbox">
                  <xsl:call-template name="PopulateNoCheckbox">
                    <xsl:with-param name="TargetNode" select="$Form926Data/IntangiblePropertyTrnsfrInd"/>
                  </xsl:call-template>
                </input>
              </span> &nbsp;
          <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form926Data/IntangiblePropertyTrnsfrInd"/>
                </xsl:call-template>
                <b>No</b>
              </label>
            </div>
          </div>
          <!-- L17b-->
          <div class="styBB" style="width:187mm;">
            <div class="styLNLeftNumBox" style="padding-left:4mm;">b</div>
            <div class="styLNDesc" style="width:179mm;">If “Yes,” describe the nature of the rights to the intangible property that was transferred as a result of the transaction:    
          <!-- button display logic -->
              <div style="float:right; vertical-align:bottom">
                <xsl:call-template name="SetTableToggleButton">
                  <xsl:with-param name="TargetNode" select="$Form926Data/NatureRightsIntangiblePropTxt"/>
                  <xsl:with-param name="containerHeight" select="3"/>
                  <xsl:with-param name="containerID" select="'part4TPctn2'"/>
                </xsl:call-template>
              </div>
              <!-- end button display logic -->
            </div>
          </div>
          <div class="styIRS926TableContainer" id="part4TPctn2" style="display:table;">
            <xsl:attribute name="style"><xsl:if test="count($Form926Data/NatureRightsIntangiblePropTxt)&gt; 3">
             height:23mm;  
          </xsl:if></xsl:attribute>
            <!-- print logic -->
            <xsl:call-template name="SetInitialState"/>
            <!-- end -->
            <table class="styIRS926Table" cellspacing="0" cellpadding="0" border="0">
              <tfoot/>
              <tbody>
                <xsl:if test="($Print != $Separated) or (count($Form926Data/NatureRightsIntangiblePropTxt) &lt;=3)">
                  <xsl:for-each select="$Form926Data/NatureRightsIntangiblePropTxt">
                    <tr style="height:8mm; font-size: 7pt; ">
                      <td class="styIRS926TblCell">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="."/>
                        </xsl:call-template>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!-- Table Filler Rows -->
                <xsl:if test="count($Form926Data/NatureRightsIntangiblePropTxt) &lt; 1 or ((count($Form926Data/NatureRightsIntangiblePropTxt) &gt;3) and ($Print = $Separated))">
                  <tr style="font-size: 7pt;">
                    <td class="styIRS926TblCell">
                      <xsl:if test="((count($Form926Data/NatureRightsIntangiblePropTxt) &gt;3) and ($Print = $Separated))">
                        <xsl:call-template name="PopulateAdditionalDataTableMessage">
                          <xsl:with-param name="TargetNode" select="$Form926Data/NatureRightsIntangiblePropTxt"/>
                        </xsl:call-template>
                      </xsl:if>
                      <span style="width: 2px"/>
                    </td>
                  </tr>
                </xsl:if>
                
              
                <!-- Table Filler Rows -->
                <xsl:if test="count($Form926Data/NatureRightsIntangiblePropTxt) &lt; 2 or ((count($Form926Data/NatureRightsIntangiblePropTxt) &gt;3) and ($Print = $Separated))">
                  <tr style="font-size: 7pt">
                    <td class="styIRS926TblCell">
                      <span style="width:4px"/>
                    </td>
                  </tr>
                </xsl:if>
                <!-- Table Filler Rows -->
                <xsl:if test="count($Form926Data/NatureRightsIntangiblePropTxt) &lt; 3 or ((count($Form926Data/NatureRightsIntangiblePropTxt) &gt;3) and ($Print = $Separated))">
                  <tr style="font-size: 7pt">
                    <td class="styIRS926TblCell">
                      <span style="width:4px"/>
                    </td>
                  </tr>
                </xsl:if>
              </tbody>
            </table>
          </div>
          <!-- END Part IV Line Items -->
          <!-- Begin Footer -->
          <div style="width:187mm;padding-top:1mm;">
            <div style="float:right;">
              <span style="width:1px;"/>
            Form<span class="styBoldText"> 926 </span>(Rev. 12-2013)
            <div class="pageEnd"/>
        </div>
          </div>
          <!-- End Footer -->
          
           
          <!--BEGIN ADDITIONAL DATA SECTION -->
          <p style="page-break-before: always"/> 
          <div class="styLeftOverTitleLine" style="font-family:verdana, arial, sans-serif">
            <div class="styLeftOverTitle">
          Additional Data    
        </div>
            <div class="styLeftOverButtonContainer" style="display:table;">
              <input class="styLeftoverTableBtn" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage()" tabindex="1"/>
            </div>
          </div>
          <!-- Additional Data Table -->
          <table class="styLeftOverTbl" style="display:table;">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form926Data"/>
            </xsl:call-template>
          </table>
          <!-- Additional Data Table-->
          <!-- Separated Data for Part I -->
          <xsl:if test="($Print = $Separated) and  (count($Form926Data/ControllingShareholder) &gt; 6)">
            <div class="pageEnd"/>
            <span class="styRepeatingDataTitle">Form 926, Line 1b - If not, list the controlling shareholder(s) and their identifying number(s):</span>
            <table class="styDepTbl" style="font-size:7pt;display:table">
              <thead class="styTableThead">
                <!--  Label the Column Headers -->
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" scope="col" style="padding-left:5mm; padding-bottom:4mm">
                    <br/>Controlling shareholder<br/>
                  </th>
                  <th class="styDepTblCell" scope="col">
                    <br/>Identifying number<br/>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form926Data/ControllingShareholder">
                  <tr>
                    <!-- Define background colors to the rows -->
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <!-- First Column -->
                    <td class="styTableCellText" style="text-align:left; width:104mm;font-family:verdana;font-size:6pt;border-right:1px solid black;">
                      <span style="width:4px"/>
                      <xsl:if test="ControllingShareholderName/BusinessNameLine1Txt">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="ControllingShareholderName/BusinessNameLine1Txt"/>
                        </xsl:call-template>
                        <xsl:if test="normalize-space(ControllingShareholderName/BusinessNameLine2Txt)">
                          <br/>
                          <span style="width:4px"/>
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="ControllingShareholderName/BusinessNameLine2Txt"/>
                          </xsl:call-template>
                        </xsl:if>
                      </xsl:if>
                    </td>
                    <td class="styTableCellText" style="width:73mm; text-align:center; padding-left:5mm">
                      <xsl:choose>
                        <xsl:when test="ControllingShareholderEIN">
                          <xsl:call-template name="PopulateEIN">
                            <xsl:with-param name="TargetNode" select="ControllingShareholderEIN"/>
                          </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="EINMissingReasonCd">
                          <xsl:call-template name="PopulateText">
                            <xsl:with-param name="TargetNode" select="EINMissingReasonCd"/>
                          </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:call-template name="PopulateSSN">
                            <xsl:with-param name="TargetNode" select="ControllingShareholderSSN"/>
                          </xsl:call-template>
                          <span style="width: 2px"/>
                        </xsl:otherwise>
                      </xsl:choose>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
          <!-- /Separated Data for Part I -->
          
          <!--Separated Data for Part III Table $$$$$$$$$$$$$$$$-->
            <!-- Begin separated data for Cash Line Table-->
          <!-- Cash table header -->
        <xsl:if test="(count($Form926Data/Cash/TransferDt) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">Form 926, Part III - Information Regarding Transfer of Property (Cash)</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Information Regarding Transfer of Property" cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
                <thead class="styDepTableThead">
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;border-bottom-width: 1px; border-top-width: 1px; ">
                      <br/>Type of<br/> property</th>
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;">
                      <span class="styBoldText">(a)</span>
                      <br/> Date of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:47mm;text-align:center;">
                      <span class="styBoldText">(b)</span>
                      <br/> Description of<br/> property
              </th>
                    <th class="styDepTblCell " scope="col" style="width:33mm;text-align:center;">
                      <span class="styBoldText">(c)</span>
                      <br/> Fair market value<br/> on date <br/>of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(d)</span>
                      <br/> Cost or other<br/> basis
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(e)</span>
                      <br/> Gain recognized on<br/> transfer
              </th>
                  </tr>
                </thead>
                <tfoot/>
                <tbody>
                  <!--Cash line repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/Cash/TransferDt)"/>
                  <xsl:for-each select="$Form926Data/Cash">
                    <tr>
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 0px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>
                  Cash
              </td>
                      </xsl:if>
                      <td class="styDepTblCell " style="width:24mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      
                      <td class="styDepTblCell " style="width:47mm;vertical-align:middle;background-color:gray;">
                         <span class="styTableCellPad"/>
                      </td>
                      
                      <td class="styDepTblCell " style="width:33mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;background-color:gray;">
                         <span class="styTableCellPad"/>
                      </td>
                      
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;background-color:gray;">
                         <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End separated data for Cash Line Table-->
           <!-- Begin separated data for Stock and Securities Line Table-->
          <!-- Stock and Securities table header -->
          <xsl:if test="(count($Form926Data/StocksAndSecurities) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">Form 926, Part III - Information Regarding Transfer of Property (Stock And Securities)</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Information Regarding Transfer of Property" cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
                <thead class="styDepTableThead">
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;border-bottom-width: 1px; border-top-width: 1px; ">
                      <br/>Type of<br/> property</th>
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;">
                      <span class="styBoldText">(a)</span>
                      <br/> Date of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:47mm;text-align:center;">
                      <span class="styBoldText">(b)</span>
                      <br/> Description of<br/> property
              </th>
                    <th class="styDepTblCell " scope="col" style="width:33mm;text-align:center;">
                      <span class="styBoldText">(c)</span>
                      <br/> Fair market value<br/> on date <br/>of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(d)</span>
                      <br/> Cost or other<br/> basis
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(e)</span>
                      <br/> Gain recognized on<br/> transfer
              </th>
                  </tr>
                </thead>
                <tfoot/>
                <tbody>
                  <!--Stock and securities line repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/StocksAndSecurities)"/>
                  <xsl:for-each select="$Form926Data/StocksAndSecurities">
                    <tr>
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;border-top-width: 0px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>
                  Stock and <br/>securities
              </td>
                      </xsl:if>
                      <td class="styDepTblCell " style="width:24mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:47mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:33mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GainRecognizedOnTransferAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End separated data for Stock and Securities Line Table-->
          <!-- Begin separated data for Installment Obligations Line Table-->
          <!-- Installment Obligations table header -->
          <xsl:if test="(count($Form926Data/InstallmentObligations) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">Form 926, Part III - Information Regarding Transfer of Property (Installment obligations, account receivables or similar property)</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Information Regarding Transfer of Property" cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
                <thead class="styDepTableThead">
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;border-bottom-width: 1px; border-top-width: 1px; ">
                      <br/>Type of<br/> property</th>
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;">
                      <span class="styBoldText">(a)</span>
                      <br/> Date of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:47mm;text-align:center;">
                      <span class="styBoldText">(b)</span>
                      <br/> Description of<br/> property
              </th>
                    <th class="styDepTblCell " scope="col" style="width:33mm;text-align:center;">
                      <span class="styBoldText">(c)</span>
                      <br/> Fair market value<br/> on date <br/>of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(d)</span>
                      <br/> Cost or other<br/> basis
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(e)</span>
                      <br/> Gain recognized on<br/> transfer
              </th>
                  </tr>
                </thead>
                <tfoot/>
                <tbody>
                  <!--Installment Obligations line repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/InstallmentObligations)"/>
                  <xsl:for-each select="$Form926Data/InstallmentObligations">
                    <tr>
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>Installment<br/>obligations,<br/>account<br/>receivables or<br/>similar property         
              </td>
                      </xsl:if>
                      <td class="styDepTblCell " style="width:24mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:47mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:33mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GainRecognizedOnTransferAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End separated data for Installment Obligations Line Table-->
          <!-- Begin separated data for Foreign currency Line Table-->
          <!--Foreign currency table header -->
          <xsl:if test="(count($Form926Data/FrgnCurOtherPropDenominated) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">Form 926, Part III - Information Regarding Transfer of Property (Foreign currency or other property denominated in foreign currency)</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Information Regarding Transfer of Property" cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
                <thead class="styDepTableThead">
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;border-bottom-width: 1px; border-top-width: 1px; ">
                      <br/>Type of<br/> property</th>
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;">
                      <span class="styBoldText">(a)</span>
                      <br/> Date of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:47mm;text-align:center;">
                      <span class="styBoldText">(b)</span>
                      <br/> Description of<br/> property
              </th>
                    <th class="styDepTblCell " scope="col" style="width:33mm;text-align:center;">
                      <span class="styBoldText">(c)</span>
                      <br/> Fair market value<br/> on date <br/>of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(d)</span>
                      <br/> Cost or other<br/> basis
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(e)</span>
                      <br/> Gain recognized on<br/> transfer
              </th>
                  </tr>
                </thead>
                <tfoot/>
                <tbody>
                  <!--Foreign currency line repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/FrgnCurOtherPropDenominated)"/>
                  <xsl:for-each select="$Form926Data/FrgnCurOtherPropDenominated">
                    <tr>
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>Foreign currency<br/>or other property<br/>denominated in<br/>foreign currency       
              </td>
                      </xsl:if>
                      <td class="styDepTblCell " style="width:24mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:47mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:33mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GainRecognizedOnTransferAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End separated data for Foreign currency Line Table-->
          <!-- Begin separated data for Inventory Line Table-->
          <!--Inventory table header -->
          <xsl:if test="(count($Form926Data/Inventory) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">Form 926, Part III - Information Regarding Transfer of Property (Inventory)</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Information Regarding Transfer of Property" cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
                <thead class="styDepTableThead">
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;border-bottom-width: 1px; border-top-width: 1px; ">
                      <br/>Type of<br/> property</th>
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;">
                      <span class="styBoldText">(a)</span>
                      <br/> Date of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:47mm;text-align:center;">
                      <span class="styBoldText">(b)</span>
                      <br/> Description of<br/> property
              </th>
                    <th class="styDepTblCell " scope="col" style="width:33mm;text-align:center;">
                      <span class="styBoldText">(c)</span>
                      <br/> Fair market value<br/> on date <br/>of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(d)</span>
                      <br/> Cost or other<br/> basis
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(e)</span>
                      <br/> Gain recognized on<br/> transfer
              </th>
                  </tr>
                </thead>
                <tfoot/>
                <tbody>
                  <!--Inventory line repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/Inventory)"/>
                  <xsl:for-each select="$Form926Data/Inventory">
                    <tr>
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>Inventory    
              </td>
                      </xsl:if>
                      <td class="styDepTblCell " style="width:24mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:47mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:33mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GainRecognizedOnTransferAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End separated data for Inventory Line Table-->
          <!-- Begin separated data for Assets subject Line Table-->
          <!--Assets subject table header -->
          <xsl:if test="(count($Form926Data/AssetsSubjectDeprecRecapture) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">Form 926, Part III - Information Regarding Transfer of Property (Assets subject to depreciation recapture (see Temp. Regs. sec. 1.367(a)-4T(b)))</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Information Regarding Transfer of Property" cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
                <thead class="styDepTableThead">
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;border-bottom-width: 1px; border-top-width: 1px; ">
                      <br/>Type of<br/> property</th>
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;">
                      <span class="styBoldText">(a)</span>
                      <br/> Date of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:47mm;text-align:center;">
                      <span class="styBoldText">(b)</span>
                      <br/> Description of<br/> property
              </th>
                    <th class="styDepTblCell " scope="col" style="width:33mm;text-align:center;">
                      <span class="styBoldText">(c)</span>
                      <br/> Fair market value<br/> on date <br/>of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(d)</span>
                      <br/> Cost or other<br/> basis
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(e)</span>
                      <br/> Gain recognized on<br/> transfer
              </th>
                  </tr>
                </thead>
                <tfoot/>
                <tbody>
                  <!--Assets subject line repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/AssetsSubjectDeprecRecapture)"/>
                  <xsl:for-each select="$Form926Data/AssetsSubjectDeprecRecapture">
                    <tr>
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>Assets subject to depreciation<br/>recapture (see<br/>Temp. Regs. sec.1.367(a)-4T(b))   
              </td>
                      </xsl:if>
                      <td class="styDepTblCell " style="width:24mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:47mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:33mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GainRecognizedOnTransferAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End separated data for Assets subject Line Table-->
          <!-- Begin separated data for Tangible property Line Table-->
          <!--Tangible property table header -->
          <xsl:if test="(count($Form926Data/TangibleProperty) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">Form 926, Part III - Information Regarding Transfer of Property (Tangible property used in trade or business not listed under another category)</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Information Regarding Transfer of Property" cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
                <thead class="styDepTableThead">
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;border-bottom-width: 1px; border-top-width: 1px; ">
                      <br/>Type of<br/> property</th>
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;">
                      <span class="styBoldText">(a)</span>
                      <br/> Date of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:47mm;text-align:center;">
                      <span class="styBoldText">(b)</span>
                      <br/> Description of<br/> property
              </th>
                    <th class="styDepTblCell " scope="col" style="width:33mm;text-align:center;">
                      <span class="styBoldText">(c)</span>
                      <br/> Fair market value<br/> on date <br/>of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(d)</span>
                      <br/> Cost or other<br/> basis
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(e)</span>
                      <br/> Gain recognized on<br/> transfer
              </th>
                  </tr>
                </thead>
                <tfoot/>
                <tbody>
                  <!--Tangible property line repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/TangibleProperty)"/>
                  <xsl:for-each select="$Form926Data/TangibleProperty">
                    <tr>
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>Tangible property used in trade or<br/>business not listed under another category  
              </td>
                      </xsl:if>
                      <td class="styDepTblCell " style="width:24mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:47mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:33mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GainRecognizedOnTransferAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End separated data for Tangible property Line Table-->
          <!-- Begin separated data for Intangible property Line Table-->
          <!--Intangible property table header -->
          <xsl:if test="(count($Form926Data/IntangibleProperty) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">Form 926, Part III - Information Regarding Transfer of Property (Intangible property)</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Information Regarding Transfer of Property" cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
                <thead class="styDepTableThead">
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;border-bottom-width: 1px; border-top-width: 1px; ">
                      <br/>Type of<br/> property</th>
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;">
                      <span class="styBoldText">(a)</span>
                      <br/> Date of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:47mm;text-align:center;">
                      <span class="styBoldText">(b)</span>
                      <br/> Description of<br/> property
              </th>
                    <th class="styDepTblCell " scope="col" style="width:33mm;text-align:center;">
                      <span class="styBoldText">(c)</span>
                      <br/> Fair market value<br/> on date <br/>of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(d)</span>
                      <br/> Cost or other<br/> basis
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(e)</span>
                      <br/> Gain recognized on<br/> transfer
              </th>
                  </tr>
                </thead>
                <tfoot/>
                <tbody>
                  <!--Intangible property line repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/IntangibleProperty)"/>
                  <xsl:for-each select="$Form926Data/IntangibleProperty">
                    <tr>
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>Intangible<br/>property  
              </td>
                      </xsl:if>
                      <td class="styDepTblCell " style="width:24mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:47mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:33mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GainRecognizedOnTransferAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End separated data for Intangible property Line Table-->
          <!-- Begin separated data for Property to be leased Line Table-->
          <!--Property to be leased table header -->
          <xsl:if test="(count($Form926Data/PropertyLeased) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">Form 926, Part III - Information Regarding Transfer of Property (Property to be leased (as described in <br/>Temp. Regs. sec.1.367(a)-4(c)))</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Information Regarding Transfer of Property" cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
                <thead class="styDepTableThead">
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;border-bottom-width: 1px; border-top-width: 1px; ">
                      <br/>Type of<br/> property</th>
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;">
                      <span class="styBoldText">(a)</span>
                      <br/> Date of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:47mm;text-align:center;">
                      <span class="styBoldText">(b)</span>
                      <br/> Description of<br/> property
              </th>
                    <th class="styDepTblCell " scope="col" style="width:33mm;text-align:center;">
                      <span class="styBoldText">(c)</span>
                      <br/> Fair market value<br/> on date <br/>of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(d)</span>
                      <br/> Cost or other<br/> basis
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(e)</span>
                      <br/> Gain recognized on<br/> transfer
              </th>
                  </tr>
                </thead>
                <tfoot/>
                <tbody>
                  <!--Property to be leased line repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/PropertyLeased)"/>
                  <xsl:for-each select="$Form926Data/PropertyLeased">
                    <tr>
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width:1px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>Property to be<br/>leased (as<br/>described in <br/>Final and temp. Regs. sec.<br/>1.367(a)-4(c))</td>
                      </xsl:if>
                      <td class="styDepTblCell " style="width:24mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:47mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:33mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GainRecognizedOnTransferAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End separated data for Property to be leased Line Table-->
          <!-- Begin separated data for Property to be sold Line Table-->
          <!--Property to be sold table header -->
          <xsl:if test="(count($Form926Data/PropertySold) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">Form 926, Part III - Information Regarding Transfer of Property (Property to be sold (as described in <br/>Temp. Regs. sec.1.367(a)-4T(d)))</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Information Regarding Transfer of Property" cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
                <thead class="styDepTableThead">
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;border-bottom-width: 1px; border-top-width: 1px; ">
                      <br/>Type of<br/> property</th>
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;">
                      <span class="styBoldText">(a)</span>
                      <br/> Date of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:47mm;text-align:center;">
                      <span class="styBoldText">(b)</span>
                      <br/> Description of<br/> property
              </th>
                    <th class="styDepTblCell " scope="col" style="width:33mm;text-align:center;">
                      <span class="styBoldText">(c)</span>
                      <br/> Fair market value<br/> on date <br/>of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(d)</span>
                      <br/> Cost or other<br/> basis
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(e)</span>
                      <br/> Gain recognized on<br/> transfer
              </th>
                  </tr>
                </thead>
                <tfoot/>
                <tbody>
                  <!--Property to be sold line repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/PropertySold)"/>
                  <xsl:for-each select="$Form926Data/PropertySold">
                    <tr>
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>Property to be sold (as described in <br/>Temp. Regs. sec.1.367(a)-4T(d))</td>
                      </xsl:if>
                      <td class="styDepTblCell " style="width:24mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:47mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:33mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GainRecognizedOnTransferAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End separated data for Property to be sold Line Table-->
          <!-- Begin separated data for Transfers of oil Line Table-->
          <!--Transfers of oil table header -->
          <xsl:if test="(count($Form926Data/TransfersOilGasWorkingInterest) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">Form 926, Part III - Information Regarding Transfer of Property (Transfers of oil and gas working interests (as described in 1.367(a)-4T(e)))</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Information Regarding Transfer of Property" cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
                <thead class="styDepTableThead">
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;border-bottom-width: 1px; border-top-width: 1px; ">
                      <br/>Type of<br/> property</th>
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;">
                      <span class="styBoldText">(a)</span>
                      <br/> Date of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:47mm;text-align:center;">
                      <span class="styBoldText">(b)</span>
                      <br/> Description of<br/> property
              </th>
                    <th class="styDepTblCell " scope="col" style="width:33mm;text-align:center;">
                      <span class="styBoldText">(c)</span>
                      <br/> Fair market value<br/> on date <br/>of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(d)</span>
                      <br/> Cost or other<br/> basis
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(e)</span>
                      <br/> Gain recognized on<br/> transfer
              </th>
                  </tr>
                </thead>
                <tfoot/>
                <tbody>
                  <!--Transfers of oil line repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/TransfersOilGasWorkingInterest)"/>
                  <xsl:for-each select="$Form926Data/TransfersOilGasWorkingInterest">
                    <tr>
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>Transfers of oil and gas working interests (as described in Temp. Regs. sec.1.367(a)-4T(e))</td>
                      </xsl:if>
                      <td class="styDepTblCell " style="width:24mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:47mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:33mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GainRecognizedOnTransferAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End separated data for Transfers of oil Line Table-->
          <!-- Begin separated data for Other property Line Table-->
          <!--Other property table header -->
          <xsl:if test="(count($Form926Data/OtherProperty) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">Form 926, Part III - Information Regarding Transfer of Property (Other Property)</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Information Regarding Transfer of Property" cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
                <thead class="styDepTableThead">
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;border-bottom-width: 1px; border-top-width: 1px; ">
                      <br/>Type of<br/> property</th>
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;">
                      <span class="styBoldText">(a)</span>
                      <br/> Date of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:47mm;text-align:center;">
                      <span class="styBoldText">(b)</span>
                      <br/> Description of<br/> property
              </th>
                    <th class="styDepTblCell " scope="col" style="width:33mm;text-align:center;">
                      <span class="styBoldText">(c)</span>
                      <br/> Fair market value<br/> on date <br/>of transfer
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(d)</span>
                      <br/> Cost or other<br/> basis
              </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(e)</span>
                      <br/> Gain recognized on<br/> transfer
              </th>
                  </tr>
                </thead>
                <tfoot/>
                <tbody>
                  <!--Other property line repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/OtherProperty)"/>
                  <xsl:for-each select="$Form926Data/OtherProperty">
                    <tr>
                      <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>Other<br/>property</td>
                      </xsl:if>
                      <td class="styDepTblCell " style="width:24mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:47mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateText">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:33mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="FairMarketValueAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="GainRecognizedOnTransferAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End separated data for Other property Line Table-->
          <br/>
          <br/>
          <!-- Separated Data for Part IV - 17b -->
          <xsl:if test="($Print = $Separated) and (count($Form926Data/NatureRightsIntangiblePropTxt) &gt; 3)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">Form 926, Line 17b - Describe the nature of the rights to the intangible property that was transferred in the transfer:</span>
            <table class="styDepTbl" style="font-size:7pt;display:table">
              <thead class="styTableThead">
                <!-- Label the Column Headers -->
                <tr class="styDepTblHdr">
                  <th class="styDepTblCell" scope="col" style="padding-left:5mm; padding-bottom:4mm">
                    <br/>If "Yes," describe the nature of the rights to the intangible property that was transferred in the transfer:<br/>
                  </th>
                </tr>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form926Data/NatureRightsIntangiblePropTxt">
                  <tr>
                    <!-- Define background colors to the rows -->
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
                    <!-- First Column -->
                    <td class="styTableCellText" style="width:186mm; height:7mm; text-align:left;">
                      <xsl:call-template name="PopulateText">
                        <xsl:with-param name="TargetNode" select="."/>
                      </xsl:call-template>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>
          <!-- /Separated Data for Part IV - 17b -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
