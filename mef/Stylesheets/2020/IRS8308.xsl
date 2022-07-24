<?xml version="1.0" encoding="UTF-8"?>
<!-- Last Modified by James Ganzy on 04/14/2021 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS8308Style.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest -->
  <xsl:param name="Form8308Data" select="$RtnDoc/IRS8308"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
          <xsl:call-template name="FormTitle">
            <xsl:with-param name="RootElement" select="local-name($Form8308Data)"/>
          </xsl:call-template>
        </title>
        <!-- No Browser Caching -->
        <meta http-equiv="Pragma" content="no-cache"/>
        <meta http-equiv="Cache-Control" content="no-cache"/>
        <meta http-equiv="Expires" content="0"/>
        <!-- No Proxy Caching -->
        <meta http-equiv="Cache-Control" content="private"/>
        <!-- Define Character Set -->
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
        <meta name="Description" content="IRS Form 8308"/>
        <xsl:call-template name="InitJS"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
        <style type="text/css">
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS8308Style"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass">
        <form name="Form8308">
          <xsl:call-template name="DocumentHeader"/>
          
          <!-- Begin Form Number and Name -->
          <div class="styTBB" style="width:187mm;height:19mm;">
            <div class="styFNBox" style="width:30mm;height:19mm;">
				  <div style="height:mm;">
					Form<span class="styFormNumber">  8308</span>
				  </div>
				 <div style="height:7mm;font-size:7pt;font-family:arial;">(Rev. September 2018)
						<span style="width:3px;"/>
						<span style="width:3px;"/>
					<xsl:call-template name="LinkToLeftoverDataTableInline">
					<xsl:with-param name="Desc">Form 8308, Top Left Margin - Summary Dormant FDE Indicator</xsl:with-param>
					<xsl:with-param name="TargetNode" select="$Form8308Data/@summaryDormantFDEIndicator"/>
					</xsl:call-template>	                
							   
								<span class="styAgency"  style="padding-top:1mm;">Department of the Treasury</span>
								<br/>
								<span class="styAgency">Internal Revenue Service</span>
			   </div>
         </div>
         <div class="styFTBox" style="width:126mm;height:19mm;padding-top:2mm;">
             <div class="styMainTitle">Report of a Sale or Exchange of<br/>Certain Partnership Interests</div><br/>
             	<div class="styFBT">
            		<span style="text-align:center;">
						<img src="{$ImagePath}/8308_Bullet_Sm.gif" alt="Bullet"/>Go to <a href="http://www.irs.gov/Form8308"><i>www.irs.gov/Form8308</i>
						</a> for the latest information.
					</span> 
	            </div>
              </div>
           <div class="styTYBox" style="width:30mm;height:19mm;padding-top:9mm;text-align:center;">OMB No. 1545-0123</div>
         </div>
         <!-- End Form Header -->
         <!--James-border-style:solid;border-color:black;border-style:solid;border-color:black;border-width:1px 1px 1px 1px;--> 
          
         <!-- Begin Partner Info -->
         <div class="styBB" style="width:187mm;">
	         <div class="styNameBox" style="width:105mm;height:10mm;font-size:7pt;">Name of partnership<br/>
		           <div style="font-family:verdana;font-size:7pt;height:10mm;">
			             <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param></xsl:call-template><br/>  
			             <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param></xsl:call-template> 
		           </div> 
           </div>
           <div class="styNameBox" style="height:10mm;width:35mm;font-size:7pt;border-right:0px solid black;">
	              <span style="padding-left:1mm;">Phone number</span><br/>
						  <span style="padding-left:1mm;"> 
	                    <xsl:call-template name="PopulatePhoneNumber">
		                  <xsl:with-param name="TargetNode" select="$Form8308Data/PhoneNumber"/>
		              </xsl:call-template>    
		       </span>
	        </div>
      	   <div style="width:47mm;height:10mm;padding-left:2mm;font-size:7pt; font-weight: normal;border-left:1px solid black;" class="styEINBox">         
       		   <span class="styBoldText" style="">Employer identification number</span><br/>   
	          <div>    
	             <span style="font-weight:normal;">  
       	        <xsl:call-template name="PopulateReturnHeaderFiler">
      	        	<xsl:with-param name="TargetNode">EIN</xsl:with-param>
      	        </xsl:call-template>
            	</span>       
            	</div> 
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styNumberBox" style="height:10mm;font-size:7pt;">Number, street, and room or suite no. If a P.O. box, see instructions.<br/>
		        <span style="">
			          <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">AddressLine1Txt</xsl:with-param></xsl:call-template><br/>
			          <xsl:call-template name="PopulateReturnHeaderFiler"><xsl:with-param name="TargetNode">AddressLine2Txt</xsl:with-param></xsl:call-template>
		        </span>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styNumberBox" style="height:16mm;font-size:7pt;">City or town, state or province, country, and ZIP or foreign postal code<br/>
		        <span style="width:90mm;">
			          <xsl:call-template name="PopulateReturnHeaderFiler">
			          	<xsl:with-param name="TargetNode">CityStateInfo</xsl:with-param>
			          </xsl:call-template>
			          <br/>
	        		  <xsl:call-template name="PopulateReturnHeaderFiler">
		        		  <xsl:with-param name="TargetNode">CountryCd</xsl:with-param>
	        		  	<xsl:with-param name="MainForm">true</xsl:with-param>
	        		  </xsl:call-template>
    	        	</span>
            </div>
          </div>

          <!-- End Filer Info -->
             
          <!-- Part 1, Transferor Information -->
          <div class="styBB" style="height:4mm;width:187mm;float:none;clear:both;">
				<span class="styPartName" style="height:4mm;width:12mm;padding-top:.5mm;padding-bottom:.5mm;">Part I</span>
				<div class="styLNDesc" style="width:175mm;font-size:8pt;padding-left:3mm;">
					<b>Transferor Information</b> (Beneficial owner of the partnership interest immediately before the transfer of that interest)
				</div>
          </div>
          
          <div class="styBB" style="width:187mm;">
            <div class="styNameBox" style="height:9mm;width:155mm;font-size:7pt;">
              Name<br/>
                   <xsl:call-template name="PopulateText">
                    <xsl:with-param name="TargetNode"
                     select="$Form8308Data/TransferorName/BusinessNameLine1Txt"/>
                  </xsl:call-template>
                  <xsl:if test="$Form8308Data/TransferorName/BusinessNameLine2Txt">
                    <br/>
                    <xsl:call-template name="PopulateText">
                      <xsl:with-param name="TargetNode"
                       select="$Form8308Data/TransferorName/BusinessNameLine2Txt"/>
                    </xsl:call-template>
                  </xsl:if>
          </div>

          <div style="height:9mm;padding-left:2mm;font-size:7pt; font-weight: normal;"
             class="styEINBox">       
			<span class="styBoldText">Identifying number</span><br/><br/>   
                <xsl:choose>
					<xsl:when test="$Form8308Data/TransferorEIN">
						<xsl:call-template name="PopulateEIN">
							<xsl:with-param name="TargetNode" select="$Form8308Data/TransferorEIN"/>
		                </xsl:call-template>
                   </xsl:when> 
                   <xsl:when test="$Form8308Data/TransferorSSN">                
                        <xsl:call-template name="PopulateSSN">
		                  <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorSSN"/>
						</xsl:call-template>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode" 
							select="$Form8308Data/TransferorMissingEINReasonCd"/>
								</xsl:call-template>
					</xsl:otherwise>
                </xsl:choose>
          </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styNumberBox" style="height:9mm;font-size:7pt;">
              Number and street (including apt. no.)
				<br/>
				<xsl:if test="$Form8308Data/TransferorUSAddress ">
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode"
						 select="$Form8308Data/TransferorUSAddress/AddressLine1Txt"/>
					</xsl:call-template>
					<xsl:if test="$Form8308Data/TransferorUSAddress/AddressLine2Txt">
					<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode"
							 select="$Form8308Data/TransferorUSAddress/AddressLine2Txt"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
                <xsl:if test="$Form8308Data/TransferorForeignAddress ">
					<xsl:call-template name="PopulateText">
					   <xsl:with-param name="TargetNode"
					    select="$Form8308Data/TransferorForeignAddress/AddressLine1Txt"/>
					</xsl:call-template>
					<xsl:if test="$Form8308Data/TransferorForeignAddress/AddressLine2Txt">
					<br/>
						<xsl:call-template name="PopulateText">
							<xsl:with-param name="TargetNode"
							 select="$Form8308Data/TransferorForeignAddress/AddressLine2Txt"/>
						</xsl:call-template>
					</xsl:if>
				</xsl:if>
            </div>
          </div>
          <div class="styBB" style="width:187mm;">
            <div class="styNumberBox" style="height:12mm;font-size:7pt;">
         	 City or town, state or province, country, and ZIP or foreign postal code
              <br/>
              <xsl:if test="$Form8308Data/TransferorUSAddress ">
                <xsl:call-template name="PopulateCityStateInfo">
                  <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorUSAddress "/>
                </xsl:call-template>
              </xsl:if>
              <xsl:if test="$Form8308Data/TransferorForeignAddress ">
                <xsl:call-template name="PopulateCityStateInfo">
                  <xsl:with-param name="TargetNode" select="$Form8308Data/TransferorForeignAddress "/>
                </xsl:call-template><br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode"
                   select="$Form8308Data/TransferorForeignAddress/ProvinceOrStateNm"/>
                </xsl:call-template><br/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode"
                   select="$Form8308Data/TransferorForeignAddress/ForeignPostalCd "/>
                </xsl:call-template>
                <span style="padding-left:1mm;"/>
                <xsl:call-template name="PopulateText">
                  <xsl:with-param name="TargetNode"
                   select="$Form8308Data/TransferorForeignAddress/CountryCd"/>
                </xsl:call-template>
              </xsl:if>
            </div>
          </div>

    <!-- End Part I, Transferor Information -->
    
    <!-- Extra information start -->          
  	<div class="styBB" style="height:auto;width:187mm;float:none;clear:both;">
		<div class="styLNDesc" style="height:auto;width:186mm;">
  			<b>Notice to Transferors:</b>
	  		<i>The information on this form has been supplied to the Internal Revenue Service.
	  		 The transferor in a section 751(a) exchange is required to treat a portion of the gain
	  		 realized from the exchange as ordinary income. For more details, see Pub. 541,
	  		 Partnerships.</i>
		</div>          
		<div class="styLNDesc" style="height:auto;width:186mm;">
			<b>Statement by Transferor:</b>
			<i>The transferor in a section 751(a) exchange is required under Regulations section
			 1.751-1(a)(3) to attach a statement relating to the sale or exchange to his or her return.
			 See Instructions to Transferors for more details.
			</i> 
		</div>
   </div>      
    <!-- Extra information end -->          
           
    <!-- Part II, Transferee Information -->
    <div class="styBB" style="height:4mm;width:187mm;float:none;clear:both;">
		<span class="styPartName" style="height:4mm;width:12mm;padding-top:.5mm;padding-bottom:.5mm;">Part II</span>
		<div class="styLNDesc" style="height:4mm;width:175mm;font-size:8pt;padding-left:3mm;">
			<b>Transferee Information</b> (Beneficial owner of the partnership interest immediately after the transfer of that interest)
		</div>
    </div>
    <div class="styBB" style="width:187mm;">
		<div class="styNameBox" style="height:9mm;width:155mm;font-size:7pt;">
		  Name<br/>
			<xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" 
				select="$Form8308Data/TransfereeName/BusinessNameLine1Txt"/>
			</xsl:call-template>
			<xsl:if test="$Form8308Data/TransfereeName/BusinessNameLine2Txt">
				<br/>
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode"
					 select="$Form8308Data/TransfereeName/BusinessNameLine2Txt"/>
				</xsl:call-template>
			</xsl:if>
		</div>
		<div style="height:9mm;padding-left:2mm;font-size:7pt; font-weight: normal;" 
		  class="styEINBox">         
			<span class="styBoldText">Identifying number</span><br/><br/>
			<xsl:choose>
				<xsl:when test="$Form8308Data/TransfereeEIN">
					<xsl:call-template name="PopulateEIN">
						<xsl:with-param name="TargetNode"
						 select="$Form8308Data/TransfereeEIN"/>
					</xsl:call-template>
				</xsl:when>                  
				<xsl:when test="$Form8308Data/TransfereeSSN">
					<xsl:call-template name="PopulateSSN">
						<xsl:with-param name="TargetNode" 
						select="$Form8308Data/TransfereeSSN"/>
					</xsl:call-template>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode" 
						select="$Form8308Data/TransfereeMissingEINReasonCd"/>
					</xsl:call-template>
				</xsl:otherwise>
			</xsl:choose>
        </div>
    </div>
    <div class="styBB" style="width:187mm;">
		<div class="styNumberBox" style="height:9mm;font-size:7pt;">
        Number and street (including apt. no.)
			<br/>
			<xsl:if test="$Form8308Data/TransfereeUSAddress">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode"
					 select="$Form8308Data/TransfereeUSAddress/AddressLine1Txt"/>
				</xsl:call-template>
				<xsl:if test="$Form8308Data/TransfereeUSAddress/AddressLine2Txt">
					<br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode"
						 select="$Form8308Data/TransfereeUSAddress/AddressLine2Txt"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:if>
			<xsl:if test="$Form8308Data/TransfereeForeignAddress">
				<xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" 
					  select="$Form8308Data/TransfereeForeignAddress/AddressLine1Txt"/>
				</xsl:call-template>
				<xsl:if test="$Form8308Data/TransfereeForeignAddress/AddressLine2Txt">
					<br/>
					<xsl:call-template name="PopulateText">
						<xsl:with-param name="TargetNode"
						 select="$Form8308Data/TransfereeForeignAddress/AddressLine2Txt"/>
					</xsl:call-template>
				</xsl:if>
			</xsl:if>
        </div>
    </div>
    <div class="styBB" style="width:187mm;">
        <div class="styNumberBox" style="height:12mm;font-size:7pt;">
       	City or town, state or province, country, and ZIP or foreign postal code
            <br/>
            <xsl:if test="$Form8308Data/TransfereeUSAddress ">
                <xsl:call-template name="PopulateCityStateInfo">
					<xsl:with-param name="TargetNode" select="$Form8308Data/TransfereeUSAddress"/>
                </xsl:call-template>
            </xsl:if>
            <xsl:if test="$Form8308Data/TransfereeForeignAddress">
                <xsl:call-template name="PopulateCityStateInfo">
					<xsl:with-param name="TargetNode" select="$Form8308Data/TransfereeForeignAddress"/>
                </xsl:call-template><br/>
                <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode"
                   select="$Form8308Data/TransfereeForeignAddress/ProvinceOrStateNm"/>
                </xsl:call-template><br/>
                <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode"
                   select="$Form8308Data/TransfereeForeignAddress/ForeignPostalCd"/>
                </xsl:call-template>
                <span style="padding-left:1mm;"/>
                <xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode"
                   select="$Form8308Data/TransfereeForeignAddress/CountryCd"/>
                </xsl:call-template>
            </xsl:if> 
          </div>
    </div>

    <!-- End Part II, Transferee Information -->
          
    <!-- Part III, Date of Sale or Exchange of Partnership Interest -->
    <div class="styBB" style="height:8mm;;width:187mm;float:none;clear:both;">
       <span class="styPartName" style="width: 14mm;margin-top:2mm;">Part III</span>
       <span class="styPartDesc" style="width: 92mm;margin-top:2mm;">Date of Sale or Exchange of Partnership Interest
             <img src="{$ImagePath}/8308_Bullet_Md.gif" alt="MidSizeBullet" align="middle"/></span>
	     <span class="styPartDesc" style="font-size:7pt;font-weight:normal;width: 22mm;margin-top:2mm;">
		    <xsl:call-template name="PopulateMonthDayYear">
			  <xsl:with-param name="TargetNode" select="$Form8308Data/SaleOrExchangeDt"/>
			</xsl:call-template>
		  <br/>
			</span>
    </div>
                                          
    <div class="styBB" style="height:auto;width:187mm;float:none;clear:both;"> 
    <div style="height:17mm;width: 38mm; float:left;border-right: thin solid black;font-size: 7pt;padding-right: 4mm;padding-top: 2mm;padding-bottom: 2mm;">
		<b>Sign here only if you are filing this form by itself and not with Form 1065</b>
	 </div>

	 <div style="width:145mm;float:right;clear none;font-size: 7pt;">
			Under penalties of perjury, I declare that I have examined this return, including accompanying attachments, and to the best of my
			knowledge and belief, it is true, correct, and complete.<br/><br/>
    <div style="width: 110mm; float: left; clear none;">
      <div style="width: 4mm; float: left; clear: none;"><img src="{$ImagePath}/8308_Bullet_Lg.gif" alt="LargeBullet"/></div>
      <div class="styFixedUnderline" style="float: left; clear: none; width:95mm; height:4mm; border-style:solid">

		<!--<span style="width:100mm">
         <xsl:call-template name="PopulateReturnHeaderPartner">
         	<xsl:with-param name="TargetNode">Name</xsl:with-param>
         </xsl:call-template>
       </span>-->
      
    </div>
    <div style="float: left; clear: none; width:95mm; height:4mm; padding-left:.5mm;font-size: 6pt; text-align:left;">Signature of partnership representative 
					or partner or limited liability company member</div>
    </div>
    
    <div style="width:30mm; float: right;clear none;">
      <div style="width: 4mm; float: left; clear: none;"><img src="{$ImagePath}/8308_Bullet_Lg.gif" alt="LargeBullet"/></div>
      <div class="styFixedUnderline" style="float: right; clear: none; width:25mm;height:4mm; border-style:solid;"><span style="width:80px">
  			  
        <!-- <xsl:call-template name="PopulateReturnHeaderPartner">
         	<xsl:with-param name="TargetNode">DateSigned</xsl:with-param>
         </xsl:call-template>-->
  			  
      </span></div> 
     <div style="float: right; clear: none; width:25mm;height:4mm;padding-left:.5mm;font-size: 6pt; text-align:left;">Date</div>
    </div>

  	 </div>
   </div>
  
    <!-- End Part III, Date of Sale or Exchange of Partnership Interest -->
              
        <div style="width:187mm;">
    
			<span style="width:80mm;"/>       
			  Cat. No. 62503I
			<span style="width:49.5mm;"/>   
			<span style="font-size:7pt;padding-right:1mm;">Form</span> <span class="styBoldText" style="font-size:8pt;">8308</span> <span style="font-size:7pt;padding-left:1mm;">(Rev. 9-2018)</span>
		</div>
		<br/><br/>
  	 <!-- BEGIN Left Over Table -->  
    <!-- Additonal Data Title Bar and Button -->
    <div class="styLeftOverTitleLine" id="LeftoverData">
      <div class="styLeftOverTitle">
        Additional Data        
      </div>
      <div class="styLeftOverButtonContainer">
        <input class="styLeftoverTableBtn" TabIndex="1" type="button" value="Return to Form" onclick="javascript:returnToWriteInImage();"/>
      </div>      
    </div>
    <!-- Additional Data Table -->
    <table class="styLeftOverTbl">
      <xsl:call-template name="PopulateCommonLeftover">
        <xsl:with-param name="TargetNode" select="$Form8308Data"/>
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>          
    </table>
    <!-- END Left Over Table -->
        </form>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>