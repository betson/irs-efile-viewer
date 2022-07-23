<?xml version="1.0"?>
<!DOCTYPE xsl:stylesheet [<!ENTITY nbsp "&#160;">]>

<!--Updated per UWR  107348 and Revision Date to July/2014- By Robert Jones -->
<!--Did changes per IBM Defect #40742 6/24/2014 Robert Jones-->
<!--Did changes per IBM Defect #41290 8/8/2014 Robert Jones-->
<!--Did changes per IBM Defect #41295 8/8/2014 Robert Jones-->
<!--Did changes per IBM Defect #41415 8/20/2014 Robert Jones 508 added scope to several "th" lines -->
<!--Updated per Kisams IM01817803 and Revision Date back to December/2013- By Robert Jones -->
<!--Updated per Kisams IM01467430 11/18/2014 Transferor not populating. Schema element mis-spelled (Tranferor)- By Robert Jones -->
<!--Did changes per IBM Defect #43153 6/30/2015 by Robert Jones IE11 Related-->
<!-- Last modified on 5/18/2017 by Robert Jones UWR 194393 and 195664 Return Headers for 1120, 1041, 1040 and 1040NR  -->
<!-- 9.11.2018 - R10.2 Drop5 Changes per UWR 212295  Circ Date 4.19.2018-->
<!-- 01/28/19 - updated per KISAM IM00498648  Jeremy Nichols -->

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
                <br/>(Rev. September 2018)<br/>
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
          <!--L1-10.2D5-->
          <div style="padding-top:1mm; width:187mm;height:auto;">
            <div class="styIRS926OL">&nbsp;1</div>
			  Is the transferor a share holder in a specified 10-percent owned foreign corporation that is not
		  </div>
          <div style="width:187mm;height:auto;">
            <div class="styIRS926OL"/>
            <div style="float:left;padding-left:8mm;">
         a controlled foreign corporation?                
        </div>
            <div style="float:right; padding-right:0.5mm">
              <span class="styIRS926DotLn">
            .........................                       
          </span>
              <div class="styLNDesc" style="height:auto;width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ControlledBy5OrFewerDomCorpInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/ControlledBy5OrFewerDomCorpInd"/>
                      <xsl:with-param name="BackupName">F926ControlledBy5OrFewerDomCorpInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ControlledBy5OrFewerDomCorpInd"/>
                      <xsl:with-param name="BackupName">F926ControlledBy5OrFewerDomCorpInd</xsl:with-param>
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
                      <xsl:with-param name="BackupName">F926ControlledBy5OrFewerDomCorpInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
          <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ControlledBy5OrFewerDomCorpInd"/>
                      <xsl:with-param name="BackupName">F926ControlledBy5OrFewerDomCorpInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!--L2-->
          <div style="padding-top:1mm; width:187mm;height:auto;">
            <div class="styIRS926OL">&nbsp;2</div>
			  If the transferor was a corporation, complete questions 2a through 2d.    
		  </div>
         
          <!--2a-->
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
            .........................                        
          </span>
              <div class="styLNDesc" style="height:auto;width:15mm;text-align:right;padding-top:0mm;padding-bottom:0mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ControlledBy5OrFewerDomCorpInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/ControlledBy5OrFewerDomCorpInd"/>
                      <xsl:with-param name="BackupName">F926ControlledBy5OrFewerDomCorpInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ControlledBy5OrFewerDomCorpInd"/>
                      <xsl:with-param name="BackupName">F926ControlledBy5OrFewerDomCorpInd</xsl:with-param>
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
                      <xsl:with-param name="BackupName">F926ControlledBy5OrFewerDomCorpInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
          <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ControlledBy5OrFewerDomCorpInd"/>
                      <xsl:with-param name="BackupName">F926ControlledBy5OrFewerDomCorpInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!--2b-->
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
                      <xsl:with-param name="BackupName">F926ExistedAfterTransferInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ExistedAfterTransferInd"/>
                      <xsl:with-param name="BackupName">F926ExistedAfterTransferInd</xsl:with-param>
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
                      <xsl:with-param name="BackupName">F926ExistedAfterTransferInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
          <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ExistedAfterTransferInd"/>
                      <xsl:with-param name="BackupName">F926ExistedAfterTransferInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!--2b r2 -->
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
                    <!-- Empty Table for line 2b  -->
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
          <!-- 2c -->
          <div style="width:187mm; padding-top:1mm;display:table">
            <div class="styIRS926OL" style="text-align:right">c</div>
            <div style="float:left">
          If the transferor was a member of an affiliated group filing a consolidated return, was it the parent                  
        </div>
          </div>
          <!-- 2c row 2 -->
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
                      <xsl:with-param name="BackupName">F926ParentCorporationInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ParentCorporationInd"/>
                      <xsl:with-param name="BackupName">F926ParentCorporationInd</xsl:with-param>
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
                      <xsl:with-param name="BackupName">F926ParentCorporationInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
          <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ParentCorporationInd"/>
                      <xsl:with-param name="BackupName">F926ParentCorporationInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!-- 2c Row3 -->
          <div style="width:184mm; padding-top:2mm; padding-bottom:2mm;display:table">
            <div style="float:left; padding-left:8mm">
          If not, list the name and employer identification number (EIN) of the parent corporation:        
        </div>
          </div>
          <!-- Begin 2c table -->
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
          <!--2d-->
          <div style="padding-top:1mm; width:187mm">
            <div class="styIRS926OL" style="text-align:right">d</div>
            <div style="float:left">
          Have basis adjustments under section 367(a)(4) been made?                    
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
                      <xsl:with-param name="BackupName">F926BasicAdjusmentsSect367a5Ind</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/BasicAdjusmentsSect367a5Ind"/>
                      <xsl:with-param name="BackupName">F926BasicAdjusmentsSect367a5Ind</xsl:with-param>
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
                      <xsl:with-param name="BackupName">F926BasicAdjusmentsSect367a5Ind</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
          <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/BasicAdjusmentsSect367a5Ind"/>
                      <xsl:with-param name="BackupName">F926BasicAdjusmentsSect367a5Ind</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!--blank line -->
          <div style="width:187mm"/>
          <!--L3-->
          <div style="width:187mm">
            <div class="styIRS926OL">&nbsp;3</div>
            <div style="float:left">
          If the transferor was a partner in a partnership that was the actual transferor (but is not treated as such under section 367), complete <br></br>questions 3a through 3d.
        </div>
          </div>
          <!--a-->
          <div style=" width:187mm; padding-top:1mm;">
            <div class="styIRS926OL" style="text-align:right">a</div>
            <div class="styLNDesc" style="padding-top:0mm;padding-bottom:0mm;">List the name and EIN of the transferor’s partnership: 
        </div>
          </div>
          <!--L3a table -->
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
          <!--3b-->
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
                      <xsl:with-param name="BackupName">F926PrtnrPickProRataShrGnTrnsfrInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrPickProRataShrGnTrnsfrInd"/>
                      <xsl:with-param name="BackupName">F926PrtnrPickProRataShrGnTrnsfrInd</xsl:with-param>
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
                      <xsl:with-param name="BackupName">F926PrtnrPickProRataShrGnTrnsfrInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
          <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrPickProRataShrGnTrnsfrInd"/>
                      <xsl:with-param name="BackupName">F926PrtnrPickProRataShrGnTrnsfrInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!-- 3c -->
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
                      <xsl:with-param name="BackupName">F926PrtnrDispsngEntireIntPrtshpInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrDispsngEntireIntPrtshpInd"/>
                      <xsl:with-param name="BackupName">F926PrtnrDispsngEntireIntPrtshpInd</xsl:with-param>
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
                      <xsl:with-param name="BackupName">F926PrtnrDispsngEntireIntPrtshpInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
          <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrDispsngEntireIntPrtshpInd"/>
                      <xsl:with-param name="BackupName">F926PrtnrDispsngEntireIntPrtshpInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
          <!-- 3d R1-->
          <div style="padding-top:1mm; width:187mm">
            <div class="styIRS926OL" style="text-align:right">d</div>
            <div class="styLNDesc">
         Is the partner disposing of an interest in a limited partnership that is regularly traded on an established                     
        </div>
          </div>
          <!-- 3d R2 -->
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
                      <xsl:with-param name="BackupName">F926PrtnrDisposingIntLtdPrtshpInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
            <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrDisposingIntLtdPrtshpInd"/>
                      <xsl:with-param name="BackupName">F926PrtnrDisposingIntLtdPrtshpInd</xsl:with-param>
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
                      <xsl:with-param name="BackupName">F926PrtnrDisposingIntLtdPrtshpInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
          <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PrtnrDisposingIntLtdPrtshpInd"/>
                      <xsl:with-param name="BackupName">F926PrtnrDisposingIntLtdPrtshpInd</xsl:with-param>
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
          <div class="styIRS926Part2BB" style="width:187mm; height:auto;">
            <div class="styFNBox" style="width:100.25mm; height:auto;">
              <!-- 4<div style="float:right; padding-left:1mm;height:auto;">
              <b>Identifying number</b> (see instructions)<br></br>
          <div style="text-align:left; padding-top:2mm"> -->
              <div style="width:7mm; height: auto;"><b>4</b></div> 
				<div style="width:85mm; height: auto;">Name of transferee (foreign corporation)</div>
			  
		<br></br>
		 
				
            <div style="width:100.25mm; height: auto; font-family:verdana;font-size:6pt; padding-left: 9mm;">
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
              <!-- 5a Replaces 4 from prior years in 2013 -->
			  <div class="styFNBox" style="width:86.25mm; height:auto; border-right-width:0px;">
              <div class="styIRS926OL" style="width:7mm; height: auto;">5a</div>
              <div class="styIRS926OL" style="width:70mm;font-weight:normal;"><b>Identifying number</b>, if any</div><br></br>
             
            <div style=" width:75mm; height:auto;padding-left: 9mm;">
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
            <br></br>
            
            <div class="styIRS926Part2BB" style="width:187mm; height:auto;">
            <div class="styFNBox" style="width:100mm; height:auto;border-right-width: 0px;">
              <!-- 6 -->
              <div style="width:7mm; height: auto;"><b>6</b></div> 
				<div style="width:85mm; height: auto;">Address (including country)</div>
				<br></br>
            <!-- Check for Transferee US Address -->
            <div style="width: 85mm; height: auto; float: left; padding-left:9mm; border-right-width: 0px;">
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
            </div>
 
   <!-- 5b New for 2013  There must be a problem with the Schema because this field will not populate with the element for this line. I can make the field populate-->
              <div class="styIRS926OL" style="width:86.25mm; height: auto; font-weight:normal;border-left:1px solid;">
				<div style="width:7mm; height: auto;border-left-width:0px"><b>5b</b></div> 
				<div style="width:75mm; height: auto;">Reference ID number (see instructions)</div>
				<br></br>
				<xsl:if test="($Print!=$Separated) or (($Print=$Separated) and (count($Form926Data/ForeignEntityIdentificationGrp) &lt;20))">
			        <div class="styIRS926OL" style="width:75mm; height: auto; font-weight:normal;padding-left:9mm;border-left-width:0px;">
						  <xsl:for-each select="$Form926Data/ForeignEntityIdentificationGrp">
									<xsl:call-template name="PopulateText">
										<xsl:with-param name="TargetNode" select="ForeignEntityReferenceIdNum"/>
									</xsl:call-template>
															  <br/>
						  </xsl:for-each>
				   </div>
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
          <!-- 7 -->
          <div class="styIRS926Part2BB" style="height:7.5mm;">
            <div class="styIRS926OL" style="clear:none">&nbsp;7</div>
            <div class="styGenericDiv" style="width:178mm;">
          Country code of country of incorporation or organization (see instructions)
          <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form926Data/TransfereeCountryOfIncorpCd"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- 8 -->
          <div class="styIRS926Part2BB" style="height:7.5mm;">
            <div class="styIRS926OL" style="clear:none">&nbsp;8</div>
            <div class="styGenericDiv" style="width:178mm;">
          Foreign law characterization (see instructions)
          <br/>
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form926Data/ForeignLawCharacterizationTxt"/>
              </xsl:call-template>
            </div>
          </div>
          <!-- 9-->
          <div class="styIRS926Part2BB">
            <div class="styIRS926OL">&nbsp;9</div>
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
                      <xsl:with-param name="BackupName">F926TransfereeForeignCorpInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransfereeForeignCorpInd"/>
                      <xsl:with-param name="BackupName">F926TransfereeForeignCorpInd</xsl:with-param>
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
                      <xsl:with-param name="BackupName">F926TransfereeForeignCorpInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransfereeForeignCorpInd"/>
                      <xsl:with-param name="BackupName">F926TransfereeForeignCorpInd</xsl:with-param>
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
      Form <b style="font-size:8pt">926</b> (Rev. 09-2018)
      </div>
          </div>
     
          <!-- Begin page 2 Header-->
          <div style="width:187mm;clear:both;padding-bottom:.5mm;float:none;clear:both;" class="styBB">
            <div style="width:90mm;" class="styGenericDiv">Form 926 (Rev. 09-2018)</div>
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
            <div class="styPartDesc">Information Regarding Transfer of Property <span class="styNormalText">(see instructions)</span>
            </div>
          </div>
            <!-- Part III Section A Header-->
          <div class="styBB" style="width:187mm;">
            <div class="styPartDesc" style="height:7mm;padding-top:3mm;padding-left:0mm">
				Section A -- Cash <!--, Stocks, and Securities-->
            </div>
			  <!-- END Part III Section A Header -->
			  
			  <!-- Declare Part III Section A Table Attributes-->
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
          <!-- Part III Table Header-->
          <div style="width:187mm; height:auto; float:left; clear:left;" id="IRTP">
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
              
              <!--Begin Part III Table - Row 1 Cash line -->
                <!-- Part III Table L1 -->
            <xsl:variable name="AGRowCount1" select="count($Form926Data/CashPropertyGrp/TransferDt)"/>
                <xsl:if test="$AGRowCount1 = 0 or ((count($Form926Data/CashPropertyGrp/TransferDt) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 1px;">
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
                        <td class="styIRS926TableCellLine " style="width:34mm; vertical-align:middle; border-bottom-width: 1px;">
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
                <!-- R10.2D5 DELETED
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
                </xsl:if>-->
                           
                <!-- Adding check for the SRD -->
                
                <!-- Part III table L2-->
                <!-- R10.2D5 DELETED 
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
                </xsl:if> -->
                <!--End Part III Table - Stock and securities line -->
              </tbody>
            </table><br/>
          </div>
          <!-- L10 -->
