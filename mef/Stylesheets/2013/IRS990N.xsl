<?xml version="1.0" encoding="UTF-8"?>
<!-- 03/06/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:include href="PopulateTemplate.xsl"/>
<xsl:include href="CommonPathRef.xsl"/>
<xsl:include href="AddHeader.xsl"/>
<xsl:include href="AddOnTable.xsl"/>
<xsl:include href="IRS990NStyle.xsl"/>

<xsl:output method="html" indent="yes"/>
<xsl:strip-space elements="*"/>

<!-- Defines the stage of the data, e.g. original or latest -->
<xsl:param name="IRS990NData" select="$RtnDoc/IRS990N"/>
<xsl:template match="/">

<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
<head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>

<title>
	<xsl:call-template name="FormTitle">
		<xsl:with-param name="RootElement" select="local-name($IRS990NData)"/>
	</xsl:call-template>
</title>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Cache-Control" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>
<meta http-equiv="Cache-Control" content="private"/>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="Description" content="IRS Form 990-EZ"/>
<META name="GENERATOR" content="IBM WebSphere Studio"/>

<script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
<xsl:call-template name="InitJS"/>
<style type="text/css">
  <xsl:if test="not($Print) or $Print=''">
    <xsl:call-template name="IRS990NStyle"/>  
    <xsl:call-template name="AddOnStyle"/>  
  </xsl:if>
</style>

<xsl:call-template name="GlobalStylesForm"/>
</head>
<body class="styBodyClass">
<form name="IRS990N">
<!--   BEGIN WARNING LINE  -->
<xsl:call-template name="DocumentHeader"/>
<!--   END WARNING LINE   -->

<!--   BEGIN FORM HEADER   -->
<div class="styBB" style="width:187mm; height:22.75mm;">
  <div class="styFNBox" style="width:33mm;height:22.75mm; border-right-width: 2px">
    <div style="padding-top:1mm;">
      Form<span class="styFormNumber">990-N</span>
      <xsl:call-template name="SetFormLinkInline">
        <xsl:with-param name="TargetNode" select="$IRS990NData"/>
        <!--<xsl:with-param name="TabOrder" select="1"/>-->
      </xsl:call-template>
    </div>

    <div style="padding-top:6mm;">
      <span class="styAgency">Department of the Treasury</span><br/>
      <span class="styAgency">Internal Revenue Service</span>
    </div>
   </div>
   <div class="styFTBox" style="width:122mm;height:22.75mm;padding-top:2mm;">
    <div class="styMainTitle">Electronic Notice (e-Postcard)</div>
    <div class="styFBT" style="font-size: 7pt; font-weight: normal; margin-top: 0px">
      <img src="{$ImagePath}/990N_Bullet_Sm.gif" alt="bullet"/><span style="width:1mm"/>For Tax-Exempt Organizations not Required to File Form 990 or 990-EZ.<span style="width: 5mm"/>
    </div>
  </div>
  <div class="styTYBox" style="width:32mm;height:22.75mm;">
    <div class="styOMB" style="height:4mm;width:32mm;">OMB No. 1545-NNNN</div>
    <div class="styTY">
      20<span class="styTYColor">13</span>
    </div>
    <div style="width:32mm;height:8.25mm; background-color: black; color: white; font-size: 7pt;padding-top: 1mm;font-weight: bold">Open to Public<br/>Inspection</div>
  </div>
</div>
<!--   END FORM HEADER   -->
<!--Box A -->
<div class="styComType" style="width:187mm;border-bottom-width: 0px; font-size: 7pt">
  <div class="styBoldText" style="height:3mm;width:4mm;float:left;clear:none;">A</div>
  <div class="styBoldText" style="height:3mm;width:183mm;float:left;clear:none;">For the 
  	<span style="width:8mm;">
   		<xsl:call-template name="PopulateReturnHeaderTaxYear"/>
  	</span>
    	calendar year, or tax year beginning 
    	<span style="width:18mm;">
      		<xsl:call-template name="PopulateReturnHeaderTaxPeriodBeginDate"/>
    	</span>, and ending 
    	<span style="width:18mm;">
      		<xsl:call-template name="PopulateReturnHeaderTaxPeriodEndDate"/>
   	</span>
  </div>
</div>

