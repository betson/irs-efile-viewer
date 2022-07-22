<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [
  <!ENTITY nbsp "&#160;">
]>

<!--Updated per UWR  107348 and Revision Date to July/2014- By Robert Jones -->
<!--Did changes per IBM Defect #40742 6/24/2014 Robert Jones-->
<!--Did changes per IBM Defect #41290 8/8/2014 Robert Jones-->
<!--Did changes per IBM Defect #41295 8/8/2014 Robert Jones-->
<!--Did changes per IBM Defect #41415 8/20/2014 Robert Jones 508 added scope to several "th" lines -->
<!--Updated per Kisams IM01817803 and Revision Date back to December/2013- By Robert Jones -->
<!--Updated per Kisams IM01467430 11/18/2014 Transferor not populating. Schema element mis-spelled (Tranferor)- By Robert Jones -->
<!--Did changes per IBM Defect #43153 6/30/2015 by Robert Jones IE11 Related-->
<!-- Last modified on 5/18/2017 by Robert Jones UWR 194393 and 195664 Return Headers for 1120, 1041, 1040 and 1040NR  -->

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
    <!--<xsl:if test="not($Print) or $Print=''">-->
            <xsl:call-template name="IRS926Style"/>
            <xsl:call-template name="AddOnStyle"/>
    <!--</xsl:if>-->
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
                <br/>(Rev. December 2017)<br/>
                <div style="font-size:6pt; padding-top:1.8mm">
              Department of the Treasury<br/>Internal Revenue Service
            </div>
              </div>
            </div>
            <div class="styFTBox" style="width:125mm">
              <div class="styMainTitle" style="padding-top:1mm">Return by a U.S. Transferor of Property<br/>to a Foreign Corporation</div>
              <div class="styFBT" style="margin-top:1mm;">
                <img src="{$ImagePath}/926_Bullet_Title.gif" alt="Arrow Bullet"/> Go to <a href="http://www.irs.gov/Form926" title="Link to IRS.gov">
                <i>www.irs.gov/Form926</i></a> for instructions and the latest information.<br/>
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
          
             <!-- Choice between 1120, 1041, 1040 and 1040NR Return Header Filer info -->
                                                         <xsl:call-template name="PopulateFilerName">
                                                            <xsl:with-param name="TargetNode" select="$Form926Data"/>
                                                         </xsl:call-template> 
              </div>
            
            <div style="float:right; padding-left:1mm;height:auto;display:table">
              <b>Identifying number</b> (see instructions)<br></br>
          <div style="text-align:left; padding-top:2mm">
                 <span style="font-weight:normal;">
                <!-- Choice between 1120, 1041, 1040 and 1040NR Return Header Filer info -->
                                                     <xsl:call-template name="PopulateFilerTIN">
                                                       <xsl:with-param name="TargetNode" select="$Form926Data"/>
                                                     </xsl:call-template>
                                                    
                </span>
             </div>
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
            <div style="float:left;padding-left:8mm">
         securities market?                    
        </div>
            <div style="float:right; padding-right:0.5mm">
              <span class="styIRS926DotLn">
            .............................
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
            <div style="font-family:verdana;font-size:6pt; padding-left: 9mm;">
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
             
            <div style=" padding-left: 9mm;">
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
                 <div class="styIRS926OL" style="width: 50mm; height: 3mm; float: left;"> &nbsp;5
                     <span style="font-weight:normal; padding-left: 5mm; ">Address (including country)
                     </span>
				 </div><br></br>
            
            
                     <!-- Check for Transferee US Address -->
            <div style="width: 50mm; height: auto; float: left; padding-left:9mm">
              <xsl:if test="$Form926Data/TransfereeUSAddress">
                <xsl:call-template name="PopulateUSAddressTemplate">
                  <xsl:with-param name="TargetNode" select="$Form926Data/TransfereeUSAddress"/>
                </xsl:call-template>
              </xsl:if>
             <br/>
              <!-- Check for Transferee Foreign Address -->
              <xsl:if test="$Form926Data/TransfereeForeignAddress">
                <xsl:call-template name="PopulateForeignAddressTemplate">
                  <xsl:with-param name="TargetNode" select="$Form926Data/TransfereeForeignAddress"/>
                </xsl:call-template>
              </xsl:if>
              </div>
            </div>
            
           
            <!--<div style="float:left">-->
   <!-- 4b New for 2013  There must be a problem with the Schema because this field will not populate with the element for this line. I can make the field populate-->
              <div class="styIRS926OL" style="width:85mm;font-weight:normal;"><b>&nbsp;4b </b> <span style="padding-left: 3mm; width: 70mm;"> Reference ID number (see instructions)</span></div>
          <div class="styIRS926OL" style="width:70mm;font-weight:normal;padding-left:9mm;border-left:1px solid grey;">
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
      Form <b style="font-size:8pt">926</b> (Rev. 12-2017)
      </div>
          </div>
     
          <!-- Begin page 2 Header-->
          <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
            <div style="width:90mm;" class="styGenericDiv">Form 926 (Rev. 12-2017)</div>
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
          <div class="styIRS926Part2BB" style="border-top-width:1px;">
            <div class="styPartName">Part III</div>
            <div class="styPartDesc">Information Regarding Transfer of Property<span class="styNormalText">(see instructions)</span>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styPartDesc" style="height:7mm;padding-top:3mm;padding-left:0mm">
				Section A -- Cash, Stocks, and Securities
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
          <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
          <!-- Part III Table -->
          <div style="width:187mm;float:left;clear:left;" id="IRTP">
            <table class="styTable" id="IRS926PartIII" summary="Information Regarding Transfer of Property" cellspacing="0" >
              <thead class="styIRS926TableThead">
                <tr>
                  <th class="styIRS926TableCellLine " scope="col" 
                  style="width:34mm;text-align:center;border-bottom-width: 0px; border-top-width: 0px;vertical-align:top; ">
                  Type of<br/> property</th>
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
            <xsl:variable name="AGRowCount1" select="count($Form926Data/CashPropertyGrp/TransferDt)"/>
                <xsl:if test="$AGRowCount1 = 0 or ((count($Form926Data/CashPropertyGrp/TransferDt) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
						Cash
					</td>
                    <td class="styIRS926TableCellA " style="width:24mm;">
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$Form926Data/CashPropertyGrp"/>
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
                <xsl:if test="($Print != $Separated) or (count($Form926Data/CashPropertyGrp/TransferDt) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/CashPropertyGrp">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
                          <xsl:attribute name="rowspan">
							  <xsl:value-of select="$AGRowCount1"/>
						  </xsl:attribute>
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
                <xsl:variable name="AGRowCount2" select="count($Form926Data/StocksAndSecuritiesPropertyGrp/TransferDt)"/>
                <xsl:if test="$AGRowCount2 = 0 or ((count($Form926Data/StocksAndSecuritiesPropertyGrp/TransferDt) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 1px;">
						Stock and securities (other that those that qualify as eligible property under Regs. sec. 1.367(a)-2(b)(3))
					</td>
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
                <xsl:if test="($Print != $Separated) or (count($Form926Data/StocksAndSecuritiesPropertyGrp/TransferDt) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/StocksAndSecuritiesPropertyGrp">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount2"/></xsl:attribute>
							  Stock and securities (other that those that qualify as eligible property under Regs. sec. 1.367(a)-2(b)(3))
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
              </tbody>
            </table>
          </div>
          <!-- L9 -->
          <div class="styIRS926Part2NBB">
            <div class="styIRS926OL">9</div>
            <div style="float:left">Was cash the only property transferred?</div>
            <div style="float:right; padding-right:0.5mm">
              <span class="styIRS926DotLn">.......................</span>
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
            <div style="float:left;padding-left:8mm">If "Yes", skip the remainder of Part III and go to Part IV.</div>
          </div>
          <br></br>
          <br></br>
          <!-- L10 Pt1-->
          <div style="padding-top:1mm; width:187mm">
            <div class="styLNLeftNumBox">10</div>
            <div class="styLNDesc" style="width:179mm;">
                Did the transferor transfer stock or securities subject to section 367(a) with respect to which a gain recognition
			</div>
          </div>
          <!-- L10 part 2 -->
          <div style="width:187mm">
            <div class="styIRS926OL" style="text-align:right"/>
            <div style="float:left;padding-left:8mm">
				 recognition agreement was filed?                    
        </div>
            <div style="float:right; padding-right:0.5mm">
              <span class="styIRS926DotLn">
            .........................
          </span>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/StockOrSecuritiesTransferInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/StockOrSecuritiesTransferInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/StockOrSecuritiesTransferInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/StockOrSecuritiesTransferInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/StockOrSecuritiesTransferInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/StockOrSecuritiesTransferInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!-- Straight Line -->
            <span style="width:187mm;border-bottom:solid 1px;"></span>
            <br></br>
            <br></br>
		  <!-- End 10 Pt 2 -->
          <!-- BEGIN Part III Property qualifying for Active Trade or Business Exception under Regs. sec.1.367(a)-2(a)(2)(i) and (ii)  Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartDesc" style="height:10mm;padding-top:2.5mm;padding-left:0mm">
				Section B -- Property qualifying for Active Trade or Business Exception under Regs. sec.1.367(a)-2(a)(2)(i) and (ii) 
            </div>       
          <!-- END Part III Property qualifying for Active Trade or Business Exception under Regs. sec.1.367(a)-2(a)(2)(i) and (ii) Title -->
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
          <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
          <!-- Part III Property qualifying for Active Trade or Business Exception under Regs. sec.1.367(a)-2(a)(2)(i) and (ii) -->
          <div style="width:187mm;float:left;clear:left;" id="IRTP">
            <table class="styTable" id="IRS926PartIII" summary="Property qualifying for Active Trade or Business Exception" cellspacing="0" >
              <thead class="styIRS926TableThead">
				<tr>
                  <th class="styIRS926TableCellLine " 
					  scope="col" style="width:34mm;text-align:center;border-bottom-width: 0px; border-top-width: 0px;vertical-align:top; ">
					  Type of<br/> property</th>
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
                    <br/> Gain recognized on<br/> transfer*
				  </th>              
                </tr>                
              </thead>              
              <tfoot/>
              <tbody>
              
              <!--Begin Part III Property qualifying for Active Trade or Business Exception under Regs. sec.1.367(a)-2(a)(2)(i) and (ii) -->
                <!-- Part III Tangible property (not listed under another category) -->
            <xsl:variable name="AGRowCount1" select="count($Form926Data/TangiblePropertyGrp/TransferDt)"/>
                <xsl:if test="$AGRowCount1 = 0 or ((count($Form926Data/TangiblePropertyGrp/TransferDt) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
						Tangible property (not listed under another category)
					</td>
                    <td class="styIRS926TableCellA " style="width:24mm;">
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$Form926Data/TangiblePropertyGrp"/>
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
                <!-- Part III table Tangible property (not listed under another category) -->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/TangiblePropertyGrp/TransferDt) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/TangiblePropertyGrp">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount1"/></xsl:attribute>
							  Tangible property (not listed under another category)
						</td>
                      </xsl:if>
                      <td class="styIRS926TableCellA " style="width:24mm;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellB" style="width:51mm;">
                        <xsl:call-template name="PopulateAmount">
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
                <!-- End Part III Table II L1 -->
                  <!--Loop -->
                <!-- Part III Table II L2-->
                <xsl:variable name="AGRowCount3" select="count($Form926Data/TrnsfrOilGasWorkingIntPropGrp)"/>
                <xsl:if test="$AGRowCount3 = 0 or ((count($Form926Data/TrnsfrOilGasWorkingIntPropGrp) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
                    Working interest in oil and gas property (as described in Regs. sec. 1.367(a)-2(b)(2) and (f))</td>
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
                <!-- Part III Table II L2-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/TrnsfrOilGasWorkingIntPropGrp) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/TrnsfrOilGasWorkingIntPropGrp">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount3"/></xsl:attribute>
							  Working interest in oil and gas property (as described in Regs. sec. 1.367(a)-2(b)(2) and (f))
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
                <!-- End Part III Table II L2 -->
                  <!--Loop -->
                <!-- Part III Table II L3-->
                <xsl:variable name="AGRowCount4" select="count($Form926Data/FinancialAssetPropertyGrp)"/>
                <xsl:if test="$AGRowCount4 = 0 or ((count($Form926Data/FinancialAssetPropertyGrp) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
                    Financial asset (as described in Regs. sec. 1.367(a)-2(b)(3))</td>
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
                <!-- Part III Table II L3-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/FinancialAssetPropertyGrp) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/FinancialAssetPropertyGrp">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount4"/></xsl:attribute>
							  Financial asset (as described in Regs. sec. 1.367(a)-2(b)(3))
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
                <!-- End Part III Table II L3 -->
				<!--Loop -->
                <!-- Part III Table II L4-->
                <xsl:variable name="AGRowCount5" select="count($Form926Data/TangiblePropertyToBeLeasedGrp)"/>
                <xsl:if test="$AGRowCount5 = 0 or ((count($Form926Data/TangiblePropertyToBeLeasedGrp) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 1px;">
                    Certain tangible property to be leased (see Regs. sec. 1.367(a)-2(e))</td>
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
                <!-- Part III Table II L4-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/TangiblePropertyToBeLeasedGrp) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/TangiblePropertyToBeLeasedGrp">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount4"/></xsl:attribute>
							  Certain tangible property to be leased (see Regs. sec. 1.367(a)-2(e))
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
                <!-- End Part III Table II L4 -->
				<!--Loop -->
                <!-- Part III Table II L5-->
                <xsl:variable name="AGRowCount15" select="count($Form926Data/ActiveTrdOrBusExcPropTotalGrp)"/>
                <xsl:if test="$AGRowCount15 = 0 or ((count($Form926Data/ActiveTrdOrBusExcPropTotalGrp) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 1px;">
						Totals
					</td>
                    <td class="styIRS926TableCellA " style="width:24mm;background-color:gray">
                      
                      <span class="styTableCellPad"/>
                    </td>
                    <td class="styIRS926TableCellB" style="width:51mm;background-color:gray">
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
                <!-- Part III Table II L5-->
                <xsl:if test="($Print != $Separated)">
                  <xsl:for-each select="$Form926Data/ActiveTrdOrBusExcPropTotalGrp">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount4"/></xsl:attribute>
							  Totals
					    </td>
                      </xsl:if>
                      <td class="styIRS926TableCellA " style="width:24mm;background-color:gray">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellB" style="width:51mm;background-color:gray">
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
                <!-- End Part III Table II L5 -->
              </tbody>
            </table>
          </div>
          <div style="width:187mm;">
            <div class="styLNDesc" style="width: 187mm;">
              <span style="font-weight:normal">
              *If property listed in this section is subject to depreciation recapture or branch loss recapture, see instructions.
              </span>
			</div>
          </div>
          <!-- separated format************************************************* -->
          <!-- Part III Bottom Heading-->
          <!-- END Part III Line Items -->
          <div style="padding-top:1mm; width:187mm; border-top:1px solid black" class="pageEnd">
            <div style="float:left">
              <b/>
            </div>
            <div style="float:right">
              <span style="width:45mm"/>
				  Form <b style="font-size:8pt">926</b> (Rev. 12-2017)
			</div>
          </div>
          <p style="page-break-before: always"/>
          <!-- Begin Page 3 -->
          <div style="width:187mm; border-bottom:1px solid black; page-break-before:always">
            <div style="float:left">
				Form 926 (Rev. 12-2017)
		  </div>
            <div style="float:right">
				Page <b style="font-size:8pt">3</b>
            </div>
          </div>
          <!-- BEGIN Part III Table III Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartDesc" style="height:10mm;padding-top:2.5mm;">Section C -- Property not qualifying for Active Trade or Business Exception
				(other than intangible property subject to section 367(d)) 
            </div>       
          <!-- END Part III Table III Title -->
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
          <!-- Part III Table III -->
          <div style="width:187mm;float:left;clear:left;" id="IRTP">
            <table class="styTable" id="IRS926PartIII" summary="Property not qualifying for Active Trade or Business Exception" cellspacing="0" >
              <thead class="styIRS926TableThead">
				<tr>
                  <th class="styIRS926TableCellLine " scope="col" style="width:34mm;text-align:center;border-bottom-width: 0px; border-top-width: 0px;vertical-align:top; ">
                  Type of<br/> property</th>
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
                    <br/> Gain recognized on<br/> transfer*
				  </th>              
                </tr>                
              </thead>              
              <tfoot/>
              <tbody>
              
              <!--Begin Part III Table III -->
                <!-- Part III Table III L1 -->
            <xsl:variable name="AGRowCount1" select="count($Form926Data/TransferInventoryPropertyGrp/TransferDt)"/>
                <xsl:if test="$AGRowCount1 = 0 or ((count($Form926Data/TransferInventoryPropertyGrp/TransferDt) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">Cash</td>
                    <td class="styIRS926TableCellA " style="width:24mm;">
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$Form926Data/TransferInventoryPropertyGrp"/>
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
                <!-- Part III table III L1-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/TransferInventoryPropertyGrp/TransferDt) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/TransferInventoryPropertyGrp">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount1"/></xsl:attribute>
							  Inventory
						</td>
                      </xsl:if>
                      <td class="styIRS926TableCellA " style="width:24mm;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellB" style="width:51mm;">
                        <xsl:call-template name="PopulateAmount">
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
                <!-- End Part III Table III L1 -->
                  <!--Loop -->
                <!-- Part III Table III L2-->
                <xsl:variable name="AGRowCount3" select="count($Form926Data/InstallmentObligationsPropGrp)"/>
                <xsl:if test="$AGRowCount3 = 0 or ((count($Form926Data/InstallmentObligationsPropGrp) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
						Installment obligations, etc. (as described in Regs. sec. 1.367(a)-2(c)(2))
                    </td>
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
                <!-- Part III Table III L2-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/InstallmentObligationsPropGrp) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/InstallmentObligationsPropGrp">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount3"/></xsl:attribute>
							  Installment obligations, etc. (as described in Regs. sec. 1.367(a)-2(c)(2))
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
                <!-- End Part III Table III L2 -->
                  <!--Loop -->
                <!-- Part III Table III L3-->
                <xsl:variable name="AGRowCount4" select="count($Form926Data/NonfunctionalCurrencyPropGrp)"/>
                <xsl:if test="$AGRowCount4 = 0 or ((count($Form926Data/NonfunctionalCurrencyPropGrp) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
						Nonfunctional currency, etc. (as described in Regs. sec. 1.367(a)-2(c)(3))
                    </td>
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
                <!-- Part III Table III L3-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/NonfunctionalCurrencyPropGrp) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/NonfunctionalCurrencyPropGrp">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount4"/></xsl:attribute>
							  Nonfunctional currency, etc. (as described in Regs. sec. 1.367(a)-2(c)(3))
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
                <!-- End Part III Table III L3 -->
				<!--Loop -->
                <!-- Part III Table III L4-->
                <xsl:variable name="AGRowCount5" select="count($Form926Data/LeasedTangiblePropertyGrp)"/>
                <xsl:if test="$AGRowCount5 = 0 or ((count($Form926Data/LeasedTangiblePropertyGrp) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
						Certain leased tangible property (see Regs. sec. 1.367(a)-2(c)(4))
                    </td>
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
                <!-- Part III Table III L4-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/LeasedTangiblePropertyGrp) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/LeasedTangiblePropertyGrp">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount5"/></xsl:attribute>
							  Certain leased tangible property (see Regs. sec. 1.367(a)-2(c)(4))
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
                <!-- End Part III Table II L4 -->
				<!--Loop -->
                <!-- Part III Table III L5-->
                <xsl:variable name="AGRowCount6" select="count($Form926Data/RetransferredPropertyGrp)"/>
                <xsl:if test="$AGRowCount6 = 0 or ((count($Form926Data/RetransferredPropertyGrp) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
						Certain property to be retransferred (see Regs. sec. 1.367(a)-2(g))
                    </td>
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
                <!-- Part III Table III L5-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/RetransferredPropertyGrp) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/RetransferredPropertyGrp">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount6"/></xsl:attribute>
							  Certain property to be retransferred (see Regs. sec. 1.367(a)-2(g))
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
                <!-- End Part III Table II L5 -->
				<!--Loop -->
                <!-- Part III Table III L6 -->
                <xsl:variable name="AGRowCount7" select="count($Form926Data/PropertyNotTransferredGrp)"/>
                <xsl:if test="$AGRowCount7 = 0 or ((count($Form926Data/PropertyNotTransferredGrp) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
						Property described in Regs. 1.6038B-1(c)(4)(iv)
                    </td>
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
                <!-- Part III Table III L6 -->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/PropertyNotTransferredGrp) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/PropertyNotTransferredGrp">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount7"/></xsl:attribute>
							  Property described in Regs. 1.6038B-1(c)(4)(iv)
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
                <!-- End Part III Table II L6 -->
				<!--Loop -->
                <!-- Part III Table III L7 -->
                <xsl:variable name="AGRowCount8" select="count($Form926Data/IneligiblePropertyGrp)"/>
                <xsl:if test="$AGRowCount8 = 0 or ((count($Form926Data/IneligiblePropertyGrp) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
						Property described in Regs. sec 1.6038B-1(c)(4)(vii)
                    </td>
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
                <!-- Part III Table III L7 -->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/IneligiblePropertyGrp) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/IneligiblePropertyGrp">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount8"/></xsl:attribute>
							  Property described in Regs. sec 1.6038B-1(c)(4)(vii)
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
                <!-- End Part III Table III L7 -->
				<!--Loop -->
                <!-- Part III Table III L8-->
                <xsl:variable name="AGRowCount9" select="count($Form926Data/ActiveTrdOrBusExcPropTotalGrp)"/>
                <xsl:if test="$AGRowCount9 = 0 or ((count($Form926Data/ActiveTrdOrBusExcPropTotalGrp) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
						Totals
					</td>
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
                <!-- Part III Table III L5-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/ActiveTrdOrBusExcPropTotalGrp) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/ActiveTrdOrBusExcPropTotalGrp">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount9"/></xsl:attribute>
							  Totals
					    </td>
                      </xsl:if>
                      <td class="styIRS926TableCellA " style="width:24mm;background-color:gray">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellB" style="width:51mm;background-color:gray">
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
                <!-- End Part III Table III L8 -->
              </tbody>
            </table>
          </div>
          <div style="width:187mm;">
            <div class="styLNDesc" style="width: 187mm">
              <span style="font-weight:normal">
              *If property listed in this section is subject to depreciation recapture or branch loss recapture, see instructions.
              </span>
			</div>
          </div>
          <!-- Straight Line -->
            <span style="width:187mm;border-bottom:solid 1px;"></span>
            <br></br>
            <br></br>
          <!-- 11 -->
          <div class="styIRS926Part2NBB">
            <div class="styIRS926OL">11</div>
            <div style="float:left">Did the transferor transfer assets that qualify for the trade or business exception under section 367(a)(3)?</div>
            <div style="float:right; padding-right:0.5mm">
              <span class="styIRS926DotLn">...</span>
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
          </div>
          <br></br>
          <br></br>
          <!-- L12 Pt1-->
          <div style="width:187mm; ">
            <div class="styLNLeftNumBox">12
            </div>
            <div class="styLNDesc" style="width:179mm;">
                Indicate whether the transferor was required to recognize income under final and Temporary Regulations
			</div>
          </div>
          <!-- L12 Pt2-->
          <div class="styIRS926Part2NBB" style="height:4.5mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox"/>
              <div class="styLNDesc" style="width:179mm;">
				sections 1.367(a)-2 through 1.367(a)-7 for any of the folowing.
			  </div><!--
              <span class="styIRS926DotLn" style="width:115mm;">............................</span>-->
            </div>
          </div>
          <!-- End 12 Pt 2 -->
          <!-- 12a -->
          <div style="padding-top:1mm; width:187mm">
            <div class="styIRS926OL" style="text-align:right">a</div>
            <div style="float:left">
			  Transfer of property subject to section 367(a)(1) gain recognition
			</div>
            <div style="float:right; padding-right:0.5mm">
              <span class="styIRS926DotLn">
				...............                                     
			  </span>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferPropGainRecognitionInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferPropGainRecognitionInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferPropGainRecognitionInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferPropGainRecognitionInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferPropGainRecognitionInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferPropGainRecognitionInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!-- End 12a -->
          <!-- 12b -->
          <div style="padding-top:1mm; width:187mm">
            <div class="styIRS926OL" style="text-align:right">b</div>
            <div style="float:left">
			  Depreciation recapture
			</div>
            <div style="float:right; padding-right:0.5mm">
              <span class="styIRS926DotLn">
				............................
			  </span>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/RqrRcgnzIncmDeprecRcptrInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/RqrRcgnzIncmDeprecRcptrInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/RqrRcgnzIncmDeprecRcptrInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/RqrRcgnzIncmDeprecRcptrInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/RqrRcgnzIncmDeprecRcptrInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/RqrRcgnzIncmDeprecRcptrInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!-- End 12b -->
          <!-- 12c -->
          <div style="padding-top:1mm; width:187mm">
            <div class="styIRS926OL" style="text-align:right">c</div>
            <div style="float:left">
			  Branch loss recapture (see instructions)
			</div>
            <div style="float:right; padding-right:0.5mm">
              <span class="styIRS926DotLn">
				.......................
			  </span>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/RqrRcgnzIncmBrLossRcptrInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/RqrRcgnzIncmBrLossRcptrInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/RqrRcgnzIncmBrLossRcptrInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/RqrRcgnzIncmBrLossRcptrInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/RqrRcgnzIncmBrLossRcptrInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/RqrRcgnzIncmBrLossRcptrInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!-- End 12c -->
          <!-- L12d-->
          <div style="width:187mm;">
            <div class="styIRS926OL" style="text-align:right">d</div>
            <div class="styLNDesc" style="width:105mm;">If the answer to line 12c is “Yes,” enter the amount of foreign branch loss recapture     
			</div>
				<img src="{$ImagePath}/926_Bullet_Title.gif" alt="Arrow Bullet"/>
				<span style="width:1mm;">$</span>
				<!-- A straight Line -->
				<span style="width:34mm;border-bottom:solid 1px;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form926Data/ForeignBranchLossRecaptureAmt"/>
				  </xsl:call-template>
				</span>
		 </div>
          <!-- End 12d -->
          <!-- 12e -->
          <div style="padding-top:1mm; width:187mm">
            <div class="styIRS926OL" style="text-align:right">e</div>
            <div style="float:left">
			  Any other income recognition provision contained iin the above-referenced regulations
			</div>
            <div style="float:right; padding-right:0.5mm">
              <span class="styIRS926DotLn">
				.........
			  </span>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/RequiredRcgnzIncmAboveRegsInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/RequiredRcgnzIncmAboveRegsInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/RequiredRcgnzIncmAboveRegsInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/RequiredRcgnzIncmAboveRegsInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/RequiredRcgnzIncmAboveRegsInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/RequiredRcgnzIncmAboveRegsInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!-- Text below 12e -->
          <div style="padding-top:1mm; width:187mm">
            <div class="styIRS926OL" style="text-align:right">&nbsp;</div>
            <div style="float:left">If the answer to line 12a, 12b, 12c, or 12e is "Yes", see instructions for information that must be included in the
			</div>
		  </div>
          <div style="padding-top:1mm; width:187mm">
            <div class="styIRS926OL" style="text-align:right">&nbsp;</div>
			<div style="float:left"> <span class="styItalText">Supplemental Part III Information Required To Be Reported</span> section below.
			</div>
		  </div>
          <!-- End Text below 12e -->		  
          <!-- Straight Line -->
            <span style="width:187mm;border-bottom:solid 1px;"></span>
            <br></br>
            <br></br>
          <!-- BEGIN Part III Table IV Title -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartDesc" style="height:4mm;padding-top:.5mm;">Section D -- Intangible property under Regs. sec. 1.367(a)-1(d)(5)
            </div>       
          <!-- END Part III Table IV Title -->
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
          <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
          <!-- Part III Table IV -->
          <div style="width:187mm;float:left;clear:left;" id="IRTP">
            <table class="styTable" id="IRS926PartIII" summary="Intangible property under Regs. sec. 1.367(a)-1(d)(5)" cellspacing="0" >
              <thead class="styIRS926TableThead">
				<tr>
                  <th class="styIRS926TableCellLine " scope="col" 
					  style="width:34mm;text-align:center;border-bottom-width: 0px; border-top-width: 0px;vertical-align:top; ">
                  Type of<br/> property</th>
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
                    <br/> Useful life
				  </th>
                  <th class="styIRS926TableCellD " scope="col" style="width:26mm;text-align:center;vertical-align:top;">
                    <span class="styBoldText">(d)</span>
                    <br/> Arm's length<br/>price on date of<br/>transfer
				  </th>
                  <th class="styIRS926TableCellE" scope="col" style="width:26mm;text-align:center;vertical-align:top;">
                    <span class="styBoldText">(e)</span>
                    <br/> Cost or other<br/>basis
				  </th>
                  <th class="styIRS926TableCellF" scope="col" style="width:26mm;text-align:center;vertical-align:top;">
                    <span class="styBoldText">(f)</span>
                    <br/> Income inclusion<br/> for year of transfer<br/>(see instructions)
				  </th>              
                </tr>                
              </thead>              
              <tfoot/>
              <tbody>
              
              <!--Begin Part III Table IV -->
                <!-- Part III Table IV L1 -->
            <xsl:variable name="AGRowCount20" select="count($Form926Data/IntangiblePropertyDetailGrp/TransferDt)"/>
                <xsl:if test="$AGRowCount20 = 0 or ((count($Form926Data/IntangiblePropertyDetailGrp/TransferDt) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">Cash</td>
                    <td class="styIRS926TableCellA " style="width:24mm;">
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$Form926Data/IntangiblePropertyTotalGrp"/>
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
                    <td class="styIRS926TableCellF" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                           
                <!-- Adding check for the SRD --> 
                <!-- Part III table IV L1-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/IntangiblePropertyDetailGrp/TransferDt) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/IntangiblePropertyDetailGrp">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount20"/></xsl:attribute>
							  Property described in sec. 936(h)(3)(B)
						</td>
                      </xsl:if>
                      <td class="styIRS926TableCellA " style="width:24mm;">
                        <xsl:call-template name="PopulateMonthDayYear">
                          <xsl:with-param name="TargetNode" select="TransferDt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellB" style="width:51mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="PropertyDesc"/>
                        </xsl:call-template>                        
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellC " style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="UsefulLifeDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellD" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="TransferDtArmLengthPriceAmt"/>
                        </xsl:call-template>                        
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellE" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>                        
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellF" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IncomeInclusionAmt"/>
                        </xsl:call-template>                        
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!-- End Part III Table IV L1 -->
                  <!--Loop -->
                <!-- Part III Table IV L2-->
                <xsl:variable name="AGRowCount21" select="count($Form926Data/IntangliblePropertyTransferGrp)"/>
                <xsl:if test="$AGRowCount21 = 0 or ((count($Form926Data/IntangliblePropertyTransferGrp) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
                    Property described in sec. 936(h)(3)(B)
                    </td>
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
                    <td class="styIRS926TableCellF" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                           
                <!-- Adding check for the SRD -->
                <!-- Part III Table IV L2-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/IntangliblePropertyTransferGrp) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/IntangliblePropertyTransferGrp">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount21"/></xsl:attribute>
							  Property subject to sec. 367(d) pursuant to Regs. sec. 1.367(a)-1(b)(5)
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
                          <xsl:with-param name="TargetNode" select="UsefulLifeDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellD" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="TransferDtArmLengthPriceAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellE" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellF" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IncomeInclusionAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!-- End Part III Table IV L2 -->
				<!--Loop -->
                <!-- Part III Table IV L3-->
                <xsl:variable name="AGRowCount22" select="count($Form926Data/IntangiblePropertyTotalGrp)"/>
                <xsl:if test="$AGRowCount22 = 0 or ((count($Form926Data/IntangiblePropertyTotalGrp) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
						Totals
					</td>
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
                    <td class="styIRS926TableCellF" style="width:26mm;">
                      <span class="styTableCellPad"/>
                    </td>
                  </tr>
                </xsl:if>
                           
                <!-- Adding check for the SRD -->
                <!-- Part III Table IV L3-->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/IntangiblePropertyTotalGrp) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/IntangiblePropertyTotalGrp">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount22"/></xsl:attribute>
							  Totals
					    </td>
                      </xsl:if>
                      <td class="styIRS926TableCellA " style="width:24mm;background-color:gray">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellB" style="width:51mm;background-color:gray">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellC " style="width:26mm;background-color:gray">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellD" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="TransferDtArmLengthPriceAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellE" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="CostOrOtherBasisAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styIRS926TableCellF" style="width:26mm;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="IncomeInclusionAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                </xsl:if>
                <!-- End Part III Table IV L3 -->
              </tbody>
            </table>
          </div>
          <!-- End of Page 3 -->
          <div style="padding-top:1mm; width:187mm; border-top:1px solid black" class="pageEnd">
            <div style="float:left">
              <b/>
            </div>
            <div style="float:right">
              <span style="width:45mm"/>
				  Form <b style="font-size:8pt">926</b> (Rev. 12-2017)
			</div>
          </div>
          <p style="page-break-before: always"/>
          <!-- Begin Page 4 -->
			<div style="width:187mm; border-bottom:1px solid black; page-break-before:always">
				<div style="float:left">
					Form 926 (Rev. 12-2014)
			  </div>
				<div style="float:right">
					Page <b style="font-size:8pt">4</b>
				</div>
			</div>
          <!-- Cont. Part III -->
          <!-- L13a Pt1-->
          <div style="width:187mm; ">
            <div class="styLNLeftNumBox">13a</div>
            <div class="styLNDesc" style="width:179mm;">
                Did the transferor transfer properry described in section 936(h)(3)(B) (not including section 1221(a)(3) property
			</div>
          </div>
          <!-- L13a Pt2-->
          <div class="styIRS926Part2NBB" style="height:4.5mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox"/>
              <div class="styLNDesc" style="width:63mm;">
				 or a working interest in oil and gas property)?
				 <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form926Data/TransferRequiredRcgnzIncome"/>
              </xsl:call-template>
			  </div>
              <span class="styIRS926DotLn" style="width:85mm;">.....................</span>
              
            </div>
            <div style="float:right;clear:none;">
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
          </div>
          <!-- End 13a Pt 2 -->
          <!-- L13b Pt1-->
          <div style="width:187mm; ">
            <div class="styIRS926OL" style="text-align:right">b</div>
            <div class="styLNDesc" style="width:179mm;">
                If the answer to line 13a is "Yes", enter the total amount included in income under section 367(d), if any, for the 
			</div>
          </div>
          <!-- L13b Pt2-->
          <div class="styIRS926Part2NBB" style="height:4.5mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox"/>
              <div class="styLNDesc" style="width:101mm;">
				  transfer of all such property on the income tax return for the year of the transfer
			  </div>
			</div>
				<img src="{$ImagePath}/926_Bullet_Title.gif" alt="Arrow Bullet"/>
				<span style="width:1mm;">$</span>
				<!-- A straight Line -->
				<span style="width:34mm;border-bottom:solid 1px;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form926Data/IntangiblePropertyTrnsfrAmt"/>
				  </xsl:call-template>
				</span> 
		  </div>
		  <!-- End 13b Pt 2 -->
          <!-- L14a Pt 1-->
          <div style="width:187mm; ">
            <div class="styLNLeftNumBox">14a</div>
            <div class="styLNDesc" style="width:179mm;">
                Did the transferor apply section 367(d) to a transfer of any property pursuant to Regulations section
			</div>
          </div>
          <!-- L14a Pt 2-->
          <div class="styIRS926Part2NBB" style="height:4.5mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox"/>
              <div class="styLNDesc" style="width:25mm;">
				 1.367(a)-1(b)(5)?
			  </div>
              <span class="styIRS926DotLn" style="width:123mm;">..............................</span>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ApplySection367dInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/ApplySection367dInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ApplySection367dInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ApplySection367dInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/ApplySection367dInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ApplySection367dInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!-- End 14a Pt 2 -->
          <!-- L14b Pt 1-->
          <div style="width:187mm; ">
            <div class="styIRS926OL" style="text-align:right">b</div>
            <div class="styLNDesc" style="width:179mm;">
                If the answer to line 14a is "Yes", enter the total amount included in income under section 367(d), if any, for the 
			</div>
          </div>
          <!-- L14b Pt 2-->
          <div class="styIRS926Part2NBB" style="height:4.5mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox"/>
              <div class="styLNDesc" style="width:101mm;">
				  transfer of all such property on the income tax return for the year of the transfer
			  </div>
			</div>
				<img src="{$ImagePath}/926_Bullet_Title.gif" alt="Arrow Bullet"/>
				<span style="width:1mm;">$</span>
				<!-- A straight Line -->
				<span style="width:34mm;border-bottom:solid 1px;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form926Data/Section367dIncomeAmt"/>
				  </xsl:call-template>
				</span> 
		  </div>
          <!-- End 14b Pt 2 -->
          <!-- L14c Pt 1-->
          <div style="width:187mm; ">
            <div class="styIRS926OL" style="text-align:right">c</div>
            <div class="styLNDesc" style="width:179mm;">
                If the answer to line 14a is "No", did the transferor transfer any property forwhich it could have applied
			</div>
          </div>
          <!-- L14c Pt 2-->
          <div class="styIRS926Part2NBB" style="height:4.5mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox"/>
              <div class="styLNDesc" style="width:85mm;">
				 section 367(d) pursuant to Regulations section 1.367(a)-1(b)(5)?
			  </div>
              <span class="styIRS926DotLn" style="width:63mm;">................</span>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/GainRcgnzUnderSect367a1Ind"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/GainRcgnzUnderSect367a1Ind"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/GainRcgnzUnderSect367a1Ind"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/GainRcgnzUnderSect367a1Ind"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/GainRcgnzUnderSect367a1Ind"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/GainRcgnzUnderSect367a1Ind"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!-- End 14c Pt 2 -->
          <!-- L14d Pt 1-->
          <div style="width:187mm; ">
            <div class="styIRS926OL" style="text-align:right">d</div>
            <div class="styLNDesc" style="width:179mm;">
                If the answer to line 14a is "Yes", enter the total amount included in income under section 367(d), if any, for the 
			</div>
          </div>
          <!-- L14d Pt 2-->
          <div class="styIRS926Part2NBB" style="height:4.5mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox"/>
              <div class="styLNDesc" style="width:101mm;">
				  transfer of all such property on the income tax return for the year of the transfer
			  </div>
			</div>
				<img src="{$ImagePath}/926_Bullet_Title.gif" alt="Arrow Bullet"/>
				<span style="width:1mm;">$</span>
				<!-- A straight Line -->
				<span style="width:34mm;border-bottom:solid 1px;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form926Data/GainRcgnzUnderSect367a1Amt"/>
				  </xsl:call-template>
				</span> 
		  </div>
          <!-- End 14d Pt 2 -->
          <!-- L15a Pt 1-->
          <div style="width:187mm; ">
            <div class="styLNLeftNumBox">15a</div>
            <div class="styLNDesc" style="width:179mm;">
                Did the transferor transfer any intangible property that, at the time of the transfer, had a useful life
			</div>
          </div>
          <!-- L15a Pt 2-->
          <div class="styIRS926Part2NBB" style="height:4.5mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox"/>
              <div class="styLNDesc" style="width:60mm;">
				 reasonably anticipated to exceed twenty years?
			  </div>
              <span class="styIRS926DotLn" style="width:88mm;">......................</span>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/UsefulLifeTransferInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/UsefulLifeTransferInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/UsefulLifeTransferInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/UsefulLifeTransferInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/UsefulLifeTransferInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/UsefulLifeTransferInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!-- End 15a Pt 2 -->
          <!-- L15b-->
          <div style="width:187mm; ">
            <div class="styIRS926OL" style="text-align:right">b</div>
            <div class="styLNDesc" style="width:130mm;">
                At the time of the transfer, did any of the transferred intangible property have an indefinite useful life?
			</div>
              <span class="styIRS926DotLn" style="width:17mm;">....</span>
            <div style="float:right;clear:none;">
              <div class="styLNDesc" style="width:15mm;text-align:left;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/IndfntUsefulLifeTransferInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/IndfntUsefulLifeTransferInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/IndfntUsefulLifeTransferInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:13mm;text-align:left;padding-left:1.5mm;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/IndfntUsefulLifeTransferInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/IndfntUsefulLifeTransferInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/IndfntUsefulLifeTransferInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
              </div>
          </div>
          <!-- End 15b -->
          <!-- L15c Pt 1-->
          <div style="width:187mm; ">
            <div class="styIRS926OL" style="text-align:right">c</div>
            <div class="styLNDesc" style="width:179mm;">
                Did the transferor choose to apply the 20-year inclusion period provided under Regulations section
			</div>
          </div>
          <!-- L15c Pt 2-->
          <div class="styIRS926Part2NBB" style="height:4.5mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox"/>
              <div class="styLNDesc" style="width:62mm;">
				 1.367(d)-1(c)(3)(ii) for any intangible property?
			  </div>
              <span class="styIRS926DotLn" style="width:86mm;">.....................</span>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/Apply20YearInclusionPeriodInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/Apply20YearInclusionPeriodInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/Apply20YearInclusionPeriodInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/Apply20YearInclusionPeriodInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/Apply20YearInclusionPeriodInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/Apply20YearInclusionPeriodInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!-- End 15c Pt 2 -->
          <!-- L15d Pt 1-->
          <div style="width:187mm; ">
            <div class="styIRS926OL" style="text-align:right">d</div>
            <div class="styLNDesc" style="width:179mm;">
                If the answer to line 15c is "Yes", enter the total estimated anticipated income or cost reduction attributable to
			</div>
          </div>
          <!-- L15d Pt 2-->
          <div class="styIRS926Part2NBB" style="height:4.5mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox"/>
              <div class="styLNDesc" style="width:150mm;">
				  the intangible property's, or properties' as applicable, use(s) beyond the 20-year period described in
			  </div>
			</div>
		  </div>
		  <!-- End L15d Pt 2 -->
          <!-- L15d Pt 3-->
          <div class="styIRS926Part2NBB" style="height:4.5mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox"/>
              <div class="styLNDesc" style="width:51mm;">
				  Regulations section 1.367(d)-1(c)(3)(ii).
			  </div>
			</div>
				<img src="{$ImagePath}/926_Bullet_Title.gif" alt="Arrow Bullet"/>
				<span style="width:1mm;">$</span>
				<!-- A straight Line -->
				<span style="width:34mm;border-bottom:solid 1px;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form926Data/LimitationAmt"/>
				  </xsl:call-template>
				</span> 
		  </div>
          <!-- End 15d Pt 3 -->
          <!-- L16 Pt 1-->
          <div style="width:187mm; ">
            <div class="styLNLeftNumBox">16</div>
            <div class="styLNDesc" style="width:179mm;">
                Was any intangible property transferred considered or anticipated to be, at the time of the transfer or at any time
			</div>
          </div>
          <!-- End L16 Pt 1-->
          <!-- L16 Pt 2-->
          <div class="styIRS926Part2NBB" style="height:4.5mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox"/>
              <div class="styLNDesc" style="width:105mm;">
				 thereafter, a platform contribution as difined in Regulation section 1.482-7(c)(1)?
			  </div>
              <span class="styIRS926DotLn" style="width:43mm;">..........</span>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/IntngblPropTrnsfrContriInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/IntngblPropTrnsfrContriInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/IntngblPropTrnsfrContriInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/IntngblPropTrnsfrContriInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/IntngblPropTrnsfrContriInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/IntngblPropTrnsfrContriInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!-- End 16 Pt 2 -->
          <!-- Begin Supplemental Information Area -->
          <div style="width:187mm;border-top:solid 1px;border-bottom:solid 1px;">
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
          <br></br>
          <br></br>
          <!-- End Supplemental Information Area -->
          
          <!-- BEGIN Part IV Title -->
          <div class="styBB" style="width:187mm">
            <div class="styPartName">Part IV</div>
            <div class="styPartDesc">Additional Information Regarding Transfer of Property <span class="styNormalText">(see instructions)</span>
            </div>
          </div>
          <!-- END Part IV Title -->
          <!-- BEGIN Part IV Line Items -->
          <!-- L7 R1-->
          <div style="width:187mm">
            <div class="styLNLeftNumBox">17</div>
            <div class="styLNDesc" style="width: 128mm;">Enter the transferor’s interest in the foreign transferee corporation before and after the transfer:
        </div>
            <!--<img src="{$ImagePath}/926_Bullet_Title.gif" alt="Arrow Bullet"/>-->
          </div>
          <!-- L17 R2-->
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
          <!-- L18-->
          <div style="width:187mm">
            <div class="styLNLeftNumBox">18</div>
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
          <!-- L19-->
          <div style="width:187mm;">
            <div class="styLNLeftNumBox">19 </div>
            <div class="styLNDesc">Indicate whether any transfer reported in Part III on this schedule is subject to any of the following:          
          </div>
          </div>
          <!--19a-->
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
          <!--19b-->
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
          <!--19c-->
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
          <!--19d-->
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
          <!-- L20-->
          <div style="width:187mm">
            <div class="styLNLeftNumBox">20</div>
            <div class="styLNDesc" style="width:78mm;">
				Did this transfer result from a change in entity classification?
		    </div>
              <span class="styIRS926DotLn" style="width:71mm;">.................</span>
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
          <!-- 21a -->
          <div class="styIRS926Part2NBB">
            <div class="styIRS926OL">21a</div>
            <div style="float:left">
				Did a domestic corporation make a distribution of property covered by section 367(e)(2) (see instructions)?
			</div>
            <div style="float:right; padding-right:0.5mm">
              <span class="styIRS926DotLn">...</span>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/CoverPropertyDistributionInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/CoverPropertyDistributionInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/CoverPropertyDistributionInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/CoverPropertyDistributionInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/CoverPropertyDistributionInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/CoverPropertyDistributionInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
            <div style="float:left;padding-left:8mm">If "Yes", complete line 21b and 21c.</div>
          </div>
          <!-- L21b-->
          <div style="width:187mm;">
            <div class="styIRS926OL">21b</div>
            <div class="styLNDesc" style="width:120mm;">
				Enter the total amount of gain or loss reconized persuant to Regulations section 1.367(c)-2(b)
			</div>
				<img src="{$ImagePath}/926_Bullet_Title.gif" alt="Arrow Bullet"/>
				<span style="width:1mm;">$</span>
				<!-- A straight Line -->
				<span style="width:34mm;border-bottom:solid 1px;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form926Data/RecognizeTotalGainLossAmt"/>
				  </xsl:call-template>
				</span>
		 </div>
          <!-- End 21b -->
          <!-- L21c Pt 1-->
          <div style="width:187mm; ">
            <div class="styLNLeftNumBox">21c</div>
            <div class="styLNDesc" style="width:179mm;">
                Did the domestic corporation not recongize gain or loss on the distribution of property because the property was used
			</div>
          </div>
          <!-- End L21c Pt 1-->
          <!-- L21c Pt 2-->
          <div class="styIRS926Part2NBB" style="height:4.5mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox"/>
              <div class="styLNDesc" style="width:110mm;">
				 in the conduct of U.S. trade or business under Regulations section 1.367(ee)-2(b)(2)?
			  </div>
              <span class="styIRS926DotLn" style="width:39mm;">.........</span>
            </div>
            <div style="float:right;clear:none;">
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PropDistriGainLossNotRcgnzInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/PropDistriGainLossNotRcgnzInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PropDistriGainLossNotRcgnzInd"/>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PropDistriGainLossNotRcgnzInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/PropDistriGainLossNotRcgnzInd"/>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PropDistriGainLossNotRcgnzInd"/>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!-- End 21c Pt 2 -->
          
          <!-- END Part IV Line Items -->
          <!-- Begin Footer -->
          <div style="width:187mm;padding-top:1mm;">
            <div style="float:right;">
              <span style="width:1px;"/>
            Form<span class="styBoldText"> 926 </span>(Rev. 12-2017)
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
                    <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
                    <xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
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
            <!-- Begin separated data for Section A Cash Line Table-->
          <!-- Section A Cash table header -->
        <xsl:if test="(count($Form926Data/CashPropertyGrp/TransferDt) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">Form 926, Part III - Information Regarding Transfer of Property (Cash)</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Information Regarding Transfer of Property" cellspacing="0" 
				  style="font-family:verdana;font-size:7pt;display:table">
                <thead class="styDepTableThead">
                  <tr class="styDepTblHdr">
                    <th class="styDepTblCell " scope="col" style="width:24mm;text-align:center;border-bottom-width: 1px; border-top-width: 1px; ">
                      <br/>Type of<br/> property
                    </th>
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
                  <!--Section A Cash line repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/CashPropertyGrp/TransferDt)"/>
                  <xsl:for-each select="$Form926Data/CashPropertyGrp">
                    <tr>
                      <xsl:attribute name="class">
						  <xsl:choose>	
							  <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
							  <xsl:otherwise>styDepTblRow2</xsl:otherwise>
						  </xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/>
                          </xsl:attribute>
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
          <!-- End separated data for Section A Cash Line Table-->
           <!-- Begin separated data for Section A Stock and Securities Line Table-->
          <!-- Stock and Securities table header -->
          <xsl:if test="(count($Form926Data/StocksAndSecuritiesPropertyGrp) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">Form 926, Part III - Information Regarding Transfer of Property (Stock And Securities)</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Information Regarding Transfer of Property" 
              cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
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
                  <!--Section A Stock and securities line repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/StocksAndSecuritiesPropertyGrp)"/>
                  <xsl:for-each select="$Form926Data/StocksAndSecuritiesPropertyGrp">
                    <tr>
                      <xsl:attribute name="class">
                      <xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
						  <xsl:otherwise>styDepTblRow2
						  </xsl:otherwise>
					  </xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;border-top-width: 0px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>
						  Stock and securities (other than those that quality as eligible peoperty uinder Regs. sec 1.367(a)-2(b)(3))
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
          <!-- End separated data for Section A Stock and Securities Line Table-->
          <!-- Begin separated data for Section B Table-->
          <!-- Tangible property (not listed under another catagory) table header -->
          <xsl:if test="(count($Form926Data/TangiblePropertyGrp) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">
				Form 926, Part III Section B -- Property qualifying for Active Trade or Business exception under sec. 1.367(a)-2(a)(2)(i) 
				and (ii) (Tangible property not listed under another category)</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Property qualifying for Active Trade or Business exception" 
				  cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
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
                  <!-- Tangible property (not listed under another catagory) line repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/TangiblePropertyGrp)"/>
                  <xsl:for-each select="$Form926Data/TangiblePropertyGrp">
                    <tr>
                      <xsl:attribute name="class">
                      <xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
							  <xsl:otherwise>styDepTblRow2
							  </xsl:otherwise>
					  </xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan">
							  <xsl:value-of select="$UKRowCount"/>
						  </xsl:attribute>
						  Tangible property (not listed under another catagory)
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
					  <!-- Begin Totals line for Tangible property -->
					  <xsl:variable name="UKRowCount1" select="count($Form926Data/ActiveTrdOrBusExcPropTotalGrp)"/>
					  <xsl:for-each select="$Form926Data/ActiveTrdOrBusExcPropTotalGrp">
						<tr>
						  <xsl:attribute name="class">
						  <xsl:choose>
							  <xsl:when test="position() mod 2 = 1">styDepTblRow1
							  </xsl:when>
								  <xsl:otherwise>styDepTblRow2
								  </xsl:otherwise>
						  </xsl:choose>
						  </xsl:attribute>
						  <xsl:if test="position()=1">
							<td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
							  <xsl:attribute name="rowspan">
								  <xsl:value-of select="$UKRowCount1"/>
							  </xsl:attribute>
							  Totals
							</td>
						  </xsl:if>
						  <td class="styDepTblCell " style="width:24mm;vertical-align:middle;background-color:gray">
							<span class="styTableCellPad"/>
						  </td>
						  <td class="styDepTblCell " style="width:47mm;vertical-align:middle;background-color:gray">
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
					  <!-- End Totals line for Tangible property -->
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End repeating data for Tangible property (not listed under another catagory) line -->
          <!-- Begin Working interest in oil and gas property Line Table-->
          <!-- Working interest in oil and gas property -->
          <xsl:if test="(count($Form926Data/TrnsfrOilGasWorkingIntPropGrp) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">
				Form 926, Part III Section B -- Property qualifying for Active Trade or  Business exception under sec. 1.367(a)-2(a)(2)(i) and (ii) (Working interest in oil and 
				gas property)</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Property qualifying for Active Trade or  Business exception" 
				  cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
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
                  <!-- Working interest in oil and gas line repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/TrnsfrOilGasWorkingIntPropGrp)"/>
                  <xsl:for-each select="$Form926Data/TrnsfrOilGasWorkingIntPropGrp">
                    <tr>
                      <xsl:attribute name="class">
						<xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
						  <xsl:otherwise>styDepTblRow2
						  </xsl:otherwise>
						</xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan">
							  <xsl:value-of select="$UKRowCount"/>
						  </xsl:attribute>Working interest in oil and gas property (as described in Regs. sec. 1.367(a)-2(b)(2) and (f))
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
					  <!-- Begin Totals line for Working interest in oil and gas  -->
					  <xsl:variable name="UKRowCount2" select="count($Form926Data/ActiveTrdOrBusExcPropTotalGrp)"/>
					  <xsl:for-each select="$Form926Data/ActiveTrdOrBusExcPropTotalGrp">
						<tr>
						  <xsl:attribute name="class">
						  <xsl:choose>
							  <xsl:when test="position() mod 2 = 1">styDepTblRow1
							  </xsl:when>
								  <xsl:otherwise>styDepTblRow2
								  </xsl:otherwise>
						  </xsl:choose>
						  </xsl:attribute>
						  <xsl:if test="position()=1">
							<td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
							  <xsl:attribute name="rowspan">
								  <xsl:value-of select="$UKRowCount2"/>
							  </xsl:attribute>
							  Totals
							</td>
						  </xsl:if>
						  <td class="styDepTblCell " style="width:24mm;vertical-align:middle;background-color:gray">
							<span class="styTableCellPad"/>
						  </td>
						  <td class="styDepTblCell " style="width:47mm;vertical-align:middle;background-color:gray">
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
					  <!-- End Totals line for Working interest in oil and gas -->
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End separated data for Working interest in oil and gas Table-->
          <!-- Begin separated data for Finalcial asset Line Table-->
          <!-- Finalcial asset  table header -->
          <xsl:if test="(count($Form926Data/FinancialAssetPropertyGrp) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">
				Form 926, Part III Section B -- Property qualifying for Active Trade or  Business exception under sec. 1.367(a)-2(a)(2)(i) 
				and (ii) (Finalcial asset)</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Property qualifying for Active Trade or  Business exception" 
				  cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
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
                  <!-- Finalcial asset line repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/FinancialAssetPropertyGrp)"/>
                  <xsl:for-each select="$Form926Data/FinancialAssetPropertyGrp">
                    <tr>
                      <xsl:attribute name="class">
						  <xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
							  <xsl:otherwise>styDepTblRow2
							  </xsl:otherwise></xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$UKRowCount"/></xsl:attribute>
                          Financial asset (as described in Regs. sec. 1.367(a)-2(b)(3))    
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
					  <!-- Begin Totals line for Financial Asset  -->
					  <xsl:variable name="UKRowCount3" select="count($Form926Data/ActiveTrdOrBusExcPropTotalGrp)"/>
					  <xsl:for-each select="$Form926Data/ActiveTrdOrBusExcPropTotalGrp">
						<tr>
						  <xsl:attribute name="class">
						  <xsl:choose>
							  <xsl:when test="position() mod 2 = 1">styDepTblRow1
							  </xsl:when>
								  <xsl:otherwise>styDepTblRow2
								  </xsl:otherwise>
						  </xsl:choose>
						  </xsl:attribute>
						  <xsl:if test="position()=1">
							<td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
							  <xsl:attribute name="rowspan">
								  <xsl:value-of select="$UKRowCount3"/>
							  </xsl:attribute>
							  Totals
							</td>
						  </xsl:if>
						  <td class="styDepTblCell " style="width:24mm;vertical-align:middle;background-color:gray">
							<span class="styTableCellPad"/>
						  </td>
						  <td class="styDepTblCell " style="width:47mm;vertical-align:middle;background-color:gray">
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
					  <!-- End Totals line for Financial Asset -->
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End separated data for Financial Asset Line Table-->
          <!-- Begin separated data for Certain tangible propertyt Line Table-->
          <!-- Certain tangible property table header -->
          <xsl:if test="(count($Form926Data/TangiblePropertyToBeLeasedGrp) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">
				Form 926, Part III Section B -- Property qualifying for Active Trade or  Business exception under sec. 1.367(a)-2(a)(2)(i) and (ii) (Certain tangible
				peoptery to be leased (see Regs. sec. 1.367(a)-2(e)))</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Property qualifying for Active Trade or  Business exception" 
				  cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
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
                  <!-- Certain tangible property repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/TangiblePropertyToBeLeasedGrp)"/>
                  <xsl:for-each select="$Form926Data/TangiblePropertyToBeLeasedGrp">
                    <tr>
                      <xsl:attribute name="class">
						<xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
						  <xsl:otherwise>styDepTblRow2
						  </xsl:otherwise>
						</xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan">
							<xsl:value-of select="$UKRowCount"/>
							</xsl:attribute>Certain tangible peoptery to be leased (see Regs. sec. 1.367(a)-2(e))
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
                      <!-- Begin Totals line for Certain tangible property repeating data -->
                  <xsl:variable name="UKRowCount4" select="count($Form926Data/ActiveTrdOrBusExcPropTotalGrp)"/>
                  <xsl:for-each select="$Form926Data/ActiveTrdOrBusExcPropTotalGrp">
                    <tr>
                      <xsl:attribute name="class">
						<xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
						  <xsl:otherwise>styDepTblRow2
						  </xsl:otherwise>
						</xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan">
							<xsl:value-of select="$UKRowCount4"/>
							</xsl:attribute>Totals
						</td>
                      </xsl:if>
                      <td class="styDepTblCell " style="width:24mm;vertical-align:middle;background-color:gray">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:47mm;vertical-align:middle;background-color:gray">
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
                      <!-- End Totals line for Certain tangible property repeating data -->
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End separated data for Certain tangible property Line Table-->
          <!-- Begin separated data for Inventory Line Table-->
          <!-- Inventory table header -->
          <xsl:if test="(count($Form926Data/TransferInventoryPropertyGrp) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">
				Form 926, Part III Section C -- Property not qualifying for Active Trade or Business exception (other than intangible property subjrct to section 467(d))
				(Inventory)</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Property not qualifying for Active Trade or Business exception" 
				  cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
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
                  <!-- Inventory repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/TransferInventoryPropertyGrp)"/>
                  <xsl:for-each select="$Form926Data/TransferInventoryPropertyGrp">
                    <tr>
                      <xsl:attribute name="class">
						<xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
						  <xsl:otherwise>styDepTblRow2
						  </xsl:otherwise>
						</xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan">
							<xsl:value-of select="$UKRowCount"/>
							</xsl:attribute>Inventory
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
                      <!-- Begin Totals line for Inventory repeating data -->
                  <xsl:variable name="UKRowCount5" select="count($Form926Data/InlgblTrdOrBusExcPropTotalGrp)"/>
                  <xsl:for-each select="$Form926Data/InlgblTrdOrBusExcPropTotalGrp">
                    <tr>
                      <xsl:attribute name="class">
						<xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
						  <xsl:otherwise>styDepTblRow2
						  </xsl:otherwise>
						</xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan">
							<xsl:value-of select="$UKRowCount5"/>
							</xsl:attribute>Totals
						</td>
                      </xsl:if>
                      <td class="styDepTblCell " style="width:24mm;vertical-align:middle;background-color:gray">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:47mm;vertical-align:middle;background-color:gray">
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
                      <!-- End Totals line for Inventory repeating data -->
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End separated data for Inventory Line Table-->
          <!-- Begin separated data for Installment Obligations Line Table-->
          <!-- Installment Obligations table header -->
          <xsl:if test="(count($Form926Data/InstallmentObligationsPropGrp) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">
				Form 926, Part III Section C -- Property not qualifying for Active Trade or Business exception (other than intangible property subjrct to section 467(d))
				(Installment Obligations)</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Property not qualifying for Active Trade or Business exception" 
				  cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
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
                  <!-- Installment Obligations repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/InstallmentObligationsPropGrp)"/>
                  <xsl:for-each select="$Form926Data/InstallmentObligationsPropGrp">
                    <tr>
                      <xsl:attribute name="class">
						<xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
						  <xsl:otherwise>styDepTblRow2
						  </xsl:otherwise>
						</xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan">
							<xsl:value-of select="$UKRowCount"/>
							</xsl:attribute>
							Installment obligations, etc. (as described in Regs. sec. 1.367(a)-2(c)(2))
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
                      <!-- Begin Totals line for Installment Obligations repeating data -->
                  <xsl:variable name="UKRowCount6" select="count($Form926Data/InlgblTrdOrBusExcPropTotalGrp)"/>
                  <xsl:for-each select="$Form926Data/InlgblTrdOrBusExcPropTotalGrp">
                    <tr>
                      <xsl:attribute name="class">
						<xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
						  <xsl:otherwise>styDepTblRow2
						  </xsl:otherwise>
						</xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan">
							<xsl:value-of select="$UKRowCount6"/>
							</xsl:attribute>Totals
						</td>
                      </xsl:if>
                      <td class="styDepTblCell " style="width:24mm;vertical-align:middle;background-color:gray">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:47mm;vertical-align:middle;background-color:gray">
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
                      <!-- End Totals line for Installment Obligation repeating data -->
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End separated data for Installment Obligation Line Table-->
          <!-- Begin separated data for Nonfunctional Currency Line Table-->
          <!-- Nonfunctonal Currency table header -->
          <xsl:if test="(count($Form926Data/NonfunctionalCurrencyPropGrp) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">
				Form 926, Part III Section C -- Property not qualifying for Active Trade or Business exception (other than intangible property subjrct to section 467(d))
				(Nonfunctonal Currency)</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Property not qualifying for Active Trade or Business exception" 
				  cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
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
                  <!-- Nonfunctional Currency repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/NonfunctionalCurrencyPropGrp)"/>
                  <xsl:for-each select="$Form926Data/NonfunctionalCurrencyPropGrp">
                    <tr>
                      <xsl:attribute name="class">
						<xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
						  <xsl:otherwise>styDepTblRow2
						  </xsl:otherwise>
						</xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan">
							<xsl:value-of select="$UKRowCount"/>
							</xsl:attribute>
							Nonfunctional currency, etc. (as described in Regs. sec. 1.367(a)-2(c)(3))
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
                      <!-- Begin Totals line for Nonfunctional Currency repeating data -->
                  <xsl:variable name="UKRowCount7" select="count($Form926Data/InlgblTrdOrBusExcPropTotalGrp)"/>
                  <xsl:for-each select="$Form926Data/InlgblTrdOrBusExcPropTotalGrp">
                    <tr>
                      <xsl:attribute name="class">
						<xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
						  <xsl:otherwise>styDepTblRow2
						  </xsl:otherwise>
						</xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan">
							<xsl:value-of select="$UKRowCount7"/>
							</xsl:attribute>Totals
						</td>
                      </xsl:if>
                      <td class="styDepTblCell " style="width:24mm;vertical-align:middle;background-color:gray">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:47mm;vertical-align:middle;background-color:gray">
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
                      <!-- End Totals line for Nonfunctional Currency repeating data -->
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End separated data for Nonfunctional Currency Line Table-->
          <!-- Begin separated data for Certain Leased Tangible Property Line Table-->
          <!-- Certain Leased Tangible Property table header -->
          <xsl:if test="(count($Form926Data/LeasedTangiblePropertyGrp) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">
				Form 926, Part III Section C -- Property not qualifying for Active Trade or Business exception (other than intangible property subjrct to section 467(d))
				(Certain Leased Tangible Property)</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Property not qualifying for Active Trade or Business exception" 
				  cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
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
                  <!-- Certain Leased Tangible Property repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/LeasedTangiblePropertyGrp)"/>
                  <xsl:for-each select="$Form926Data/LeasedTangiblePropertyGrp">
                    <tr>
                      <xsl:attribute name="class">
						<xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
						  <xsl:otherwise>styDepTblRow2
						  </xsl:otherwise>
						</xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan">
							<xsl:value-of select="$UKRowCount"/>
							</xsl:attribute>
								Certain leased tangible property (as described in Regs. sec. 1.367(a)-2(c)(4))
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
                      <!-- Begin Totals line for Certain Leased Tangible Property repeating data -->
                  <xsl:variable name="UKRowCount8" select="count($Form926Data/InlgblTrdOrBusExcPropTotalGrp)"/>
                  <xsl:for-each select="$Form926Data/InlgblTrdOrBusExcPropTotalGrp">
                    <tr>
                      <xsl:attribute name="class">
						<xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
						  <xsl:otherwise>styDepTblRow2
						  </xsl:otherwise>
						</xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan">
							<xsl:value-of select="$UKRowCount8"/>
							</xsl:attribute>Totals
						</td>
                      </xsl:if>
                      <td class="styDepTblCell " style="width:24mm;vertical-align:middle;background-color:gray">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:47mm;vertical-align:middle;background-color:gray">
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
                      <!-- End Totals line for Certain Leased Tangible Property repeating data -->
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End separated data for Certain Leased Tangible Property Line Table-->
          <!-- Begin separated data for Certain Property to be Retransferred Property Line Table-->
          <!-- Certain Property to be Retransferred table header -->
          <xsl:if test="(count($Form926Data/RetransferredPropertyGrp) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">
				Form 926, Part III Section C -- Property not qualifying for Active Trade or Business exception (other than intangible property subjrct to section 467(d))
				(Certain Property to be Retransferred)</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Property not qualifying for Active Trade or Business exception" 
				  cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
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
                  <!-- Certain Property to be Retransferred repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/RetransferredPropertyGrp)"/>
                  <xsl:for-each select="$Form926Data/RetransferredPropertyGrp">
                    <tr>
                      <xsl:attribute name="class">
						<xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
						  <xsl:otherwise>styDepTblRow2
						  </xsl:otherwise>
						</xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan">
							<xsl:value-of select="$UKRowCount"/>
							</xsl:attribute>
								Certain property to be retransferred (as described in Regs. sec. 1.367(a)-2(g))
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
                      <!-- Begin Totals line for Certain Property to be Retransferred repeating data -->
                  <xsl:variable name="UKRowCount9" select="count($Form926Data/InlgblTrdOrBusExcPropTotalGrp)"/>
                  <xsl:for-each select="$Form926Data/InlgblTrdOrBusExcPropTotalGrp">
                    <tr>
                      <xsl:attribute name="class">
						<xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
						  <xsl:otherwise>styDepTblRow2
						  </xsl:otherwise>
						</xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan">
							<xsl:value-of select="$UKRowCount9"/>
							</xsl:attribute>Totals
						</td>
                      </xsl:if>
                      <td class="styDepTblCell " style="width:24mm;vertical-align:middle;background-color:gray">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:47mm;vertical-align:middle;background-color:gray">
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
                      <!-- End Totals line for Certain Property to be Retransferred repeating data -->
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End separated data for Certain Property to be Retransferred Line Table-->
          <!-- Begin separated data for Property Described in Regs sec. 1.6038B-1(c)(4)(iv) Line Table-->
          <!-- Property Described in Regs sec. 1.6038B-1(c)(4)(iv) table header -->
          <xsl:if test="(count($Form926Data/PropertyNotTransferredGrp) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">
				Form 926, Part III Section C -- Property not qualifying for Active Trade or Business exception (other than intangible property subjrct to section 467(d))
				(Property Described in Regs sec. 1.6038B-1(c)(4)(iv))</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Property not qualifying for Active Trade or Business exception" 
				  cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
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
                  <!-- Certain Property Described in Regs sec. 1.6038B-1(c)(4)(iv) repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/PropertyNotTransferredGrp)"/>
                  <xsl:for-each select="$Form926Data/PropertyNotTransferredGrp">
                    <tr>
                      <xsl:attribute name="class">
						<xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
						  <xsl:otherwise>styDepTblRow2
						  </xsl:otherwise>
						</xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan">
							<xsl:value-of select="$UKRowCount"/>
							</xsl:attribute>
								Certain Property Described in Regs sec. 1.603B-1(c)(4)(iv)
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
                      <!-- Begin Totals line for Property Described in Regs sec. 1.6038B-1(c)(4)(iv) repeating data -->
                  <xsl:variable name="UKRowCount10" select="count($Form926Data/InlgblTrdOrBusExcPropTotalGrp)"/>
                  <xsl:for-each select="$Form926Data/InlgblTrdOrBusExcPropTotalGrp">
                    <tr>
                      <xsl:attribute name="class">
						<xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
						  <xsl:otherwise>styDepTblRow2
						  </xsl:otherwise>
						</xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan">
							<xsl:value-of select="$UKRowCount10"/>
							</xsl:attribute>Totals
						</td>
                      </xsl:if>
                      <td class="styDepTblCell " style="width:24mm;vertical-align:middle;background-color:gray">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:47mm;vertical-align:middle;background-color:gray">
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
                      <!-- End Totals line for Property Described in Regs sec. 1.6038B-1(c)(4)(iv) repeating data -->
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End separated data for Property Described in Regs sec. 1.6038B-1(c)(4)(iv) Line Table-->
          <!-- Begin separated data for Property Described in Regs sec. 1.6038B-1(c)(4)(vii) Line Table-->
          <!-- Property Described in Regs sec. 1.6038B-1(c)(4)(vii) table header -->
          <xsl:if test="(count($Form926Data/IneligiblePropertyGrp) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">
				Form 926, Part III Section C -- Property not qualifying for Active Trade or Business exception (other than intangible property subjrct to section 467(d))
				(Property Described in Regs sec. 1.6038B-1(c)(4)(vii))</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Property not qualifying for Active Trade or Business exception" 
				  cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
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
                  <!-- Certain Property Described in Regs sec. 1.6038B-1(c)(4)(vii) repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/IneligiblePropertyGrp)"/>
                  <xsl:for-each select="$Form926Data/IneligiblePropertyGrp">
                    <tr>
                      <xsl:attribute name="class">
						<xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
						  <xsl:otherwise>styDepTblRow2
						  </xsl:otherwise>
						</xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan">
							<xsl:value-of select="$UKRowCount"/>
							</xsl:attribute>
								Certain Property Described in Regs sec. 1.6038B-1(c)(4)(vii)
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
                      <!-- Begin Totals line for Property Described in Regs sec. 1.6038B-1(c)(4)(vii) repeating data -->
                  <xsl:variable name="UKRowCount10" select="count($Form926Data/InlgblTrdOrBusExcPropTotalGrp)"/>
                  <xsl:for-each select="$Form926Data/InlgblTrdOrBusExcPropTotalGrp">
                    <tr>
                      <xsl:attribute name="class">
						<xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
						  <xsl:otherwise>styDepTblRow2
						  </xsl:otherwise>
						</xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan">
							<xsl:value-of select="$UKRowCount10"/>
							</xsl:attribute>Totals
						</td>
                      </xsl:if>
                      <td class="styDepTblCell " style="width:24mm;vertical-align:middle;background-color:gray">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:47mm;vertical-align:middle;background-color:gray">
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
                      <!-- End Totals line for Property Described in Regs sec. 1.6038B-1(c)(4)(vii) repeating data -->
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End separated data for Property Described in Regs sec. 1.6038B-1(c)(4)(vii) Line Table-->
          <!-- Begin separated data for Property described in sec. 936(h)(3)(B) Line Table-->
          <!-- Property described in sec. 936(h)(3)(B) table header -->
          <xsl:if test="(count($Form926Data/IntangiblePropertyDetailGrp) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">
				Form 926 Part III Section D -- Intangible property under Regs. sec. 1.367(a)-1(d)(5) (Property described in sec. 936(h)(3)(B))</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Property not qualifying for Active Trade or Business exception" 
				  cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
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
                      <br/> Useful life
				    </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(d)</span>
                      <br/> Arm's length<br/>price on date of<br/>transfer
				    </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(e)</span>
                      <br/> Cost or<br/> other basis
				    </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(f)</span>
                      <br/> Income inclusion<br/>for year or transfer<br/>(see instructions)
				    </th>
                  </tr>
                </thead>
                <tfoot/>
                <tbody>
                  <!-- Property described in sec. 936(h)(3)(B) repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/IntangiblePropertyDetailGrp)"/>
                  <xsl:for-each select="$Form926Data/IntangiblePropertyDetailGrp">
                    <tr>
                      <xsl:attribute name="class">
						<xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
						  <xsl:otherwise>styDepTblRow2
						  </xsl:otherwise>
						</xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan">
							<xsl:value-of select="$UKRowCount"/>
							</xsl:attribute>
								Property described in sec. 936(h)(3)(B)
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
                          <xsl:with-param name="TargetNode" select="UsefulLifeDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="TransferDtArmLengthPriceAmt"/>
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
                          <xsl:with-param name="TargetNode" select="IncomeInclusionAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                      <!-- Begin Totals line for Property described in sec. 936(h)(3)(B) repeating data -->
                  <xsl:variable name="UKRowCount11" select="count($Form926Data/IntangiblePropertyTotalGrp)"/>
                  <xsl:for-each select="$Form926Data/IntangiblePropertyTotalGrp">
                    <tr>
                      <xsl:attribute name="class">
						<xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
						  <xsl:otherwise>styDepTblRow2
						  </xsl:otherwise>
						</xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan">
							<xsl:value-of select="$UKRowCount11"/>
							</xsl:attribute>Totals
						</td>
                      </xsl:if>
                      <td class="styDepTblCell " style="width:24mm;vertical-align:middle;background-color:gray">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:47mm;vertical-align:middle;background-color:gray">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:33mm;vertical-align:middle;background-color:gray">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="TransferDtArmLengthPriceAmt"/>
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
                          <xsl:with-param name="TargetNode" select="IncomeInclusionAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                      <!-- End Totals line for Property described in sec. 936(h)(3)(B) repeating data -->
                </tbody>
              </table>
            </div>
          </xsl:if>
          <!-- End separated data for Property described in sec. 936(h)(3)(B) Line Table-->
          <!-- Begin separated data for Property subject to sec. 367(d) pursuant to Regs. sec. 1.367(a)-1(b)(5) Line Table-->
          <!-- Property subject to sec. 367(d) pursuant to Regs. sec. 1.367(a)-1(b)(5) table header -->
          <xsl:if test="(count($Form926Data/IntangliblePropertyTransferGrp) &gt;1) and ($Print = $Separated)">
            <div class="pageEnd"/>
            <br/>
            <br/>
            <span class="styRepeatingDataTitle">
				Form 926 Part III Section D -- Intangible property under Regs. sec. 1.367(a)-1(d)(5) (Property subject to sec. 367(d) pursuant to Regs. sec. 1.367(a)-1(b)(5))
			</span>
            <div style="width:187mm;float:left;clear:left;" id="IRTP">
              <table class="styDepTable" id="IRS926PartIII" summary="Property not qualifying for Active Trade or Business exception" 
				  cellspacing="0" style="font-family:verdana;font-size:7pt;display:table">
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
                      <br/> Useful life
				    </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(d)</span>
                      <br/> Arm's length<br/>price on date of<br/>transfer
				    </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(e)</span>
                      <br/> Cost or<br/> other basis
				    </th>
                    <th class="styDepTblCell " scope="col" style="width:32mm;text-align:center;">
                      <span class="styBoldText">(f)</span>
                      <br/> Income inclusion<br/>for year or transfer<br/>(see instructions)
				    </th>
                  </tr>
                </thead>
                <tfoot/>
                <tbody>
                  <!-- Property subject to sec. 367(d) pursuant to Regs. sec. 1.367(a)-1(b)(5) repeating data -->
                  <xsl:variable name="UKRowCount" select="count($Form926Data/IntangliblePropertyTransferGrp)"/>
                  <xsl:for-each select="$Form926Data/IntangliblePropertyTransferGrp">
                    <tr>
                      <xsl:attribute name="class">
						<xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
						  <xsl:otherwise>styDepTblRow2
						  </xsl:otherwise>
						</xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan">
							<xsl:value-of select="$UKRowCount"/>
							</xsl:attribute>
								Property subject to sec. 367(d) pursuant to Regs. sec. 1.367(a)-1(b)(5)
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
                          <xsl:with-param name="TargetNode" select="UsefulLifeDesc"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="TransferDtArmLengthPriceAmt"/>
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
                          <xsl:with-param name="TargetNode" select="IncomeInclusionAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                      <!-- Begin Totals line for Property subject to sec. 367(d) repeating data -->
                  <xsl:variable name="UKRowCount11" select="count($Form926Data/IntangiblePropertyTotalGrp)"/>
                  <xsl:for-each select="$Form926Data/IntangiblePropertyTotalGrp">
                    <tr>
                      <xsl:attribute name="class">
						<xsl:choose>
						  <xsl:when test="position() mod 2 = 1">styDepTblRow1
						  </xsl:when>
						  <xsl:otherwise>styDepTblRow2
						  </xsl:otherwise>
						</xsl:choose>
					  </xsl:attribute>
                      <xsl:if test="position()=1">
                        <td class="styDepTblCell " style="width:24mm;vertical-align:middle;border-bottom-width: 1px;">
                          <xsl:attribute name="rowspan">
							<xsl:value-of select="$UKRowCount11"/>
							</xsl:attribute>Totals
						</td>
                      </xsl:if>
                      <td class="styDepTblCell " style="width:24mm;vertical-align:middle;background-color:gray">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:47mm;vertical-align:middle;background-color:gray">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:33mm;vertical-align:middle;background-color:gray">
                        <span class="styTableCellPad"/>
                      </td>
                      <td class="styDepTblCell " style="width:32mm;vertical-align:middle;">
                        <xsl:call-template name="PopulateAmount">
                          <xsl:with-param name="TargetNode" select="TransferDtArmLengthPriceAmt"/>
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
                          <xsl:with-param name="TargetNode" select="IncomeInclusionAmt"/>
                        </xsl:call-template>
                        <span class="styTableCellPad"/>
                      </td>
                    </tr>
                  </xsl:for-each>
                      <!-- End Totals line for Property subject to sec. 367(d) repeating data -->
                </tbody>
              </table>
            </div>
          </xsl:if>
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