<!--Q10 Container-->     
			<div style="width:187mm; height: auto; float:left;">
<!--Q10-->   
				<div style="width:7.5mm; height: 8mm; float:left; padding-left:1mm; padding-top:1mm;">
					<span><b>10</b> </span> 
				</div>
<!--Q10 text-->   
			<div style="width:152mm; height: 3mm; float:left; padding-top:1mm;">
					Was cash the only property transferred?
					<span class="styIRS926DotLn" style="height: 3mm; float:none;padding-top:1mm;">
						 ........................
					</span><br/>
					If "Yes", skip the remainder of Part III and go to Part IV.
			</div>  
            
<!--Q10 YesCheckBox-->    
			<div style="width: 14mm; height: 4.5mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form926Data/CashOnlyPropertyTransferredInd"/>
                  </xsl:call-template>
 <!---->                     
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/CashOnlyPropertyTransferredInd"/>
                      <xsl:with-param name="BackupName">F926CashOnlyPropertyTransferredInd</xsl:with-param>
                    </xsl:call-template>
                  </input>            
                </span> 
<!--Q10 YesLabel-->              
              <span>
              <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/CashOnlyPropertyTransferredInd"/>
                      <xsl:with-param name="BackupName">F926CashOnlyPropertyTransferredInd</xsl:with-param>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
			   </span>
            </div>