<!--Box B -->        
<div style="width:187mm;float:left;clear:left;">
	<div style="width:47mm;height:37mm;float:left;clear:left;">
          <div class="styComType" style="width:47mm;border-top-width:1px;border-bottom-width: 0px">
            <div class="styBoldText" style="height:3mm;width:4mm;float:left;clear:none;font-size: 7pt">B</div>
            <div class="styNormalText" style="height:3mm;width:39mm;padding-top: .5mm;float:left;clear:none;">Check if applicable:</div>
	   </div>
       <!-- Final Return - Terminated, Out of Business -->   
       <div class="styComType" style="width:47mm;border-bottom:0px;padding-left:0mm;"> 
            <div style="width:47mm;">
               <input type="checkbox" class="styIRS990NCkBox">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$IRS990NData/FinalReturnInd"/>
                  <xsl:with-param name="BackupName">IRS990NTermination</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabel">
                  <xsl:with-param name="TargetNode" select="$IRS990NData/FinalReturnInd"/>
                  <xsl:with-param name="BackupName">IRS990NTermination</xsl:with-param>
                </xsl:call-template>
               Termination</label>
            </div>
       </div>
       <!-- Gross Receipts -->   
       <div class="styComType" style="width:47mm;border-bottom:0px;"> 
           <div style="width:47mm;">
              <input type="checkbox" class="styIRS990NCkBox" style="height:4mm;width:4mm;">
                <xsl:call-template name="PopulateCheckbox">
                  <xsl:with-param name="TargetNode" select="$IRS990NData/GrossReceiptsLimitInd"/>
                  <xsl:with-param name="BackupName">GrossReceiptsTest</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
              	<xsl:call-template name="PopulateLabel">
              		<xsl:with-param name="TargetNode" select="$IRS990NData/GrossReceiptsLimitInd"/>
              		<xsl:with-param name="BackupName">GrossReceiptsTest</xsl:with-param>
					</xsl:call-template>
					Gross receipts are normally <br/>
					<span style="width:6.5mm;"/>$50,000 or less
              </label>
            </div>
            </div>
         
          <!-- Box B BLANK LINE -->   
          <div class="styComType" style="width:47mm;border-bottom:0px;"> <!-- padding-top:1.5mm--> 
           <div style="width:42mm;">
           </div>
	   </div>
	   <!--Box B End-->    
        
        <!-- Box E -->
      <div style="word-wrap:break-word; width:47mm;border-top:2px solid black;border-bottom:0px solid white; ">
      <span class="styBoldText" style="width:4mm;">E </span>Website Address: <br/>
      <span style="width: 3mm"/>
      <span style="text-align: left; width:33mm">
        <xsl:call-template name="PopulateText">
        <xsl:with-param name="TargetNode" select="$IRS990NData/WebsiteAddressTxt"/>
        </xsl:call-template>
      </span>
      </div>
     </div>
          
          
          <!--Box C -->
        	<div class="styLblNameAddr" style="width:98mm;height:52mm;border-bottom-width: 1px;">
                   <div class="styNameAddr" style="width:97mm;height:10.5mm;border-left-width:1px;">
            		<b>C</b> Name of organization<br/>
            <span class="stySmallText" style="padding-left:2mm;">
                <xsl:call-template name="PopulateReturnHeaderFiler">
                	<xsl:with-param name="TargetNode">BusinessNameLine1</xsl:with-param>
                </xsl:call-template><br/>
          	   <xsl:call-template name="PopulateReturnHeaderFiler">
          	   	<xsl:with-param name="TargetNode">BusinessNameLine2</xsl:with-param>
          	   </xsl:call-template><br/>          	   
                <xsl:call-template name="PopulateReturnHeaderFiler">
                <xsl:with-param name="TargetNode">InCareOfName</xsl:with-param>
                </xsl:call-template>
           </span>
          </div>
         
          <xsl:for-each select="$IRS990NData/DoingBusinessAsName">
          		<div class="styNameAddr" style="width:97mm;height:8mm;border-left-width:1px;">
					<span style="width:2mm;"/>Doing Business As Name<br/>
					<span class="stySmallText" style="padding-left:2mm;">
               			<xsl:call-template name="PopulateText">
   	 					<xsl:with-param name="TargetNode" select="BusinessNameLine1"/>
    		 			</xsl:call-template>
						<br/>
					    <xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" select="BusinessNameLine2"/>
						</xsl:call-template>
					</span>
				</div>
          </xsl:for-each>

          <div class="styNameAddr" style="width:97mm;height:10mm;border-left-width:1px;">
            <span style="width: 96mm; height: 10mm">
              <span style="width: 96mm;padding-left: 2mm"> Number and street (or P. O. box, if mail is not delivered to street address)</span>
                <span class="stySmallText" style="width: 96mm;padding-left:2mm;">
                	<xsl:call-template name="PopulateReturnHeaderFiler">
                		<xsl:with-param name="TargetNode">AddressLine1</xsl:with-param>
                	</xsl:call-template>      
                	<br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                	<xsl:with-param name="TargetNode">AddressLine2</xsl:with-param>
                </xsl:call-template>
    		</span>
            </span>
            <!-- Remove Room/Suite Per Juan Godstrom's e-mailed December 18, 2007 reference to ITAMS ticket 4458993 
            <span style="border-style: solid; border-left-width: 1px; border-right-width: 0px; border-top-width: 0px; border-bottom-width: 0px; width: 14mm; height: 10mm">Room/suite</span>
          -->
          </div>
          <div class="styNameAddr" style="border-bottom-width:0px;width:97mm;height:9.5mm;border-left-width:1px">
           <span style="width: 1mm"/> City or town, state or country, and ZIP + 4<br/>
              <span style="padding-left:2mm;" class="stySmallText">
                <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param></xsl:call-template>
                <br/>
          <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">Country</xsl:with-param><xsl:with-param name="MainForm">true</xsl:with-param></xsl:call-template>
                </span>
          </div>
        </div>
        
        <!-- Box D -->
        <div class="styEINDateAssets" style="width:42mm;height:9mm;border-top-width: 1px"><span class="styBoldText">D Employer ID number</span><br/><br/><span style="width: 3mm"/><span class="styEINFld" style="">
          <xsl:call-template name="PopulateReturnHeaderFiler">
          	<xsl:with-param name="EINChanged">true</xsl:with-param><xsl:with-param name="TargetNode">EIN</xsl:with-param></xsl:call-template>
