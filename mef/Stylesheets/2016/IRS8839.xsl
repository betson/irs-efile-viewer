<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8839Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <xsl:param name="Form8839Data" select="$RtnDoc/IRS8839"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="EN-US">
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form8839Data)"/>
          </xsl:call-template>
        </title>
        <!--  No Browser Caching  -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set  -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="IRS Form 8839"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
        <xsl:if test="not($Print) or $Print=''"> 
            <xsl:call-template name="IRS8839Style"/>
            <xsl:call-template name="AddOnStyle"/>
         </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="IRS8839">
          <!--  Begin Header section 1 -->
          <xsl:call-template name="DocumentHeader"/>
          <div class="styBB" style="width:187mm;border-bottom-width:2px;">
            <div class="styFNBox" style="width:31mm;height:22mm;border-right-width:2px;padding-top:.5mm;">
              <div style="padding-top:1mm;">
                Form<span class="styFormNumber">  8839</span>
              </div>
              <!--General Dependency Push Pin-->
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form8839Data"/>
              </xsl:call-template>
              <br/><br/><br/>
              <span class="styAgency">Department of the Treasury</span>
              <br/>
              <span class="styAgency">Internal Revenue Service (99)</span>
            </div>
            <div class="styFTBox" style="width:125mm;">
              <!--  Main Title >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
              <div class="styMainTitle" style="height:8mm;">
                Qualified Adoption Expenses
              </div>
              <div class="styFST" style="height:5mm;font-size:7pt;margin-left:2mm;text-align:center;">
                <span style="text-align:center;font-weight:bold;">
                  <div style="width:100%;height:5mm;padding-left:0px;">
                    <div style="width:110mm;height:5mm;padding-top:1mm;">
                      <br/>  
                      <img src="{$ImagePath}/8839_Bullet_Sm.gif" alt="SmallBullet"/> 
                      Attach to Form 1040 or 1040NR.
                      <br/>
                      <img src="{$ImagePath}/8839_Bullet_Sm.gif" alt="SmallBullet"/> 
                      For information about Form 8839 and its separate instructions, see <a href="http://www.irs.gov/form8839"  title="Link to IRS.gov"> <i>www.irs.gov/form8839</i></a>
                    </div>
                  </div>
                </span>
              </div>
            </div>
            <div class="styTYBox" style="height:22mm;width:30mm;border-left-width:2px;">
              <div class="styOMB" style="height:4mm;font-size:7pt;">OMB No. 1545-0074</div>
              <div class="styTY">20<span class="styTYColor">16</span>
              </div>
              <div style="margin-left:3mm;text-align:left;font-size:7pt;">
                Attachment<br/>Sequence No. 
                <span class="styBoldText" style="font-size:9pt;">38</span>
              </div>
            </div>
          </div>
          <!--  End Header section 1 -->
          <!-- Begin Names and Identifying number section -->
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="width:137mm;height:8mm;font-weight:normal;font-size:7pt;">
              Name(s) shown on return<br/><span style="padding-top:2mm;">
              <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">Name</xsl:with-param>
              </xsl:call-template></span>
            </div>
            <div style="height:8mm;width:50mm;height:4mm;padding:0px 0px 0px 2mm;font-size:7pt;" class="styEINBox">
              Your social security number
              <br/>
              <span style="font-weight:normal;text-align:center;width:100%;padding-top:2mm;">
                <xsl:call-template name="PopulateSSN">
                  <xsl:with-param name="TargetNode" select="$RtnHdrData/Filer/PrimarySSN"/>
                  <xsl:with-param name="BackupName">RtnHdrDataFilerPrimarySSN</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- End Names and Identifying number section -->
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin Part I                                                  -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Header -->
          <div style="width:187mm;" class="styBB">
            <!-- Content -->
            <div class="styPartName" style="width:15mm;">Part I</div>
            <div class="styPartDesc" style="padding-left:3mm;height:8mm;float:left;">
           <span class="styNormalText" > <b>Information About Your Eligible Child or Children</b><b><img src="{$ImagePath}/1040SchA_JobExp_Longdash.gif" alt="Long Dash"/></b> You <b>must</b> complete this part. See instructions for<br />
              details, including what to do if you need more space.</span>
              <span class="styGenericDiv" style="width:3.2mm;float:right;padding-top:3.2mm;">
                  <!-- button display logic -->
                  <xsl:call-template name="SetDynamicTableToggleButton">
                    <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild"/>
                    <xsl:with-param name="containerHeight" select="3"/>
                    <xsl:with-param name="containerID" select=" 'AdoptedChildDiv' "/>
                    <xsl:with-param name="headerRowCount" select="3"/>
                  </xsl:call-template>
                  <!-- end button display logic -->
                </span>
            </div>
          </div>
          <!-- Body -->
          <div class="styBB" style="width:187mm;height:25mm;border-bottom-width:0px;">
            <div >
              <div class="styTableContainer" id="AdoptedChildDiv">
                <xsl:call-template name="SetInitialState"/>
                <table class="styTable" cellspacing="0">
                  <thead class="styTableThead">
                    <xsl:call-template name="CreateTableHeaders"/>
                  </thead>
                  <tfoot/>
                  <tbody>
                    <xsl:for-each select="$Form8839Data/AdoptedChild">
                      <!--JMI: If the print parameter is not set to be Separated, or there are less elements than the-->
                      <!--container height (4), execute-->
                      <xsl:if test="($Print != $Separated) or (count($Form8839Data/AdoptedChild) &lt;=3)">
                        <xsl:call-template name="CreateTableRows"/>
                      </xsl:if>
                    </xsl:for-each>
                    <!-- Table Filler Rows -->
                    <!-- JMI: added: or.... -->
                    <xsl:if test="count($Form8839Data/AdoptedChild) &lt; 1 or ((count($Form8839Data/AdoptedChild) &gt;3) and ($Print = $Separated))">
                      <xsl:call-template name="CreateEmptyTableRows">
                        <xsl:with-param name="Number">1</xsl:with-param>
                        <xsl:with-param name="InsertAdditionalDataMessage">true</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <!-- JMI: added: or.... -->
                    <xsl:if test="count($Form8839Data/AdoptedChild) &lt; 2 or ((count($Form8839Data/AdoptedChild) &gt;3) and ($Print = $Separated))">
                      <xsl:call-template name="CreateEmptyTableRows">
                        <xsl:with-param name="Number">2</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <!-- JMI: added: or.... -->
                    <xsl:if test="count($Form8839Data/AdoptedChild) &lt; 3 or ((count($Form8839Data/AdoptedChild) &gt;3) and ($Print = $Separated))">
                      <xsl:call-template name="CreateEmptyTableRows">
                        <xsl:with-param name="Number">3</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                  </tbody>
                </table>
              </div>
              <!-- Set Initial Height of Above Table -->
              <xsl:call-template name="SetInitialDynamicTableHeight">
                <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild"/>
                <xsl:with-param name="containerHeight" select="3"/>
                <xsl:with-param name="headerRowCount" select="3"/>
                <xsl:with-param name="containerID" select=" 'AdoptedChildDiv' "/>
              </xsl:call-template>
              <!-- End Set Initial Height of Above Table -->
            </div>         
            <span style="width:180mm;height:7mm;padding-bottom:2mm;padding-top:0mm;">
               <b>Caution.</b> If the child was a foreign child, see <b>Special rules</b> in the instructions for line 1, column (e) before you complete Part II or
               Part III. If you received <b>employer-provided adoption benefits</b>, complete Part III on the back next.                  
            </span>
              
          <!-- >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> -->
          <!-- Begin Part II                                                   -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Header -->
          <div style="width:187mm;border-top-width:1px;" class="styBB"  >
            <!-- Content -->
            <div class="styPartName" style="width:15mm;height:4mm;">Part II</div>
            <div class="styPartDesc" style="padding-left:3mm;">Adoption Credit</div>
          </div>
          <!-- Body -->
          <xsl:variable name="AdoptedChildData" select="$Form8839Data/*[starts-with(name(), 'AdoptedChild')]"/>
          <div class="styTBB" style="width:187mm;">
            <!-- Table starts here -->
            <xsl:for-each select="$AdoptedChildData[position() mod 3 = 1]">
              <xsl:variable name="Counter">
                <xsl:number value="position()" format="1"/>
              </xsl:variable>
              <xsl:call-template name="PopulatePartIITable">
                <xsl:with-param name="Child1Number">
                  <xsl:value-of select="(number($Counter)-1)*3 + 1"/>
                </xsl:with-param>
                <xsl:with-param name="Child1" select="."/>
                <xsl:with-param name="Child2Number">
                  <xsl:value-of select="(number($Counter)-1)*3 + 2"/>
                </xsl:with-param>
                <xsl:with-param name="Child2" select="following-sibling::*[1]"/>
                <xsl:with-param name="Child3Number">
                  <xsl:value-of select="(number($Counter)-1)*3 + 3"/>
                </xsl:with-param>
                <xsl:with-param name="Child3" select="following-sibling::*[2]"/>
              </xsl:call-template>
            </xsl:for-each>
      <!-- 3/15/2016 will create empty table below-->
           <xsl:if  test="count($AdoptedChildData)=0">
              <xsl:variable name="Counter">
                <xsl:number value="position()" format="1"/>
              </xsl:variable>
              <xsl:call-template name="PopulatePartIITable">
                <xsl:with-param name="Child1Number">
                  <xsl:value-of select="(number($Counter)-1)*3 + 1"/>
                </xsl:with-param>
                <xsl:with-param name="Child1" select="."/>
                <xsl:with-param name="Child2Number">
                  <xsl:value-of select="(number($Counter)-1)*3 + 2"/>
                </xsl:with-param>
                <xsl:with-param name="Child2" select="following-sibling::*[1]"/>
                <xsl:with-param name="Child3Number">
                  <xsl:value-of select="(number($Counter)-1)*3 + 3"/>
                </xsl:with-param>
                <xsl:with-param name="Child3" select="following-sibling::*[2]"/>
              </xsl:call-template>
            </xsl:if>
            <!-- (7) ////////////////////////////////////////////////////-->
            <div class="styIRS8839LineItem" style="height:4mm;">
              <div class="styIRS8839LNLeftNumBox">7</div>
              <div class="styIRS8839LNDesc" style="width:106mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8839LNDesc" style="width:auto;height:100%;float:left;">
                  Enter modified adjusted gross income (see instructions)
                </div>
                <div class="styIRS8839LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 4px 0px 0px;">
					<!--Dotted Line-->
					<span class="styDotLn" style="padding-right:1mm;">......</span>	
                </div>
              </div>
              <div class="styIRS8839LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS8839LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8839LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;border-color:black;border-bottom-width:1px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptionCreditModifiedAGIAmt"/>
                    <xsl:with-param name="Number">7</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (8) ////////////////////////////////////////////////////-->
            <div class="styIRS8839LineItem" style="height:13mm;">
              <div class="styIRS8839LNLeftNumBox">8</div>
              <div class="styIRS8839LNDesc" style="width:105mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8839LNDesc" style="width:auto;height:100%;">
                  Is line 7 more than $201,920?<br/>
                  <!-- ++++++++++++++ No Checkbox +++++++++++++ -->
                  <span>
                    <xsl:call-template name="PopulateSpan">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptionCrModifAGIGrtrAmtInd"/>
                    </xsl:call-template>
                    <input type="checkbox" class="styCkbox" alt="Checkbox for AdoptionCrModifAGIGrtrAmtInd">
                      <xsl:if test="$Form8839Data/AdoptionCrModifAGIGrtrAmtInd">
                        <xsl:call-template name="PopulateNoCheckbox">
                          <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptionCrModifAGIGrtrAmtInd"/>
                          <xsl:with-param name="BackupName">IRS8839ChildAdoptionCrModifAGIGrtrAmtInd</xsl:with-param>
                        </xsl:call-template>
                      </xsl:if>
                    </input>
                  </span>
                  <span style="width:2mm;"/>
                  <label>
                    <xsl:if test="$Form8839Data/AdoptionCrModifAGIGrtrAmtInd">
                      <xsl:call-template name="PopulateLabelNo">
                        <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptionCrModifAGIGrtrAmtInd"/>
                        <xsl:with-param name="BackupName">IRS8839ChildAdoptionCrModifAGIGrtrAmtInd</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <span class="styBoldText">No.</span>
                    <span style="width:5px;"/>Skip lines 8 and 9, and    <span style="width:3px;"/>enter -0- on line 10.<br/>
                  </label>
                  <!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
                  <span>
                    <xsl:call-template name="PopulateSpan">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptionCrModifAGIGrtrAmtInd"/>
                    </xsl:call-template>
                    <input type="checkbox" class="styCkbox" alt="Checkbox for AdoptionCrModifAGIGrtrAmtInd">
                    <xsl:if test="$Form8839Data/AdoptionCrModifAGIGrtrAmtInd">
                        <xsl:call-template name="PopulateYesCheckbox">
                          <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptionCrModifAGIGrtrAmtInd"/>
                          <xsl:with-param name="BackupName">IRS8839ChildAdoptionCrModifAGIGrtrAmtInd</xsl:with-param>
                        </xsl:call-template>
                      </xsl:if>
                    </input>
                   <!-- </input>-->
                  </span>
                  <span style="width:2mm;"/>
                  <label>
                    <xsl:if test="$Form8839Data/AdoptionCrModifAGIGrtrAmtInd">
                      <xsl:call-template name="PopulateLabelYes">
                        <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptionCrModifAGIGrtrAmtInd"/>
                        <xsl:with-param name="BackupName">IRS8839ChildAdoptionCrModifAGIGrtrAmtInd</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <span class="styBoldText">Yes.</span>
                    <span style="width:5px;"/>Subtract $201,920 from line 7
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>	
                  </label>
                </div>
              </div>
              <div class="styIRS8839LNDesc" style="height:100%;width:75mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS8839LNDesc" style="height:6mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8839LNDesc" style="height:6mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8839LNDesc" style="height:7mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8839LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptionCreditModifAGILimitAmt"/>
                    <xsl:with-param name="Number">8</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (9) ////////////////////////////////////////////////////-->
            <div class="styIRS8839LineItem" style="height:6.5mm;">
              <div class="styIRS8839LNLeftNumBox">9</div>
              <div class="styIRS8839LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8839LNDesc" style="width:auto;height:100%;">
                  Divide line 8 by $40,000. Enter the result as a decimal (rounded to at least three places).<br/> Do not enter more than 1.000
                  <!--Dotted Line-->
                  <span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>	
                </div>
              </div>
              <div class="styIRS8839LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS8839LNDesc" style="height:1.5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
		     <div class="styIRS8839LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
			 <xsl:choose>
				<xsl:when test="$Form8839Data/AdoptionCreditAdjModifAGIPct">
					  <xsl:call-template name="CreateBox">
						<xsl:with-param name="TargetNode" select="$Form8839Data/AdoptionCreditAdjModifAGIPct"/>
						<xsl:with-param name="Number">9</xsl:with-param>
						<xsl:with-param name="InsertTextBefore">X</xsl:with-param>
						<xsl:with-param name="PopulateAsText">X</xsl:with-param>
						<xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;font-size:7pt;</xsl:with-param>
						<xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;padding:7px 0px 0px 0px;</xsl:with-param>				
					  </xsl:call-template>
				 </xsl:when>
				 <xsl:otherwise>
					    <xsl:call-template name="CreateBox">
						<xsl:with-param name="Number">9</xsl:with-param>
						<xsl:with-param name="StaticText">X     .</xsl:with-param>
						<xsl:with-param name="AmountBoxStyle">border-bottom-width:1px;text-align:center;font-size:8pt;</xsl:with-param>
						<xsl:with-param name="NumberBoxStyle">border-bottom-width:1px;padding:7px 0px 0px 0px;</xsl:with-param>				
					    </xsl:call-template>
                 </xsl:otherwise>
             </xsl:choose>                
		     </div>
              </div>
            </div>          
            <xsl:for-each select="$Form8839Data/AdoptedChild">
              <xsl:if test="position() mod 3 = 1">
                <xsl:variable name="pos" select="position()"/>
                <div style="width:187mm;">
                  <div class="styLNLeftNumBox" style="height:4mm;"></div>
                  <div class="styGenericDiv" style="width:46.95mm;height:4.5mm;">
                  </div>
                  <div class="styGenericDiv" style="width:8mm;height:4.5mm;border:black 0 solid;border-bottom-width:1px;"></div>
                  <xsl:if test="$pos = 1">
                    <div class="styGenericDiv" style="border:1px black solid;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos"/>
                    </div>
                    <div class="styGenericDiv" style="border:1px black solid;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos + 1"/>
                    </div>
                    <div class="styGenericDiv" style="border:1px black solid;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos + 2"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="$pos != 1">
                    <div class="styGenericDiv" style="border:1px black solid;border-top-width:0px;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos"/>
                    </div>
                    <div class="styGenericDiv" style="border:1px black solid;border-top-width:0px;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos + 1"/>
                    </div>
                    <div class="styGenericDiv" style="border:1px black solid;border-top-width:0px;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos + 2"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="position() = 1">
					  <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;width:8.05mm;border-top-width:1px;"></div>
					  <div class="styLNAmountBoxNBB" style="width:29mm;height:4.5mm;border-top-width:1px;"></div>
                  </xsl:if>
                  <xsl:if test="position() > 1">
					  <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;width:8.05mm;"></div>
					  <div class="styLNAmountBoxNBB" style="width:29mm;height:4.5mm;"></div>
                  </xsl:if>
               </div>
                <!-- (10) ////////////////////////////////////////////////////-->
                <div style="width:187mm;height:7mm;">
                  <div class="styLNLeftNumBox" style="height:7mm;">10</div>
                  <div class="styGenericDiv" style="width:46.95mm;">
                   Multiply each amount on line 6
                   <span style="float:left;"> by line 9 </span>
                  <!--Dotted Line-->
                  <span class="styDotLn" style="float:right;padding-right:1mm;">........</span>	
                  </div>
                  <div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;border-bottom-width:2px;">10</div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos]/CalculatedAdoptionCreditAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos + 1]/CalculatedAdoptionCreditAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos + 2]/CalculatedAdoptionCreditAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;width:8.05mm;"></div>
                  <div class="styLNAmountBoxNBB" style="width:29mm;height:7mm;"></div>
               </div>
                <!-- (11) ////////////////////////////////////////////////////-->
                <div style="width:187mm;height:7mm;">
                  <div class="styLNLeftNumBox" style="height:7mm;padding-top:3.5mm;">11</div>
                  <div class="styGenericDiv" style="width:46.95mm;padding-top:3.5mm;">
                    <span style="float:left;">Subtract line 10 from line 6</span> 
                    <span class="styDotLn" style="float:right;">.</span>	
                  </div>
                  <div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;border-bottom-width:2px;">11</div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos]/NetCalculatedAdoptionCreditAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos + 1]/NetCalculatedAdoptionCreditAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos + 2]/NetCalculatedAdoptionCreditAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;width:8.05mm;"></div>
                  <div class="styLNAmountBoxNBB" style="width:29mm;height:7mm;"></div>
               </div>
              </xsl:if>
            </xsl:for-each>   
            <xsl:if test="count($Form8839Data/AdoptedChild)=0">
              <xsl:if test="position() mod 3 = 1">
                <xsl:variable name="pos" select="position()"/>
 <!--               <div style="width:187mm;">
                  <div class="styLNLeftNumBox" style="height:4.5mm;"></div>
                  <div class="styGenericDiv" style="width:46.95mm;height:4.5mm;">
                  </div>
                  <div class="styGenericDiv" style="width:8mm;height:4.5mm;border:black 0 solid;border-bottom-width:1px;"></div>
                  <xsl:if test="$pos = 1">
                    <div class="styGenericDiv" style="border:1px black solid;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos"/>
                    </div>
                    <div class="styGenericDiv" style="border:1px black solid;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos + 1"/>
                    </div>
                    <div class="styGenericDiv" style="border:1px black solid;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos + 2"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="$pos != 1">
                    <div class="styGenericDiv" style="border:1px black solid;border-top-width:0px;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos"/>
                    </div>
                    <div class="styGenericDiv" style="border:1px black solid;border-top-width:0px;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos + 1"/>
                    </div>
                    <div class="styGenericDiv" style="border:1px black solid;border-top-width:0px;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos + 2"/>
                    </div>
                  </xsl:if>
                  <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;width:8.05mm;border-top-width:1px;"></div>
                  <div class="styLNAmountBoxNBB" style="width:29mm;height:4.5mm;"></div>
               </div>-->
                <!-- (10) ////////////////////////////////////////////////////-->
                <div style="width:187mm;height:7mm;">
                  <div class="styLNLeftNumBox" style="height:7mm;">10</div>
                  <div class="styGenericDiv" style="width:46.95mm;">
                    Multiply each amount on line 6
                    <span style="float:left;">by line 9 </span>
                    <!--Dotted Line-->
                    <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>	
                  </div>
                  <div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;border-top-width:1px;">10</div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-top-width:1px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos]/CalculatedAdoptionCreditAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-top-width:1px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos + 1]/CalculatedAdoptionCreditAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-top-width:1px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos + 2]/CalculatedAdoptionCreditAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNRightNumBoxNBB" style="height:6.9mm;background-color:lightgrey;width:8.05mm;"></div>
                  <div class="styLNAmountBoxNBB" style="width:29mm;height:7mm;"></div>
               </div>
                <!-- (11) ////////////////////////////////////////////////////-->
                <div style="width:187mm;height:7mm;">
                  <div class="styLNLeftNumBox" style="height:7mm;padding-top:3.5mm;">11</div>
                  <div class="styGenericDiv" style="width:46.95mm;padding-top:3.5mm;">
                    Subtract line 10 from line 6 
                    <span class="styBoldText">
                      <span style="width:11px"/>.
                    </span>
                  </div>
                  <div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;border-bottom-width:2px;">11</div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos]/NetCalculatedAdoptionCreditAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos + 1]/NetCalculatedAdoptionCreditAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos + 2]/NetCalculatedAdoptionCreditAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;width:8.05mm;"></div>
                  <div class="styLNAmountBoxNBB" style="width:29mm;height:7mm;"></div>
               </div>
              </xsl:if>
            </xsl:if>       
            <!-- (12) ////////////////////////////////////////////////////-->
            <div class="styIRS8839LineItem" style="height:4mm;">
              <div class="styIRS8839LNLeftNumBox">12</div>
              <div class="styIRS8839LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8839LNDesc" style="width:auto;height:100%;">
                  Add the amounts on line 11
                  <!--Dotted Line-->
                  <span class="styDotLn" style="float:right;padding-right:1mm;">.......................</span>	
                </div>
              </div>
              <div class="styIRS8839LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">             
                <div class="styIRS8839LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form8839Data/NetAdoptionCreditExclCfwdAmt"/>
                    <xsl:with-param name="Number">12</xsl:with-param>                   
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (13) ////////////////////////////////////////////////////-->
            <div class="styIRS8839LineItem" style="height:7mm;">
              <div class="styIRS8839LNLeftNumBox">13</div>
              <div class="styIRS8839LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8839LNDesc" style="width:auto;height:100%;">
                  Credit carryforward, if any, from prior years. See your Adoption Credit Carryforward Worksheet in the<br/>2015 Form 8839 instructions
                  <!--Dotted Line-->
                  <span class="styDotLn" style="float:right;padding-right:1mm;">..........................</span>	
                </div>
              </div>
              <div class="styIRS8839LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS8839LNDesc" style="height:2mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8839LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;border-color:black;border-bottom-width:1px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptionCreditCfwdAmt"/>
                    <xsl:with-param name="Number">13</xsl:with-param>                   
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (14) ////////////////////////////////////////////////////-->
            <div class="styIRS8839LineItem" style="height:4mm;">
              <div class="styIRS8839LNLeftNumBox">14</div>
              <div class="styIRS8839LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8839LNDesc" style="width:auto;height:100%;">
                  Add lines 12 and 13 
                  <!--Dotted Line-->
                  <span class="styDotLn" style="float:right;padding-right:1mm;">............................</span>	     
                </div>
              </div>
              <div class="styIRS8839LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">                
                <div class="styIRS8839LNDesc" style="height:auto;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form8839Data/NetAdoptionCreditCfwdAmt"/>
                    <xsl:with-param name="Number">14</xsl:with-param>                   
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (15) ////////////////////////////////////////////////////-->
            <div class="styIRS8839LineItem" style="height:4mm;">
              <div class="styIRS8839LNLeftNumBox">15</div>
              <div class="styIRS8839LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8839LNDesc" style="width:auto;height:100%;">
                 <span style="float:left;"> Enter the amount from line 5 of the Credit Limit Worksheet in the instructions</span>
                  <!--Dotted Line-->
                  <span class="styDotLn" style="float:right;padding-right:1mm;">..........</span>	              
                </div>
              </div>
              <div class="styIRS8839LNDesc" style="height:14mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                
                <div class="styIRS8839LNDesc" style="height:14mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form8839Data/CreditLimitWorksheetAmt"/>
                    <xsl:with-param name="Number">15</xsl:with-param>                   
                  </xsl:call-template>
                </div>
              </div>
            </div>

            <!-- (16) ////////////////////////////////////////////////////-->
            <div class="styIRS8839LineItem" style="height:10mm;">
              <div class="styIRS8839LNLeftNumBox">16</div>
              <div class="styIRS8839LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8839LNDesc" style="width:auto;height:100%;">
                  <b>Adoption Credit.</b> Enter the smaller of line 14 or line 15 here and on Form 1040, line 54, or Form 1040NR,<br />line 51. Check box <b>c</b> on that line and enter <b>"8839"</b> in the space next to box <b>c</b>. If line 15 is smaller than line<br />14, you may have a credit carryforward (see instructions)
                  <!--Dotted Line-->
                  <span class="styDotLn" style="float:right;padding-right:1mm;">................</span>	
                </div>
              </div>
              <div class="styIRS8839LNDesc" style="height:100%;width:37mm;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS8839LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8839LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptionCreditAmt"/>
                    <xsl:with-param name="Number">16</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;padding-bottom:.5mm;</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
          </div>
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;clear:all;">
            <div style="float:left;clear:all;">
              <span class="styBoldText">
                For Paperwork Reduction Act Notice, see your tax return instructions.
              </span>
               
                <span style="width:50px;"/>  
                <span style="font-size:7pt;">			   Cat. No. 22843L					</span>
                 <span style="width:28.1mm;"/>   Form <span class="styBoldText" style="font-size:8pt;">8839</span> (2016)
            </div>
          </div>
          <!-- END Page Break and Footer-->
          <p style="page-break-before: always"/>
          <!-- BEGIN Page Header -->
          <div class="styTBB" style="width:187mm;padding-top:5mm;clear:all;">
            <div style="float:left;clear:all;">
              Form 8839 (2016)
            </div>
            <div style="float:right;">
              Page <span style="font-weight:bold;font-size:8pt;">2</span>
            </div>
          </div>
          <!-- END Page Header -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Begin Part III                                               -->
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Header -->
          <div style="width:187mm;" class="styBB">
            <span style="height:3mm;"/>
            <!-- Content -->
            <div class="styPartName" style="width:15mm;height:4mm;">Part III</div>
            <div class="styPartDesc" style="padding-left:3mm;">Employer-Provided Adoption Benefits</div>
            <br/>          
          </div>
          <!-- Body -->
          <div class="styBB" style="width:187mm;">
            <xsl:for-each select="$AdoptedChildData[position() mod 3 = 1]">
              <xsl:variable name="Counter">
                <xsl:number value="position()" format="1"/>
              </xsl:variable>
              <xsl:call-template name="PopulatePartIIITable">
                <xsl:with-param name="Child1Number">
                  <xsl:value-of select="(number($Counter)-1)*3 + 1"/>
                </xsl:with-param>
                <xsl:with-param name="Child1" select="."/>
                <xsl:with-param name="Child2Number">
                  <xsl:value-of select="(number($Counter)-1)*3 + 2"/>
                </xsl:with-param>
                <xsl:with-param name="Child2" select="following-sibling::*[1]"/>
                <xsl:with-param name="Child3Number">
                  <xsl:value-of select="(number($Counter)-1)*3 + 3"/>
                </xsl:with-param>
                <xsl:with-param name="Child3" select="following-sibling::*[2]"/>
              </xsl:call-template>
            </xsl:for-each>
            <xsl:if test="count($AdoptedChildData)=0">
			  <xsl:variable name="Counter">
                <xsl:number value="position()" format="1"/>
              </xsl:variable>
              <xsl:call-template name="PopulatePartIIITable">
                <xsl:with-param name="Child1Number">
                  <xsl:value-of select="(number($Counter)-1)*3 + 1"/>
                </xsl:with-param>
                <xsl:with-param name="Child1" select="."/>
                <xsl:with-param name="Child2Number">
                  <xsl:value-of select="(number($Counter)-1)*3 + 2"/>
                </xsl:with-param>
                <xsl:with-param name="Child2" select="following-sibling::*[1]"/>
                <xsl:with-param name="Child3Number">
                  <xsl:value-of select="(number($Counter)-1)*3 + 3"/>
                </xsl:with-param>
                <xsl:with-param name="Child3" select="following-sibling::*[2]"/>
              </xsl:call-template>									
			</xsl:if>
            <div class="styIRS8839LineItem" style="height:4mm;width:37mm;float:right;">
              <xsl:call-template name="CreateBox">                          
                 <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
                 <xsl:with-param name="NumberBoxStyle">border-bottom-width:0px;background-color:lightgrey;</xsl:with-param>
              </xsl:call-template>
            </div>
            <!-- (21) ////////////////////////////////////////////////////-->
            <div class="styIRS8839LineItem" style="height:5.0mm;">
              <div class="styIRS8839LNLeftNumBox">21</div>
              <div class="styIRS8839LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8839LNDesc" style="width:auto;height:100%;">
                  Add the amounts on line 20.
                </div>
                <div class="styIRS8839LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
                  <!--Dotted Line-->
                  <span class="styDotLn" style="float:right;padding-right:1mm;">........................</span>	
                </div>
              </div>
              <xsl:call-template name="CreateBox">
                <xsl:with-param name="TargetNode" select="$Form8839Data/EmployerAdoptionBenefitsAmt"/>
                <xsl:with-param name="Number">21</xsl:with-param>
              </xsl:call-template>
            </div>
             <!-- (22) ////////////////////////////////////////////////////-->
          <xsl:choose>
				<xsl:when test="$Form8839Data/AdoptedChild/AllwdTaxCrOrEmplrAdptnBnftAmt">
				<xsl:for-each select="$AdoptedChildData[position() mod 3 = 1]">
              <xsl:variable name="Counter">
                <xsl:number value="position()" format="1"/>
              </xsl:variable>
              <xsl:call-template name="PopulatePartIIILine22">
                <xsl:with-param name="Child1Number">
                  <xsl:value-of select="(number($Counter)-1)*3 + 1"/>
                </xsl:with-param>
                <xsl:with-param name="Child1" select="."/>
                <xsl:with-param name="Child2Number">
                  <xsl:value-of select="(number($Counter)-1)*3 + 2"/>
                </xsl:with-param>
                <xsl:with-param name="Child2" select="following-sibling::*[1]"/>
                <xsl:with-param name="Child3Number">
                  <xsl:value-of select="(number($Counter)-1)*3 + 3"/>
                </xsl:with-param>
                <xsl:with-param name="Child3" select="following-sibling::*[2]"/>
              </xsl:call-template>
            </xsl:for-each>
            </xsl:when>
		  <xsl:otherwise>
               <div class="styIRS8839LineItem" style="height:18mm;">
               <div class="styIRS8839LNLeftNumBox">22</div>
               <div class="styIRS8839LNDesc" style="width:48mm;height:100%;padding:5px 0px 0px 0px;">
               <div class="styIRS8839LNDesc" style="width:auto;height:auto;">
                 Enter the <b>smaller</b> of line 19 or<br/>
                 line 20. But if the child was a<br/>
                 child with special needs and the<br/>
                  adoption became final in 2016,<br/>
                 enter the amount from line 19<br/>
             </div>
             </div>
             <div class="styIRS8839LNDesc" style="height:100%;width:132mm;float:right;padding:0px 0px 0px 0px;">
           <xsl:call-template name="CreateBoxRow">
          <xsl:with-param name="Child3Style">border-bottom-width:0px;border-top-width:1px;</xsl:with-param>
          <xsl:with-param name="Child2Style">border-bottom-width:0px;border-top-width:1px;</xsl:with-param>
          <xsl:with-param name="Child1Style">border-bottom-width:0px;border-top-width:1px;</xsl:with-param>
          <xsl:with-param name="NumberStyle">border-bottom-width:0px;border-top-width:1px;</xsl:with-param>
          <xsl:with-param name="Height">13mm</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="CreateBoxRow">
           <xsl:with-param name="Child1Style">border-bottom-width:2px;</xsl:with-param>
             <xsl:with-param name="NumberStyle">border-bottom-width:2px;</xsl:with-param>
            <xsl:with-param name="Child2Style">border-bottom-width:2px;</xsl:with-param>
           <xsl:with-param name="Child3Style">border-bottom-width:2px;</xsl:with-param>
          <xsl:with-param name="Number">22</xsl:with-param>
          </xsl:call-template>
          </div>
          </div>  
          </xsl:otherwise>
         </xsl:choose> 
            <!-- (23) ////////////////////////////////////////////////////-->
            <div class="styIRS8839LineItem" style="height:5mm;">
              <div class="styIRS8839LNLeftNumBox">23</div>
              <div class="styIRS8839LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8839LNDesc" style="width:auto;height:100%;">
                  Enter modified adjusted gross income<br/>
                  (from the worksheet in the instructions)
					<!--Dotted Line-->
					<span class="styDotLn" style="float:right;padding-right:1mm;">....</span>	
                </div>
              </div>
              <div class="styIRS8839LNDesc" style="height:100%;width:auto;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS8839LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8839LNDesc" style="height:5mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
              
                <div class="styIRS8839LNDesc" style="height:3mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptionBenefitsModifiedAGIAmt"/>
                    <xsl:with-param name="Number">23</xsl:with-param>
                  </xsl:call-template>
                </div>
              </div>
            </div>
            <!-- (24) ////////////////////////////////////////////////////-->
            <div class="styIRS8839LineItem" style="height:18mm;">
              <div class="styIRS8839LNLeftNumBox" style="padding-top:3mm;">24</div>
              <div class="styIRS8839LNDesc" style="width:auto;height:100%;padding:0px 0px 0px 0px;padding-top:3mm;">
                <div class="styIRS8839LNDesc" style="width:auto;height:100%;">
                  Is line 23 more than $201,920?<br/>
                  <!-- ++++++++++++++ No Checkbox +++++++++++++ -->
                  <span style="width:1mm;"/>
                  <span>
                    <xsl:call-template name="PopulateSpan">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptionBnftModifAGIGrtrAmtInd"/>
                    </xsl:call-template>
                    <input type="checkbox" class="styCkbox" alt="Checkbox for AdoptionBnftModifAGIGrtrAmtInd">
                      <xsl:if test="$Form8839Data/AdoptionBnftModifAGIGrtrAmtInd">
                        <xsl:call-template name="PopulateNoCheckbox">
                          <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptionBnftModifAGIGrtrAmtInd"/>
                          <xsl:with-param name="BackupName">IRS8839AdoptionBnftModifAGIGrtrAmtInd</xsl:with-param>
                        </xsl:call-template>
                      </xsl:if>
                    </input>
                  </span>
                  <span style="width:2mm;"/>
                  <label>
                    <xsl:if test="$Form8839Data/AdoptionBnftModifAGIGrtrAmtInd">
                      <xsl:call-template name="PopulateLabelNo">
                        <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptionBnftModifAGIGrtrAmtInd"/>
                        <xsl:with-param name="BackupName">IRS8839AdoptionBnftModifAGIGrtrAmtInd</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <span class="styBoldText">No.</span>
                    <span style="width:4px;"/>Skip lines 24 and 25, and
                   enter -0- <br/> <span style="width:9mm;"/>on line 26.<br/>
                  </label>
                  <!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
                  <span style="width:1mm;"/>
                  <span>
                    <xsl:call-template name="PopulateSpan">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptionBnftModifAGIGrtrAmtInd"/>
                    </xsl:call-template>
                    <input type="checkbox" class="styCkbox" alt="Checkbox for AdoptionBnftModifAGIGrtrAmtInd">
                      <xsl:if test="$Form8839Data/AdoptionBnftModifAGIGrtrAmtInd">
                        <xsl:call-template name="PopulateYesCheckbox">
                          <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptionBnftModifAGIGrtrAmtInd"/>
                          <xsl:with-param name="BackupName">IRS8839AdoptionBnftModifAGIGrtrAmtInd</xsl:with-param>
                        </xsl:call-template>
                      </xsl:if>
                    </input>
                  </span>
                  <span style="width:2mm;"/>
                  <label>
                    <xsl:if test="$Form8839Data/AdoptionBnftModifAGIGrtrAmtInd">
                      <xsl:call-template name="PopulateLabelYes">
                        <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptionBnftModifAGIGrtrAmtInd"/>
                        <xsl:with-param name="BackupName">IRS8839AdoptionBnftModifAGIGrtrAmtInd</xsl:with-param>
                      </xsl:call-template>
                    </xsl:if>
                    <span class="styBoldText">Yes.</span>
                    <span style="width:4px;"/>Subtract $201,920 from line
                    23             
                  </label>
                </div>
              </div>
              <div class="styIRS8839LNDesc" style="height:100%;width:auto;float:right;padding:0px 0px 0px 0px;">
                <div class="styIRS8839LNDesc" style="height:20mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>
                <div class="styIRS8839LNDesc" style="height:20mm;width:37mm;float:right;padding:0px 0px 0px 0px;">
                  <xsl:call-template name="CreateBox">
                    <xsl:with-param name="Height">100%</xsl:with-param>
                    <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                    <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                  </xsl:call-template>
                </div>                
               <div style="float:right;">
						<div class="styLNRightNumBox" style="padding-top:15mm;height:20mm;">
						24</div>
						<div class="styLNAmountBox" style="width:29mm;height:20mm;padding-top:15mm;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8839Data/AdoptionBnftModifAGILessLmtAmt"/>
							</xsl:call-template>
						</div>	
				</div>
              </div>
            </div>           
            <!-- (25) ////////////////////////////////////////////////////-->
            <div style="width:187mm;height:9mm;">
              <div class="styLNLeftNumBox" style="height:7mm;padding-top:3mm;">25</div>
              <div class="styGenericDiv" style="width:105mm;padding-top:3mm;">
                Divide line 24 by $40,000. Enter the result as a decimal (rounded to
                at least three places). Do not enter more than 1.000
				<!--Dotted Line-->
				<span class="styDotLn" style="float:right;padding-right:1mm;">...........</span>	
              </div>
              <div class="styLNRightNumBoxNBB" style="height:9mm;padding-top:6mm;">25</div>
              <xsl:choose>
			  <xsl:when test="$Form8839Data/AdoptionBenefitAdjModifAGIPct">
              <div class="styLNAmountBoxNBB" style="width:29mm;height:9mm;padding-top:6mm;font-size:6pt;padding-right:.5mm;">
                <span style="width:8mm;padding-right:4mm;font-size:8pt;">X      </span>
                  <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptionBenefitAdjModifAGIPct"/>
                  </xsl:call-template>
                </div>
              </xsl:when>
			  <xsl:otherwise>
				 <div class="styLNAmountBoxNBB" style="width:29mm;height:9mm;padding-top:6mm;font-size:6pt;padding-right:.5mm;">
                <span style="width:8mm;padding-right:4mm;font-size:8pt;">X      .</span>
                </div>
               </xsl:otherwise>
               </xsl:choose>     
              <div class="styLNRightNumBoxNBB" style="height:9mm;background-color:lightgrey;"></div>
              <div class="styLNAmountBoxNBB" style="width:29mm;height:9mm;font-size:6pt;padding-right:.5mm;"></div>
           </div>
            <xsl:for-each select="$Form8839Data/AdoptedChild">
              <xsl:if test="position() mod 3 = 1">
                <xsl:variable name="pos" select="position()"/>
                <div style="width:187mm;">
                  <div class="styLNLeftNumBox" style="height:4mm;"></div>
                  <div class="styGenericDiv" style="width:46.95mm;height:4.5mm;">
                  </div>
                  <div class="styGenericDiv" style="width:8mm;height:4.5mm;border:black 0 solid;border-bottom-width:1px;"></div>
                  <xsl:if test="$pos = 1">
                    <div class="styGenericDiv" style="border:1px black solid;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos"/>
                    </div>
                    <div class="styGenericDiv" style="border:1px black solid;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos + 1"/>
                    </div>
                    <div class="styGenericDiv" style="border:1px black solid;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos + 2"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="$pos != 1">
                    <div class="styGenericDiv" style="border:1px black solid;border-top-width:0px;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos"/>
                    </div>
                    <div class="styGenericDiv" style="border:1px black solid;border-top-width:0px;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos + 1"/>
                    </div>
                    <div class="styGenericDiv" style="border:1px black solid;border-top-width:0px;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos + 2"/>
                    </div>
                  </xsl:if>

                  <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;width:8.05mm;"></div>
                  <div class="styLNAmountBoxNBB" style="width:29mm;height:4.5mm;"></div>
               </div>
                <!-- (26) ////////////////////////////////////////////////////-->
                <div style="width:187mm;height:7mm">
                  <div class="styLNLeftNumBox" style="height:7mm;">26</div>
                  <div class="styGenericDiv" style="width:46.95mm;">
                    Multiply each amount on line 22
                    <span style="float:left;">by line 25 </span>
				    <!--Dotted Line-->
				    <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>	
                  </div>
                  <div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;border-bottom-width:2px;">26</div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos]/AdoptionBnftAGIPctExpnsAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos + 1]/AdoptionBnftAGIPctExpnsAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos + 2]/AdoptionBnftAGIPctExpnsAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;width:8.05mm;"></div>
                  <div class="styLNAmountBoxNBB" style="width:29mm;height:7mm;"></div>
               </div>
                <!-- (27) ////////////////////////////////////////////////////-->
                <div class="styGenericDiv" style="width:187mm;height:7mm">
                  <div class="styLNLeftNumBox" style="height:7mm;">27</div>
                  <div class="styGenericDiv" style="width:46.95mm;">
                    <b>Excluded benefits.</b> Subtract
                    <span style="float:left;">line 26 from line 22 </span>
				    <!--Dotted Line-->
				    <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>	
                  </div>
                  <div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;border-bottom-width:2px;">27</div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos]/ExcludedBenefitsAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos + 1]/ExcludedBenefitsAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos + 2]/ExcludedBenefitsAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;width:8.05mm;"></div>
                  <div class="styLNAmountBoxNBB" style="width:29mm;height:7mm;"></div>
               </div>
              </xsl:if>             
            </xsl:for-each>
            <xsl:if test="count($Form8839Data/AdoptedChild)=0">  
                              <xsl:if test="position() mod 3 = 1">
                <xsl:variable name="pos" select="position()"/>