<!--Q10 NoCheckBox-->          
			<div style="width: 12mm; height: 4.5mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/CashOnlyPropertyTransferredInd"/>
                  </xsl:call-template>
                <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/CashOnlyPropertyTransferredInd"/>
                      <xsl:with-param name="BackupName">F926CashOnlyPropertyTransferredInd</xsl:with-param>
                    </xsl:call-template>
                </input>          
                </span> 
<!--Q10 NoLabel-->          
				<span>  
                <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/CashOnlyPropertyTransferredInd"/>
                      <xsl:with-param name="BackupName">F926CashOnlyPropertyTransferredInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
                </span>
              </div>
        </div>

<!-- BEGIN Part III Section B—Other Property (other than intangible property subject to section 367(d)) -->
          <div class="styBB" style="width:187mm;">
            <div class="styPartDesc" style="height:10mm;padding-top:2.5mm;padding-left:0mm">
				Section B -- Section B—Other Property (other than intangible property subject to section 367(d)) 
            </div>       
          <!-- END Part III Section B—Other Property (other than intangible property subject to section 367(d)) -->
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
          <!-- Part III Section B—Other Property (other than intangible property subject to section 367(d)) -->
          <div style="width:187mm;float:left;clear:left;" id="IRTP">
            <table class="styTable" id="IRS926PartIII" summary="Other Property (other than intangible property subject to section 367(d))" cellspacing="0" >
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
              
              <!--Begin Part III Section B—Other Property (other than intangible property subject to section 367(d)) -->
                <!-- Part III Stock and Securities -->
            <xsl:variable name="AGRowCount1" select="count($Form926Data/StocksAndSecuritiesPropertyGrp/TransferDt)"/>
                <xsl:if test="$AGRowCount1 = 0 or ((count($Form926Data/StocksAndSecuritiesPropertyGrp/TransferDt) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
						Stock and Securities
					</td>
                    <td class="styIRS926TableCellA " style="width:24mm;">
                      <xsl:call-template name="PopulateAdditionalDataTableMessage">
                        <xsl:with-param name="TargetNode" select="$Form926Data/StocksAndSecuritiesPropertyGrp"/>
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
                <!-- Part III table Stock and Securities -->
                <xsl:if test="($Print != $Separated) or (count($Form926Data/StocksAndSecuritiesPropertyGrp/TransferDt) &lt;= 1) ">
                  <xsl:for-each select="$Form926Data/StocksAndSecuritiesPropertyGrp">
                    <tr>
                      <xsl:if test="position()=1">
                        <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
                          <xsl:attribute name="rowspan"><xsl:value-of select="$AGRowCount1"/></xsl:attribute>
							 Stock and Securities
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
                <!-- Part III Table II L2 Inventory-->
                <xsl:variable name="AGRowCount3" select="count($Form926Data/TrnsfrOilGasWorkingIntPropGrp)"/>
                <xsl:if test="$AGRowCount3 = 0 or ((count($Form926Data/TrnsfrOilGasWorkingIntPropGrp) &gt; 1) and ($Print = $Separated))">
                  <tr>
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">
                    Inventory</td>
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
                   Other property (not listed under another category)</td>
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
							  Other property (not listed under another category)
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
                    Property with built-in loss</td>
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
							  Property with built-in loss
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





        
<!--Q11a Container-->     
			<div style="width:187mm; height: auto; float:left; padding-top:1mm;">
<!--Q11a-->   
				<div style="width:7.5mm; height: 8mm; float:left; padding-left:1mm; padding-top:1mm;">
					<span><b>11</b> </span> 
				</div>
<!--Q11a text--> 
				<div style="width:152mm; height: 8mm; float:left;padding-top:1mm;">  
                Did the transferor transfer stock or securities subject to section 367(a) with respect to which a gain recognition<br/>
				 agreement was filed?   
				<span class="styIRS926DotLn" style="height: 8mm; float: none;padding-top:1mm;padding-left:1.5mm;">
					.............................
				</span>
			</div>
           
              <div style="width:14mm; height: 4.5mm; padding-top:3mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/StockOrSecuritiesTransferInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/StockOrSecuritiesTransferInd"/>
                      <xsl:with-param name="BackupName">F926StockOrSecuritiesTransferInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> 
				<label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/StockOrSecuritiesTransferInd"/>
                      <xsl:with-param name="BackupName">F926StockOrSecuritiesTransferInd</xsl:with-param>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
              </div>
              <div style="width:12mm; height: 4.5mm; padding-top:3mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/StockOrSecuritiesTransferInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/StockOrSecuritiesTransferInd"/>
                      <xsl:with-param name="BackupName">F926StockOrSecuritiesTransferInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span>
				<label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/StockOrSecuritiesTransferInd"/>
                      <xsl:with-param name="BackupName">F926StockOrSecuritiesTransferInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          
		  <!-- End 11 Pt 2 -->
		  <!-- -->
		  <!-- -->
		  <!-- -->
		  <!-- -->
		  <!-- -->
		  <!-- -->
		  <!-- -->
<!--Q12a Container-->     
			<div style="width:187mm; height: auto; float:left;">
<!--Q12a-->   
				<div style="width:7.5mm; height: 8mm; float:left; padding-left:1mm; padding-top:1mm;">
					<span><b>12a</b> </span> 
				</div>
<!--Q12a text-->   
			<div style="width:152mm; height: 8mm; float:left;padding-top:1mm;">
					Were any assets of a foreign branch (including a branch that is a foreign disregarded entity) transferred to a
					 foreign corporation?  If "Yes", go to line 12b.
					<span class="styIRS926DotLn" style=" height: 8mm; float: none;padding-top:1mm;">
						  .........................
					</span>
			</div>
<!--Q12a DotLine-->   
            
<!--Q12a YesCheckBox-->    
			<div style="width: 14mm; height: 9mm; padding-top:4mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form926Data/ForeignBranchAssetTransferInd"/>
                  </xsl:call-template>
 <!---->                     
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/ForeignBranchAssetTransferInd"/>
                      <xsl:with-param name="BackupName">F926ForeignBranchAssetTransferInd</xsl:with-param>
                    </xsl:call-template>
                  </input>            
                </span> 
<!--Q12a YesLabel-->              
              <span>
              <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ForeignBranchAssetTransferInd"/>
                      <xsl:with-param name="BackupName">F926ForeignBranchAssetTransferInd</xsl:with-param>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
			   </span>
            </div>
<!--Q12a NoCheckBox-->          
			<div style="width: 12mm; height: 9mm; padding-top:4mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ForeignBranchAssetTransferInd"/>
                  </xsl:call-template>
                <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/ForeignBranchAssetTransferInd"/>
                      <xsl:with-param name="BackupName">F926ForeignBranchAssetTransferInd</xsl:with-param>
                    </xsl:call-template>
                </input>          
                </span> 
<!--Q12a NoLabel-->          
				<span>  
                <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ForeignBranchAssetTransferInd"/>
                      <xsl:with-param name="BackupName">F926ForeignBranchAssetTransferInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
                </span>
              </div>
        </div>
         
 