</span></div>
      </div>
      
      <!--Bottom Left Blank Box E -->        
      <div style="width:187mm;border-bottom:1px solid black;">
	<div style="width:47mm;height:30.25mm;float:left;clear:left;"/>
	
<!--Box F -->
       <div class="styLblNameAddr" style="width:98mm;height:40mm;border-top-width:2px;border-bottom-width:none;">
       <div class="styNameAddr" style="width:97mm;height:8mm;border-left-width:0px;border-top-width:None;">
            <b>F</b> Name of Principal Officer:<br/>
            <span class="stySmallText" style="padding-left:2mm;">
            <xsl:choose>
			<xsl:when test="$IRS990NData/PersonNm">
            			<xsl:call-template name="PopulateText">
   	 				<xsl:with-param name="TargetNode" select="$IRS990NData/PersonNm"/>
    		  		</xsl:call-template>
    	    		 </xsl:when>
    	    		 <xsl:otherwise>
                		<xsl:call-template name="PopulateText">
   	 				<xsl:with-param name="TargetNode" select="$IRS990NData/BusinessName/BusinessNameLine1"/>
    		 		 </xsl:call-template>
		  		<br/>
          	   		<xsl:call-template name="PopulateText">
   	 				<xsl:with-param name="TargetNode" select="$IRS990NData/BusinessName/BusinessNameLine2"/>
    		 		</xsl:call-template>
    	    		</xsl:otherwise>
    	    </xsl:choose> 
           </span>
          </div>

          <div class="styNameAddr" style="width:97mm;height:11mm;border-left-width:0px;">
              <span style="width: 96.5mm;padding-left: 2mm;"> Number and street (or P. O. box, if mail is not delivered to street address) of Principal Officer</span>
              <span class="stySmallText" style="width: 96.5m;padding-left:2mm;">
              	<xsl:if test="$IRS990NData/USAddress">
                  		<xsl:call-template name="PopulateText">
                    		<xsl:with-param name="TargetNode" select="$IRS990NData/USAddress/AddressLine1"/>
                  		</xsl:call-template>
                  		<xsl:if test="normalize-space($IRS990NData/USAddress/AddressLine2)!=''">    
                    		<br/>
                    		<xsl:call-template name="PopulateText">
                      			<xsl:with-param name="TargetNode" select="$IRS990NData/USAddress/AddressLine2"/>
                    		</xsl:call-template>          
                  		</xsl:if>
                	</xsl:if>
                	<xsl:if test="$IRS990NData/ForeignAddress">
                  		<xsl:call-template name="PopulateText">
                    		<xsl:with-param name="TargetNode" select="$IRS990NData/ForeignAddress/AddressLine1"/>
                  		</xsl:call-template>
                  		<xsl:if test="normalize-space($IRS990NData/ForeignAddress/AddressLine2)!=''">    
                    		<br/>
                    		<xsl:call-template name="PopulateText">
                      			<xsl:with-param name="TargetNode" select="$IRS990NData/ForeignAddress/AddressLine2"/>
                    		</xsl:call-template>          
                  		</xsl:if>
                	</xsl:if>
    		   </span>
          </div>

          <div class="styNameAddr" style="border-bottom-width:0px;width:98mm;height:18mm;padding-top:0mm;border-left-width:0px">
           <span style="width: 1mm"/> City or town, state or country, and ZIP + 4<br/>
              <!-- Choose between Shareholder US or Foreign Address -->
              <span style="width: 2mm"/> 
              	<xsl:if test="$IRS990NData/USAddress">
                		<div style=" font-family:'verdana';font-size:7pt;">
                			<xsl:call-template name="PopulateText">
                  				<xsl:with-param name="TargetNode" select="$IRS990NData/USAddress/City"/>
                			</xsl:call-template>, 
                			<xsl:call-template name="PopulateText">
                  				<xsl:with-param name="TargetNode" select="$IRS990NData/USAddress/State"/>
                			</xsl:call-template><span style="width:1mm;"/> 
                			<xsl:call-template name="PopulateText">
                  				<xsl:with-param name="TargetNode" select="$IRS990NData/USAddress/ZIPCode"/>
                			</xsl:call-template>
                		</div>       
              	</xsl:if>
              	<xsl:if test="$IRS990NData/ForeignAddress">
                		<div style="font-family:'verdana';font-size:7pt;">
                			<xsl:call-template name="PopulateText">
                  				<xsl:with-param name="TargetNode" select="$IRS990NData/ForeignAddress/City"/>
                			</xsl:call-template>,<br/>
                			<span class="stySmallText" style="padding-left:1mm;"/>
                			<xsl:call-template name="PopulateText">
                  				<xsl:with-param name="TargetNode" select="$IRS990NData/ForeignAddress/ProvinceOrState"/>
                			</xsl:call-template>,<br/>
                			<span class="stySmallText" style="padding-left:1mm;"/>
                			<xsl:call-template name="PopulateText">
                  				<xsl:with-param name="TargetNode" select="$IRS990NData/ForeignAddress/PostalCode"/>
                			</xsl:call-template>,<br/>
                			<span class="stySmallText" style="padding-left:1mm;"/>
                			<xsl:call-template name="PopulateText">
                  				<xsl:with-param name="TargetNode" select="$IRS990NData/ForeignAddress/Country"/>
                			</xsl:call-template>
                		</div>  
              	</xsl:if>
          	</div>
        </div>
      </div>

<!--   BEGIN FORM FOOTER  -->
<div style="width:187mm;">
  <span style="float: right">Form <span class="styBoldText">990-N</span> (2013)</span>
</div>
<!--   END FORM FOOTER   -->

<br/>
<div class="pageEnd"/>

      <div class="styLeftOverTitleLine" id="LeftoverData">
        <div class="styLeftOverTitle">
          Additional Data        
        </div>
        <div class="styLeftOverButtonContainer">
          <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
        </div>      
            
      <table class="styLeftOverTbl">
        <xsl:call-template name="PopulateCommonLeftover">
          <xsl:with-param name="TargetNode" select="$IRS990NData"/>
          <xsl:with-param name="DescWidth" select="100"/>
        </xsl:call-template>
      </table>  
      </div>
</form>
</body>
</html>
</xsl:template>
</xsl:stylesheet>