<!--                <div style="width:187mm;">
                  <div class="styLNLeftNumBox" style="height:4mm;"></div>
                  <div class="styGenericDiv" style="width:46.95mm;height:4.5mm;">
                  </div>
                  <div class="styGenericDiv" style="width:8mm;height:4.5mm;border:black 0 solid;border-bottom-width:1px;"></div>
                  <xsl:if test="$pos = 1">
                    <div class="styGenericDiv" style="border:1px black solid;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos"/>
                    </div>
                    <div class="styGenericDiv" style="border:1px black solid;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos + 1"/>
                    </div>
                    <div class="styGenericDiv" style="border:1px black solid;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos + 2"/>
                    </div>
                  </xsl:if>
                  <xsl:if test="$pos != 1">
                    <div class="styGenericDiv" style="border:1px black solid;border-top-width:0px;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos"/>
                    </div>
                    <div class="styGenericDiv" style="border:1px black solid;border-top-width:0px;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos + 1"/>
                    </div>
                    <div class="styGenericDiv" style="border:1px black solid;border-top-width:0px;border-right-width:0px;text-align:center;font-weight:bold;width:29mm;height:4.5mm;padding-top:1mm;padding-right:.5mm;font-size:6pt;">
                      Child <xsl:value-of select="$pos + 2"/>
                    </div>
                  </xsl:if>

                  <div class="styLNRightNumBoxNBB" style="background-color:lightgrey;height:4.5mm;width:8.05mm;"></div>
                  <div class="styLNAmountBoxNBB" style="width:29mm;height:4.5mm;"></div>
               </div>-->
                <!-- (26) ////////////////////////////////////////////////////-->
                <div style="width:187mm;height:7mm">
                  <div class="styLNLeftNumBox" style="height:7mm;">26</div>
                  <div class="styGenericDiv" style="width:46.95mm;">
                    Multiply each amount on line 22
                    <span style="float:left;">by line 25 </span>												
				    <!--Dotted Line-->
				    <span class="styDotLn" style="float:right;padding-right:1mm;">.......</span>	
                  </div>
                  <div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;border-bottom-width:1px;border-top-width:1px;">26</div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-bottom-width:1px;border-top-width:1px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos]/AdoptionBnftAGIPctExpnsAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-bottom-width:1px;border-top-width:1px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos + 1]/AdoptionBnftAGIPctExpnsAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-bottom-width:1px;border-top-width:1px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos + 2]/AdoptionBnftAGIPctExpnsAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;width:8.05mm;"></div>
                  <div class="styLNAmountBoxNBB" style="width:29mm;height:7mm;"></div>
               </div>
                <!-- (27) ////////////////////////////////////////////////////-->
                <div class="styGenericDiv" style="width:187mm;height:7mm">
                  <div class="styLNLeftNumBox" style="height:7mm;">27</div>
                  <div class="styGenericDiv" style="width:46.95mm;">
                    <b>Excluded benefits.</b> Subtract
                    <span style="float:left;">line 26 from line 22 </span>
				    <!--Dotted Line-->
				    <span class="styDotLn" style="float:right;padding-right:1mm;">.....</span>	
                  </div>
                  <div class="styLNRightNumBox" style="height:7mm;padding-top:3mm;border-bottom-width:2px;">27</div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos]/ExcludedBenefitsAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos + 1]/ExcludedBenefitsAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNAmountBox" style="width:29mm;height:7mm;padding-top:3.5mm;font-size:6pt;padding-right:.5mm;border-bottom-width:2px;">
                    <xsl:call-template name="PopulateAmount">
                      <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild[$pos + 2]/ExcludedBenefitsAmt"/>
                    </xsl:call-template>
                  </div>
                  <div class="styLNRightNumBoxNBB" style="height:7mm;background-color:lightgrey;width:8.05mm;"></div>
                  <div class="styLNAmountBoxNBB" style="width:29mm;height:7mm;"></div>
               </div>
              </xsl:if>  
            </xsl:if>
            <!-- (28) ////////////////////////////////////////////////////-->
            <div class="styIRS8839LineItem">
              <div class="styIRS8839LNLeftNumBox">28</div>
              <div class="styIRS8839LNDesc" style="width:144mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8839LNDesc" style="width:auto;height:100%;float:left;">
                  Add the amounts on line 27
                </div>
                <div class="styIRS8839LNDesc" style="width:auto;height:100%;text-align:right;float:right;padding:0px 3mm 0px 0px;">
				    <!--Dotted Line-->
				    <span class="styDotLn" style="padding-right:1mm;">........................</span>	
                </div>
              </div>          
              <div style="float:right;">
						<div class="styLNRightNumBox"  style="height:3.4mm;border-bottom-width:0.1mm;">
						28</div>
						<div class="styLNAmountBox" style="width:29mm;height:3.4mm;padding-bottom:.5mm;font-size:6pt;">
							<xsl:call-template name="PopulateAmount">
								<xsl:with-param name="TargetNode" select="$Form8839Data/TotalExcludedBenefitsAmt"/>
							</xsl:call-template>
						</div>	
			  </div>          
            </div>
            <!-- (29) ////////////////////////////////////////////////////-->
            <div class="styIRS8839LineItem" style="height:28mm;">
              <div class="styIRS8839LNLeftNumBox">29</div>
              <div class="styIRS8839LNDesc" style="width:142.5mm;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8839LNDesc" style="width:auto;height:auto;">
                  <b>Taxable benefits.</b> Is line 28 more than line 21?
                  <div style="padding:0px 0px 0px 0px;width:100%;height:100%;">
                    <div class="styIRS8839LNDesc" style="padding:0px 0px 0px 0px;float:left;width:auto;">
                      <!-- ++++++++++++++ No Checkbox +++++++++++++ -->
                      <span style="width:1mm;"/>
                      <span>
                        <xsl:call-template name="PopulateSpan">
                          <xsl:with-param name="TargetNode" select="$Form8839Data/ExcldMoreThanEmplrAdptnBnftInd"/>
                        </xsl:call-template>
                     <input type="checkbox" class="styCkbox" alt="Checkbox forExcldMoreThanEmplrAdptnBnftInd">
                          <xsl:if test="$Form8839Data/ExcldMoreThanEmplrAdptnBnftInd">
                            <xsl:call-template name="PopulateNoCheckbox">
                              <xsl:with-param name="TargetNode" select="$Form8839Data/ExcldMoreThanEmplrAdptnBnftInd"/>
                              <xsl:with-param name="BackupName">IRS8839ExcldMoreThanEmplrAdptnBnftInd</xsl:with-param>
                            </xsl:call-template>
                          </xsl:if>
                        </input>
                      </span>
                      <span style="width:2mm;"/>
                      <label>
                        <xsl:if test="$Form8839Data/ExcldMoreThanEmplrAdptnBnftInd">
                          <xsl:call-template name="PopulateLabelNo">
                            <xsl:with-param name="TargetNode" select="$Form8839Data/ExcldMoreThanEmplrAdptnBnftInd"/>
                            <xsl:with-param name="BackupName">IRS8839ExcldMoreThanEmplrAdptnBnftInd</xsl:with-param>
                          </xsl:call-template>
                        </xsl:if>
                        <span class="styBoldText">No.</span>
                        <span style="width:5px;"/>Subtract line 28 from line 21. Also, include this amount, if more than zero, on<br/>
                        <span style="width:11mm;"/>line 7 of Form 1040 or line 8 of Form 1040NR. On the dotted line next to line<br/>
                        <span style="width:11mm;"/>7 of Form 1040 or line 8 of Form 1040NR, enter “AB.”<br/>
                      </label>
                      <!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
                      <span style="width:1mm;"/>
                      <span>
                        <xsl:call-template name="PopulateSpan">
                          <xsl:with-param name="TargetNode" select="$Form8839Data/ExcldMoreThanEmplrAdptnBnftInd"/>
                        </xsl:call-template>
                   <input type="checkbox" class="styCkbox" alt="Checkbox for ExcldMoreThanEmplrAdptnBnftInd">
                          <xsl:if test="$Form8839Data/ExcldMoreThanEmplrAdptnBnftInd">
                            <xsl:call-template name="PopulateYesCheckbox">
                              <xsl:with-param name="TargetNode" select="$Form8839Data/ExcldMoreThanEmplrAdptnBnftInd"/>
                              <xsl:with-param name="BackupName">IRS8839ExcldMoreThanEmplrAdptnBnftInd</xsl:with-param>
                            </xsl:call-template>
                          </xsl:if>
                        </input>
                      </span>
                      <span style="width:2mm;"/>
                      <label>
                        <xsl:if test="$Form8839Data/ExcldMoreThanEmplrAdptnBnftInd">
                          <xsl:call-template name="PopulateLabelYes">
                            <xsl:with-param name="TargetNode" select="$Form8839Data/ExcldMoreThanEmplrAdptnBnftInd"/>
                            <xsl:with-param name="BackupName">IRS8839ExcldMoreThanEmplrAdptnBnftInd</xsl:with-param>
                          </xsl:call-template>
                        </xsl:if>
                        <span class="styBoldText">Yes.</span>
                        <span style="width:5px;"/>Subtract line 21 from line 28. Enter the result as a negative number. Reduce<br/>
                        <span style="width:11mm;"/>the total you would enter on line 7 of Form 1040 or line 8 of Form 1040NR by<br/>
                        <span style="width:11mm;"/>the amount on Form 8839, line 29. Enter the result on line 7 of Form 1040 or<br/>
                        <span style="width:11mm;"/>line 8 of Form 1040NR. Enter "SNE" on the dotted line next to the entry line.
                      </label>
                    </div>
                    <div class="styIRS8839LNDesc" style="padding:0px 0px 0px 3px;float:left;width:auto;height:auto;">
                      <img src="{$ImagePath}/8839_Bracket_Lg.gif" alt="LargeBracket"/>
                    </div>
                    <div class="styIRS8839LNDesc" style="padding:0px 5px 0px 0px;float:right;width:auto;height:auto;">
			          <!--Dotted Line-->
                      <span class="styBoldText" style="height:100%;padding-top:7.5mm;letter-spacing:3.1mm;">
                      ....
                      </span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="styIRS8839LNDesc" style="height:100%;width:37mm;float:right;padding:2px 0px 0px 0px;">
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="Height">10mm</xsl:with-param>
                  <xsl:with-param name="AmountBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;</xsl:with-param>
                  <xsl:with-param name="NumberBoxStyle">border-width:0px 0px 0px 1px;padding:0px 0px 0px 0px;background-color:lightgrey;</xsl:with-param>
                </xsl:call-template>
                <xsl:call-template name="CreateBox">
                  <xsl:with-param name="TargetNode" select="$Form8839Data/TaxableBenefitsAmt"/>
                  <xsl:with-param name="Number">29</xsl:with-param>
                </xsl:call-template>
              </div>
            </div>
          </div>
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <div class="styTBB" style="width:187mm;height:25mm;">
            <div class="styIRS8839LineItem">
              <div class="styIRS8839LNDesc" style="width:12%;height:100%;padding:5.5mm 0px 0px 3.5mm;vertical-align:middle;">
                <img src="{$ImagePath}/8839_Tip.gif" alt="Tip"/>
              </div>
              <div class="styIRS8839LNDesc" style="width:88%;height:100%;padding:0px 0px 0px 0px;">
                <div class="styIRS8839LNDesc" style="width:100%;height:auto;padding:5px 0px 0px 5px;">
                  You may be able to claim the adoption credit in Part II on the front of this form if any of the following apply.
                </div>
                <div class="styIRS8839LNDesc" style="width:100%;height:auto;padding:5px 0px 0px 5px;">
                  <img src="{$ImagePath}/8839_Bullet_Round.gif" alt="RoundBullet"/><span style="width:4px;"/>You paid adoption expenses in 2015, those expenses were not fully reimbursed by your employer or otherwise, and<br/>
                  <span style="width:7px;"/>the adoption was not final by the end of 2015.
                </div>
                <div class="styIRS8839LNDesc" style="width:100%;height:auto;padding:5px 0px 0px 5px;">
                  <img src="{$ImagePath}/8839_Bullet_Round.gif" alt="RoundBullet"/><span style="width:4px;"/>The total adoption expenses you paid in 2016 were not fully reimbursed by your employer or otherwise, and the<br/>
                  <span style="width:7px;"/>adoption became final in 2016 or earlier.
                </div>
                <div class="styIRS8839LNDesc" style="width:100%;height:auto;padding:5px 0px 5px 5px;">
                  <img src="{$ImagePath}/8839_Bullet_Round.gif" alt="RoundBullet"/><span style="width:4px;"/>You adopted a child with special needs and the adoption became final in 2016.
                </div>
              </div>
            </div>
          </div>
          <!-- <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< -->
          <!-- Page Break and Footer-->
          <div class="pageEnd" style="width:187mm;padding-top:1mm;clear:all;">
            <div style="float:right;">
              <span style="width:20px;"/>
              Form  <span class="styBoldText" style="font-size:7pt;">  8839 </span> (2016)
            </div>
          </div>
          <!-- END Page Break and Footer-->
          
             <!-- Additonal Data Title Bar and Button -->
          <div class="styLeftOverTitleLine" id="LeftoverData" style="padding-top:5mm;clear:all;">
            <div class="styLeftOverTitle">
              Additional Data        
            </div>
            <div class="styLeftOverButtonContainer">
              <input class="styLeftoverTableBtn" type="button" TabIndex="-1" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
            </div>
          </div>
          <!-- Additional Data Table -->
          <xsl:variable name="TableWidth">145</xsl:variable>
          <table class="styLeftOverTbl">
            <xsl:call-template name="PopulateCommonLeftover">
              <xsl:with-param name="TargetNode" select="$Form8839Data"/>
              <xsl:with-param name="DescWidth" select="$TableWidth"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Return Software ID</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$RtnHdrData/SoftwareId"/>
              <xsl:with-param name="DescWidth" select="$TableWidth"/>
            </xsl:call-template>
            <xsl:call-template name="PopulateLeftoverRow">
              <xsl:with-param name="Desc">Return Software Version</xsl:with-param>
              <xsl:with-param name="TargetNode" select="$RtnHdrData/SoftwareVersionNum"/>
              <xsl:with-param name="DescWidth" select="$TableWidth"/>
            </xsl:call-template>
            <xsl:for-each select="$Form8839Data/AdoptedChild">
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Part I, Line 1(a) - Person Name Control Text - Child <xsl:number value="position()" format="1"/>
                </xsl:with-param>
                <xsl:with-param name="TargetNode" select="PersonNameControlTxt"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
            </xsl:for-each>
            <xsl:if test="count($Form8839Data/AdoptedChild) > 1">
              <xsl:for-each select="$Form8839Data/AdoptedChild">
              <xsl:variable name="SameChildNode">
					<xsl:choose>
						<xsl:when test="AdoptionCreditSameChildPYInd='true'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
						</xsl:choose>
                </xsl:variable>
                <tr>
				  <td class="styLeftOverTableRowDesc" style="width:120mm;" scope="row">Part II, Line 3-Did you file Form 8839 for a prior year for the same child?-Child <xsl:number value="position()" format="1"/>:</td>  
				  <td class="styLeftOverTableRowAmount" style="width:87mm;"><xsl:value-of select="$SameChildNode"></xsl:value-of>
					
				  </td>                          
				</tr>
                <!--<xsl:call-template name="PopulateLeftoverRow">                
                  <xsl:with-param name="Desc">Part I, Line 3-Did you file Form 8839 for a prior year for the same child?-Child <xsl:number value="position()" format="1"/>
                  </xsl:with-param>
                  <xsl:with-param name="TargetNode" select="$SameChildNode"/>
                  <xsl:with-param name="DescWidth" select="$TableWidth"/>
                </xsl:call-template>-->
              </xsl:for-each>
              <xsl:for-each select="$Form8839Data/AdoptedChild">
              <xsl:variable name="EmpSameChildNode">
					<xsl:choose>
						<xsl:when test="EmployerAdptnBnftSameChldPYInd='true'">yes</xsl:when>
						<xsl:otherwise>no</xsl:otherwise>
						</xsl:choose>
                </xsl:variable>
                <tr>
				  <td class="styLeftOverTableRowDesc" style="width:120mm;" scope="row">Part III, Line 18-Did you receive employer provided adoption benefits for a prior year for the same child?-Child <xsl:number value="position()" format="1"/>:</td>  
				  <td class="styLeftOverTableRowAmount" style="width:87mm;"><xsl:value-of select="$EmpSameChildNode"></xsl:value-of>
					
				  </td>                          
				</tr>
                <!--<xsl:call-template name="PopulateLeftoverRow">
                  <xsl:with-param name="Desc">Part III, Line 18-Did you receive employer provided adoption benefits for a prior year for the same child?-Child <xsl:number value="position()" format="1"/>
                  </xsl:with-param>
                  <xsl:with-param name="TargetNode" select="EmployerAdptnBnftSameChldPYInd"/>
                  <xsl:with-param name="DescWidth" select="$TableWidth"/>
                </xsl:call-template>-->
              </xsl:for-each>
            </xsl:if>
            <xsl:for-each select="$Form8839Data/AdoptedChild">
              <xsl:variable name="num">
                <xsl:number value="position()" format="1"/>
              </xsl:variable>
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Part III, Line 20-Employer Adoption Benefit Exclusion Prior Year Amount-Child <xsl:value-of select="$num"/>
                </xsl:with-param>
                <xsl:with-param name="TargetNode" select="EmployerAdoptionBnftPerChldAmt/@employerAdoptionBnftExclPYAmt"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
              <xsl:call-template name="PopulateLeftoverRow">
                <xsl:with-param name="Desc">Part III, Line 20-Employer Adoption Benefit Exclusion Prior Year Code-Child <xsl:value-of select="$num"/>
                </xsl:with-param>
                <xsl:with-param name="TargetNode" select="EmployerAdoptionBnftPerChldAmt/@employerAdoptionBnftExclPYCd"/>
                <xsl:with-param name="DescWidth" select="$TableWidth"/>
              </xsl:call-template>
            </xsl:for-each>
          </table>
        
          <!-- Separated Data for Part I -->
          <xsl:if test="($Print = $Separated) and  (count($Form8839Data/AdoptedChild) &gt; 3)">
            <br/><br/>
            <span class="styRepeatingDataTitle">
              Form 8839, Part I, Line 1 - Information About Your Eligible Child or Children
            </span>
            <table class="styDepTbl" cellspacing="0">
              <thead class="styTableThead">
                <xsl:call-template name="CreateTableHeaders">
                  <xsl:with-param name="AddColoredHeaders">true</xsl:with-param>
                </xsl:call-template>
              </thead>
              <tfoot/>
              <tbody>
                <xsl:for-each select="$Form8839Data/AdoptedChild">
                  <xsl:call-template name="CreateTableRows">
                    <xsl:with-param name="AddColorCodeRow">true</xsl:with-param>
                  </xsl:call-template>
                </xsl:for-each>
              </tbody>
            </table>
          </xsl:if>  
          </div>
        </form>
      </body>
    </html>
  </xsl:template>
  <!-- ////////////////////////////////////// -->
  <xsl:template name="CreateEmptyTableRows">
    <xsl:param name="Number">1</xsl:param>
    <xsl:param name="InsertAdditionalDataMessage"/>
    <tr style="font-size: 7pt;">
      <td class="styIRS8839TableCell" style="width:15mm;font-size: 7pt; text-align:center;border-bottom-width:1px;">
        <span class="styBoldText">Child<br/>
          <xsl:value-of select="$Number"/>
        </span>
      </td>
      <!--First Name-->
      <td class="styIRS8839TableCell" style="width:40%;font-size: 7pt; text-align:center;">
        <span style="width:4px"/>
        <xsl:if test="$InsertAdditionalDataMessage">
          <xsl:if test="((count($Form8839Data/AdoptedChild) &gt;3) and ($Print = $Separated))">
            <xsl:call-template name="PopulateAdditionalDataTableMessage">
              <xsl:with-param name="TargetNode" select="$Form8839Data/AdoptedChild"/>
            </xsl:call-template>
          </xsl:if>
        </xsl:if>
      </td>
      <!--Last Name-->
      <td class="styIRS8839TableCell" style="width:40%;font-size: 7pt; text-align:center;">
        <span style="width:4px"/>
      </td>
      <!--Birth Year-->
      <td class="styIRS8839TableCell" style="width:14mm;font-size: 7pt; text-align:center;">
        <span style="width:4px"/>
      </td>
      <!--(c) Disabled Child Over 18-->
      <td class="styIRS8839TableCell" style="width:8%;font-size: 7pt; text-align:center;">
        <input class="styCkbox" type="checkbox" style="width:4mm;"><xsl:attribute name="id">IRS8839Child<xsl:value-of select="$Number"/>Over18Blank</xsl:attribute></input><label><xsl:attribute name="for">IRS8839Child<xsl:value-of select="$Number"/>Over18Blank</xsl:attribute></label>
      </td>
      <!--(d) Child With Special Needs-->
      <td class="styIRS8839TableCell" style="width:8%;font-size: 7pt; text-align:center;">
        <input class="styCkbox" type="checkbox" style="width:4mm;"><xsl:attribute name="id">IRS8839Child<xsl:value-of select="$Number"/>SpecialNeedsBlank</xsl:attribute></input><label><xsl:attribute name="for">IRS8839Child<xsl:value-of select="$Number"/>SpecialNeedsBlank</xsl:attribute></label>
      </td>
      <!--(e) Foreign Child Indicator-->
      <td class="styIRS8839TableCell" style="width:8%;font-size: 7pt; text-align:center;">
        <input class="styCkbox" type="checkbox" style="width:4mm;"><xsl:attribute name="id">IRS8839Child<xsl:value-of select="$Number"/>ForeignBlank</xsl:attribute></input><label><xsl:attribute name="for">IRS8839Child<xsl:value-of select="$Number"/>ForeignBlank</xsl:attribute></label>
      </td>
      <!--(f) Child's SSN-->
      <td class="styIRS8839TableCell" style="width:14%;font-size: 7pt; text-align:center;">
        <span style="width:4px"/>
      </td>
      <!--(g) adoption became final in 2014 or earlier Indicator-->
      <td class="styIRS8839TableCell" style="width:44%;font-size: 7pt; text-align:center;border-right-width:0px;">
        <input class="styCkbox" type="checkbox" style="width:4mm;"><xsl:attribute name="id">IRS8839Child<xsl:value-of select="$Number"/>FinalBlank</xsl:attribute></input><label><xsl:attribute name="for">IRS8839Child<xsl:value-of select="$Number"/>FinalBlank</xsl:attribute></label>
      </td>
    </tr>
  </xsl:template>
  <xsl:template name="CreateTableHeaders">
    <xsl:param name="AddColoredHeaders"/>
    <tr>
      <xsl:if test="$AddColoredHeaders">
        <xsl:attribute name="class">styDepTblHdr</xsl:attribute>
      </xsl:if>
      <th class="styTableCellHeader" scope="col" rowspan="3">
        <xsl:attribute name="style">
          border-color:black;width:5%;font-weight:normal;
          <xsl:if test="$AddColoredHeaders">
            color:white;font-size:7pt;
          </xsl:if>
        </xsl:attribute>
        <span style="font-weight:bold;">1</span>
      </th>
      <th class="styTableCellHeader" scope="col" rowspan="2" colspan="2" >
        <xsl:attribute name="style">
          border-bottom-width:0px;border-color:black;width:48mm;font-weight:normal;
          <xsl:if test="$AddColoredHeaders">
            color:white;font-size:7pt;
          </xsl:if>
        </xsl:attribute>
        <span style="font-weight:bold;">(a)</span>
        <br/>Child's name</th>
      <th class="styTableCellHeader" scope="col" rowspan="3" style="width:12mm;">
        <xsl:attribute name="style">
          border-color:black;width:8mm;font-weight:normal;
          <xsl:if test="$AddColoredHeaders">
            color:white;font-size:7pt;
          </xsl:if>
        </xsl:attribute>
        <span style="font-weight:bold;">(b)</span>
        <br/>Child's year<br/>of birth</th>
      <th class="styTableCellHeader" scope="col" colspan="3" rowspan="1"  >
        <xsl:attribute name="style">
          border-color:black;width:36mm;font-weight:normal;
          <xsl:if test="$AddColoredHeaders">
            color:white;font-size:7pt;
          </xsl:if>
        </xsl:attribute>
            Check if child was-</th>
      <th class="styTableCellHeader" scope="col" rowspan="3" style="width:28mm;">
        <xsl:attribute name="style">
          border-color:black;width:30%;font-weight:normal;
          <xsl:if test="$AddColoredHeaders">
            color:white;font-size:7pt;
          </xsl:if>
        </xsl:attribute>
        <span style="font-weight:bold;">(f)</span>
        <br/>Child's<br/>identifying number</th>
      <th class="styTableCellHeader" scope="col" rowspan="3">
        <xsl:attribute name="style">
          border-color:black;width:67mm;font-weight:normal;border-right:0;
          <xsl:if test="$AddColoredHeaders">
            color:white;font-size:7pt;
          </xsl:if>
        </xsl:attribute>
        <span style="font-weight:bold;">(g)</span>
        <br/>Check if<br/>adoption<br/>became final in 2016 or earlier</th>
    </tr>
    <tr>
      <xsl:if test="$AddColoredHeaders">
        <xsl:attribute name="class">styDepTblHdr</xsl:attribute>
      </xsl:if>
      <th class="styTableCellHeader" scope="col" rowspan="2">
        <xsl:attribute name="style">
          border-color:black;width:8mm;font-weight:normal;
          <xsl:if test="$AddColoredHeaders">
            color:white;font-size:7pt;
          </xsl:if>
        </xsl:attribute>
        <span class="styBoldText">(c)</span>
        <br/>born <b>before<br/>1999</b> and<br/>disabled</th>
      <th class="styTableCellHeader" scope="col" rowspan="2">
        <xsl:attribute name="style">
          border-color:black;width:8mm;font-weight:normal;
          <xsl:if test="$AddColoredHeaders">
            color:white;font-size:7pt;
          </xsl:if>
        </xsl:attribute>
        <span class="styBoldText">(d)</span>
        <br/>a child<br/>with special<br/>needs</th>
      <th class="styTableCellHeader" scope="col" rowspan="2">
        <xsl:attribute name="style">
          border-color:black;width:8mm;font-weight:normal;
          <xsl:if test="$AddColoredHeaders">
            color:white;font-size:7pt;
          </xsl:if>
        </xsl:attribute>
        <span class="styBoldText">(e)</span>
        <br/>a<br/>foreign<br/>child</th>
    </tr>
    <tr>
      <xsl:if test="$AddColoredHeaders">
        <xsl:attribute name="class">styDepTblHdr</xsl:attribute>
      </xsl:if>
      <th class="styTableCellHeader" scope="col" rowspan="1">
        <xsl:attribute name="style">
          border-color:black;border-width:0px 0px 1px 0px;width:27%;font-weight:normal;
          <xsl:if test="$AddColoredHeaders">
            color:white;font-size:7pt;
          </xsl:if>
        </xsl:attribute>
        First
      </th>
      <th class="styTableCellHeader" scope="col" rowspan="1">
        <xsl:attribute name="style">
          border-color:black;border-width:0px 1px 1px 0px;width:27%;font-weight:normal;
          <xsl:if test="$AddColoredHeaders">
            color:white;font-size:7pt;
          </xsl:if>
        </xsl:attribute>
        Last
      </th>
    </tr>
  </xsl:template>
  <xsl:template name="CreateTableRows">
    <xsl:param name="AddColorCodeRow"/>
        <tr style="font-size: 7pt;"  >
        
          <xsl:variable name="ChildNumber">
            <xsl:number format="1"/>
          </xsl:variable>
          <xsl:if test="$AddColorCodeRow">
            <xsl:attribute name="class"><xsl:choose><xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when><xsl:otherwise>styDepTblRow2</xsl:otherwise></xsl:choose></xsl:attribute>
          </xsl:if>
          <td class="styIRS8839TableCell">
            <xsl:attribute name="style">
              width:5%;font-size: 7pt; text-align:center;black;border-width:0px 1px 2px 0px;
              <xsl:if test="(position() &gt; 3) and (position() = last())">
   black;border-width:0px 1px 2px 0px;
              </xsl:if></xsl:attribute>
            <span class="styBoldText" >Child<br/>
              <xsl:value-of select="$ChildNumber"/>
            </span>          </td>
          <!--First Name-->
          <td class="styIRS8839TableCell">
            <xsl:attribute name="style">
              width:27%;font-size: 7pt; text-align:center;black;border-width:0px 1px 2px 0px;
              <xsl:if test="(position() &gt; 3) and (position() = last())">
              black-border-width:0px 1px 2px 0px;
              </xsl:if>              
              </xsl:attribute><span style="width:1px;"/>
            <xsl:if test="$Form8839Data/AdoptedChild/PersonFirstNm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PersonFirstNm"/>
              </xsl:call-template>
              <span class="styTableCellPad"/>
            </xsl:if>
          </td>
          <!--Last Name-->
          <td class="styIRS8839TableCell">
            <xsl:attribute name="style">
              width:27%;font-size: 7pt; text-align:center;black;border-width:0px 1px 2px 0px;
              <xsl:if test="(position() &gt; 3) and (position() = last())">
              </xsl:if></xsl:attribute><span style="width:1px;"/>
            <xsl:if test="$Form8839Data/AdoptedChild/PersonLastNm">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="PersonLastNm"/>
              </xsl:call-template>
              <xsl:if test="not($Form8839Data/AdoptedChild/PersonNameControlTxt)">
                <span class="styTableCellPad"/>
              </xsl:if>
            </xsl:if>
            <xsl:if test="$Form8839Data/AdoptedChild/PersonNameControlTxt">
              <br/>
              <xsl:call-template name="LinkToLeftoverDataTableInline">
                <xsl:with-param name="Desc">Person Name Control Text - Child <xsl:value-of select="$ChildNumber"/>
                </xsl:with-param>
                <xsl:with-param name="TargetNode" select="PersonNameControlTxt"/>
              </xsl:call-template>
              <span class="styTableCellPad"/>
            </xsl:if>
          </td>
          <!--Birth Year-->
          <td class="styIRS8839TableCell">
            <xsl:attribute name="style">
              width:8mm;font-size: 7pt; text-align:center;black;border-width:0px 1px 2px 0px;
              <xsl:if test="(position() &gt; 3) and (position() = last())">
      black;border-width:0px 1px 2px 0px;
              </xsl:if></xsl:attribute><span style="width:1px;"/>
            <xsl:if test="$Form8839Data/AdoptedChild/ChildBirthYr">
              <xsl:call-template name="PopulateMonthDayYear">
                <xsl:with-param name="TargetNode" select="ChildBirthYr"/>
              </xsl:call-template>
              <span class="styTableCellPad"/>
            </xsl:if>
          </td>
          <!--(c) Disabled Child Over 18-->
          <td class="styIRS8839TableCell">
            <xsl:attribute name="style">
              width:8%;font-size: 7pt; text-align:center;black;border-width:0px 1px 2px 0px;
              <xsl:if test="(position() &gt; 3) and (position() = last())">
         black;border-width:0px 1px 2px 0px;
              </xsl:if></xsl:attribute>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="DisabledChildOver18Ind"/>
                <xsl:with-param name="BackupName">Form8839DataAdoptedChildDisabledChildOver18Ind</xsl:with-param>
              </xsl:call-template>
            </label>
            <input class="styCkbox" type="checkbox" style="width:4mm;">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="DisabledChildOver18Ind"/>
                <xsl:with-param name="BackupName">Form8839DataAdoptedChildDisabledChildOver18Ind</xsl:with-param>
              </xsl:call-template>
            </input>
          </td>
          <!--(d) Child With Special Needs-->
          <td class="styIRS8839TableCell">
            <xsl:attribute name="style">
              width:8%;font-size: 7pt; text-align:center;black;border-width:0px 1px 2px 0px;
              <xsl:if test="(position() &gt; 3) and (position() = last())">
              black;border-width:0px 1px 2px 0px;
              </xsl:if></xsl:attribute>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="ChildWithSpecialNeedsInd"/>
                <xsl:with-param name="BackupName">Form8839DataAdoptedChildChildWithSpecialNeedsInd</xsl:with-param>
              </xsl:call-template>
            </label>
            <input class="styCkbox" type="checkbox" style="width:4mm;">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="ChildWithSpecialNeedsInd"/>
                <xsl:with-param name="BackupName">Form8839DataAdoptedChildChildWithSpecialNeedsInd</xsl:with-param>
              </xsl:call-template>
            </input>
          </td>
          <!--(e) Foreign Child Indicator-->
          <td class="styIRS8839TableCell">
            <xsl:attribute name="style">
              width:8%;font-size: 7pt; text-align:center;black;border-width:0px 1px 2px 0px;
              <xsl:if test="(position() &gt; 3) and (position() = last())">
              black;border-width:0px 1px 2px 0px;
              </xsl:if></xsl:attribute>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="ForeignChildInd"/>
                <xsl:with-param name="BackupName">Form8839DataAdoptedChildForeignChildInd</xsl:with-param>
              </xsl:call-template>
            </label>
            <input class="styCkbox" type="checkbox" style="width:4mm;">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="ForeignChildInd"/>
                <xsl:with-param name="BackupName">Form8839DataAdoptedChildForeignChildInd</xsl:with-param>
              </xsl:call-template>
            </input>
          </td>
          <!--(f) Child's SSN-->
          <td class="styIRS8839TableCell">
            <xsl:attribute name="style">
              width:30%;font-size: 7pt; text-align:center;black;border-width:0px 1px 2px 0px;
              <xsl:if test="(position() &gt; 3) and (position() = last())">
     black;border-width:0px 1px 2px 0px;
              </xsl:if></xsl:attribute><span style="width:1px;"/>
            <xsl:if test="$Form8839Data/AdoptedChild/ChildSSN">
              <xsl:call-template name="PopulateSSN">
                <xsl:with-param name="TargetNode" select="ChildSSN"/>
              </xsl:call-template>
              <span class="styTableCellPad"/>
            </xsl:if>
          </td>
          <!--(g) adoption became final in 2014 or earlier Indicator-->
          <td class="styIRS8839TableCell">
            <xsl:attribute name="style">
              width:67mm;font-size: 7pt; text-align:center;border-right-width:0px;black;border-width:0px 1px 2px 0px;
              <xsl:if test="(position() &gt; 3) and (position() = last())">
       black;border-width:0px 1px 2px 0px;
              </xsl:if></xsl:attribute>
            <label>
              <xsl:call-template name="PopulateLabel">
                <xsl:with-param name="TargetNode" select="AdoptionFinalInd"/>
                <xsl:with-param name="BackupName">Form8839DataAdoptedChildAdoptionFinalInd</xsl:with-param>
              </xsl:call-template>
            </label>
            <input class="styCkbox" type="checkbox" style="width:4mm;">
              <xsl:call-template name="PopulateCheckbox">
                <xsl:with-param name="TargetNode" select="AdoptionFinalInd"/>
                <xsl:with-param name="BackupName">Form8839DataAdoptedChildAdoptionFinalInd</xsl:with-param>
              </xsl:call-template>
            </input>
          </td>
        </tr>
  </xsl:template>
  <xsl:template name="CreateBox">
    <xsl:param name="TargetNode"/>
    <xsl:param name="Ref1Desc"/>
    <xsl:param name="Ref1Node"/>
    <xsl:param name="Ref2Desc"/>
    <xsl:param name="Ref2Node"/>
    <xsl:param name="StaticText"/>
    <xsl:param name="InsertTextBefore"/>
    <xsl:param name="AmountBoxStyle"/>
    <xsl:param name="PopulateAsText"/>
    <xsl:param name="Number"/>
    <xsl:param name="NumberBoxStyle"/>
    <xsl:param name="NoNumberBox"/>
    <xsl:param name="Width">29mm</xsl:param>
    <xsl:param name="Height">5mm</xsl:param>
      <xsl:if test="not($NoNumberBox)">
      <div class="styLNRightNumBox">
        <xsl:attribute name="style">
          padding:3px 0px 0px 0px;
          border-right-width:0px;
          height:<xsl:value-of select="$Height"/>;
          <xsl:if test="$NumberBoxStyle"><xsl:value-of select="$NumberBoxStyle"/></xsl:if></xsl:attribute>
        <xsl:if test="$Number">
          <xsl:value-of select="$Number"/>
        </xsl:if>
      </div>
    </xsl:if>
    <div class="styLNAmountBox">
      <xsl:attribute name="style">
        width:<xsl:value-of select="$Width"/>;height:<xsl:value-of select="$Height"/>;
        border-right-width:0px;text-align:right;padding-right:2px;font-size:6pt;
        <xsl:choose><xsl:when test="$TargetNode"><xsl:choose><xsl:when test="$TargetNode/@referenceDocumentId">padding-top:3px;</xsl:when><xsl:otherwise>padding-top:6px;</xsl:otherwise></xsl:choose></xsl:when><xsl:otherwise>padding-top:2px;</xsl:otherwise></xsl:choose><xsl:if test="$AmountBoxStyle"><xsl:value-of select="$AmountBoxStyle"/></xsl:if></xsl:attribute>
      <xsl:choose>
        <xsl:when test="$TargetNode">
          <xsl:if test="$InsertTextBefore">
            <xsl:value-of select="$InsertTextBefore"/>
            <span style="width:2px;"/>
          </xsl:if>
          <xsl:choose>
            <xsl:when test="$PopulateAsText">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="$TargetNode"/>
              </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="$TargetNode"/>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
          <xsl:if test="$TargetNode/@referenceDocumentId">
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$TargetNode"/>
            </xsl:call-template>
          </xsl:if>
          <xsl:if test="$Ref1Node">
			  <xsl:variable name="NodeVal">
                <xsl:value-of select="$Ref1Node"/>
              </xsl:variable>
			  <xsl:choose>
				<xsl:when test="$NodeVal='1'">
					 <xsl:call-template name="LinkToLeftoverBooleanDataTableInline">
					  <xsl:with-param name="Desc">
						<xsl:value-of select="$Ref1Desc"/>
					  </xsl:with-param>
					  <xsl:with-param name="TargetNode" select="$Ref1Node"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:when test="$NodeVal='0'">
					 <xsl:call-template name="LinkToLeftoverBooleanDataTableInline">
					  <xsl:with-param name="Desc">
						<xsl:value-of select="$Ref1Desc"/>
					  </xsl:with-param>
					  <xsl:with-param name="TargetNode" select="$Ref1Node"/>
					</xsl:call-template>
				</xsl:when>
					 <xsl:otherwise>
					 <xsl:call-template name="LinkToLeftoverDataTableInline">
              <xsl:with-param name="Desc">
                <xsl:value-of select="$Ref1Desc"/>
              </xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Ref1Node"/>
            </xsl:call-template>
					 </xsl:otherwise>
			</xsl:choose>  
           
          </xsl:if>
          <xsl:if test="$Ref2Node">
            <xsl:call-template name="LinkToLeftoverDataTableInline">
              <xsl:with-param name="Desc">
                <xsl:value-of select="$Ref2Desc"/>
              </xsl:with-param>
              <xsl:with-param name="TargetNode" select="$Ref2Node"/>
            </xsl:call-template>
          </xsl:if>
        </xsl:when>
        <xsl:when test="$StaticText">
          <xsl:value-of select="$StaticText"/>
        </xsl:when>
      </xsl:choose>
    </div>
  </xsl:template>
  <xsl:template name="CreateBoxRow">
    <xsl:param name="Child1TargetNode"/>
    <xsl:param name="Child1Ref1Desc"/>
    <xsl:param name="Child1Ref2Desc"/>
    <xsl:param name="Child1Ref1Node"/>
    <xsl:param name="Child1Ref2Node"/>
    <xsl:param name="Child2TargetNode"/>
    <xsl:param name="Child2Ref1Desc"/>
    <xsl:param name="Child2Ref2Desc"/>
    <xsl:param name="Child2Ref1Node"/>
    <xsl:param name="Child2Ref2Node"/>
    <xsl:param name="Child3TargetNode"/>
    <xsl:param name="Child3Ref1Desc"/>
    <xsl:param name="Child3Ref2Desc"/>
    <xsl:param name="Child3Ref1Node"/>
    <xsl:param name="Child3Ref2Node"/>
    <xsl:param name="Child1Style">text-align:right;padding:5px 2px 0px 0px;</xsl:param>
    <xsl:param name="Child2Style">text-align:right;padding:5px 2px 0px 0px;</xsl:param>
    <xsl:param name="Child3Style">text-align:right;padding:5px 2px 0px 0px;</xsl:param>
    <xsl:param name="Child1StaticText"/>
    <xsl:param name="Child2StaticText"/>
    <xsl:param name="Child3StaticText"/>
    <xsl:param name="Height">5mm</xsl:param>
    <xsl:param name="Number"/>
    <xsl:param name="NumberStyle"/>
    <xsl:call-template name="CreateBox">
      <xsl:with-param name="AmountBoxStyle">
        <xsl:value-of select="$Child1Style"/>
      </xsl:with-param>
      <xsl:with-param name="TargetNode" select="$Child1TargetNode"/>
      <xsl:with-param name="Number">
        <xsl:value-of select="$Number"/>
      </xsl:with-param>
      <xsl:with-param name="NumberBoxStyle">
        <xsl:value-of select="$NumberStyle"/>
      </xsl:with-param>
      <xsl:with-param name="StaticText">
        <xsl:value-of select="$Child1StaticText"/>
      </xsl:with-param>
      <xsl:with-param name="Height">
        <xsl:value-of select="$Height"/>
      </xsl:with-param>
      <xsl:with-param name="Ref1Desc" select="$Child1Ref1Desc"/>
      <xsl:with-param name="Ref2Desc" select="$Child1Ref2Desc"/>
      <xsl:with-param name="Ref1Node" select="$Child1Ref1Node"/>
      <xsl:with-param name="Ref2Node" select="$Child1Ref2Node"/>
    </xsl:call-template>
        <xsl:call-template name="CreateBox">
      <xsl:with-param name="AmountBoxStyle">
        <xsl:value-of select="$Child2Style"/>
      </xsl:with-param>
      <xsl:with-param name="TargetNode" select="$Child2TargetNode"/>
      <xsl:with-param name="NoNumberBox">true</xsl:with-param>
      <xsl:with-param name="StaticText">
        <xsl:value-of select="$Child2StaticText"/>
      </xsl:with-param>
      <xsl:with-param name="Height">
        <xsl:value-of select="$Height"/>
      </xsl:with-param>
      <xsl:with-param name="Ref1Desc" select="$Child2Ref1Desc"/>
      <xsl:with-param name="Ref2Desc" select="$Child2Ref2Desc"/>
      <xsl:with-param name="Ref1Node" select="$Child2Ref1Node"/>
      <xsl:with-param name="Ref2Node" select="$Child2Ref2Node"/>
    </xsl:call-template>
    <xsl:call-template name="CreateBox">
      <xsl:with-param name="AmountBoxStyle">
        <xsl:value-of select="$Child3Style"/>
      </xsl:with-param>
      <xsl:with-param name="TargetNode" select="$Child3TargetNode"/>
      <xsl:with-param name="NoNumberBox">true</xsl:with-param>
      <xsl:with-param name="StaticText">
        <xsl:value-of select="$Child3StaticText"/>
      </xsl:with-param>
      <xsl:with-param name="Height">
        <xsl:value-of select="$Height"/>
      </xsl:with-param>
      <xsl:with-param name="Ref1Desc" select="$Child3Ref1Desc"/>
      <xsl:with-param name="Ref2Desc" select="$Child3Ref2Desc"/>
      <xsl:with-param name="Ref1Node" select="$Child3Ref1Node"/>
      <xsl:with-param name="Ref2Node" select="$Child3Ref2Node"/>
    </xsl:call-template>
    <xsl:call-template name="CreateBox">
      <xsl:with-param name="AmountBoxStyle">border-bottom-width:0px;</xsl:with-param>
      <xsl:with-param name="NumberBoxStyle">background-color:lightgrey;border-bottom-width:0px;</xsl:with-param>
      <xsl:with-param name="Height">
        <xsl:value-of select="$Height"/>
      </xsl:with-param>
    </xsl:call-template>
  </xsl:template>
  <xsl:template name="PopulatePartIITable">
    <xsl:param name="Child1"/>
    <xsl:param name="Child1Number"/>
    <xsl:param name="Child2"/>
    <xsl:param name="Child2Number"/>
    <xsl:param name="Child3"/>
    <xsl:param name="Child3Number"/>
    <!-- Headers -->
    <div class="styIRS8839LineItem" style="height:5mm;">
		<div class="styIRS8839LNLeftNumBox"/>
		<div class="styIRS8839LNDesc" style="width:49mm;height:100%;padding:0px 0px 0px 0px;border-color:blue;">
		 </div>
      <xsl:call-template name="CreateBoxRow">
        <xsl:with-param name="Child1StaticText">Child <xsl:value-of select="$Child1Number"/>
        </xsl:with-param>
        <xsl:with-param name="Child2StaticText">Child <xsl:value-of select="$Child2Number"/>
        </xsl:with-param>
        <xsl:with-param name="Child3StaticText">Child <xsl:value-of select="$Child3Number"/>
        </xsl:with-param>
        <xsl:with-param name="Child3Style">text-align:center;font-weight:bolder;</xsl:with-param>
        <xsl:with-param name="Child2Style">text-align:center;font-weight:bolder;</xsl:with-param>
        <xsl:with-param name="Child1Style">text-align:center;font-weight:bolder;</xsl:with-param>
        <xsl:with-param name="NumberStyle">border-width:0px 0px 1px 0px;</xsl:with-param>
      </xsl:call-template>
    </div>
    <!-- (2) ////////////////////////////////////////////////////-->
    <div class="styIRS8839LineItem"  style="height:8mm;">
      <div class="styIRS8839LNLeftNumBox">2</div>
      <div class="styIRS8839LNDesc" style="width:48mm;height:100%;padding:0px 0px 0px 0px;border-color:blue;">
        <div class="styIRS8839LNDesc" style="width:auto;height:100%;">
         <span style="float:left;padding-right:6mm;">Maximum adoption credit per</span>
          <span style="float:left;">child</span>
          <!--Dotted Line-->
		  <span class="styDotLn" style="float:right;padding-right:1mm;">........</span>
        </div>
      </div>
     <div class="styIRS8839LNDesc" style="height:100%;width:132mm;float:right;padding:0px 0px 0px 0px;">
        <xsl:call-template name="CreateBoxRow">
          <xsl:with-param name="Child3Style">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="Child2Style">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="Child1Style">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="NumberStyle">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="Height">3mm</xsl:with-param>
        </xsl:call-template>
        <xsl:choose>
          <xsl:when test="count($Form8839Data/AdoptedChild) > 1">
            <xsl:call-template name="CreateBoxRow">
              <xsl:with-param name="Child1TargetNode" select="$Child1/AdoptionCreditMaxPerChildAmt"/>
              <xsl:with-param name="Child1Ref1Desc">Maximum adoption credit per child</xsl:with-param>
              <xsl:with-param name="Child2TargetNode" select="$Child2/AdoptionCreditMaxPerChildAmt"/>
              <xsl:with-param name="Child2Ref1Desc">Maximum adoption credit per child</xsl:with-param>
              <xsl:with-param name="Child3TargetNode" select="$Child3/AdoptionCreditMaxPerChildAmt"/>
              <xsl:with-param name="Child3Ref1Desc">Maximum adoption credit per child</xsl:with-param>
              <xsl:with-param name="Number">2</xsl:with-param>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
         <xsl:call-template name="CreateBoxRow">
         <xsl:with-param name="Child1StaticText">$13,460</xsl:with-param>
          <xsl:with-param name="Child2StaticText">$13,460</xsl:with-param>
          <xsl:with-param name="Child3StaticText">$13,460</xsl:with-param>
          <xsl:with-param name="Number">2</xsl:with-param>
        </xsl:call-template>        
         </xsl:otherwise>
        </xsl:choose>
    </div>
    </div>
    <!-- (3) ////////////////////////////////////////////////////-->
    <div class="styIRS8839LineItem"  style="height:19mm;">
      <div class="styIRS8839LNLeftNumBox">3</div>
      <div class="styIRS8839LNDesc" style="width:47mm;height:100%;padding:0px 0px 0px 0px;">
        <div class="styIRS8839LNDesc" style="width:auto;height:auto;">
          Did you file Form 8839 for a<br/>
          prior year for the same child?<br/>
          <div style="padding:0px 0px 0px 0px;width:100%;height:100%;">
            <div class="styIRS8839LNDesc" style="padding:0px 0px 0px 0px;float:left;width:auto;">
              <!-- ++++++++++++++ No Checkbox +++++++++++++ -->
              <span style="width:1mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Child1/AdoptionCreditSameChildPYInd"/>
                </xsl:call-template>
                
                <input type="checkbox" class="styCkbox" alt="Checkbox for AdoptionCreditSameChildPYInd">    
                    <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Child1/AdoptionCreditSameChildPYInd"/>
                      <xsl:with-param name="BackupName">IRS8839Child<xsl:value-of select="$Child1Number"/>AdoptionCreditSameChildPYInd</xsl:with-param>
                    </xsl:call-template>
                </input>
              </span>
              <span style="width:2mm;"/>
              <label>
              <xsl:choose>
                <xsl:when test="$Child1/AdoptionCreditSameChildPYInd and (count($Form8839Data/AdoptedChild) &gt;= 1)">  
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Child1/AdoptionCreditSameChildPYInd"/>
                    <xsl:with-param name="BackupName">IRS8839Child<xsl:value-of select="$Child1Number"/>AdoptionCreditSameChildPYInd</xsl:with-param>
                  </xsl:call-template>
                 </xsl:when>
                <xsl:otherwise>
                  <xsl:attribute name="for">IRS8839Child<xsl:value-of select="$Child1Number"/>AdoptionCreditSameChildPYIndNo</xsl:attribute>
                  <xsl:attribute name="onclick">return false;</xsl:attribute>
                </xsl:otherwise> 
                </xsl:choose>                 
                <span class="styBoldText">No.</span> Enter -0-.<br/>
              </label>
             <!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
              <span style="width:1mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Child1/AdoptionCreditSameChildPYInd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox" alt="Checkbox for AdoptionCreditSameChildPYInd">
                 <xsl:choose>
                  <xsl:when test="$Child1/AdoptionCreditSameChildPYInd and (count($Form8839Data/AdoptedChild) &gt;= 1)">  
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Child1/AdoptionCreditSameChildPYInd"/>
                      <xsl:with-param name="BackupName">IRS8839Child<xsl:value-of select="$Child1Number"/>AdoptionCreditSameChildPYInd</xsl:with-param>
                    </xsl:call-template>
                   </xsl:when>
                  <xsl:otherwise>
                    <xsl:attribute name="id">IRS8839Child<xsl:value-of select="$Child1Number"/>AdoptionCreditSameChildPYIndYes</xsl:attribute>
                    <xsl:attribute name="onclick">return false;</xsl:attribute>
                  </xsl:otherwise>
                  </xsl:choose>  
                </input>
              </span>
              <span style="width:2mm;"/>
              <label>
              <xsl:choose>
                <xsl:when test="$Child1/AdoptionCreditSameChildPYInd and (count($Form8839Data/AdoptedChild) &gt;= 1)">
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Child1/AdoptionCreditSameChildPYInd"/>
                    <xsl:with-param name="BackupName">IRS8839Child<xsl:value-of select="$Child1Number"/>AdoptionCreditSameChildPYInd</xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:attribute name="for">IRS8839Child<xsl:value-of select="$Child1Number"/>AdoptionCreditSameChildPYIndYes</xsl:attribute>
                  <xsl:attribute name="onclick">return false;</xsl:attribute>
                </xsl:otherwise>
                </xsl:choose>
                <span class="styBoldText">Yes.</span> See instructions for<br/>
                <span style="width:10.5mm;"/>the amount to enter.
              </label>
            </div>
            <div class="styIRS8839LNDesc" style="padding:0px 0px 0px 3px;float:left;width:auto;height:auto;float:right;">
              <img src="{$ImagePath}/8834_Bracket_Md.gif" alt="SmallBracket"/>
            </div>
          </div>
        </div>
      </div>
      <div class="styIRS8839LNDesc" style="height:100%;width:132mm;float:right;padding:0px 0px 0px 0px;">
        <xsl:call-template name="CreateBoxRow">
          <xsl:with-param name="Child3Style">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="Child2Style">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="Child1Style">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="NumberStyle">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="Height">9mm</xsl:with-param>
        </xsl:call-template>
         <xsl:call-template name="CreateBoxRow">
          <xsl:with-param name="Child3Style">border-top-width:0px;border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="Child2Style">border-top-width:0px;border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="Child1Style">border-top-width:0px;border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="NumberStyle">border-top-width:0px;border-bottom-width:0px;</xsl:with-param>
        </xsl:call-template>
        <xsl:choose>
          <xsl:when test="count($Form8839Data/AdoptedChild) > 1">
            <xsl:call-template name="CreateBoxRow">
              <xsl:with-param name="Child1TargetNode" select="$Child1/AdoptionCreditPriorYearAmt"/>
              <xsl:with-param name="Child1Ref1Desc">Did you file Form 8839 for a prior year for the same child?</xsl:with-param>
              <xsl:with-param name="Child1Ref1Node" select="$Child1/AdoptionCreditSameChildPYInd"/>
              <xsl:with-param name="Child2TargetNode" select="$Child2/AdoptionCreditPriorYearAmt"/>
              <xsl:with-param name="Child2Ref1Desc">Did you file Form 8839 for a prior year for the same child?</xsl:with-param>
              <xsl:with-param name="Child2Ref1Node" select="$Child2/AdoptionCreditSameChildPYInd"/>
              <xsl:with-param name="Child3TargetNode" select="$Child3/AdoptionCreditPriorYearAmt"/>
              <xsl:with-param name="Child3Ref1Desc">Did you file Form 8839 for a prior year for the same child?</xsl:with-param>
              <xsl:with-param name="Child3Ref1Node" select="$Child3/AdoptionCreditSameChildPYInd"/>
              <xsl:with-param name="Number">3</xsl:with-param>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="CreateBoxRow">
              <xsl:with-param name="Child1TargetNode" select="$Child1/AdoptionCreditPriorYearAmt"/>
              <xsl:with-param name="Child2TargetNode" select="$Child2/AdoptionCreditPriorYearAmt"/>
              <xsl:with-param name="Child3TargetNode" select="$Child3/AdoptionCreditPriorYearAmt"/>
              <xsl:with-param name="Number">3</xsl:with-param>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>

      </div>
    </div>
    <!-- (4) ////////////////////////////////////////////////////-->
    <div class="styIRS8839LineItem" style="height:4mm;">
      <div class="styIRS8839LNLeftNumBox">4</div>
      <div class="styIRS8839LNDesc" style="width:48mm;height:100%;padding:0px 0px 0px 0px;">
        <div class="styIRS8839LNDesc" style="width:auto;height:auto;">
         <span style="float:left;">Subtract line 3 from line 2</span>
          <!--Dotted Line-->
          <span class="styDotLn" style="float:right;">..</span>	
        </div>
      </div>
      <div class="styIRS8839LNDesc" style="height:100%;width:132mm;float:right;padding:0px 0px 0px 0px;">
        <xsl:call-template name="CreateBoxRow">
          <xsl:with-param name="Child1TargetNode" select="$Child1/AdoptionNetAllowedTaxCreditAmt"/>
          <xsl:with-param name="Child2TargetNode" select="$Child2/AdoptionNetAllowedTaxCreditAmt"/>
          <xsl:with-param name="Child3TargetNode" select="$Child3/AdoptionNetAllowedTaxCreditAmt"/>
          <xsl:with-param name="Number">4</xsl:with-param>
        </xsl:call-template>
      </div>
    </div>
    <!-- (5) ////////////////////////////////////////////////////-->
    <div class="styIRS8839LineItem" style="height:23mm;">
      <div class="styIRS8839LNLeftNumBox">5</div>
      <div class="styIRS8839LNDesc" style="width:48mm;height:100%;padding:5px 0px 0px 0px;">
        <div class="styIRS8839LNDesc" style="width:auto;height:auto;">
          <b>Qualified adoption expenses</b>
          <br/>
         <span> (see instructions)</span>
          <!--Dotted Line-->
          <span class="styDotLn" style="float:right;">.....</span>
          <br/>
          <br/>
          <b>Caution.</b>
          <span style="width:15px;"/>Your<span style="width:15px;"/>qualified<br/>
          adoption expenses may not be<br/>
          equal to the adoption expenses<br/>
          you paid in 2016.
        </div>
      </div>
      <div class="styIRS8839LNDesc" style="height:100%;width:132mm;float:right;padding:0px 0px 0px 0px;">
        <xsl:call-template name="CreateBoxRow">
          <xsl:with-param name="Child3Style">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
          <xsl:with-param name="Child2Style">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
          <xsl:with-param name="Child1Style">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
          <xsl:with-param name="NumberStyle">border-bottom-width:0px;padding:0px 0px 0px 0px;</xsl:with-param>
          <xsl:with-param name="Height">4mm</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="CreateBoxRow">
          <xsl:with-param name="Child1TargetNode" select="$Child1/QualifiedAdoptionExpenseAmt"/>
          <xsl:with-param name="Child2TargetNode" select="$Child2/QualifiedAdoptionExpenseAmt"/>
          <xsl:with-param name="Child3TargetNode" select="$Child3/QualifiedAdoptionExpenseAmt"/>
          <xsl:with-param name="Number">5</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="CreateBoxRow">
          <xsl:with-param name="Child3Style">border-bottom-width:2px;</xsl:with-param>
          <xsl:with-param name="Child2Style">border-bottom-width:2px;</xsl:with-param>
          <xsl:with-param name="Child1Style">border-bottom-width:2px;</xsl:with-param>
          <xsl:with-param name="NumberStyle">border-bottom-width:2px;</xsl:with-param>
          <xsl:with-param name="Height">19mm</xsl:with-param>
        </xsl:call-template>
      </div>
    </div>
    <!-- (6) ////////////////////////////////////////////////////-->
    <div class="styIRS8839LineItem" style="height:5mm;">
      <div class="styIRS8839LNLeftNumBox">6</div>
      <div class="styIRS8839LNDesc" style="width:48mm;height:100%;padding:0px 0px 0px 0px;">
        <div class="styIRS8839LNDesc" style="width:auto;height:auto;">
          Enter the <span style="font-family:arial narrow;font-size:7.5pt">
            <b>smaller</b>
          </span> of line 4 or line 5
        </div>
      </div>
      <div class="styIRS8839LNDesc" style="height:100%;width:132mm;float:right;padding:0px 0px 0px 0px;">
        <xsl:call-template name="CreateBoxRow">
          <xsl:with-param name="Child1TargetNode" select="$Child1/AdoptionSmllrCreditOrExpnsAmt"/>
          <xsl:with-param name="Child2TargetNode" select="$Child2/AdoptionSmllrCreditOrExpnsAmt"/>
          <xsl:with-param name="Child3TargetNode" select="$Child3/AdoptionSmllrCreditOrExpnsAmt"/>
          <xsl:with-param name="Number">6</xsl:with-param>
        </xsl:call-template>
      </div>
    </div>
  </xsl:template>
  <xsl:template name="PopulatePartIIITable">
    <xsl:param name="Child1"/>
    <xsl:param name="Child1Number"/>
    <xsl:param name="Child2"/>
    <xsl:param name="Child2Number"/>
    <xsl:param name="Child3"/>
    <xsl:param name="Child3Number"/>
    <!-- Headers -->
    <div class="styIRS8839LineItem" style="height:5mm;">
	  <div class="styIRS8839LNLeftNumBox"/>
	  <div class="styIRS8839LNDesc" style="width:49mm;height:100%;padding:0px 0px 0px 0px;"/>
      <xsl:call-template name="CreateBoxRow">
        <xsl:with-param name="Child1StaticText">Child <xsl:value-of select="$Child1Number"/>
        </xsl:with-param>
        <xsl:with-param name="Child2StaticText">Child <xsl:value-of select="$Child2Number"/>
        </xsl:with-param>
        <xsl:with-param name="Child3StaticText">Child <xsl:value-of select="$Child3Number"/>
        </xsl:with-param>
        <xsl:with-param name="Child3Style">text-align:center;font-weight:bolder;</xsl:with-param>
        <xsl:with-param name="Child2Style">text-align:center;font-weight:bolder;</xsl:with-param>
        <xsl:with-param name="Child1Style">text-align:center;font-weight:bolder;</xsl:with-param>
        <xsl:with-param name="NumberStyle">border-width:0px 0px 1px 0px;</xsl:with-param>
      </xsl:call-template>
    </div>
    <!-- (17) ////////////////////////////////////////////////////-->  
   <div class="styIRS8839LineItem"  style="height:8mm;">
      <div class="styIRS8839LNDesc" style="width:48.5mm;height:100%;padding:12px 0px 0px 0px;border-color:blue;">
         <div class="styIRS8839LNLeftNumBox">17</div>
               <div class="styIRS8839LNDesc" style="width:auto;height:auto;">Maximum exclusion per child</div>
        </div>
      <div class="styIRS8839LNDesc" style="height:100%;width:132mm;float:right;padding:0px 0px 0px 0px;">      
        <xsl:call-template name="CreateBoxRow">
          <xsl:with-param name="Child3Style">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="Child2Style">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="Child1Style">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="NumberStyle">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="Height">3mm</xsl:with-param>
        </xsl:call-template>
        <xsl:choose>
          <xsl:when test="count($Form8839Data/AdoptedChild) > 1">
            <xsl:call-template name="CreateBoxRow">
              <xsl:with-param name="Child1TargetNode" select="$Child1/EmployerAdoptionExclMaxChldAmt"/>
              <xsl:with-param name="Child1Ref1Desc">Maximum exclusion per child</xsl:with-param>
              <xsl:with-param name="Child2TargetNode" select="$Child2/EmployerAdoptionExclMaxChldAmt"/>
              <xsl:with-param name="Child2Ref1Desc">Maximum exclusion per child</xsl:with-param>
              <xsl:with-param name="Child3TargetNode" select="$Child3/EmployerAdoptionExclMaxChldAmt"/>
              <xsl:with-param name="Child3Ref1Desc">Maximum exclusion per child</xsl:with-param>
              <xsl:with-param name="Number">17</xsl:with-param>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
         <xsl:call-template name="CreateBoxRow">
         <xsl:with-param name="Child1StaticText">$13,460</xsl:with-param>
          <xsl:with-param name="Child2StaticText">$13,460</xsl:with-param>
          <xsl:with-param name="Child3StaticText">$13,460</xsl:with-param>
          <xsl:with-param name="Number">17</xsl:with-param>
        </xsl:call-template>        
         </xsl:otherwise>
        </xsl:choose>
      </div>
    </div>
    <!-- (18) ////////////////////////////////////////////////////-->
    <div class="styIRS8839LineItem" style="height:23mm;">
      <div class="styIRS8839LNLeftNumBox">18</div>
      <div class="styIRS8839LNDesc" style="width:48.5mm;height:100%;padding:0px 0px 0px 0px;">
        <div class="styIRS8839LNDesc" style="width:auto;height:auto;">
          Did you receive employer-provided
          adoption benefits for a
          prior year for the same child?
          <div style="padding:0px 0px 0px 0px;width:100%;height:100%;">
            <div class="styIRS8839LNDesc" style="padding:0px 0px 0px 0px;float:left;width:auto;">
              <!-- ++++++++++++++ No Checkbox +++++++++++++ -->
              <span style="width:1mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Child1/EmployerAdptnBnftSameChldPYInd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox" alt="Checkbox for EmployerAdptnBnftSameChldPYInd">               
                     <xsl:call-template name="PopulateNoCheckbox">
                      <xsl:with-param name="TargetNode" select="$Child1/EmployerAdptnBnftSameChldPYInd"/>
                      <xsl:with-param name="BackupName">IRS8839Child<xsl:value-of select="$Child1Number"/>EmployerAdptnBnftSameChldPYInd</xsl:with-param>
                    </xsl:call-template>
                </input>
              </span>
              <span style="width:2mm;"/>
              <label>
              <xsl:choose>
                <xsl:when test="$Child1/EmployerAdptnBnftSameChldPYInd and (count($Form8839Data/AdoptedChild) &gt;= 1)">
                  <xsl:call-template name="PopulateLabelNo">
                    <xsl:with-param name="TargetNode" select="$Child1/EmployerAdptnBnftSameChldPYInd"/>
                    <xsl:with-param name="BackupName">IRS8839Child<xsl:value-of select="$Child1Number"/>EmployerAdptnBnftSameChldPYInd</xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:attribute name="for">IRS8839Child<xsl:value-of select="$Child1Number"/>EmployerAdptnBnftSameChldPYIndNo</xsl:attribute>
                  <xsl:attribute name="onclick">return false;</xsl:attribute>
                </xsl:otherwise>
                </xsl:choose>
                <span class="styBoldText">No.</span> Enter -0-.<br/>
              </label>
              <!-- ++++++++++++++ Yes Checkbox +++++++++++++ -->
              <span style="width:1mm;"/>
              <span>
                <xsl:call-template name="PopulateSpan">
                  <xsl:with-param name="TargetNode" select="$Child1/EmployerAdptnBnftSameChldPYInd"/>
                </xsl:call-template>
                <input type="checkbox" class="styCkbox" alt="Checkbox for EmployerAdptnBnftSameChldPYInd">
                <xsl:choose>
                  <xsl:when test="$Child1/EmployerAdptnBnftSameChldPYInd and (count($Form8839Data/AdoptedChild) &gt;= 1)">
                    <xsl:call-template name="PopulateYesCheckbox">
                      <xsl:with-param name="TargetNode" select="$Child1/EmployerAdptnBnftSameChldPYInd"/>
                      <xsl:with-param name="BackupName">IRS8839Child<xsl:value-of select="$Child1Number"/>EmployerAdptnBnftSameChldPYInd</xsl:with-param>
                    </xsl:call-template>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:attribute name="id">IRS8839Child<xsl:value-of select="$Child1Number"/>EmployerAdptnBnftSameChldPYIndYes</xsl:attribute>
                    <xsl:attribute name="onclick">return false;</xsl:attribute>
                  </xsl:otherwise>
                  </xsl:choose>
                </input>
              </span>
              <span style="width:2mm;"/>
              <label>
              <xsl:choose>
                <xsl:when test="$Child1/EmployerAdptnBnftSameChldPYInd and (count($Form8839Data/AdoptedChild) &gt;= 1)">
                  <xsl:call-template name="PopulateLabelYes">
                    <xsl:with-param name="TargetNode" select="$Child1/EmployerAdptnBnftSameChldPYInd"/>
                    <xsl:with-param name="BackupName">IRS8839Child<xsl:value-of select="$Child1Number"/>EmployerAdptnBnftSameChldPYInd</xsl:with-param>
                  </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:attribute name="for">IRS8839Child<xsl:value-of select="$Child1Number"/>EmployerAdptnBnftSameChldPYIndYes</xsl:attribute>
                  <xsl:attribute name="onclick">return false;</xsl:attribute>
                </xsl:otherwise>
                </xsl:choose>
                <span class="styBoldText">Yes.</span> See instructions for<br/>
                <span style="width:10.5mm;"/>the amount to enter.
              </label>
            </div>
            <div class="styIRS8839LNDesc" style="padding:0px 0px 0px 3px;float:left;width:auto;height:9mm;float:right;">
              <img src="{$ImagePath}/8834_Bracket_Md.gif" alt="SmallBracket"/>
            </div>
          </div>
        </div>
      </div>
      <div class="styIRS8839LNDesc" style="height:100%;width:132mm;float:right;padding:0px 0px 0px 0px;">
        <xsl:call-template name="CreateBoxRow">
          <xsl:with-param name="Child3Style">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="Child2Style">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="Child1Style">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="NumberStyle">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="Height">13.5mm</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="CreateBoxRow">
          <xsl:with-param name="Child3Style">border-top-width:0px;border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="Child2Style">border-top-width:0px;border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="Child1Style">border-top-width:0px;border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="NumberStyle">border-top-width:0px;border-bottom-width:0px;</xsl:with-param>
        </xsl:call-template>
        <xsl:choose>
          <xsl:when test="count($Form8839Data/AdoptedChild) > 1">
            <xsl:call-template name="CreateBoxRow">
              <xsl:with-param name="Child1TargetNode" select="$Child1/EmployerAdoptionBenefitsPYAmt"/>
              <xsl:with-param name="Child1Ref1Desc">Did you receive employer provided adoption benefits for a prior year for the same child</xsl:with-param>
              <xsl:with-param name="Child1Ref1Node" select="$Child1/EmployerAdptnBnftSameChldPYInd"/>
              <xsl:with-param name="Child2TargetNode" select="$Child2/EmployerAdoptionBenefitsPYAmt"/>
              <xsl:with-param name="Child2Ref1Desc">Did you receive employer provided adoption benefits for a prior year for the same child</xsl:with-param>
              <xsl:with-param name="Child2Ref1Node" select="$Child2/EmployerAdptnBnftSameChldPYInd"/>
              <xsl:with-param name="Child3TargetNode" select="$Child3/EmployerAdoptionBenefitsPYAmt"/>
              <xsl:with-param name="Child3Ref1Desc">Did you receive employer provided adoption benefits for a prior year for the same child</xsl:with-param>
              <xsl:with-param name="Child3Ref1Node" select="$Child3/EmployerAdptnBnftSameChldPYInd"/>
              <xsl:with-param name="Number">18</xsl:with-param>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <xsl:call-template name="CreateBoxRow">
              <xsl:with-param name="Child1TargetNode" select="$Child1/EmployerAdoptionBenefitsPYAmt"/>
              <xsl:with-param name="Child2TargetNode" select="$Child2/EmployerAdoptionBenefitsPYAmt"/>
              <xsl:with-param name="Child3TargetNode" select="$Child3/EmployerAdoptionBenefitsPYAmt"/>
              <xsl:with-param name="Number">18</xsl:with-param>
            </xsl:call-template>
          </xsl:otherwise>
        </xsl:choose>

      </div>
    </div>
    <!-- (19) ////////////////////////////////////////////////////-->
    <div class="styIRS8839LineItem" style="height:4mm;">
      <div class="styIRS8839LNLeftNumBox">19</div>
      <div class="styIRS8839LNDesc" style="width:48.5mm;height:100%;padding:0px 0px 0px 0px;">
        <div class="styIRS8839LNDesc" style="width:auto;height:auto;">
          Subtract line 18 from line 17        
        </div>
      </div>
      <div class="styIRS8839LNDesc" style="height:100%;width:132mm;float:right;padding:0px 0px 0px 0px;">
        <xsl:call-template name="CreateBoxRow">
          <xsl:with-param name="Child1TargetNode" select="$Child1/EmployerAdptnBnftLessAllwdAmt"/>
          <xsl:with-param name="Child2TargetNode" select="$Child2/EmployerAdptnBnftLessAllwdAmt"/>
          <xsl:with-param name="Child3TargetNode" select="$Child3/EmployerAdptnBnftLessAllwdAmt"/>
          <xsl:with-param name="Number">19</xsl:with-param>
        </xsl:call-template>
      </div>
    </div>
    <!-- (20) ////////////////////////////////////////////////////-->
    <div class="styIRS8839LineItem" style="height:18mm;">
      <div style="height:100%;padding:7px 0px 0px 0px;">
      <div class="styIRS8839LNLeftNumBox">20</div>
      <div class="styIRS8839LNDesc" style="width:48.5mm;height:100%;padding:0px 0px 0px 0px;">
        <div class="styIRS8839LNDesc" style="width:auto;height:auto;">
          Employer-provided adoption<br/>
          benefits you received in 2016.<br/>
          This amount should be shown<br/>
          in box 12 of your 2016 Form(s)<br/>
          W-2 with code <b>T</b>
          <!--Dotted Line-->
         <span class="styDotLn" style="float:right;padding-right:1mm;padding-left:3mm;">.....</span>
        </div>
      </div></div>
      <div class="styIRS8839LNDesc" style="height:100%;width:132mm;float:right;padding:0px 0px 0px 0px;border-color:black;">
        <xsl:call-template name="CreateBoxRow">
          <xsl:with-param name="Child3Style">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="Child2Style">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="Child1Style">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="NumberStyle">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="Height">13.8mm</xsl:with-param>
        </xsl:call-template>        
        <xsl:call-template name="CreateBoxRow" >      
          <xsl:with-param name="Child1TargetNode" select="$Child1/EmployerAdoptionBnftPerChldAmt"/>
           <xsl:with-param name="Child1Style">padding:3px 0px 0px 0px;border-bottom-width:2px;font-size:5.5pt;</xsl:with-param>
             <xsl:with-param name="NumberStyle">border-bottom-width:2px;</xsl:with-param>
          <xsl:with-param name="Child1Ref1Desc">Employer Adoption Benefit Excl Prior Year Amount - Child <xsl:value-of select="$Child1Number"/>
          </xsl:with-param>
          <xsl:with-param name="Child1Ref2Desc">Employer Adoption Benefit Excl Prior Year Code - Child <xsl:value-of select="$Child1Number"/>
          </xsl:with-param>
          <xsl:with-param name="Child1Ref1Node" select="$Child1/EmployerAdoptionBnftPerChldAmt/@employerAdoptionBnftExclPYAmt"/>
          <xsl:with-param name="Child1Ref2Node" select="$Child1/EmployerAdoptionBnftPerChldAmt/@employerAdoptionBnftExclPYCd"/>
          <xsl:with-param name="Child2TargetNode" select="$Child2/EmployerAdoptionBnftPerChldAmt"/>
           <xsl:with-param name="Child2Style">padding:3px 0px 0px 0px;border-bottom-width:2px;font-size:5.5pt;</xsl:with-param>            
          <xsl:with-param name="Child2Ref1Desc">Employer Adoption Benefit Excl Prior Year Amount - Child <xsl:value-of select="$Child2Number"/>
          </xsl:with-param>
          <xsl:with-param name="Child2Ref2Desc">Employer Adoption Benefit Excl Prior Year Code - Child <xsl:value-of select="$Child2Number"/>
          </xsl:with-param>
          <xsl:with-param name="Child2Ref1Node" select="$Child2/EmployerAdoptionBnftPerChldAmt/@employerAdoptionBnftExclPYAmt"/>
          <xsl:with-param name="Child2Ref2Node" select="$Child2/EmployerAdoptionBnftPerChldAmt/@employerAdoptionBnftExclPYCd"/>
          <xsl:with-param name="Child3TargetNode" select="$Child3/EmployerAdoptionBnftPerChldAmt"/>
           <xsl:with-param name="Child3Style">padding:3px 0px 0px 0px;border-bottom-width:2px;font-size:5.5pt;</xsl:with-param>
          <xsl:with-param name="Child3Ref1Desc">Employer Adoption Benefit Excl Prior Year Amount - Child <xsl:value-of select="$Child3Number"/>
          </xsl:with-param>
          <xsl:with-param name="Child3Ref2Desc">Employer Adoption Benefit Excl Prior Year Code - Child <xsl:value-of select="$Child3Number"/>
          </xsl:with-param>
          <xsl:with-param name="Child3Ref1Node" select="$Child3/EmployerAdoptionBnftPerChldAmt/@employerAdoptionBnftExclPYAmt"/>
          <xsl:with-param name="Child3Ref2Node" select="$Child3/EmployerAdoptionBnftPerChldAmt/@employerAdoptionBnftExclPYCd"/>          
          <xsl:with-param name="Number">20</xsl:with-param>          
        </xsl:call-template>
      </div>
    </div>    
  </xsl:template>
  <xsl:template name="PopulatePartIIILine22">
    <xsl:param name="Child1"/>
    <xsl:param name="Child1Number"/>
    <xsl:param name="Child2"/>
    <xsl:param name="Child2Number"/>
    <xsl:param name="Child3"/>
    <xsl:param name="Child3Number"/>
    <!-- Headers -->
    <div class="styIRS8839LineItem" style="height:5mm;">
      <div class="styIRS8839LNLeftNumBox"/>
      <div class="styIRS8839LNDesc" style="width:49mm;height:100%;padding:0px 0px 0px 0px;"/>
      <xsl:call-template name="CreateBoxRow">
        <xsl:with-param name="Child1StaticText">Child <xsl:value-of select="$Child1Number"/>
        </xsl:with-param>
        <xsl:with-param name="Child2StaticText">Child <xsl:value-of select="$Child2Number"/>
        </xsl:with-param>
        <xsl:with-param name="Child3StaticText">Child <xsl:value-of select="$Child3Number"/>
        </xsl:with-param>
        <xsl:with-param name="Child3Style">
          text-align:center;font-weight:bolder;
          <xsl:if test="$Child1Number = 1">
            border-top-width:1px;
          </xsl:if>
        </xsl:with-param>
        <xsl:with-param name="Child2Style">
          text-align:center;font-weight:bolder;
          <xsl:if test="$Child1Number = 1">
            border-top-width:1px;
          </xsl:if>
        </xsl:with-param>
        <xsl:with-param name="Child1Style">
          text-align:center;font-weight:bolder;
          <xsl:if test="$Child1Number = 1">
            border-top-width:1px;
          </xsl:if>
        </xsl:with-param>
        <xsl:with-param name="NumberStyle">border-width:0px 0px 1px 0px;</xsl:with-param>
      </xsl:call-template>
    </div>
    <!-- (22) ////////////////////////////////////////////////////-->
    <div class="styIRS8839LineItem" style="height:18mm;">
      <div class="styIRS8839LNLeftNumBox">22</div>
      <div class="styIRS8839LNDesc" style="width:48mm;height:100%;padding:5px 0px 0px 0px;">
        <div class="styIRS8839LNDesc" style="width:auto;height:auto;">
          Enter the <b>smaller</b> of line 19 or<br/>
          line 20. But if the child was a<br/>
          child with special needs and the<br/>
          adoption became final in 2016,<br/>
          enter the amount from line 19<br/>
        </div>
      </div>
      <div class="styIRS8839LNDesc" style="height:100%;width:132mm;float:right;padding:0px 0px 0px 0px;">
        <xsl:call-template name="CreateBoxRow">
          <xsl:with-param name="Child3Style">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="Child2Style">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="Child1Style">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="NumberStyle">border-bottom-width:0px;</xsl:with-param>
          <xsl:with-param name="Height">13mm</xsl:with-param>
        </xsl:call-template>
        <xsl:call-template name="CreateBoxRow">
          <xsl:with-param name="Child1TargetNode" select="$Child1/AllwdTaxCrOrEmplrAdptnBnftAmt"/>
           <xsl:with-param name="Child1Style">border-bottom-width:2px;</xsl:with-param>
             <xsl:with-param name="NumberStyle">border-bottom-width:2px;</xsl:with-param>
          <xsl:with-param name="Child2TargetNode" select="$Child2/AllwdTaxCrOrEmplrAdptnBnftAmt"/>
            <xsl:with-param name="Child2Style">border-bottom-width:2px;</xsl:with-param>
          <xsl:with-param name="Child3TargetNode" select="$Child3/AllwdTaxCrOrEmplrAdptnBnftAmt"/>
           <xsl:with-param name="Child3Style">border-bottom-width:2px;</xsl:with-param>
          <xsl:with-param name="Number">22</xsl:with-param>
        </xsl:call-template>
      </div>
    </div>   
  </xsl:template>
</xsl:stylesheet>