<!--Q12b Container-->
				<div style="width:187mm; height: auto; float:left;">
<!--Q12b-->  			
					  <div style="width:7.5mm; height: 13.5mm; float:left; padding-left:1mm; padding-top:1mm;">
						 <span style="padding-left: 4mm;"><b>b</b> </span> 
					</div>
<!--Q12b Text-->  			
					<div style="width:138.5mm; height: 13.5mm; float:left;padding-top:1mm;">
					 Was the transferor a domestic corporation that transferred substantially all of the assets of a foreign branch (including a branch that is a foreign disregarded entity) to a specified 10-percent owned foreign corporation?  If "Yes", continue to line 12c. If "No", skip lines 12c and 12d, and go to line 13.
				</div>
<!--Q12b DotLine-->  		
				 <div class="styIRS926DotLn" style="width:13.5mm; height: 8mm; float: left;padding-top:4.5mm;">
              ....
					</div>
<!--Q12b YesCheckBox-->   
				<div class="styLNDesc" style="width:15mm; height: 9mm; padding-top:3mm;">
                <span>  
                  <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form926Data/DomCorpAstTransferForeignBrInd"/>
                  </xsl:call-template>                     
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/DomCorpAstTransferForeignBrInd"/>
                      <xsl:with-param name="BackupName">F926DomCorpAstTransferForeignBrInd</xsl:with-param>
                    </xsl:call-template>
                  </input>              
                </span> 
<!--Q12b YesLabel--> 
              <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/DomCorpAstTransferForeignBrInd"/>
                      <xsl:with-param name="BackupName">F926DomCorpAstTransferForeignBrInd</xsl:with-param>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
            </div>
<!--Q12b NoCheckBox-->       
              <div class="styLNDesc" style="width:12mm; height: 9mm;padding-top:3mm; ">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/DomCorpAstTransferForeignBrInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/DomCorpAstTransferForeignBrInd"/>
                      <xsl:with-param name="BackupName">F926DomCorpAstTransferForeignBrInd</xsl:with-param>
                    </xsl:call-template>
                  </input>     
                </span> 
<!--Q12b NoLabel-->               
			 <span> 
				  <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/DomCorpAstTransferForeignBrInd"/>
                      <xsl:with-param name="BackupName">F926DomCorpAstTransferForeignBrInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
             </span>
              </div>
            </div>
            
<!--Q12c Container-->
				<div style="width:187mm; height: auto; float:left;">
<!--Q12c-->  			
					  <div style="width:7.5mm; height: 9mm; float:left; padding-left:1mm; padding-top:1mm;">
						 <span style="padding-left: 4mm;"><b>c</b> </span> 
					</div>
<!--Q12c Text-->  			
					<div style="width:152mm; height: 9mm; float:left;padding-top:1mm;">
					Immediately after the transfer, was the domestic corporation a U.S. shareholder with respect to the transferee foreign
					 corporation?  If "Yes", continue to line 12d.  If "No", skip 12d, and go to line 13. 
					<span class="styIRS926DotLn" style="height: 9mm; float: none;padding-top:1mm;">
						  ............
					</span>
				</div>
<!--Q12c DotLine-->  		
				
<!--Q12c YesCheckBox-->   
				<div class="styLNDesc" style="width:14.75mm; height: 9mm;padding-top:3mm; ">
                <span>  
                  <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form926Data/DomesticCorpUSShareholderInd"/>
                  </xsl:call-template>                     
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/DomesticCorpUSShareholderInd"/>
                      <xsl:with-param name="BackupName">F926DomesticCorpUSShareholderInd</xsl:with-param>
                    </xsl:call-template>
                  </input>              
                </span> 
<!--Q12c YesLabel--> 
              <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/DomesticCorpUSShareholderInd"/>
                      <xsl:with-param name="BackupName">F926DomesticCorpUSShareholderInd</xsl:with-param>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
            </div>
<!--Q12c NoCheckBox-->       
              <div class="styLNDesc" style="width:12mm; height: 9mm;padding-top:3mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/DomesticCorpUSShareholderInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/DomesticCorpUSShareholderInd"/>
                      <xsl:with-param name="BackupName">F926DomesticCorpUSShareholderInd</xsl:with-param>
                    </xsl:call-template>
                  </input>     
                </span> 
<!--Q12c NoLabel-->               
			 <span> 
				  <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/DomesticCorpUSShareholderInd"/>
                      <xsl:with-param name="BackupName">F926DomesticCorpUSShareholderInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
             </span>
              </div>
            </div>

<!--Q12d Container-->
				<div style="width:187mm; height: auto; float:left;">
<!--Q12d-->  			
					 <div style="width:7.5mm; height: 6mm; float:left; padding-left:1mm; padding-top:1mm;">
						 <span style="padding-left: 4mm;"><b>d</b> </span> 
					</div>
<!--Q12d Text-->  			
					<div style="width:112mm; height: 6mm; float:left;padding-top:1mm;">
					Enter the transferred loss amount included in gross income as required under section 91
				</div>
<!--Q12d DotLine-->  		
				  <div class="styIRS926DotLn" style="width:67mm; height: 6mm; float: left;padding-top:1mm;">
              ......
				<span><img src="{$ImagePath}/926_Bullet_Title.gif" alt="Arrow Bullet"/></span>
				<span style="width:1mm;">$</span>
				<!-- A straight Line -->
				<span style="width:34mm;border-bottom:solid 1px;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form926Data/TransferredLossAmt"/>
				  </xsl:call-template>
				</span> 
		  </div>
		  </div>

    
            <!--Q13 Container-->
				<div style="width:187mm; height: auto; float:left; padding-top:1mm;">
<!--Q13 -->  			
					 <div style="width:7.5mm; height:8mm; float:left; padding-left:1mm; padding-top:1mm;">
						 <span><b>13</b> </span> 
					</div>
<!--Q13 Text-->  			
					<div style="width:85mm; height: 8mm; float:left;padding-top:1mm;">
						 Did the transferor transfer property described in section 367(d)(4)?<br/> 
						If "No", skip Section C and questions 14a through 15.
						 <!--<span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form926Data/IntangiblePropertyTrnsfrInd"/>
							  </xsl:call-template>
						 </span>-->
					</div>
<!--Q13 DotLine-->  		
				  <div class="styIRS926DotLn" style="width:67mm;height: 8mm; float: left;padding-top:1mm;">
              ................
					</div>
<!--Q13 YesCheckBox-->   
				<div class="styLNDesc" style="width:15.5mm; height: 9mm;">
                <span>  
                  <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form926Data/IntangiblePropertyTrnsfrInd"/>
                  </xsl:call-template>                     
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/IntangiblePropertyTrnsfrInd"/>
                      <xsl:with-param name="BackupName">F926IntangiblePropertyTrnsfrInd</xsl:with-param>
                    </xsl:call-template>
                  </input>              
                </span> 
<!--Q13 YesLabel--> 
			  <span>
              <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/IntangiblePropertyTrnsfrInd"/>
                      <xsl:with-param name="BackupName">F926IntangiblePropertyTrnsfrInd</xsl:with-param>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
			  </span>
            </div>  
<!--Q13 NoCheckBox-->       
              <div class="styLNDesc" style="width:12mm; height: 9mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/IntangiblePropertyTrnsfrInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/IntangiblePropertyTrnsfrInd"/>
                      <xsl:with-param name="BackupName">F926IntangiblePropertyTrnsfrInd</xsl:with-param>
                    </xsl:call-template>
                  </input>     
                </span> 
<!--Q13 NoLabel-->               
			 <span> 
				  <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/IntangiblePropertyTrnsfrInd"/>
                      <xsl:with-param name="BackupName">F926IntangiblePropertyTrnsfrInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
             </span>
              </div>
            </div> 
            
            
           
          <!-- BEGIN Part III Table IV Title -->
          <div class="styBB" style="width:187mm; height: auto;">
            <div class="styPartDesc" style=" width: 187mm; height: 1mm; padding-top:.5mm; border-top-style: solid; border-top-width: 1px;">Section C - Intangible Property Subject to Section 367(d)(4)
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
            <table class="styTable" id="IRS926PartIII" summary="Intangible Property Subject to Section 367(d)(4)" cellspacing="0" >
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
                    <td class="styIRS926TableCellLine " style="width:34mm;vertical-align:middle;border-bottom-width: 0px;">Property described in sec. 367(d)(4)</td>
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
							  Property described in sec. 367(d)(4) 
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
               <!-- <xsl:variable name="AGRowCount21" select="count($Form926Data/IntangliblePropertyTransferGrp)"/>
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
                           
                 Adding check for the SRD 
                 Part III Table IV L2
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
                </xsl:if>-->
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
            <div style="padding-top:1mm; width:187mm; border-top:1px solid black" class="pageEnd">
            <div style="float:left">
              <b/>
            </div>
            <div style="float:right">
              <span style="width:45mm"/>
				  Form <b style="font-size:8pt">926</b> (Rev. 9-2018)
			</div>
          </div>
          </div>
          <!-- End of Page 3 -->
          
          <p style="page-break-before: always"/>
          <!-- Begin Page 4 -->
			<div style="width:187mm; border-bottom:1px solid black; page-break-before:always">
				<div style="float:left">
					Form 926 (Rev. 9-2018)
			  </div>
				<div style="float:right">
					Page <b style="font-size:8pt">4</b>
				</div>
			</div>
			
			
			

        
		  
<!--Q14a Container-->
				<div style="width:187mm; height: auto; float:left; padding-top:1mm;">
<!--Q14a -->  			
					 <div style="width:7.5mm; height:9mm; float:left; padding-left:1mm; padding-top:1mm;">
						 <span><b>14a</b> </span> 
					</div>
<!--Q14a Text-->  			
					<div style="width:151mm; height: 9mm; float:left; padding-top:1mm;">
						  Did the transferor transfer any intangible property that, at the time of the 
						  transfer, had a useful life reasonably<br/> anticipated to exceed twenty years?
						 <!--<span>
							<xsl:call-template name="SetFormLinkInline">
								<xsl:with-param name="TargetNode" select="$Form926Data/UsefulLifeTransferInd"/>
							  </xsl:call-template>
						 </span>-->
						   <div class="styIRS926DotLn" style="float: none; padding-top:1mm;">
              .........................
					</div>
					</div>
<!--Q14a DotLine-->  		
				
<!--Q14 YesCheckBox-->   
				<div class="styLNDesc" style="width:16mm; height: 4.5mm;padding-top:3mm;">
                <span>  
                  <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form926Data/UsefulLifeTransferInd"/>
                  </xsl:call-template>                     
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/UsefulLifeTransferInd"/>
                      <xsl:with-param name="BackupName">F926UsefulLifeTransferInd</xsl:with-param>
                    </xsl:call-template>
                  </input>              
                </span> 
<!--Q14a YesLabel--> 
			  <span>
              <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/UsefulLifeTransferInd"/>
                      <xsl:with-param name="BackupName">F926UsefulLifeTransferInd</xsl:with-param>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
			  </span>
            </div>  
<!--Q14a NoCheckBox-->       
              <div class="styLNDesc" style="width:12mm; height: 4.5mm; padding-top:3mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/UsefulLifeTransferInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/UsefulLifeTransferInd"/>
                      <xsl:with-param name="BackupName">F926UsefulLifeTransferInd</xsl:with-param>
                    </xsl:call-template>
                  </input>     
                </span> 
<!--Q14a NoLabel-->               
			 <span> 
				  <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/UsefulLifeTransferInd"/>
                      <xsl:with-param name="BackupName">F926UsefulLifeTransferInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
             </span>
              </div>
            </div> 
          
      
          <!-- L14b-->
          <div style="width:187mm; ">
            <div class="styIRS926OL" style="text-align:right; height: 4.5mm; padding-top:1.5mm;">b</div>
            <div class="styLNDesc" style="width:129mm; height: 4.5mm; padding-top:1.5mm;">
                At the time of the transfer, did any of the transferred intangible property have an indefinite useful life?
			</div>
              <span class="styIRS926DotLn" style="width:17mm; padding-top:1.5mm;">.....</span>
            <div style="float:right;clear:none;">
              <div class="styLNDesc" style="width:16mm; height: 4.5mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/IndfntUsefulLifeTransferInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/IndfntUsefulLifeTransferInd"/>
                      <xsl:with-param name="BackupName">F926IndfntUsefulLifeTransferInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> 
				<label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/IndfntUsefulLifeTransferInd"/>
                      <xsl:with-param name="BackupName">F926IndfntUsefulLifeTransferInd</xsl:with-param>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
                <span style="width:2px;"/>
              </div>
              <div class="styLNDesc" style="width:12mm; height: 4.5mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/IndfntUsefulLifeTransferInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/IndfntUsefulLifeTransferInd"/>
                      <xsl:with-param name="BackupName">F926IndfntUsefulLifeTransferInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> 
				<label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/IndfntUsefulLifeTransferInd"/>
                      <xsl:with-param name="BackupName">F926IndfntUsefulLifeTransferInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
              </div>
          </div>
<!-- End 14b -->
<!-- L14c Pt 1-->
          <div style="width:187mm; ">
            <div class="styIRS926OL" style="text-align:right">c</div>
            <div class="styLNDesc" style="width:179mm;">
                Did the transferor choose to apply the 20-year inclusion period provided under Regulations section
			</div>
          </div>
<!-- L14c Pt 2-->
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
                      <xsl:with-param name="BackupName">F926Apply20YearInclusionPeriodInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/Apply20YearInclusionPeriodInd"/>
                      <xsl:with-param name="BackupName">F926Apply20YearInclusionPeriodInd</xsl:with-param>
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
                      <xsl:with-param name="BackupName">F926Apply20YearInclusionPeriodInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/Apply20YearInclusionPeriodInd"/>
                      <xsl:with-param name="BackupName">F926Apply20YearInclusionPeriodInd</xsl:with-param>
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
                If the answer to line 14c is "Yes", enter the total estimated anticipated income or cost reduction attributable to
			</div>
          </div>
<!-- L14d Pt 2-->
          <div class="styIRS926Part2NBB" style="height:4.5mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox"/>
              <div class="styLNDesc" style="width:150mm;">
				  the intangible property's, or properties' as applicable, use(s) beyond the 20-year period described in
			  </div>
			</div>
		  </div>
<!-- End L14d Pt 2 -->
<!-- L14d Pt 3-->
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
<!-- End 14d Pt 3 -->


<!-- L15 -->
          <div style="width:187mm; ">
            <div class="styLNLeftNumBox">15</div>
            <div class="styLNDesc" style="width:179mm;">
                Was any intangible property transferred considered or anticipated to be, at the time of the transfer or at any time
			</div>
          </div>
<!-- End L15 Pt 1-->
<!-- L15 Pt 2-->
          <div class="styIRS926Part2NBB" style="height:4.5mm;">
            <div style="float:left;clear:none;">
              <div class="styLNLeftNumBox"/>
              <div class="styLNDesc" style="width:105mm;">
				 thereafter, a platform contribution as difined in Regulation section 1.482-7(c)(1)?
			  </div>
              <span class="styIRS926DotLn" style="width:43mm;">...........</span>
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
                      <xsl:with-param name="BackupName">F926IntngblPropTrnsfrContriInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/IntngblPropTrnsfrContriInd"/>
                      <xsl:with-param name="BackupName">F926IntngblPropTrnsfrContriInd</xsl:with-param>
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
                      <xsl:with-param name="BackupName">F926IntngblPropTrnsfrContriInd</xsl:with-param>
                    </xsl:call-template>
                  </input>
                </span> &nbsp;
				<label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/IntngblPropTrnsfrContriInd"/>
                      <xsl:with-param name="BackupName">F926IntngblPropTrnsfrContriInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
              </div>
            </div>
          </div>
<!-- End 15 Pt 2 -->




<!-- Begin Supplemental Information Area -->
          <div style="width:187mm;border-top:solid 1px;border-bottom:solid 1px;">
            <div class="styLNDesc" style="width: 128mm;">
              <span style="font-weight: bold">Supplemental Information Required To Be Reported </span>(see instructions):
			</div>
          </div>
          <div>
<!-- A straight Line -->
            <span style="width:187mm;border-bottom:solid 1px; padding: 0.5mm 1mm;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form926Data/SupplementalInformationTxt"/>
              </xsl:call-template>
            </span>
            <br/>
          </div>        
<!-- End Supplemental Information Area -->       



<!-- BEGIN Part IV Title -->
          <div class="styBB" style="width:187mm; height: auto;">
            <div class="styPartName">Part IV</div>
            <div class="styPartDesc">Additional Information Regarding Transfer of Property <span class="styNormalText">(see instructions)</span>
            </div>
          </div>
          <!-- END Part IV Title -->
          <!-- BEGIN Part IV Line Items -->
          <!-- L7 R1-->
          
<!--Q16-21 CONTAINER-->
        <div style="width:187mm; height: auto;">
<!--Q16-->
			<div style="width:187mm; height: auto;">
				<div class="styLNLeftNumBox" style="width:8mm; height: 5mm;">
					16
					</div>
				<div class="styLNDesc" style="width: 179mm; height: 4.5mm;">
					Enter the transferor’s interest in the transferee foreign corporation before and after the transfer:
					</div>
            </div>
<!--Q16a-->
            <div style="width:187mm; height: auto;">
				 <div class="styLNDesc" style="width: 179mm; height: 5mm;">
				<span style="width:8mm;"/>
					 <span>
						 <b>(a)</b> Before 
					</span>
				 <span style="width:1mm;"/>
				 <span style="width:25mm;border-bottom:solid 1px;">
						<xsl:call-template name="PopulatePercent">
						  <xsl:with-param name="TargetNode" select="$Form926Data/TransferorsBeforeTransferIntRt"/>
						</xsl:call-template>
				  </span>
				  <span style="width:5mm;"/>
<!--Q16b-->				  
			  <span> 
				<b>(b)</b> After 
			</span>
			<span style="width:1mm;"/>
				 <span style="width:25mm;border-bottom:solid 1px;">
					<xsl:call-template name="PopulatePercent">
					  <xsl:with-param name="TargetNode" select="$Form926Data/TransferorsAfterTransferIntRt"/>
					</xsl:call-template>
				  </span>
				</div>
			</div>
<!--Q17-->
		<div style="width:187mm; height: auto;">
			<div class="styLNLeftNumBox" style="width:8mm; height: 5mm;">
				17
			</div>
            <div class="styLNDesc" style="width: 66mm; height: 5mm;">
				Type of nonrecognition transaction (see instructions)
			</div>
			<span style="width:1mm;"/>
				<span><img src="{$ImagePath}/926_Bullet_Title.gif" alt="Arrow Bullet"/></span>
			<span style="width:1.5mm;"/>
            <!-- A straight Line -->
            <span style="width:75mm;border-bottom:solid 1px;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$Form926Data/NonrecognitionTransactionTxt"/>
              </xsl:call-template>
            </span>
		</div>
<!--Q18 Container-->
		<div style="width:187mm; height: auto; float: left;">
<!--Q18-->   
			<div class="styLNLeftNumBox" style="width:8mm; height: 4.5mm; float: left;">
				18
				</div>  
<!--Q18 Text-->   
			<div class="styLNDesc" style="width: 179mm; height: 4.5mm; float: left;">
				 Indicate whether any transfer reported in Part III on this schedule is subject to any of the following: 
				</div>
			</div>
<!--Q18a Container-->     
			<div style="width:187mm; height: auto; float:left;">
<!--Q18a-->   
				<div style="width:12mm; height: 4.5mm; float:left; padding-top:1mm;">
					<span style="padding-left: 8mm;"><b>a</b> </span> 
				</div>
<!--Q18a text-->   
			<div style="width:56mm; 4.5mm; float:left; padding-top:1mm;">
					Gain recognition under section 904(f)(3)
			</div>
<!--Q18a DotLine-->   
            <div class="styIRS926DotLn" style="width:77.5mm; height: 4.5mm; padding-top:1mm;">
              ...................
			</div>
<!--Q18a PushPin-->   		
            <div style="width: 13mm; height: 4.5mm; float: left; padding-top:1mm; float: none;">
				<xsl:call-template name="SetFormLinkInline">
					<xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f3Ind"/>
				</xsl:call-template>                      
			</div>
<!--Q18a YesCheckBox-->    
			<div style="width: 14mm; height: 4.5mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f3Ind"/>
                  </xsl:call-template>
 <!---->                     
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f3Ind"/>
                      <xsl:with-param name="BackupName">F926TransferGainUnderSect904f3Ind</xsl:with-param>
                    </xsl:call-template>
                  </input>            
                </span> 
<!--Q18a YesLabel-->              
              <span>
              <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f3Ind"/>
                      <xsl:with-param name="BackupName">F926TransferGainUnderSect904f3Ind</xsl:with-param>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
			   </span>
            </div>
<!--Q18a NoCheckBox-->          
			<div style="width: 12mm; height: 4.5mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f3Ind"/>
                  </xsl:call-template>
                <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f3Ind"/>
                      <xsl:with-param name="BackupName">F926TransferGainUnderSect904f3Ind</xsl:with-param>
                    </xsl:call-template>
                </input>          
                </span> 
<!--Q18a NoLabel-->          
				<span>  
                <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f3Ind"/>
                      <xsl:with-param name="BackupName">F926TransferGainUnderSect904f3Ind</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
                </span>
              </div>
        </div>
         
 
<!--Q18b Container-->
				<div style="width:187mm; height: auto; float:left;">
<!--Q18b-->  			
					 <div style="width:12mm; height: 4.5mm; float:left;padding-top:1mm;">
						 <span style="padding-left: 8mm;"><b>b</b> </span> 
					</div>
<!--Q18b Text-->  			
					<div style="width:56mm; 4.5mm; float:left;padding-top:1mm;">
					Gain recognition under section 904(f)(5)(F)
				</div>
<!--Q18b DotLine-->  		
				  <div class="styIRS926DotLn" style="width:77.5mm; height: 4.5mm; float: left; padding-top:1mm;">
              ...................
					</div>
<!--Q18b PushPin-->               
               <div style="width: 14mm; height: 4.5mm; float: left;padding-top:1mm;">
					  <xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f5FInd"/>
					  </xsl:call-template>                      
				 </div>
<!--Q18b YesCheckBox-->   
				<div class="styLNDesc" style="width:14.75mm; height: 4.5mm; ">
                <span>  
                  <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f5FInd"/>
                  </xsl:call-template>                     
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f5FInd"/>
                      <xsl:with-param name="BackupName">F926TransferGainUnderSect904f5FInd</xsl:with-param>
                    </xsl:call-template>
                  </input>              
                </span> 
<!--Q18b YesLabel--> 
              <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f5FInd"/>
                      <xsl:with-param name="BackupName">F926TransferGainUnderSect904f5FInd</xsl:with-param>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
            </div>
<!--Q18b NoCheckBox-->       
              <div class="styLNDesc" style="width:12mm; height: 4.5mm; ">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f5FInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f5FInd"/>
                      <xsl:with-param name="BackupName">F926TransferGainUnderSect904f5FInd</xsl:with-param>
                    </xsl:call-template>
                  </input>     
                </span> 
<!--Q18b NoLabel-->               
			 <span> 
				  <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferGainUnderSect904f5FInd"/>
                      <xsl:with-param name="BackupName">F926TransferGainUnderSect904f5FInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
             </span>
              </div>
            </div>
            
<!--Q18c Container-->
				<div style="width:187mm; height: auto; float:left;">
<!--Q18c-->  			
					 <div style="width:12mm; height: 4.5mm; float:left;padding-top:1mm;">
						 <span style="padding-left: 8mm;"><b>c</b> </span> 
					</div>
<!--Q18c Text-->  			
					<div style="width:56mm; 4.5mm; float:left;padding-top:1mm;">
					Recapture under section 1503(d)
				</div>
<!--Q18c DotLine-->  		
				  <div class="styIRS926DotLn" style="width:77.5mm; height: 4.5mm; float: left; padding-top:1mm;">
              ...................
					</div>
<!--Q18c PushPin-->               
               <div style="width: 14mm; height: 4.5mm; float: left; padding-top:1mm;">
					  <xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$Form926Data/TransferRcptrUndSect1503dInd"/>
					  </xsl:call-template>                      
				 </div>
<!--Q18c YesCheckBox-->   
				<div class="styLNDesc" style="width:14.75mm; height: 4.5mm; ">
                <span>  
                  <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form926Data/TransferRcptrUndSect1503dInd"/>
                  </xsl:call-template>                     
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferRcptrUndSect1503dInd"/>
                      <xsl:with-param name="BackupName">F926TransferRcptrUndSect1503dInd</xsl:with-param>
                    </xsl:call-template>
                  </input>              
                </span> 
<!--Q18c YesLabel--> 
              <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferRcptrUndSect1503dInd"/>
                      <xsl:with-param name="BackupName">F926TransferRcptrUndSect1503dInd</xsl:with-param>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
            </div>
<!--Q18c NoCheckBox-->       
              <div class="styLNDesc" style="width:12mm; height: 4.5mm; ">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferRcptrUndSect1503dInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TransferRcptrUndSect1503dInd"/>
                      <xsl:with-param name="BackupName">F926TransferRcptrUndSect1503dInd</xsl:with-param>
                    </xsl:call-template>
                  </input>     
                </span> 
<!--Q18c NoLabel-->               
			 <span> 
				  <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TransferRcptrUndSect1503dInd"/>
                      <xsl:with-param name="BackupName">F926TransferRcptrUndSect1503dInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
             </span>
              </div>
            </div>
          
<!--Q18d Container-->
				<div style="width:187mm; height: auto; float:left;">
<!--Q18d-->  			
					 <div style="width:12mm; height: 6mm; float:left;padding-top:1mm;">
						 <span style="padding-left: 8mm;"><b>d</b> </span> 
					</div>
<!--Q18d Text-->  			
					<div style="width:56mm; 6mm; float:left;padding-top:1mm;">
					Exchange gain under section 987 
				</div>
<!--Q18d DotLine-->  		
				  <div class="styIRS926DotLn" style="width:77.5mm; height: 6mm; float: left;padding-top:1mm;">
              ...................
					</div>
<!--Q18d PushPin-->               
               <div style="width: 14mm; height: 6mm; float: left; padding-top:1mm;">
					  <xsl:call-template name="SetFormLinkInline">
							<xsl:with-param name="TargetNode" select="$Form926Data/TrnsfrExchGainUndSect987Ind"/>
					  </xsl:call-template>                      
				 </div>
<!--Q18d YesCheckBox-->   
				<div class="styLNDesc" style="width:14.75mm; height: 6mm; ">
                <span>  
                  <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form926Data/TrnsfrExchGainUndSect987Ind"/>
                  </xsl:call-template>                     
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TrnsfrExchGainUndSect987Ind"/>
                      <xsl:with-param name="BackupName">F926TrnsfrExchGainUndSect987Ind</xsl:with-param>
                    </xsl:call-template>
                  </input>              
                </span> 
<!--Q18d YesLabel--> 
              <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TrnsfrExchGainUndSect987Ind"/>
                      <xsl:with-param name="BackupName">F926TrnsfrExchGainUndSect987Ind</xsl:with-param>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
            </div>
<!--Q18d NoCheckBox-->       
              <div class="styLNDesc" style="width:12mm; height: 6mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TrnsfrExchGainUndSect987Ind"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/TrnsfrExchGainUndSect987Ind"/>
                      <xsl:with-param name="BackupName">F926TrnsfrExchGainUndSect987Ind</xsl:with-param>
                    </xsl:call-template>
                  </input>     
                </span> 
<!--Q18d NoLabel-->               
			 <span> 
				  <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/TrnsfrExchGainUndSect987Ind"/>
                      <xsl:with-param name="BackupName">F926TrnsfrExchGainUndSect987Ind</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
             </span>
              </div>
            </div>
            
            
            
<!--Q19 Container-->
				<div style="width:187mm; height: auto; float:left; padding-top:1mm;">
<!--Q19-->  			
					 <div style="width:7.5mm; height: 6mm; float:left; padding-top:1mm;">
						 <span style="padding-left:1.25mm;"><b>19</b> </span> 
					</div>
<!--Q19 Text-->  			
					<div style="width:80mm; height: 6mm; float:left; padding-top:1mm;">
					Did this transfer result from a change in entity classification?
				</div>
<!--Q19 DotLine-->  		
				  <div class="styIRS926DotLn" style="width:72mm; height: 6mm; float: left; padding-top:1mm;">
              .................
					</div>
<!--Q19 YesCheckBox-->   
				<div class="styLNDesc" style="width:15mm; height: 6mm; ">
                <span>  
                  <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form926Data/ResultedInChangeClsfInd"/>
                  </xsl:call-template>                     
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/ResultedInChangeClsfInd"/>
                      <xsl:with-param name="BackupName">F926ResultedInChangeClsfInd</xsl:with-param>
                    </xsl:call-template>
                  </input>              
                </span> 
<!--Q19 YesLabel--> 
			  <span>
              <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ResultedInChangeClsfInd"/>
                      <xsl:with-param name="BackupName">F926ResultedInChangeClsfInd</xsl:with-param>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
			  </span>
            </div>  
<!--Q19 NoCheckBox-->       
              <div class="styLNDesc" style="width:12mm; height: 6mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ResultedInChangeClsfInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/ResultedInChangeClsfInd"/>
                      <xsl:with-param name="BackupName">F926ResultedInChangeClsfInd</xsl:with-param>
                    </xsl:call-template>
                  </input>     
                </span> 
<!--Q19 NoLabel-->               
			 <span> 
				  <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/ResultedInChangeClsfInd"/>
                      <xsl:with-param name="BackupName">F926ResultedInChangeClsfInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
             </span>
              </div>
            </div> 
            
 
<!--Q20a Container-->
				<div style="width:187mm; height: auto; float:left; padding-top:1mm;">
<!--Q20a -->  			
					 <div style="width:7.5mm; height: 8mm; float:left; padding-left:1mm; padding-top:1mm;">
						 <span><b>20a</b> </span> 
					</div>
<!--Q20a Text-->  			
					<div style="width:134.5mm; height: 8mm; float:left;padding-top:1mm;">
						Did a domestic corporation make a distribution of property covered by section 367(e)(2) (see instructions)?<br/>
						If "Yes", complete line 20b and 20c. 
					</div>
<!--Q20a DotLine-->  		
				  <div class="styIRS926DotLn" style="width:17.5mm; height: 8mm; float: left;padding-top:1mm;">
              ....
					</div>
<!--Q20a YesCheckBox-->   
				<div class="styLNDesc" style="width:15mm; height: 8mm;">
                <span>  
                  <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form926Data/CoverPropertyDistributionInd"/>
                  </xsl:call-template>                     
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/CoverPropertyDistributionInd"/>
                      <xsl:with-param name="BackupName">F926CoverPropertyDistributionInd</xsl:with-param>
                    </xsl:call-template>
                  </input>              
                </span> 
<!--Q20a YesLabel--> 
			  <span>
              <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/CoverPropertyDistributionInd"/>
                      <xsl:with-param name="BackupName">F926CoverPropertyDistributionInd</xsl:with-param>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
			  </span>
            </div>  
<!--Q20a NoCheckBox-->       
              <div class="styLNDesc" style="width:12mm; height: 8mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/CoverPropertyDistributionInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/CoverPropertyDistributionInd"/>
                      <xsl:with-param name="BackupName">F926CoverPropertyDistributionInd</xsl:with-param>
                    </xsl:call-template>
                  </input>     
                </span> 
<!--Q20a NoLabel-->               
			 <span> 
				  <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/CoverPropertyDistributionInd"/>
                      <xsl:with-param name="BackupName">F926CoverPropertyDistributionInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
             </span>
              </div>
            </div> 
            


<!--Q20b Container-->
				<div style="width:187mm; height: auto; float:left;">
<!--Q20b -->  			
					 <div style="width:7.5mm; height: 4.5mm; float:left;">
						 <span style="padding-left: 4mm;"><b>b</b> </span> 
					</div>
<!--Q20b Text-->  			
					<div style="width:119mm; height: 4.5mm; float:left;">
						Enter the total amount of gain or loss reconized persuant to Regulations section 1.367(c)-2(b) 
					</div>
<!--Q20b DotLine-->  		
				  <div style="width:5mm; height: 4.5mm; float:left;">
					<img src="{$ImagePath}/926_Bullet_Title.gif" alt="Arrow Bullet"/>
					
						<span style="width:1mm;">$</span></div>
<!-- A straight Line -->
				<div style="width:34mm;border-bottom:solid 1px;">
				  <xsl:call-template name="PopulateAmount">
					<xsl:with-param name="TargetNode" select="$Form926Data/RecognizeTotalGainLossAmt"/>
				  </xsl:call-template>
				</div>
		 </div>
  

                     
 <!--Q20c Container-->
				<div style="width:187mm; height: auto; float:left;">
<!--Q20c -->  			
					 <div style="width:7.5mm; height: 9mm; float:left;">
						 <span style="padding-left:4mm;"><b>c</b> </span> 
					</div>
<!--Q20c Text-->  			
					<div style="width:152mm; height: 9mm; float:left;">
						Did the domestic corporation not recongize gain or loss on the distribution of property because the property was used<br/>
						in the conduct of U.S. trade or business under Regulations section 1.367(ee)-2(b)(2)?
						<div class="styIRS926DotLn" style="width: 7.5mm; height: 4mm; padding-top: 1mm; float: none;">
						  ...........
						</div>
					</div>
<!--Q20c DotLine-->  		
				  
<!--Q20c YesCheckBox-->   
				<div class="styLNDesc" style="width:15mm; height: 9mm; padding-top:3mm;">
                <span>  
                  <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form926Data/PropDistriGainLossNotRcgnzInd"/>
                  </xsl:call-template>                     
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/PropDistriGainLossNotRcgnzInd"/>
                      <xsl:with-param name="BackupName">F926PropDistriGainLossNotRcgnzInd</xsl:with-param>
                    </xsl:call-template>
                  </input>              
                </span> 
<!--Q20c YesLabel--> 
			  <span>
              <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PropDistriGainLossNotRcgnzInd"/>
                      <xsl:with-param name="BackupName">F926PropDistriGainLossNotRcgnzInd</xsl:with-param>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
			  </span>
            </div>  
<!--Q20c NoCheckBox-->       
              <div class="styLNDesc" style="width:12mm; height: 9mm; padding-top:3mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PropDistriGainLossNotRcgnzInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/PropDistriGainLossNotRcgnzInd"/>
                      <xsl:with-param name="BackupName">F926PropDistriGainLossNotRcgnzInd</xsl:with-param>
                    </xsl:call-template>
                  </input>     
                </span> 
<!--Q20c NoLabel-->               
			 <span> 
				  <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/PropDistriGainLossNotRcgnzInd"/>
                      <xsl:with-param name="BackupName">F926PropDistriGainLossNotRcgnzInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
             </span>
              </div>
            </div> 
            
<!--Q21 Container-->
				<div style="width:187mm; height: auto; float:left; border-bottom-width: 1mm;">
<!--Q21-->  			
					 <div style="width:7.5mm; height: 9mm; float:left; padding-top:1mm;">
						 <span style="padding-left:1.25mm;"><b>21</b> </span> 
					</div>
<!--Q21 Text-->  			
				<div style="width:152mm; height: 9mm; float:left; padding-top:1mm;">
					Did a domestic corporation make a section 355 distribution of stock in a foreign controlled corporation covered <br/>by 
					section 367(e)(1) (see instructions)?  
<!--Q21 DotLine-->  
				<div class="styIRS926DotLn" style="height: 4mm; padding-top: 1mm; float: none;">
              ........................
					</div>
				</div>		 
<!--Q21 YesCheckBox-->   
				<div class="styLNDesc" style="width:15mm; height: 6mm;padding-top: 4mm; ">
                <span>  
                  <xsl:call-template name="PopulateSpan">
					<xsl:with-param name="TargetNode" select="$Form926Data/Section355StockDistributionInd"/>
                  </xsl:call-template>                     
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/Section355StockDistributionInd"/>
                      <xsl:with-param name="BackupName">F926Section355StockDistributionInd</xsl:with-param>
                    </xsl:call-template>
                  </input>              
                </span> 
<!--Q21 YesLabel--> 
			  <span>
              <label>
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Form926Data/Section355StockDistributionInd"/>
                      <xsl:with-param name="BackupName">F926Section355StockDistributionInd</xsl:with-param>
                  </xsl:call-template>
                  <b>Yes</b>
                </label>
			  </span>
            </div>  
<!--Q21 NoCheckBox-->       
              <div class="styLNDesc" style="width:12mm; height: 6mm; padding-top: 4mm;">
                <span>
                  <xsl:call-template name="PopulateSpan">
                    <xsl:with-param name="TargetNode" select="$Form926Data/Section355StockDistributionInd"/>
                  </xsl:call-template>
                  <input type="Checkbox" class="styCkbox">
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Form926Data/Section355StockDistributionInd"/>
                      <xsl:with-param name="BackupName">F926Section355StockDistributionInd</xsl:with-param>
                    </xsl:call-template>
                  </input>     
                </span> 
<!--Q21 NoLabel-->               
			 <span> 
				  <label>
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Form926Data/Section355StockDistributionInd"/>
                      <xsl:with-param name="BackupName">F926Section355StockDistributionInd</xsl:with-param>
                  </xsl:call-template>
                  <b>No</b>
                </label>
             </span>
              </div>
            </div>     
          </div>
          <!-- END Part IV Line Items -->
          <!-- Begin Footer -->
          <div style="width:187mm;height: auto; padding-top:1mm; border-top-style: solid; border-top-width: 1px;">
            <div style="float:right;">
              <span style="width:1px;"/>
            Form <span class="styBoldText">926 </span> (Rev. 9-2018)
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
								Property described in sec. 367(d)(4)
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
