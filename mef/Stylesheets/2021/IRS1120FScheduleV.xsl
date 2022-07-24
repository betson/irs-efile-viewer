<?xml version="1.0" encoding="UTF-8"?>
  <xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>
  <xsl:include href="IRS1120FScheduleVStyle.xsl"/>
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  <!-- Defines the stage of the data, e.g. original or latest -->
  <xsl:param name="Form1120FScheduleVData" select="$RtnDoc/IRS1120FScheduleV"/>
  <xsl:template match="/">
    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
    <html>
      <head>
	    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
        <title>
	      <xsl:call-template name="FormTitle">
		    <xsl:with-param name="RootElement" select="local-name($Form1120FScheduleVData)"/>
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
        <meta name="Description" content="IRS Form 1120FScheduleV"/>
        <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js" type="text/javascript"/>
        <xsl:call-template name="InitJS"/>
        <style type="text/css">
          <!-- Print spot comment removed-->
          <xsl:if test="not($Print) or $Print=''">
            <xsl:call-template name="IRS1120FScheduleVStyle"/>
            <xsl:call-template name="AddOnStyle"/>
          </xsl:if>
        </style>
        <xsl:call-template name="GlobalStylesForm"/>
      </head>
      <body class="styBodyClass" style="width:187mm;">
        <form name="Form1120FScheduleV">
          <!--xsl:value-of select='$PageWatermark'/-->
          <!-- BEGIN WARNING LINE -->
          <xsl:call-template name="DocumentHeader"/>
          <!-- END WARNING LINE -->
          <!-- Begin Form Number and Name -->
          <div class="styBB" style="width:187mm;">
            <div class="styFNBox" style="width:30mm; height:19.5mm;">
              <div style="padding-left:0mm; font-weight:bold;">Schedule V</div>
              <div style="padding-left:0mm; font-weight:bold;">(Form 1120-F)</div>
              <br/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData"/>
              </xsl:call-template>
              <br/>
              <span class="styAgency">
                <br/>Department of the Treasury<br/>Internal Revenue Service
              </span>
            </div>
            <div class="styFTBox" style="width:125mm; height:12mm;">
              <div class="styMainTitle" style="height:8mm; padding-top:2mm;">List of Vessels or Aircraft, Operators, and Owners </div>       
              <div class="styFST">
                <br/>
			    <img src="{$ImagePath}/1120FScheduleH_Bullet.gif" alt="Right Pointing Arrow"/>Attach to Form 1120-F.
			    <br/>
			    <img src="{$ImagePath}/1120FScheduleH_Bullet.gif" alt="Right Pointing Arrow"/>&#160;Go to 
			    <a style="text-decoration:none; color:black;" href="http://www.irs.gov/form1120f"><i>www.irs.gov/Form1120F</i></a> for instructions and the latest information.
			  </div>
            </div>
            <div class="styTYBox" style="width:31mm; height:19.5mm;">
              <div style="height:2mm;"/>
              <div class="styOMB">OMB No. 1545-0123 </div>
              <div class="styTY" style="height:8mm; padding-top:1mm;">20<span class="styTYColor">21</span></div>
            </div>
          </div>
          <!-- End Form Number and Name section -->
          <!-- Begin Names and Identifying number section -->
          <div class="styBB" style="width:187mm; float:none; clear:none;">
            <div class="styNameBox" style="width:140mm; height:10mm; font-size:7pt;">Name of corporation<br/>
              <span>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine1Txt</xsl:with-param>
                </xsl:call-template>
                <br/>
                <xsl:call-template name="PopulateReturnHeaderFiler">
                  <xsl:with-param name="TargetNode">BusinessNameLine2Txt</xsl:with-param>
                </xsl:call-template>
                <br/>
              </span>
            </div>
            <div class="styEINBox" style="width:46mm; height:4mm; padding-left:2mm; font-size:7pt; font-weight:bold;">Employer identification number
             <br/>
              <br/>
              <span style="width:27mm; text-align:left; font-weight:normal;">
      	        <xsl:call-template name="PopulateReturnHeaderFiler">
              	  <xsl:with-param name="TargetNode">EIN</xsl:with-param>
                </xsl:call-template>
              </span>
            </div>
          </div>
          <!-- End Names and Identifying number section -->
          <div style="width:187mm; padding-bottom:5mm; font-size:7pt;">
            Provide the information requested on lines 1 through 9 for each vessel or aircraft with respect to which the corporation is subject to a 4% 		    
            rate of tax under section 887.  If you check “Yes” on line 3 or line 4 for a vessel or aircraft chartered in or chartered out, see instructions 
            to determine whether you must attach a statement to Schedule V with additional information.
          </div>
          <!-- *******first viewing ****** -->
          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation">
            <xsl:if test="($Print != $Separated) or (count($Form1120FScheduleVData/VesselAircraftInformation) &lt;5)">
	          <table class="styTable" cellspacing="0" style="border-color:black;width:187mm;">
		        <xsl:for-each select="$Form1120FScheduleVData/VesselAircraftInformation">
			      <xsl:variable name="pos" select="position()"/>
			      <xsl:if test="position() mod 4 = 1">
				    <!-- title row -->
				    <tr>
					  <td style="border:none;" scope="row">
						<div>
						   <span class="styTableCellPad"  style="width:67mm; height:5mm;"/>
						</div>
					  </td>
					  <td class="styTableCellSmall" style="width:30mm; font-size:7pt; text-align:center; font-weight:bold; border-color:black; border-top-width:1px; border-right-width:1px; border-left-width:1px;">
						<xsl:number value="position()" format="A"/>
						<span class="styTableCellPad"/>
					  </td>
					  <td class="styTableCellSmall" style="width:30mm; font-size:7pt; text-align:center; font-weight:bold; border-color:black; border-top-width:1px; border-left-width:0px; border-right-width:1px;">
					    <xsl:number value="position()+1" format="A"/>
						<span class="styTableCellPad"/>
					  </td>
					  <td class="styTableCellSmall" style="width:30mm; font-size:7pt; text-align:center; font-weight:bold; border-color:black; border-top-width:1px; border-left-width:0px; border-right-width:1px;">
						<xsl:number value="position()+2" format="A"/>
						<span class="styTableCellPad"/>
					  </td>
					  <td class="styTableCellSmall" style="width:30mm; font-size:7pt; text-align:center; font-weight:bold; border-color:black; border-top-width:1px; border-left-width:0px; border-right-width:0px;">
						<xsl:number value="position()+3" format="A"/>
						<span class="styTableCellPad"/>
					  </td>
				    </tr>
				    <!-- Line 1 -->
				    <tr>
					  <td style="border:none;" scope="row">
					    <div style="width:67mm;">
						  <div class="styBoldText" style="width:5mm; float:left; font-size:7.5pt; padding-left:2mm; height:8mm; padding-top:3mm;">1</div>
						  <div class="styGenericDiv" style="width:60mm; font-size:7.5pt; padding-top:3mm;">
						    Name of vessel or type of aircraft
						    <!--Dotted Line-->
						    <div class="styDotLn" style="float:right; padding-right:1mm;">...</div>
				    	      </div>
		     			</div>
				      </td>
				      <td class="styTableCellSmall" style="width:30mm; border-color:black; height:8mm; padding-top:3mm; border-left-width:1px; font-size:6pt; text-align:left">
			         	<xsl:call-template name="PopulateText">
			           	  <xsl:with-param name="TargetNode" select="VesselOrAircraftNm"/>
			         	</xsl:call-template>
			        	    <span class="styTableCellPad"/>
				      </td>
				      <td class="styTableCellSmall" style="width:30mm; border-color:black; height:8mm; padding-top:3mm; font-size:6pt; text-align:left">
				        <xsl:call-template name="PopulateText">
				          <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftNm"/>
			            </xsl:call-template>
			            <span class="styTableCellPad"/>
			     	  </td>
			     	  <td class="styTableCellSmall" style="width:30mm; border-color:black; height:8mm; padding-top:3mm; font-size:6pt; text-align:left">
		         		<xsl:call-template name="PopulateText">
			        	      <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrAircraftNm"/>
			        	    </xsl:call-template>
		        		    <span class="styTableCellPad"/>
				      </td>
			    	      <td class="styTableCellSmall" style="width:30mm; border-color:black; height:8mm; padding-top:3mm; border-right-width:0px; font-size:6pt; text-align:left">
		        		    <xsl:call-template name="PopulateText">
			        	      <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrAircraftNm"/>
		        		    </xsl:call-template>
			        	    <span class="styTableCellPad"/>
			    	      </td>
		    	        </tr>
				    <!--  **************************************************************************************************************************  -->
				    <!-- Line 2 -->
				    <tr>
				      <td style="border:none;" scope="row">
			        	    <div>
			              <div class="styGenericDiv" style="width:5mm; font-size:7.5pt; padding-left:2mm; height:8mm; padding-top:3mm;"><b>2</b></div>
			              <div class="styGenericDiv" style="width:61mm; font-size:7.5pt; padding-top:3mm;"> 
			        	        <span style="float:left;">Vessel or aircraft ID number</span>
				          	<!--Dotted Line-->
				     	    <div class="styDotLn" style="float:right; padding-right:1mm;">....</div>
				          </div>
			        	    </div>
				      </td>
				      <td class="styTableCellSmall" style="width:30mm; border-color:black; height:8mm; padding-top:3mm; border-left-width:1px; font-size:6pt; text-align:left">
			         	<xsl:call-template name="PopulateText">
		     	    	      <xsl:with-param name="TargetNode" select="VesselOrAircraftIDNum"/>
			        	    </xsl:call-template>
		     		    <span class="styTableCellPad"/>
			    	      </td>
				      <td class="styTableCellSmall" style="width:30mm; border-color:black; height:8mm; padding-top:3mm; font-size:6pt; text-align:left">
			        	    <xsl:call-template name="PopulateText">
			        	      <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftIDNum"/>
			        	    </xsl:call-template>
			    	        <span class="styTableCellPad"/>
			    	      </td>
			    	      <td class="styTableCellSmall" style="width:30mm; border-color:black; height:8mm; padding-top:3mm; font-size:6pt; text-align:left">
			         	<xsl:call-template name="PopulateText">
				          <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrAircraftIDNum"/>
			         	</xsl:call-template>
		    		        <span class="styTableCellPad"/>
			    	      </td>
		    		      <td class="styTableCellSmall" style="width:30mm; border-color:black; height:8mm; padding-top:3mm; border-right-width:0px; font-size:6pt; text-align:left">
				        <xsl:call-template name="PopulateText">
			        	      <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrAircraftIDNum"/>
			    	        </xsl:call-template>
				        <span class="styTableCellPad"/>
			    	      </td>
	    		        </tr>
				    <!-- ============================================================================= -->
				    <!-- Line 3 -->
				    <!-- ============================================================================= -->
				    <tr>
			    	      <td style="border:none;" scope="row">
			         	<div>
		        	          <div class="styGenericDiv" style="font-size:7pt; width:5mm; padding-left:2mm; height:8mm; padding-top:3mm;"><b>3</b></div>
			              <div class="styGenericDiv" style="width:61mm; height:8mm; font-size:7pt; padding-top:3mm;">
		               	    <span style="float:left;">Was the vessel or aircraft chartered in?</span>
			                <!--Dotted Line-->
			            	    <div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
		             	  </div>
		        		    </div>
			    	      </td>
		     		  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-left-width:1px; text-align:center;">
			        	    <span style="width:1px;"/>
		          		<!-- Add PopulateSpan to boolean (yes/no) checkbox -->
				        <span>
				    	      <xsl:call-template name="PopulateSpan">
				     		<xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
				    	      </xsl:call-template>								
				    	      <input type="checkbox" alt="Vessel Or Aircraft Chartered In Indicator Yes"  class="styCkbox">
					    	    <xsl:call-template name="PopulateYesCheckbox">
						      <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
					     	  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn<xsl:value-of select="$pos"/></xsl:with-param>
					    	    </xsl:call-template>
				    	      </input>
			     		  <label>
				     		<xsl:call-template name="PopulateLabelYes">
					    	      <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
				    		      <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn<xsl:value-of select="$pos"/></xsl:with-param>
			     			</xsl:call-template>
				    		    <span style="font-size:6pt">Yes </span>
		     			  </label>
					      <span style="width:2mm"/>
					      <input type="checkbox" alt="Vessel Or Aircraft Chartered In Indicator No" class="styCkbox">
					    	    <xsl:call-template name="PopulateNoCheckbox">
							  <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
							  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn<xsl:value-of select="$pos"/></xsl:with-param>
				    		    </xsl:call-template>
		     			  </input>
			    		      <label>
				    	        <xsl:call-template name="PopulateLabelNo">
							  <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
							  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn<xsl:value-of select="$pos"/></xsl:with-param>
			    			    </xsl:call-template>
		     				<span style="font-size:6pt">No </span>
		     			  </label>
			    		      <span class="styTableCellPad"/>
				    		    <xsl:call-template name="SetFormLinkInline">
				    		      <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
		     	     		</xsl:call-template>
	         			  </span>
				        </td>
	    			        <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:8mm; padding-top:3mm; text-align:center">
		         		  <span style="width:1px;"/>
			        	      <span>
		        		        <xsl:call-template name="PopulateSpan">
				    		      <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftCharteredInInd"/>
	         			    </xsl:call-template>								
		         		    <input type="checkbox" alt="Vessel Or Aircraft Chartered In Indicator Yes" class="styCkbox">
			    			      <xsl:call-template name="PopulateYesCheckbox">
							    <xsl:with-param name="TargetNode"  select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftCharteredInInd"/>
							    <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn<xsl:value-of select="$pos + 1"/></xsl:with-param>
				     		  </xsl:call-template>
				    	        </input>
		    			  <label>
				    		<xsl:call-template name="PopulateLabelYes">
							  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftCharteredInInd"/>
					    	  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn<xsl:value-of select="$pos + 1"/></xsl:with-param>
					    	</xsl:call-template>
			     			<span style="font-size:6pt">Yes </span>
		     			  </label>
		     			  <span style="width:2mm"/>
		     			  <input type="checkbox" alt="Vessel Or Aircraft Chartered In Indicator No" class="styCkbox">
					    	<xsl:call-template name="PopulateNoCheckbox">
							  <xsl:with-param name="TargetNode"  select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftCharteredInInd"/>
						      <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn<xsl:value-of select="$pos + 1"/></xsl:with-param>
			     			</xsl:call-template>
			     		  </input>
		     			  <label>
					    	<xsl:call-template name="PopulateLabelNo">
							  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftCharteredInInd"/>
							  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn<xsl:value-of select="$pos + 1"/></xsl:with-param>
				    		</xsl:call-template>
				      		<span style="font-size:6pt">No </span>
		    			  </label>
		         		  <span class="styTableCellPad"/>
			             	<xsl:call-template name="SetFormLinkInline">
	                		  <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
		            		</xsl:call-template>
		            	  </span>
			    	    </td>
		    		    <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style: solid; border-color:black; height:8mm; padding-top:3mm; text-align:center">
			        	  <span style="width:1px;"/>
		         		  <span>
			     		  <xsl:call-template name="PopulateSpan">
						    <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrAircraftCharteredInInd"/>
			     		  </xsl:call-template>								
				    	  <input type="checkbox" alt="Vessel Or Aircraft Chartered In Indicator Yes" class="styCkbox">
					    	<xsl:call-template name="PopulateYesCheckbox">
						      <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrAircraftCharteredInInd"/>
					    	  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn<xsl:value-of select="$pos + 2"/></xsl:with-param>
					    	</xsl:call-template>
				    	  </input>
				    	  <label>
			   	     		<xsl:call-template name="PopulateLabelYes">
							  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrAircraftCharteredInInd"/>
							  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn<xsl:value-of select="$pos + 2"/></xsl:with-param>
			    			</xsl:call-template>
					    	<span style="font-size:6pt">Yes </span>
		     			  </label>
			        	  <span style="width:2mm"/>
			    		  <input type="checkbox" alt="Vessel Or Aircraft Chartered In Indicator No" class="styCkbox">
					    	<xsl:call-template name="PopulateNoCheckbox">
						      <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrAircraftCharteredInInd"/>
						      <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn<xsl:value-of select="$pos + 2"/></xsl:with-param>
					    	</xsl:call-template>
				    	  </input>
				    	  <label>
					    	<xsl:call-template name="PopulateLabelNo">
							  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrAircraftCharteredInInd"/>
				     		  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn<xsl:value-of select="$pos + 2"/></xsl:with-param>
					    	</xsl:call-template>
					    	<span style="font-size:6pt">No </span>
			    		  </label>
			     		  <xsl:call-template name="SetFormLinkInline">
						    <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
				     	  </xsl:call-template>
				        </span>
				      </td>
	    			  <td class="styTableCellSmall"  style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:8mm; padding-top:3mm; text-align:center; border-right-width:0px;">
			         	<span style="width:1px;"/>
		        		<span>
				    	<xsl:call-template name="PopulateSpan">
			     		  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrAircraftCharteredInInd"/>
			     		</xsl:call-template>								
		    			<input type="checkbox" alt="Vessel Or Aircraft Chartered In Indicator Yes" class="styCkbox">
				    	  <xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrAircraftCharteredInInd"/>
							<xsl:with-param name="BackupName">VesselOrAircraftCharteredIn<xsl:value-of select="$pos + 3"/></xsl:with-param>
				     	  </xsl:call-template>
		     			</input>
					    <label>
						  <xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrAircraftCharteredInInd"/>
							<xsl:with-param name="BackupName">VesselOrAircraftCharteredIn<xsl:value-of select="$pos + 3"/></xsl:with-param>
				    	  </xsl:call-template>
				    	  <span style="font-size:6pt">Yes </span>
			     		</label>
			    		<span style="width:2mm"/>
			    		<input type="checkbox" alt="Vessel Or Aircraft Chartered In Indicator No" class="styCkbox">
					      <xsl:call-template name="PopulateNoCheckbox">
							<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrAircraftCharteredInInd"/>
							<xsl:with-param name="BackupName">VesselOrAircraftCharteredIn<xsl:value-of select="$pos + 3"/></xsl:with-param>
				    	  </xsl:call-template>
		    			</input>
			    		<label>
						  <xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrAircraftCharteredInInd"/>
							<xsl:with-param name="BackupName">VesselOrAircraftCharteredIn<xsl:value-of select="$pos + 3"/></xsl:with-param>
						  </xsl:call-template>
						  <span style="font-size:6pt">No </span>
			     		</label>
					    <span class="styTableCellPad"/>
						<xsl:call-template name="SetFormLinkInline">
						  <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
		     			</xsl:call-template>
     			      </span>
			    	</td>
				  </tr>
				  <!-- ============================================================================= -->
				  <!-- Line 4 -->
				  <!-- ============================================================================= -->
				  <tr>
			    	<td style="border:none;" scope="row">
			          <div>
			            <div class="styGenericDiv" style="width:5mm; font-size:7pt; padding-left:2mm; height:8mm; padding-top:3mm;"><b>4</b></div>
			            <div class="styGenericDiv" style="width:61mm; font-size:7pt; height:8mm; padding-top:3mm;">
				          <span style="float:left;">Was the vessel or aircraft chartered out?</span>
				          <!--Dotted Line-->
				          <div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
				        </div>
			          </div>
		    		</td>
	    			<td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:center; border-style:solid;border-color:black;black; height:8mm; padding-top:3mm; border-left-width:1px;">
	        		  <span>
				        <xsl:call-template name="PopulateSpan">
						  <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
			        	</xsl:call-template>								
			     		<input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator Yes" class="styCkbox">
					      <xsl:call-template name="PopulateYesCheckbox">
						    <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
							<xsl:with-param name="BackupName">VesselOrArcrftCharteredOut<xsl:value-of select="$pos"/></xsl:with-param>
					      </xsl:call-template>
				    	</input>
				     	<label>
					      <xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
							<xsl:with-param name="BackupName">VesselOrArcrftCharteredOut<xsl:value-of select="$pos"/></xsl:with-param>
				    	  </xsl:call-template>
			     		  <span style="font-size:6pt;">Yes </span>
				     	</label>
				     	<span style="width:2mm"/>
				    	<input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator No" class="styCkbox">
					      <xsl:call-template name="PopulateNoCheckbox">
							<xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
							<xsl:with-param name="BackupName">VesselOrArcrftCharteredOut<xsl:value-of select="$pos"/></xsl:with-param>
			     		  </xsl:call-template>
			    		</input>
		    			<label>
						  <xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
							<xsl:with-param name="BackupName">VesselOrArcrftCharteredOut<xsl:value-of select="$pos"/></xsl:with-param>
					      </xsl:call-template>
					      <span style="font-size:6pt;">No </span>
				    	</label>
			      		<span class="styTableCellPad"/>
			    		<xsl:call-template name="SetFormLinkInline">
						  <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
				    	</xsl:call-template>
			    	  </span>
				    </td>
			    	<td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm">
			          <span>
			    		<xsl:call-template name="PopulateSpan">
						  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrArcrftCharteredOutInd"/>
			    		</xsl:call-template>								
	     				<input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator Yes"	class="styCkbox">
				    	  <xsl:call-template name="PopulateYesCheckbox">
						    <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrArcrftCharteredOutInd"/>
							<xsl:with-param name="BackupName">VesselOrArcrftCharteredOut<xsl:value-of select="$pos + 1"/></xsl:with-param>
					      </xsl:call-template>
	      				</input>
	    				<label>
					      <xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrArcrftCharteredOutInd"/>
							<xsl:with-param name="BackupName">VesselOrArcrftCharteredOut<xsl:value-of select="$pos + 1"/></xsl:with-param>
					      </xsl:call-template>
						  <span style="font-size:6pt">Yes </span>
				    	</label>
			     		<span style="width:2mm"/>
				    	<input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator No" class="styCkbox">
					      <xsl:call-template name="PopulateNoCheckbox">
						    <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrArcrftCharteredOutInd"/>
					    	<xsl:with-param name="BackupName">VesselOrArcrftCharteredOut<xsl:value-of select="$pos + 1"/></xsl:with-param>
				    	  </xsl:call-template>
			    		</input>
			    		<label>
					      <xsl:call-template name="PopulateLabelNo">
					  		<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrArcrftCharteredOutInd"/>
							<xsl:with-param name="BackupName">VesselOrArcrftCharteredOut<xsl:value-of select="$pos + 1"/></xsl:with-param>
				    	  </xsl:call-template>
					      <span style="font-size:6pt;">No </span>
				    	</label>
				     	<span class="styTableCellPad"/>
			    		<xsl:call-template name="SetFormLinkInline">
						  <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
			     		</xsl:call-template>
			          </span>
				    </td>
	            	<td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:center; border-style: solid; border-color:black; black; height:8mm; padding-top:3mm">
		         	  <span style="width:1.5mm;"/>
		        	  <span>
			     		<xsl:call-template name="PopulateSpan">
					      <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrArcrftCharteredOutInd"/>
				    	</xsl:call-template>								
			    	    <input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator Yes" class="styCkbox">
					      <xsl:call-template name="PopulateYesCheckbox">
							<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrArcrftCharteredOutInd"/>
							<xsl:with-param name="BackupName">VesselOrArcrftCharteredOut<xsl:value-of select="$pos + 2"/></xsl:with-param>
					      </xsl:call-template>
				        </input>
				    	<label>
					      <xsl:call-template name="PopulateLabelYes">
							<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrArcrftCharteredOutInd"/>
							<xsl:with-param name="BackupName">VesselOrArcrftCharteredOut<xsl:value-of select="$pos + 2"/></xsl:with-param>
				    	  </xsl:call-template>
			     		  <span style="font-size:6pt">Yes </span>
			    		</label>
		    			<span style="width:2mm"/>
	     				<input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator No"  class="styCkbox">
					      <xsl:call-template name="PopulateNoCheckbox">
							<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrArcrftCharteredOutInd"/>
							<xsl:with-param name="BackupName">VesselOrArcrftCharteredOut<xsl:value-of select="$pos + 2"/></xsl:with-param>
				    	  </xsl:call-template>
					    </input>
				        <label>
						  <xsl:call-template name="PopulateLabelNo">
							<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrArcrftCharteredOutInd"/>
							<xsl:with-param name="BackupName">VesselOrArcrftCharteredOut<xsl:value-of select="$pos + 2"/></xsl:with-param>
			     		  </xsl:call-template>
					      <span style="font-size:6pt;">No </span>
					    </label>
				        <span class="styTableCellPad"/>
				    	<xsl:call-template name="SetFormLinkInline">
					      <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
				        </xsl:call-template>
			          </span>
				    </td>
		    		<td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:center; border-style:solid;border-color:black; height:8mm; padding-top:3mm; border-right-width:0px;">
			          <span>
			        	<xsl:call-template name="PopulateSpan">
					      <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrArcrftCharteredOutInd"/>
			         	</xsl:call-template>								
			     	    <input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator Yes" class="styCkbox">
				     	  <xsl:call-template name="PopulateYesCheckbox">
				    		<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrArcrftCharteredOutInd"/>
				    		<xsl:with-param name="BackupName">VesselOrArcrftCharteredOut<xsl:value-of select="$pos + 3"/></xsl:with-param>
				          </xsl:call-template>
			    	    </input>
			    	    <label>
				          <xsl:call-template name="PopulateLabelYes">
			        		<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrArcrftCharteredOutInd"/>
		        			<xsl:with-param name="BackupName">VesselOrArcrftCharteredOut<xsl:value-of select="$pos + 3"/></xsl:with-param>
		     			  </xsl:call-template>
			     		  <span style="font-size:6pt">Yes </span>
			        	</label>
			         	<span style="width:2mm"/>
		     	        <input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator No" class="styCkbox">
				          <xsl:call-template name="PopulateNoCheckbox">
					        <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrArcrftCharteredOutInd"/>
				        	<xsl:with-param name="BackupName">VesselOrArcrftCharteredOut<xsl:value-of select="$pos + 3"/></xsl:with-param>
			     	      </xsl:call-template>
		    	        </input>
		    	    	<label>
		        		  <xsl:call-template name="PopulateLabelNo">
				    		<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrArcrftCharteredOutInd"/>
			    			<xsl:with-param name="BackupName">VesselOrArcrftCharteredOut<xsl:value-of select="$pos + 3"/></xsl:with-param>
				          </xsl:call-template>
			    	      <span style="font-size:6pt">No </span>
				    	</label>
			        	<span class="styTableCellPad"/>
		    		    <xsl:call-template name="SetFormLinkInline">
			    		  <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
		        		</xsl:call-template>
		        	  </span>
				    </td>
		     	  </tr>
				  <!-- Line 5 -->
				  <tr>
	     			<td style="border:none;font-size:7pt;" scope="row">
	    			      <div>
		    		        <div class="styGenericDiv" style="width:5mm; padding-left:2mm; height:8mm; padding-top:3mm;"><b>5</b></div>
		    		        <div class="styGenericDiv" style="width:61mm; height:8mm; padding-top:3mm;">
	    			          <span style="float:left;">Name of registered owner</span>
		    		          <!--Dotted Line-->
		     		      <div class="styDotLn" style="float:right; padding-right:1mm;">......</div>
		    		        </div>
		    		      </div>
		    		    </td>
		    		    <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid;border-color:black; height:8mm; padding-top:3mm; border-left-width:1px;">
	        		  <xsl:call-template name="PopulateText">
        			    <xsl:with-param name="TargetNode" select="RegisteredOwnerName/BusinessNameLine1Txt"/>
	        		  </xsl:call-template>
	        		  <span class="styTableCellPad"/>
		        	  <br/>
	        		  <xsl:call-template name="PopulateText">
		        		<xsl:with-param name="TargetNode" select="RegisteredOwnerName/BusinessNameLine2Txt"/>
	         		  </xsl:call-template>
	        		  <span class="styTableCellPad"/>
			    	</td>
		    		<td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
        	    	  <xsl:call-template name="PopulateText">
	       	        	<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/RegisteredOwnerName/BusinessNameLine1Txt"/>
	    	    	  </xsl:call-template>
			          <br/>
	        		  <xsl:call-template name="PopulateText">
	    	    	    <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/RegisteredOwnerName/BusinessNameLine2Txt"/>
	    	    	  </xsl:call-template>
	        		  <span class="styTableCellPad"/>
		    		</td>
		     		<td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
	        		  <xsl:call-template name="PopulateText">
		        	    <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/RegisteredOwnerName/BusinessNameLine1Txt"/>
		        	  </xsl:call-template>
		        	  <br/>
		         	  <xsl:call-template name="PopulateText">
		        		<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/RegisteredOwnerName/BusinessNameLine2Txt"/>
			    	  </xsl:call-template>
	     			  <span class="styTableCellPad"/>
		    		</td>
		     		<td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-right-width:0px;">
		        	  <xsl:call-template name="PopulateText">
			            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/RegisteredOwnerName/BusinessNameLine1Txt"/>
		        	  </xsl:call-template>
		        	  <br/>
		         	  <xsl:call-template name="PopulateText">
	    	        	<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/RegisteredOwnerName/BusinessNameLine2Txt"/>
			          </xsl:call-template>
		    	      <span class="styTableCellPad"/>
		        	</td>
		    	  </tr>
				  <!-- Line 6 -->
				  <tr>
				    <td style="border:none; font-size:7pt;" scope="row">
					  <div>
	    		    	      <div class="styGenericDiv" style="width:5mm; padding-left:2mm; height:8mm; padding-top:3mm;"><b>6</b></div>
		     		    <div class="styGenericDiv" style="width:61mm; height:8mm; padding-top:3mm;">
		     		      <span style="float:left;">EIN or SSN of registered owner</span>
			     	      <!--Dotted Line-->
		    		          <div class="styDotLn" style="float:right; padding-right:1mm;">.....</div>
		        		    </div>
		    		      </div>
				    </td>
				    <td class="styTableCellSmall" style="width:30mm; border-style:solid; border-color: black; height:8mm; padding-top:3mm; border-left-width:1px; text-align:center;">
    				  <xsl:if test="RegisteredOwnerEIN != ' '">
	     	        	<xsl:call-template name="PopulateEIN">
		                  <xsl:with-param name="TargetNode" select="RegisteredOwnerEIN"/>
     		         	</xsl:call-template>
	     		     	<span class="styTableCellPad"/>
		      		  </xsl:if>
	    			  <xsl:if test="RegisteredOwnerSSN != ' '">
			        	<xsl:call-template name="PopulateSSN">
		            	  <xsl:with-param name="TargetNode" select="RegisteredOwnerSSN"/>
	        			</xsl:call-template>
		         		<span class="styTableCellPad"/>
	    			  </xsl:if>
		    		  <xsl:if test="MissingEINReasonCd != ' '">
		         		<xsl:call-template name="PopulateText">
		            	  <xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
		     	    	</xsl:call-template>
		        		<span class="styTableCellPad"/>
			    	  </xsl:if>
	    			  <xsl:if test=" UnknownRegisteredOwnerCd!= ' '">
	        			<xsl:call-template name="PopulateText">
		             	  <xsl:with-param name="TargetNode" select="UnknownRegisteredOwnerCd"/>
	         			</xsl:call-template>
		         		<span class="styTableCellPad"/>
		    		  </xsl:if>
		   		    </td>
				    <td class="styTableCellSmall" style="width:30mm; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
			     	  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/RegisteredOwnerEIN != ' '">
						<xsl:call-template name="PopulateEIN">
		             	  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/RegisteredOwnerEIN"/>
						</xsl:call-template>
						<span class="styTableCellPad"/>
		      		  </xsl:if>
					  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/RegisteredOwnerSSN != ' '">
						<xsl:call-template name="PopulateSSN">
						  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/RegisteredOwnerSSN"/>
	         			</xsl:call-template>
						<span class="styTableCellPad"/>
					  </xsl:if>
					  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/MissingEINReasonCd != ' '">
	        			<xsl:call-template name="PopulateText">
	    	        	  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/MissingEINReasonCd"/>
	    	    		</xsl:call-template>
		         		<span class="styTableCellPad"/>
		    		  </xsl:if>
	    			  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/UnknownRegisteredOwnerCd!= ' '">
	        			<xsl:call-template name="PopulateText">
		            	  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/UnknownRegisteredOwnerCd"/>
	        			</xsl:call-template>
	    	    		<span class="styTableCellPad"/>
		    		  </xsl:if>
	    	     	  <span class="styTableCellPad"/>
				    </td>
				    <td class="styTableCellSmall" style="width:30mm; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
		    		  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/RegisteredOwnerEIN != ' '">
		        		<xsl:call-template name="PopulateEIN">
		             	  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/RegisteredOwnerEIN"/>
		        		</xsl:call-template>
			        	<span class="styTableCellPad"/>
		    		  </xsl:if>
		    		  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/RegisteredOwnerSSN != ' '">
		        		<xsl:call-template name="PopulateSSN">
	            		  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/RegisteredOwnerSSN"/>
		         		</xsl:call-template>
		        		<span class="styTableCellPad"/>
		    		  </xsl:if>
		    		  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/MissingEINReasonCd != ' '">
	     			    <xsl:call-template name="PopulateText">
	         		      <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/MissingEINReasonCd"/>
		    	    	</xsl:call-template>
		      	    	<span class="styTableCellPad"/>
			    	  </xsl:if>
		    		  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/UnknownRegisteredOwnerCd != ' '">
		        		<xsl:call-template name="PopulateText">
        	     		  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/UnknownRegisteredOwnerCd"/>
			        	</xsl:call-template>
		        		<span class="styTableCellPad"/>
	     			  </xsl:if>
		    		  <span class="styTableCellPad"/>
				    </td>
				    <td class="styTableCellSmall"  style="width:30mm; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-right-width:0px;">
	    			  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/RegisteredOwnerEIN != ' '">
	         			<xsl:call-template name="PopulateEIN">
	         			  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/RegisteredOwnerEIN"/>
		        		</xsl:call-template>
		        		<span class="styTableCellPad"/>
		    		  </xsl:if>
	       			  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/RegisteredOwnerSSN != ' '">
	        			<xsl:call-template name="PopulateSSN">
	             	      <xsl:with-param name="TargetNode"  select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/RegisteredOwnerSSN"/>
	         			</xsl:call-template>
		        		<span class="styTableCellPad"/>
		     		  </xsl:if>
	    			  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/MissingEINReasonCd != ' '">
	        			<xsl:call-template name="PopulateText">
		            	  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/MissingEINReasonCd"/>
        				</xsl:call-template>
		        		<span class="styTableCellPad"/>
		     		  </xsl:if>
	     			  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/UnknownRegisteredOwnerCd != ' '">
	         			<xsl:call-template name="PopulateText">
		            	  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/UnknownRegisteredOwnerCd"/>
		        		</xsl:call-template>
	        			<span class="styTableCellPad"/>
		    		  </xsl:if>
	        		  <span class="styTableCellPad"/>
		    		</td>
		    	  </tr>
				  <!-- Line 7 -->
				  <tr>
			    	<td style="border:none; font-size:7pt;" scope="row">
		        	  <div>
		    	        <div class="styGenericDiv"	style="width:5mm; padding-left:2mm; height:8mm; padding-top:3mm;"><b>7</b></div>
			          <div class="styGenericDiv" style="width:61mm; height:8mm; padding-top:3mm;">
				        <span style="float:left;">Name of operator </span>
			         	<!--Dotted Line-->
			            <div class="styDotLn" style="float:right; padding-right:1mm;">........</div>
			        </div>
		     	  </div>
		    		</td>
	    			<td class="styTableCellSmall" style="width:30mm; border-style:solid; border-color: black; height:8mm; padding-top:3mm; border-left-width:1px; font-size:6pt; text-align:left;">
	     	    	  <xsl:if test="OperatorBusinessName != ' '">
		            	<xsl:call-template name="PopulateText">
	         	          <xsl:with-param name="TargetNode" select="OperatorBusinessName/BusinessNameLine1Txt"/>
		            	</xsl:call-template>
		            	<span class="styTableCellPad"/>
			            <br/>
			            <xsl:call-template name="PopulateText">
			              <xsl:with-param name="TargetNode" select="OperatorBusinessName/BusinessNameLine2Txt"/>
			            </xsl:call-template>
			            <span class="styTableCellPad"/>
		        	  </xsl:if>
	         		  <xsl:if test="OperatorPersonNm != ' '">
		            	<xsl:call-template name="PopulateText">
		                  <xsl:with-param name="TargetNode" select="OperatorPersonNm"/>
		            	</xsl:call-template>
		             	<span class="styTableCellPad"/>
		        	  </xsl:if>
	         		  <xsl:if test="UnknownOperatorNameCd != ' '">
	             		<xsl:call-template name="PopulateText">
		                  <xsl:with-param name="TargetNode" select="UnknownOperatorNameCd"/>
		            	</xsl:call-template>
		            	<span class="styTableCellPad"/>
		        	  </xsl:if>
			    	</td>
     				<td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
		              <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OperatorBusinessName  != ' '">
		                <xsl:call-template name="PopulateText">
	                      <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OperatorBusinessName/BusinessNameLine1Txt"/>
	                	</xsl:call-template>
		                <span class="styTableCellPad"/>
		                <br/>
		                <xsl:call-template name="PopulateText">
                     	  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OperatorBusinessName/BusinessNameLine2Txt"/>
	                	</xsl:call-template>
		                <span class="styTableCellPad"/>
	            	  </xsl:if>
	            	  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OperatorPersonNm != ' '">
	                	<xsl:call-template name="PopulateText">
	                      <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OperatorPersonNm"/>
                		</xsl:call-template>
		                <span class="styTableCellPad"/>
		          	  </xsl:if>
	             	  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/UnknownOperatorNameCd != ' '">
	                 	<xsl:call-template name="PopulateText">
		                  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/UnknownOperatorNameCd"/>
                 	    </xsl:call-template>
		              </xsl:if>
		              <span class="styTableCellPad"/>
			        </td>
				    <!--  ********************************************************************************************  -->
				    <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
	     			  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OperatorBusinessName  != ' '">
		         		<xsl:call-template name="PopulateText">
		             	  <xsl:with-param name="TargetNode" select="  $Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OperatorBusinessName/BusinessNameLine1Txt"/>
	         			</xsl:call-template>
			        	<span class="styTableCellPad"/>
		         		<br/>
		        		<xsl:call-template name="PopulateText">
	            		  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OperatorBusinessName/BusinessNameLine2Txt"/>
	        			</xsl:call-template>
	        			<span class="styTableCellPad"/>
		    		  </xsl:if>
	     			  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OperatorPersonNm != ' '">
		        		<xsl:call-template name="PopulateText">
	            		  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OperatorPersonNm"/>
	        			</xsl:call-template>
		        		<span class="styTableCellPad"/>
		    		  </xsl:if>
	     			  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/UnknownOperatorNameCd != ' '">
		        		<xsl:call-template name="PopulateText">
		             	  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/UnknownOperatorNameCd"/>
		         		</xsl:call-template>
		    		  </xsl:if>
		     		  <span class="styTableCellPad"/>
				    </td>
				    <td class="styTableCellSmall" style="width:30mm; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:4mm; border-right-width:0px;">
	     			  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OperatorBusinessName  != ' '">
		         		<xsl:call-template name="PopulateText">
		        	      <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OperatorBusinessName/BusinessNameLine1Txt"/>
		         		</xsl:call-template>
		         		<span class="styTableCellPad"/>
		         		<br/>
	        			<xsl:call-template name="PopulateText">
	            		  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OperatorBusinessName/BusinessNameLine2Txt"/>
		        		</xsl:call-template>
	        			<span class="styTableCellPad"/>
		    		  </xsl:if>
	    			  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OperatorPersonNm!= ' '">
	        			<xsl:call-template name="PopulateText">
		           		  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OperatorPersonNm"/>
		         		</xsl:call-template>
		         		<span class="styTableCellPad"/>
		        	  </xsl:if>
		    	  	  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/UnknownOperatorNameCd  != ' '">
		        		<xsl:call-template name="PopulateText">
	    	        	  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/UnknownOperatorNameCd"/>
		    	    	</xsl:call-template>
		        		<span class="styTableCellPad"/>
		    		  </xsl:if>
			    	  <span class="styTableCellPad"/>
			    	</td>
			      </tr>
				  <!-- Line 8 -->
				  <tr>
					<td class="styIRS1120FScheduleVTableCellSmall" style="font-size:7pt;" scope="row">
					  <div>
		     	        <div class="styGenericDiv" style="width:5mm; padding-left:2mm; height:8mm; padding-top:3mm;"><b>8</b></div>
		        		<div class="styGenericDiv" style="width:61mm; height:8mm; padding-top:3mm;">
			    	      <span style="float:left;">EIN or SSN of operator</span>
			     	      <!--Dotted Line-->
			    	      <div class="styDotLn" style="float:right; padding-right:1mm;">......</div>
		     	        </div>
			          </div>
		    		</td>
		     		<td class="styTableCellSmall"  style="width:30mm; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-left-width:1px">
	        		  <xsl:if test="OperatorEIN != ' '">
			            <xsl:call-template name="PopulateEIN">
	              	      <xsl:with-param name="TargetNode" select="OperatorEIN"/>
            			</xsl:call-template>
		            	<span class="styTableCellPad"/>
	        		  </xsl:if>
	        		  <xsl:if test="OperatorSSN != ' '">
		            	<xsl:call-template name="PopulateSSN">
		             	  <xsl:with-param name="TargetNode" select="OperatorSSN"/>
	             		</xsl:call-template>
		            	<span class="styTableCellPad"/>
		    	      </xsl:if>
		         	  <xsl:if test="EINMissingReasonCd != ' '">
	            		<xsl:call-template name="PopulateText">
	                	  <xsl:with-param name="TargetNode" select="EINMissingReasonCd"/>
		            	</xsl:call-template>
		            	<span class="styTableCellPad"/>
	         		  </xsl:if>
	         		  <xsl:if test="UnknownOperatorCd != ' '">
		            	<xsl:call-template name="PopulateText">
	                	  <xsl:with-param name="TargetNode" select="UnknownOperatorCd"/>
	             		</xsl:call-template>
	            		<span class="styTableCellPad"/>
	         		  </xsl:if>
	        		  <span class="styTableCellPad"/>
			    	</td>
	     			<td class="styTableCellSmall" style="width:30mm; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
	        		  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OperatorEIN != ' '">
	             		<xsl:call-template name="PopulateEIN">
		                  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OperatorEIN"/>
	            		</xsl:call-template>
		            	<span class="styTableCellPad"/>
		        	  </xsl:if>
		        	  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OperatorSSN != ' '">
		            	<xsl:call-template name="PopulateSSN">
	                	  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OperatorSSN"/>
	            		</xsl:call-template>
			            <span class="styTableCellPad"/>
	        		  </xsl:if>
		         	  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/EINMissingReasonCd != ' '">
	                	<xsl:call-template name="PopulateText">
		                  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/EINMissingReasonCd"/>
	                 	</xsl:call-template>
		                <span class="styTableCellPad"/>
		              </xsl:if>
	         		  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/UnknownOperatorCd != ' '">
		                <xsl:call-template name="PopulateText">
		                  <xsl:with-param name="TargetNode"	select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/ UnknownOperatorCd"/>
		            	</xsl:call-template>
		            	<span class="styTableCellPad"/>
		              </xsl:if>
		        	  <span class="styTableCellPad"/>
			    	</td>
			    	<td class="styTableCellSmall" style="width:30mm; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
		              <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OperatorEIN != ' '">
		            	<xsl:call-template name="PopulateEIN">
	                 	  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OperatorEIN"/>
	            		</xsl:call-template>
	            		<span class="styTableCellPad"/>
	         		  </xsl:if>
	         		  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OperatorSSN != ' '">
	            	    <xsl:call-template name="PopulateSSN">
		                  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OperatorSSN"/>
	            		</xsl:call-template>
		            	<span class="styTableCellPad"/>
			          </xsl:if>
	        		  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/EINMissingReasonCd != ' '">
	            	    <xsl:call-template name="PopulateText">
	                 	  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/ EINMissingReasonCd"/>
		             	</xsl:call-template>
			            <span class="styTableCellPad"/>
		         	  </xsl:if>
	        		  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/UnknownOperatorCd != ' '">
		            	<xsl:call-template name="PopulateText">
		                  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/UnknownOperatorCd"/>
		            	</xsl:call-template>
	            		<span class="styTableCellPad"/>
		        	  </xsl:if>
		         	  <span class="styTableCellPad"/>
			    	</td>
			    	<td class="styTableCellSmall" style="width:30mm; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-right-width:0px;">
	         		  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OperatorEIN != ' '">
	            	    <xsl:call-template name="PopulateEIN">
		             	  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OperatorEIN"/>
	         		    </xsl:call-template>
		        	    <span class="styTableCellPad"/>
			          </xsl:if>
			          <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OperatorSSN != ' '">
		             	<xsl:call-template name="PopulateSSN">
		                  <xsl:with-param name="TargetNode"	 select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OperatorSSN"/>
	            		</xsl:call-template>
	            		<span class="styTableCellPad"/>
	        		  </xsl:if>
		        	  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/EINMissingReasonCd != ' '">
		            	<xsl:call-template name="PopulateText">
		                  <xsl:with-param name="TargetNode" 	select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/EINMissingReasonCd"/>
		             	</xsl:call-template>
	            		<span class="styTableCellPad"/>
		        	  </xsl:if>
	        		  <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/UnknownOperatorCd!= ' '">
	              		<xsl:call-template name="PopulateText">
	                	  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/UnknownOperatorCd"/>
		             	</xsl:call-template>
	            		<span class="styTableCellPad"/>
		        	  </xsl:if>
		        	  <span class="styTableCellPad"/>
			    	</td>
				  </tr>
				  <!-- Line 9 -->
				  <tr>
	      			<td class="styIRS1120FScheduleVTableCellSmall" style="font-size:7pt;" scope="row">
		         	  <div> 
		         	    <div class="styGenericDiv" style="width:5mm; font-size:7.5pt; padding-left:2mm; height:20mm; padding-top:3mm;"><b>9</b></div>
						<div class="styGenericDiv" style="width:61mm; height:20mm; padding-top:3mm;">
			         	  U.S. source gross transportation income. See instructions for details regarding a statement that must be 
			         	  attached to Schedule V describing the method used to determine your U.S. source 
			         	  <span style="float:left;">gross transportation income. </span>
			       	      <!--Dotted Line-->
			     	      <div class="styDotLn" style="float:right; padding-right:1mm;">......</div>
			        	    </div>
			    	      </div>
			    	    </td>
			      	<td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:20mm; padding-top:15mm; border-left-width:1px; text-align:right;">
		         	  <xsl:call-template name="PopulateAmount">
			            <xsl:with-param name="TargetNode" select="USSourceGrossTransIncmAmt"/>
			          </xsl:call-template>
		        	      <span class="styTableCellPad"/>
		     		</td>
	     			<td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:20mm; padding-top:15mm;">
	        		      <xsl:call-template name="PopulateAmount">
	             		<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/USSourceGrossTransIncmAmt"/>
			          </xsl:call-template>
		         	  <span class="styTableCellPad"/>
			     	</td>
		     		<td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:20mm; padding-top:15mm;">
			          <xsl:call-template name="PopulateAmount">
	            		    <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +  2]/USSourceGrossTransIncmAmt"/>
			          </xsl:call-template>
		        	      <span class="styTableCellPad"/>
			     	</td>
		     		<td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color: black; height:20mm; padding-top:15mm; border-right-width:0px;">
		        	      <xsl:call-template name="PopulateAmount">
		            	    <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/USSourceGrossTransIncmAmt"/>
	        		      </xsl:call-template>
		        	      <span class="styTableCellPad"/>
		    		    </td>
				  </tr>
				  <tr>
				    <td colspan="5">
				      <span class="styTableCellPad"/>
				    </td>
				  </tr>
			    </xsl:if>
		      </xsl:for-each>
	          <!-- first for-each vessel aircraft information -->
	        </table>
          </xsl:if>
          <!-- this should start separated mode -->
		  <!-- start II -->
          <xsl:if test="((count($Form1120FScheduleVData/VesselAircraftInformation) &gt;4) and ($Print = $Separated))">
	        <table class="styTable" cellspacing="0" style="border-color:black;width:187mm;">
		      <xsl:variable name="pos" select="position()"/>
		      <xsl:if test="position() mod 4 = 1">
			  <!-- title row -->
			    <tr>
				  <td style="border:none;" scope="row">
					<div>
					  <span class="styTableCellPad"  style="width:67mm;height:5mm;"/>
					</div>
				  </td>
				  <td class="styTableCellSmall" style="width:30mm; text-align:center; font-weight:bold; border-color:black; border-top-width:1px; border-left-width:1px; border-right-width:1px;">
	            	<xsl:number value="position()" format="A"/>
		         	<span class="styTableCellPad"/>
			      </td>
	    		  <td class="styTableCellSmall" style="width:30mm; text-align:center; font-weight:bold; border-color:black; border-top-width:1px; border-left-width:0px; border-right-width:1px;">
	     			<xsl:number value="position()+1" format="A"/>
		    		<span class="styTableCellPad"/>
	    		  </td>
	    		  <td class="styTableCellSmall" style="width:30mm; text-align:center; font-weight:bold; border-color:black; border-top-width:1px; border-left-width:0px; border-right-width:1px;">
		     		<xsl:number value="position()+2" format="A"/>
		     		<span class="styTableCellPad"/>
		    	  </td>
		    	  <td class="styTableCellSmall" style="width:30mm; text-align:center; font-weight:bold; border-color:black; border-top-width:1px; border-left-width:0px; border-right-width:0px;">
		     		<xsl:number value="position()+3" format="A"/>
		        	<span class="styTableCellPad"/>
		    	  </td>
		        </tr>
			    <!-- Line 1 -->
			    <tr>
				  <td style="border:none;" scope="row">
					<div style="width:67mm;">
					  <div class="styBoldText" style="width:5mm; float:left; font-size:7.5pt; padding-left:2mm; height:8mm; padding-top:3mm;">1 </div>
					  <div class="styGenericDiv" style="width:60mm; font-size:7.5pt; padding-top:3mm;">Name of vessel or type of aircraft
						<!--Dotted Line-->
						<div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
					  </div>
					</div>
				  </td>
				  <td class="styTableCellSmall" style="width:30mm; border-color:black; height:8mm; padding-top:3mm; border-left-width:1px; font-size:6pt; text-align:left">
		     	    <xsl:call-template name="PopulateAdditionalDataTableMessage">
		    		  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation/VesselOrAircraftNm"/>
				    </xsl:call-template>
		    	    <span class="styTableCellPad"/>
		 		  </td>
				  <td class="styTableCellSmall"	 style="width:30mm; border-color:black; height:8mm; padding-top:3mm; font-size:6pt; text-align:left">
		       		<span class="styTableCellPad"/>
				  </td>
				  <td class="styTableCellSmall" style="width:30mm; border-color:black; height:8mm; padding-top:3mm; font-size:6pt; text-align:left">
		        	<span class="styTableCellPad"/>
				  </td>
				  <td class="styTableCellSmall" style="width:30mm; border-color:black; height:8mm; padding-top:3mm; border-right-width:0px; font-size:6pt; text-align:left">
	    			<span class="styTableCellPad"/>
				  </td>
			    </tr>
			    <!--  ***************************************************************************************************************************  -->
			    <!-- Line 2 -->
			    <tr>
				  <td style="border:none;" scope="row">
					<div style="width:67mm;">
					  <div class="styBoldText" style="width:5mm; float:left; font-size:7.5pt; padding-left:2mm; height:8mm; padding-top:3mm;">2</div>
		     		  <div class="styGenericDiv" style="width:60mm; font-size:7.5pt; padding-top:3mm;">Vessel or aircraft ID number
						<!--Dotted Line-->
						<div class="styDotLn" style="float:right; padding-right:1mm;">....</div>
					  </div>
					</div>
				  </td>
			      <td class="styTableCellSmall" style="width:30mm; border-color:black; height:8mm; padding-top:3mm; border-left-width:1px; font-size:6pt; text-align:left">
		    	    <span class="styTableCellPad"/>
			      </td>
			      <td class="styTableCellSmall" style="width:30mm; border-color:black; height:8mm; padding-top:3mm; font-size:6pt; text-align:left">
	    		    <span class="styTableCellPad"/>
			      </td>
			      <td class="styTableCellSmall"  style="width:30mm; border-color:black; height:8mm; padding-top:3mm; font-size:6pt; text-align:left">
	     		    <span class="styTableCellPad"/>
			      </td>
			      <td class="styTableCellSmall" style="width:30mm; border-color:black; height:8mm; padding-top:3mm; border-right-width:0px; font-size:6pt; text-align:left">
	     		    <span class="styTableCellPad"/>
			      </td>
		        </tr>
			    <!-- ============================================================================= -->
			    <!-- Line 3 -->
			    <!-- ============================================================================= -->
			    <tr>
				  <td style="border:none;" scope="row">
					<div style="width:67mm;">
					  <div class="styBoldText" style="width:5mm; float:left; font-size:7.5pt; padding-left:2mm; height:8mm; padding-top:3mm;">3</div>
					  <div class="styGenericDiv" style="width:60mm; font-size:7.5pt; padding-top:3mm;">
					    Was the vessel or aircraft chartered in?
						<!--Dotted Line-->
						<div class="styDotLn" style="float:right; padding-right:1mm;">.</div>
					  </div>
					</div>
				  </td>
	     		  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-left-width:1px; text-align:center;">
	        		<span style="width:1px;"/>
	        		<input type="checkbox" alt="Yes" class="styCkbox"></input>
		        	<label><span style="font-size:6pt">Yes </span></label>
		            <span style="width:5mm"/>
		        	<input type="checkbox" alt="No" class="styCkbox"></input>
		        	<label><span style="font-size:6pt">No </span><span style="width:2mm"/></label>
		        	<span class="styTableCellPad"/>
		    	  </td>
     			  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:8mm; padding-top:3mm; text-align:center">
	         		<span style="width:1px;"/>
		        	<input type="checkbox" alt="Yes" class="styCkbox"></input>
	         		<label><span style="font-size:6pt">Yes </span></label>
		            <span style="width:5mm"/>
		         	<input type="checkbox" alt="No" class="styCkbox"></input>
		        	<label><span style="font-size:6pt">No </span><span style="width:2mm"/></label>
		            <span class="styTableCellPad"/>
			      </td>
		     	  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style: solid;	border-color:black; height:8mm; padding-top:3mm; text-align:center">
		            <span style="width:1px;"/>
		        	<input type="checkbox" alt="Yes" class="styCkbox"></input>
	        		<label><span style="font-size:6pt">Yes </span></label>
		            <span style="width:5mm"/>
		         	<input type="checkbox" alt="No" class="styCkbox"></input>
		        	<label><span style="font-size:6pt">No </span><span style="width:2mm"/></label>
		     	  </td>
     			  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:8mm; padding-top:3mm; text-align:center; border-right-width:0px;">
	        		<span style="width:1px;"/>
		        	<input type="checkbox" alt="Yes" class="styCkbox"></input>
		         	<label><span style="font-size:6pt">Yes </span></label>
		            <span style="width:5mm"/>
		         	<input type="checkbox" alt="No" class="styCkbox"></input>
	        		<label><span style="font-size:6pt">No </span><span style="width:2mm"/></label>
	            	<span class="styTableCellPad"/>
		    	  </td>
			    </tr>
			    <!-- ============================================================================= -->
			    <!-- Line 4 -->
			    <!-- ============================================================================= -->
			    <tr>
				  <td style="border:none;" scope="row">
					<div style="width:67mm;">
					  <div class="styBoldText" style="width:5mm; float:left; font-size:7.5pt; padding-left:2mm; height:8mm; padding-top:3mm;">4</div>
					  <div class="styGenericDiv" style="width:60mm; font-size:7.5pt; padding-top:3mm;"> Was the vessel or aircraft chartered out?
					    <!--Dotted Line-->
						<div class="styDotLn" style="float:right; padding-right:1mm;">.</div>
					  </div>
					</div>
				  </td>
	     		  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-left-width:1px;">
		            <input type="checkbox" alt="Yes" class="styCkbox"></input>
	            	<label><span style="font-size:6pt">Yes </span></label>
		            <span style="width:5mm"/>
		            <input type="checkbox" alt="No" class="styCkbox"></input>
		            <label><span style="font-size:6pt">No </span><span style="width:2mm"/></label>
		            <span class="styTableCellPad"/>
			      </td>
		    	  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm">
             		<input type="checkbox" alt="Yes" class="styCkbox"></input>
		            <label><span style="font-size:6pt">Yes </span></label>
		            <span style="width:5mm"/>
	            	<input type="checkbox" alt="No" class="styCkbox"></input>
		            <label><span style="font-size:6pt">No </span><span style="width:2mm"/></label>
		            <span class="styTableCellPad"/>
		    	  </td>
     			  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm">
	            	<input type="checkbox" alt="Yes" class="styCkbox"></input>
		            <label><span style="font-size:6pt">Yes </span></label>
	                <span style="width:5mm"/>
	             	<input type="checkbox" alt="No" class="styCkbox"></input>
	             	<label><span style="font-size:6pt">No </span><span style="width:2mm"/></label>
		         	<span class="styTableCellPad"/>
		     	  </td>
		     	  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-right-width:0px;">
		         	<input type="checkbox" alt="Yes" class="styCkbox"></input>
	         		<label>
		              <span style="font-size:6pt">Yes </span>
		        	</label>
		            <span style="width:5mm"/>
		         	<input type="checkbox" alt="No" class="styCkbox">
		            </input>
		            <label>
			          <span style="font-size:6pt">No </span>
		              <span style="width:2mm"/>
		         	</label>
		          	<span class="styTableCellPad"/>
		     	  </td>
			    </tr>
			    <!-- Line 5 -->
			    <tr>
				  <td style="border:none;" scope="row">
					<div style="width:67mm;">
					  <div class="styBoldText" style="width:5mm; float:left; font-size:7.5pt; padding-left:2mm; height:8mm; padding-top:3mm;">5</div>
					  <div class="styGenericDiv" style="width:60mm; font-size:7.5pt; padding-top:3mm;">
					    Name of registered owner
						<!--Dotted Line-->
						<div class="styDotLn" style="float:right; padding-right:1mm;">.....</div>
					  </div>
					</div>
				  </td>
		    	  <td class="styTableCellSmall" style="width:30mm;f ont-size:6pt; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-left-width:1px;">
	            	<span class="styTableCellPad"/>
	             	<br/>
		             <span class="styTableCellPad"/>
		    	  </td>
	    		  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
		         	<br/>
	    	     	<span class="styTableCellPad"/>
		    	  </td>
	    		  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
     	    		<br/>
		         	<span class="styTableCellPad"/>
		    	  </td>
		    	  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-right-width:0px;">
		         	<br/>
			       <span class="styTableCellPad"/>
		    	  </td>
	    	    </tr>
			    <!-- Line 6 -->
			    <tr>
				  <td style="border:none;" scope="row">
					<div style="width:67mm;">
					  <div class="styBoldText" style="width:5mm; float:left; font-size:7.5pt; padding-left:2mm; height:8mm; padding-top:3mm;">6</div>
					  <div class="styGenericDiv" style="width:60mm; font-size:7.5pt; padding-top:3mm;">
						EIN or SSN of registered owner
						<!--Dotted Line-->
						<div class="styDotLn" style="float:right; padding-right:1mm;">...</div>
					  </div>
					</div>
				  </td>
		    	  <td class="styTableCellSmall" style="width:30mm; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-left-width:1px; text-align:center;">
	        	    <span class="styTableCellPad"/>
	    		  </td>
	    		  <td class="styTableCellSmall" style="width:30mm; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
	        		<span class="styTableCellPad"/>
	     		  </td>
	    		  <td class="styTableCellSmall" style="width:30mm; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
	        		<span class="styTableCellPad"/>
    			  </td>
	    		  <td class="styTableCellSmall" style="width:30mm; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-right-width:0px;">
		        	<span class="styTableCellPad"/>
	    		  </td>
			    </tr>
			    <!-- Line 7 -->
			    <tr>
				  <td style="border:none;" scope="row">
					<div style="width:67mm;">
					  <div class="styBoldText" style="width:5mm; float:left; font-size:7.5pt; padding-left:2mm; height:8mm; padding-top:3mm;"> 7</div>
					  <div class="styGenericDiv" style="width:60mm; font-size:7.5pt; padding-top:3mm;">Name of operator
						<!--Dotted Line-->
						<div class="styDotLn" style="float:right; padding-right:1mm;">.......</div>
					  </div>
					</div>
				  </td>
		    	  <td class="styTableCellSmall" style="width:30mm; border-style:solid; border-color: black;	height:8mm; padding-top:3mm; border-left-width:1px; font-size:6pt; text-align:left;">
		        	<span class="styTableCellPad"/>
		    	  </td>
		    	  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
		        	<span class="styTableCellPad"/>
			      </td>
		    	  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
	     	     	<span class="styTableCellPad"/>
			      </td>
		    	  <td class="styTableCellSmall" style="width:30mm; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-right-width:0px;">
		        	<span class="styTableCellPad"/>
		        	<span class="styTableCellPad"/>
		    	  </td>
			    </tr>
			    <!-- Line 8 -->
			    <tr>
				  <td style="border:none;" scope="row">
					<div style="width:67mm;">
					  <div class="styBoldText"  style="width:5mm; float:left; font-size:7.5pt; padding-left:2mm; height:8mm; padding-top:3mm;">8</div>
					  <div class="styGenericDiv" style="width:60mm; font-size:7.5pt; padding-top:3mm;"> EIN or SSN of operator
						<!--Dotted Line-->
						<div class="styDotLn" style="float:right; padding-right:1mm;">......</div>
					  </div>
					</div>
				  </td>
	    		  <td class="styTableCellSmall" style="width:30mm; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-left-width:1px">
	        		<span class="styTableCellPad"/>
	    		  </td>
	    		  <td class="styTableCellSmall"	 style="width:30mm; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
		         	<span class="styTableCellPad"/>
		    	  </td>
		    	  <td class="styTableCellSmall" style="width:30mm; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
	        		<span class="styTableCellPad"/>
		    	  </td>
		    	  <td class="styTableCellSmall"	style="width:30mm; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-right-width:0px;">
		         	<span class="styTableCellPad"/>
		        	<span class="styTableCellPad"/>
	    		  </td>
		  	    </tr>
			    <!-- line 9 Blank Row 1-->
			    <tr>
				<td style="border:none;" scope="row">
				  <div style="width:67mm;">
					<div class="styBoldText"  style="width:5mm; float:left; font-size:7.5pt; padding-left:2mm; height:8mm; padding-top:3mm;">9</div>
					<div class="styGenericDiv" style="width:60mm; font-size:7.5pt; padding-top:3mm;">
						U.S. source gross transportation income. See instructions for details regarding a statement that must be attached
						to Schedule V describing the method used to determine your U.S. source gross transportation income.
					  <!--Dotted Line-->
					  <div class="styDotLn" style="float:right; padding-right:1mm;">.......</div>
					</div>
				  </div>
				</td>
	    		<td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-left-width:1px; text-align:right;">
         		  <span class="styTableCellPad"/>
	    		</td>
	    		<td class="styTableCellSmall"  style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
	           	  <span class="styTableCellPad"/>
		    	</td>
	    		<td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
	        	  <span class="styTableCellPad"/>
		     	</td>
	     		<td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-right-width:0px;">
        		  <span class="styTableCellPad"/>
	    		</td>
			  </tr>
			  <tr>
		    	<td colspan="5">
		          <span class="styTableCellPad"/>
		    	</td>
	  		  </tr>
		    </xsl:if>
		    <!-- first for-each vessel aircraft information -->
	      </table>
        </xsl:if>
      </xsl:if>
      <!-- this is the endif for whether vessel aircraft info is available -->
      <!-- a001 -->
      <!--  START Empty Table - it is simply a copy of the above table with a dummy value for position -->
      <xsl:if test="not($Form1120FScheduleVData/VesselAircraftInformation)">
        <table class="styTable" cellspacing="0">
          <xsl:variable name="pos" select="1"/>
          <!-- This is just a dummy value so the empty table works properly -->
          <!-- title row -->
          <tr>
		    <td style="border:none;" scope="row">
			  <div>
				<span class="styTableCellPad"  style="width:67mm; height:5mm;"/>
			  </div>
		    </td>
			<td class="styTableCellSmall" style="width:30mm; text-align:center; font-weight:bold; border-color:black; border-top-width:1px; border-left-width:1px; border-right-width:1px;">
              A<span class="styTableCellPad"/>
            </td>
            <td class="styTableCellSmall" style="width:30mm; text-align:center; font-weight:bold; border-color:black; border-top-width:1px; border-left-width:0px; border-right-width:1px;">
              B<span class="styTableCellPad"/>
            </td>
            <td class="styTableCellSmall" style="width:30mm; text-align:center; font-weight:bold; border-color:black; border-top-width:1px; border-left-width:0px; border-right-width:1px;">
              C<span class="styTableCellPad"/>
            </td>
            <td class="styTableCellSmall" style="width:30mm; text-align:center; font-weight:bold; border-color:black; border-top-width:1px; border-left-width:0px; border-right-width:0px;">
              D<span class="styTableCellPad"/>
            </td>
          </tr>
          <!-- ********************************************************************************************************  -->
          <!-- Line 1 -->
          <tr>
            <td style="border:none;" scope="row">
              <div style="width:67mm;">
	         	<div class="styBoldText" style="width:5mm; float:left; font-size:7.5pt; padding-left:2mm; height:8mm; padding-top:3mm;">1</div>
	        	<div class="styGenericDiv" style="width:60mm; font-size:7.5pt; padding-top:3mm;">Name of vessel or type of aircraft
		     	  <!--Dotted Line-->
	     		  <div class="styDotLn" style="float:right; padding-right:1mm;">...</div>
	         	</div>
	          </div>
            </td>
            <td class="styTableCellSmall" style="width:30mm; border-color:black; height:8mm; padding-top:3mm; border-left-width:1px; font-size:6pt; text-align:left">
              <span class="styTableCellPad"/>
            </td>
            <td class="styTableCellSmall"  style="width:30mm; border-color:black; height:8mm; padding-top:3mm; font-size:6pt; text-align:left">
              <span class="styTableCellPad"/>
            </td>
            <td class="styTableCellSmall" style="width:30mm; border-color:black; height:8mm; padding-top:3mm; font-size:6pt; text-align:left">
              <span class="styTableCellPad"/>
            </td>
            <td class="styTableCellSmall" style="width:30mm; border-color:black; height:8mm; padding-top:3mm; border-right-width:0px; font-size:6pt; text-align:left">
              <span class="styTableCellPad"/>
            </td>
          </tr>
          <!-- Line 2 -->
          <tr>
            <td style="border:none; widht:67mm;" scope="row">
			  <div>
				<div class="styGenericDiv" style="width:5mm; font-size:7.5pt; padding-left:2mm; height:8mm; padding-top:3mm;"><b>2</b>
				</div>
				<div class="styGenericDiv" style="width:61mm; font-size:7.5pt; padding-top:3mm;"> 
				  <span style="float:left;">Vessel or aircraft ID number</span>
					<!--Dotted Line-->
					<div class="styDotLn" style="float:right; padding-right:1mm;">....</div>
				</div>
			  </div>
            </td>
            <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-left-width:1px; text-align:left;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="VesselOrAircraftIDNum"/>
              </xsl:call-template>
              <span class="styTableCellPad"/>
            </td>
            <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:8mm; padding-top:3mm; text-align:left;">
              <span class="styTableCellPad"/>
            </td>
            <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:8mm; padding-top:3mm; text-align:left;">
              <span class="styTableCellPad"/>
            </td>
            <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:8mm; padding-top:3mm; text-align:left; border-right-width:0px; border-top-width:0px;">
              <xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode"  select="$Form1120FScheduleVData/ VesselAircraftInformation[$pos + 3]/VesselOrAircraftIDNum"/>
              </xsl:call-template>
              <span class="styTableCellPad"/>
            </td>
          </tr>
          <!-- ============================================================================= -->
          <!-- Line 3 -->
          <!-- ============================================================================= -->
          <tr>
            <td style="border:none;" scope="row">
			  <div>
			    <div class="styGenericDiv"	style="font-size:7pt; width:5mm; padding-left:2mm; height:8mm; padding-top:3mm;"><b>3</b></div>
				<div class="styGenericDiv" style="width:61mm; height:8mm; font-size:7pt; padding-top:3mm;">
				  <span style="float:left;">Was the vessel or aircraft chartered in?</span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right;padding-right:1mm;">..</div>
				</div>
			  </div>
            </td>
            <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-left-width:1px; text-align:center;">
              <span style="width:1px;"/>
              <input type="checkbox" alt="Vessel Or Aircraft Chartered In Indicator Yes" class="styCkbox">
                <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
                  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn1</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
                  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn1</xsl:with-param>
                </xsl:call-template>
                <span style="font-size:6pt">Yes </span>
              </label>
              <span style="width:5mm"/>
              <input type="checkbox" alt="Vessel Or Aircraft Chartered In Indicator No" class="styCkbox">
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
                  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn1</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
                  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn1</xsl:with-param>
                </xsl:call-template>
                <span style="font-size:6pt">No </span>
                <span style="width:2mm"/>
              </label>
              <span class="styTableCellPad"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
              </xsl:call-template>
            </td>
            <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:8mm; padding-top:3mm; text-align:center">
              <span style="width:1px;"/>
              <input type="checkbox" alt="Vessel Or Aircraft Chartered In Indicator Yes" class="styCkbox">
                <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftCharteredInInd"/>
                  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn2</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftCharteredInInd"/>
                  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn2</xsl:with-param>
                </xsl:call-template>
                <span style="font-size:6pt">Yes </span>
              </label>
              <span style="width:5mm"/>
              <input type="checkbox" alt="Vessel Or Aircraft Chartered In Indicator No" class="styCkbox">
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftCharteredInInd"/>
                  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn2</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftCharteredInInd"/>
                  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn2</xsl:with-param>
                </xsl:call-template>
                <span style="font-size:6pt">No </span>
                <span style="width:2mm"/>
              </label>
              <span class="styTableCellPad"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
              </xsl:call-template>
            </td>
            <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:8mm; padding-top:3mm; text-align:center">
              <span style="width:1px;"/>
              <input type="checkbox" alt="Vessel Or Aircraft Chartered In Indicator Yes" class="styCkbox">
                <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode"  select=" $Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrAircraftCharteredInInd"/>
                  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn3</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrAircraftCharteredInInd"/>
                  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn3</xsl:with-param>
                </xsl:call-template>
                <span style="font-size:6pt">Yes </span>
              </label>
              <span style="width:5mm"/>
              <input type="checkbox" alt="Vessel Or Aircraft Chartered In Indicator No"  class="styCkbox">
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrAircraftCharteredInInd"/>
                  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn3</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrAircraftCharteredInInd"/>
                  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn3</xsl:with-param>
                </xsl:call-template>
                <span style="font-size:6pt">No </span>
                <span style="width:2mm"/>
              </label>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
              </xsl:call-template>
            </td>
            <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:8mm; padding-top:3mm; text-align:center; border-right-width:0px;">
              <span style="width:1px;"/>
              <input type="checkbox" alt="Vessel Or Aircraft Chartered In Indicator Yes" class="styCkbox">
                <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrAircraftCharteredInInd"/>
                  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn4</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrAircraftCharteredInInd"/>
                  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn4</xsl:with-param>
                </xsl:call-template>
                <span style="font-size:6pt">Yes </span>
              </label>
              <span style="width:5mm"/>
              <input type="checkbox" alt="essel Or Aircraft Chartered In Indicator No" class="styCkbox">
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrAircraftCharteredInInd"/>
                  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn4</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrAircraftCharteredInInd"/>
                  <xsl:with-param name="BackupName">VesselOrAircraftCharteredIn4</xsl:with-param>
                </xsl:call-template>
                <span style="font-size:6pt">No </span>
                <span style="width:2mm"/>
              </label>
              <span class="styTableCellPad"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
              </xsl:call-template>
            </td>
          </tr>
          <!-- ============================================================================= -->
          <!-- Line 4 -->
          <!-- ============================================================================= -->
          <tr>
            <td style="border:none; font-size:7pt;" scope="row">
			  <div>
				<div class="styGenericDiv" style="width:5mm; font-size:7pt; padding-left:2mm; height:8mm; padding-top:3mm;"><b>4</b></div>
				<div class="styGenericDiv" style="width:61mm; font-size:7pt; height:8mm; padding-top:3mm;">
				  <span style="float:left;">Was the vessel or aircraft chartered out?</span>
				  <!--Dotted Line-->
				  <div class="styDotLn" style="float:right; padding-right:1mm;">..</div>
				</div>
			  </div>
            </td>
            <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-left-width:1px;">
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
              </xsl:call-template>								
              <input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator Yes" class="styCkbox">
                <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
                  <xsl:with-param name="BackupName">VesselOrArcrftCharteredOut1</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
                  <xsl:with-param name="BackupName">1VesselOrArcrftCharteredOut1</xsl:with-param>
                </xsl:call-template>
                <span style="font-size:6pt">Yes </span>
              </label>
              <span style="width:5mm"/>
              <input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator No" class="styCkbox">
                <xsl:call-template name="PopulateNoCheckbox">
                  <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
                  <xsl:with-param name="BackupName">VesselOrArcrftCharteredOut1</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelNo">
                  <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
                  <xsl:with-param name="BackupName">VesselOrArcrftCharteredOut1</xsl:with-param>
                </xsl:call-template>
                <span style="font-size:6pt">No </span>
                <span style="width:2mm"/>
              </label>
              <span class="styTableCellPad"/>
              <xsl:call-template name="SetFormLinkInline">
                <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
              </xsl:call-template>
            </td>
            <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm">
              <xsl:call-template name="PopulateSpan">
                <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrArcrftCharteredOutInd"/>
              </xsl:call-template>								
              <input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator Yes" class="styCkbox">
                <xsl:call-template name="PopulateYesCheckbox">
                  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrArcrftCharteredOutInd"/>
                  <xsl:with-param name="BackupName">VesselOrArcrftCharteredOut2</xsl:with-param>
                </xsl:call-template>
              </input>
              <label>
                <xsl:call-template name="PopulateLabelYes">
                  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrArcrftCharteredOutInd"/>
                  <xsl:with-param name="BackupName">VesselOrArcrftCharteredOut2</xsl:with-param>
                </xsl:call-template>
               <span style="font-size:6pt">Yes </span>
              </label>
            <span style="width:5mm"/>
            <input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator No" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrArcrftCharteredOutInd"/>
                <xsl:with-param name="BackupName">VesselOrArcrftCharteredOut2</xsl:with-param>
              </xsl:call-template>
            </input>
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrArcrftCharteredOutInd"/>
                <xsl:with-param name="BackupName">VesselOrArcrftCharteredOut2</xsl:with-param>
              </xsl:call-template>
              <span style="font-size:6pt">No </span>
              <span style="width:2mm"/>
            </label>
            <span class="styTableCellPad"/>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
            </xsl:call-template>
          </td>
          <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm">
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrArcrftCharteredOutInd"/>
            </xsl:call-template>								
            <input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator Yes" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrArcrftCharteredOutInd"/>
                <xsl:with-param name="BackupName">VesselOrArcrftCharteredOut3</xsl:with-param>
              </xsl:call-template>
            </input>
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrArcrftCharteredOutInd"/>
                <xsl:with-param name="BackupName">VesselOrArcrftCharteredOut3</xsl:with-param>
              </xsl:call-template>
              <span style="font-size:6pt">Yes </span>
            </label>
            <span style="width:5mm"/>
            <input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator No" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrArcrftCharteredOutInd"/>
                <xsl:with-param name="BackupName">VesselOrArcrftCharteredOut3</xsl:with-param>
              </xsl:call-template>
            </input>
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrArcrftCharteredOutInd"/>
                <xsl:with-param name="BackupName">VesselOrArcrftCharteredOut3</xsl:with-param>
              </xsl:call-template>
              <span style="font-size:6pt">No </span>
              <span style="width:2mm"/>
            </label>
            <span class="styTableCellPad"/>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
            </xsl:call-template>
          </td>
          <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-right-width:0px;">
            <xsl:call-template name="PopulateSpan">
              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrArcrftCharteredOutInd"/>
            </xsl:call-template>								
            <input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator Yes" class="styCkbox">
              <xsl:call-template name="PopulateYesCheckbox">
                <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrArcrftCharteredOutInd"/>
                <xsl:with-param name="BackupName">VesselOrArcrftCharteredOut4</xsl:with-param>
              </xsl:call-template>
            </input>
            <label>
              <xsl:call-template name="PopulateLabelYes">
                <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrArcrftCharteredOutInd"/>
                <xsl:with-param name="BackupName">VesselOrArcrftCharteredOut4</xsl:with-param>
              </xsl:call-template>
              <span style="font-size:6pt">Yes </span>
            </label>
            <span style="width:5mm"/>
            <input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator No" class="styCkbox">
              <xsl:call-template name="PopulateNoCheckbox">
                <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrArcrftCharteredOutInd"/>
                <xsl:with-param name="BackupName">VesselOrArcrftCharteredOut4</xsl:with-param>
              </xsl:call-template>
            </input>
            <label>
              <xsl:call-template name="PopulateLabelNo">
                <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrArcrftCharteredOutInd"/>
                <xsl:with-param name="BackupName">VesselOrArcrftCharteredOut4</xsl:with-param>
              </xsl:call-template>
              <span style="font-size:6pt">No </span>
              <span style="width:2mm"/>
            </label>
            <span class="styTableCellPad"/>
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
            </xsl:call-template>
          </td>
        </tr>
        <!-- Line 5 -->
        <tr>
          <td style="border:none;font-size:7pt;" scope="row">
			<div>
			  <div class="styGenericDiv" style="width:5mm;padding-left:2mm;height:8mm;padding-top:3mm;"><b>5</b></div>
			  <div class="styGenericDiv" style="width:61mm;height:8mm;padding-top:3mm;">
			    <span style="float:left;">Name of registered owner</span>
				<!--Dotted Line-->
				<div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
			  </div>
			</div>
          </td>
          <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-left-width:1px;">
            <span class="styTableCellPad"/>
            <br/>
            <span class="styTableCellPad"/>
          </td>
          <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
            <br/>
            <span class="styTableCellPad"/>
          </td>
          <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
            <br/>
            <span class="styTableCellPad"/>
          </td>
          <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-right-width:0px;">
            <br/>
            <span class="styTableCellPad"/>
          </td>
        </tr>
        <!-- Line 6 -->
        <tr>
          <td style="border:none; font-size:7pt;" scope="row">
			<div>
			  <div class="styGenericDiv" style="width:5mm; padding-left:2mm; height:8mm; padding-top:3mm;"><b>6</b></div>
			  <div class="styGenericDiv" style="width:61mm; height:8mm; padding-top:3mm;">
				<span style="float:left;">EIN or SSN of registered owner</span>
				<!--Dotted Line-->
				<div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
			  </div>
			</div>
          </td>
          <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-left-width:1px;">
            <span class="styTableCellPad"/>
            <br/>
            <span class="styTableCellPad"/>
          </td>
          <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
            <br/>
            <span class="styTableCellPad"/>
          </td>
          <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
            <span class="styTableCellPad"/>
          </td>
          <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-right-width:0px;">
            <span class="styTableCellPad"/>
          </td>
        </tr>
        <!-- Line 7 -->
        <tr>
          <td style="border:none; font-size:7pt;" scope="row">
		    <div>
			  <div class="styGenericDiv" style="width:5mm; padding-left:2mm; height:8mm; padding-top:3mm;"><b>7 </b></div>
			  <div class="styGenericDiv" style="width:61mm; height:8mm; padding-top:3mm;">
				<span style="float:left;">Name of operator </span>
				<!--Dotted Line-->
				<div class="styDotLn" style="float:right; padding-right:1mm;">........</div>
			  </div>
			</div>
          </td>
          <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-top-width:0px; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-left-width:1px; text-align:left;">
            <span class="styTableCellPad"/>
            <span class="styTableCellPad"/>
          </td>
          <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
            <span class="styTableCellPad"/>
          </td>
          <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
            <span class="styTableCellPad"/>
          </td>
          <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-right-width:0px;">
            <xsl:call-template name="PopulateText">
              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +  3]/OperatorName/BusinessNameLine2Txt"/>
            </xsl:call-template>
            <span class="styTableCellPad"/>
          </td>
        </tr>
        <!-- Line 8 -->
        <tr>
          <td class="styIRS1120FScheduleVTableCellSmall" style="font-size:7.5pt;" scope="row">
		    <div>
			  <div class="styGenericDiv" style="width:5mm; padding-left:2mm; height:8mm; padding-top:3mm;"><b>8</b></div>
			  <div class="styGenericDiv" style="width:61mm; height:8mm; padding-top:3mm;">
				<span style="float:left;">EIN or SSN of operator</span>
				<!--Dotted Line-->
				<div class="styDotLn" style="float:right; padding-right:1mm;">......</div>
			  </div>
			</div>
          </td>
          <td class="styTableCellSmall" style="width:30mm; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-left-width:1px">
            <span class="styTableCellPad"/>
          </td>
          <td class="styTableCellSmall" style="width:30mm; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
            <span class="styTableCellPad"/>
          </td>
          <td class="styTableCellSmall" style="width:30mm; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
            <span class="styTableCellPad"/>
          </td>
          <td class="styTableCellSmall" style="width:30mm; text-align:center; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-right-width:0px;">
            <span class="styTableCellPad"/>
          </td>
        </tr>
        <!-- line 9 Blank Row 2-->
        <tr>
          <td class="styIRS1120FScheduleVTableCellSmall" style="font-size:7pt;" scope="row">
			<div>
			  <div class="styGenericDiv" style="width:5mm; font-size:7.5pt; padding-left:2mm; height:8mm; padding-top:3mm;"><b>9 </b></div>
			  <div class="styGenericDiv" style="width:61mm; height:8mm; padding-top:3mm;">
				<span style="float:left;">
				U.S. source gross transportation income. See instructions for details regarding a statement that must be attached
				to Schedule V describing the method used to determine your U.S. source gross transportation income .</span>
				<!--Dotted Line-->
				<div class="styDotLn" style="float:right; padding-right:1mm;">.......</div>
			  </div>
			</div>
          </td>
          <td class="styTableCellSmall" style="width:30mm;font-size:6pt;border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-left-width:1px; text-align:right;">
            <span class="styTableCellPad"/>
          </td>
          <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
            <span class="styTableCellPad"/>
          </td>
          <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:8mm; padding-top:3mm;">
            <span class="styTableCellPad"/>
          </td>
          <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:8mm; padding-top:3mm; border-right-width:0px;">
            <span class="styTableCellPad"/>
          </td>
        </tr>
      </table>
    </xsl:if>
    <!-- line 10 -->
    <div style="width:187mm">
      <div style="float:left; clear:none;">
        <div class="styLNLeftNumBox" style="width:5mm; height:8mm; padding-left:0mm;">10</div>
        <div class="styLNDesc" style="float:left; width:142mm; height:8mm;">
          <b>Total U.S. source gross transportation income.</b> Add the amounts on line 9, columns A through D (and the
          <span style="float:left;">amounts on line 9 of any attached continuation statements).</span>
          <!--Dotted Line-->
          <div class="styDotLn" style="float:right; padding-right:1mm;">...............</div>
        </div>
      </div>
      <div style="float:right; clear:none;">
        <div class="styLNRightNumBox" style="height:8mm; padding-top:4mm">10</div>
        <div class="styLNAmountBox" style="height:8mm; padding-top:4mm">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/TotalUSSourceGrossTransIncmAmt"/>
          </xsl:call-template>
        </div>
      </div>
    </div>
    <!-- line 11 -->
    <div style="width:187mm">
      <div style="float:left; clear:none;">
        <div class="styLNLeftNumBox" style="width:5mm; height:4mm; padding-left:0mm;">11</div>
        <div class="styLNDesc" style="width:142mm; height:4mm;">
          <span style="float:left;">Amount of line 10 that is exempt by treaty (attach Form 8833)
            <xsl:call-template name="SetFormLinkInline">
              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/TransportationIncmExmptTrtyAmt"/>
            </xsl:call-template>
          </span>
          <!--Dotted Line-->
          <div class="styDotLn" style="float:right; padding-right:1mm;">..............</div>
        </div>
      </div>
      <div style="float:right; clear:none;">
        <div class="styLNRightNumBox" style="height:4.5mm;">11</div>
        <div class="styLNAmountBox" style="height:4.5mm;">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/TransportationIncmExmptTrtyAmt"/>
          </xsl:call-template>
        </div>
      </div>
    </div>
    <!-- line 12 -->
    <div class="styBB" style="width:187mm">
      <div style="float:left; clear:none;">
        <div class="styLNLeftNumBox" style="width:5mm; height:4mm; padding-left:0mm;">12</div>
        <div class="styLNDesc" style="width:142mm; height:4mm;">
          Subtract line 11 from line 10.  Enter the result here and on Form 1120-F, Section I, line 9, column (b)  
          <!--Dotted Line-->
          <div class="styDotLn" style="float:right; padding-right:1mm;">..</div>
        </div>
      </div>
      <div style="float:right; clear:none;">
        <div class="styLNRightNumBox" style="height:4.5mm; border-bottom-width:0px">12</div>
        <div class="styLNAmountBox" style="height:4.5mm; border-bottom-width:0px">
          <xsl:call-template name="PopulateAmount">
            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/GrossTransIncmMnsTrtyAmt"/>
          </xsl:call-template>
	    </div>
      </div>
    </div>
    <!-- END Empty Table -->
    <!--<div class="styBB" style="width:187mm;">
      <span style="width:32px;"/>
    </div>-->
    <!-- Empty table e1001 -->
    <p>
	  <div class="pageEnd" style="width:187mm; padding-top:0mm;">
	    <div style="float:left;">
		  <span class="styBoldText">
		    For Paperwork Reduction Act Notice, see the instructions for Form 1120-F.
          </span>
		  <span style="width:1mm;"/>                        
		  Cat. No. 50821R
	    </div>
	    <div style="float:right;">
		  <span style="width:10px;"/>
          <b>Schedule V (Form 1120-F) 2021</b>
	    </div>
	  </div>
    </p>
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
        <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData"/>
        <xsl:with-param name="DescWidth" select="100"/>
      </xsl:call-template>
    </table>
    <!-- Blue Table -->
    <!-- END Left Over Table -->
    <!-- start here iii -->
    <!-- Blue table was approved by customer on Tue 11/20/2012 4:47 PM -->
    <xsl:if test="((count($Form1120FScheduleVData/VesselAircraftInformation) &gt;4) and ($Print = $Separated))">
	  <table class="styTable" cellspacing="0" style="border-color:black; width:187mm;">
	    <xsl:for-each select="$Form1120FScheduleVData/VesselAircraftInformation">
		  <xsl:variable name="pos" select="position()"/>
	      <xsl:if test="position() mod 4 = 1">
	        <!-- title row -->
		    <tr>
			  <td style="border:none;" scope="row">
			    <div>
				  <span class="styTableCellPad" style="width:67mm;height:5mm;"/>
			    </div>
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; text-align:center; font-weight:bold; border-color:black; border-top-width:1px; border-left-width:1px; border-right-width:1px;">
			    <xsl:number value="position()" format="A"/>
			    <span class="styTableCellPad"/>
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; text-align:center; font-weight:bold; border-color:black; border-top-width:1px; border-left-width:0px; border-right-width:1px;">
			    <xsl:number value="position()+1" format="A"/>
			    <span class="styTableCellPad"/>
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; text-align:center; font-weight:bold; border-color:black; border-top-width:1px; border-left-width:0px; border-right-width:1px;">
			    <xsl:number value="position()+2" format="A"/>
			    <span class="styTableCellPad"/>
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; text-align:center; font-weight:bold; border-color:black; border-top-width:1px; border-left-width:0px; border-right-width:0px;">
			    <xsl:number value="position()+3" format="A"/>
			    <span class="styTableCellPad"/>
			  </td>
		    </tr>
		    <!-- Line 1 -->
		    <tr class="styDepTblRow1">
			  <td style="border:none;" scope="row">
			    <div style="width:67mm;">
				  <div class="styBoldText" style="width:5mm; float:left; font-size:7.5pt; padding-left:2mm; height:6mm; padding-top:2mm;">1 </div>
				  <div class="styGenericDiv" style="width:60mm;font-size:7.5pt;padding-top:2mm;">
				    Name of vessel or type of aircraft
				    <!--Dotted Line-->
				    <div class="styDotLn" style="float:right;padding-right:1mm;">...</div>
				  </div>
			    </div>
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; border-color:black; height:6mm; padding-top:3mm; border-left-width:1px; font-size:6pt; text-align:left">
			    <xsl:call-template name="PopulateText">
				  <xsl:with-param name="TargetNode" select="VesselOrAircraftNm"/>
			    </xsl:call-template>
			    <span class="styTableCellPad"/>
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; border-color:black; height:6mm; padding-top:3mm; font-size:6pt; text-align:left">
			    <xsl:call-template name="PopulateText">
		          <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftNm"/>
		        </xsl:call-template>
			    <span class="styTableCellPad"/>  
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; border-color:black; height:6mm; padding-top:3mm; font-size:6pt; text-align:left">
			    <xsl:call-template name="PopulateText">
		          <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrAircraftNm"/>
			    </xsl:call-template>
		        <span class="styTableCellPad"/>
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; border-color:black; height:6mm; padding-top:3mm; border-right-width:0px; font-size:6pt; text-align:left">
		        <xsl:call-template name="PopulateText">
		          <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrAircraftNm"/>
		        </xsl:call-template>
	     	    <span class="styTableCellPad"/>
			  </td>
		    </tr>
		    <!--  ***************************************************************************************************************************  -->
		    <!-- Line 2 -->
		    <tr class="styDepTblRow2">
			  <td style="border:none;" scope="row">
			    <div style="width:67mm;">
				  <div class="styBoldText" style="width:5mm; float:left; font-size:7.5pt; padding-left:2mm; height:6mm; padding-top:2mm;">2</div>
				  <div class="styGenericDiv" style="width:60mm; font-size:7.5pt; padding-top:2mm;">Vessel or aircraft ID number
				    <!--Dotted Line-->
				    <div class="styDotLn" style="float:right; padding-right:1mm;">....</div>
			      </div>
			    </div>
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; border-color:black; height:6mm; padding-top:3mm; border-left-width:1px; font-size:6pt; text-align:left">
	     	    <xsl:call-template name="PopulateText">
	    	          <xsl:with-param name="TargetNode" select="VesselOrAircraftIDNum"/>
	    	        </xsl:call-template>
	            <span class="styTableCellPad"/>
		      </td>
		      <td class="styTableCellSmall" style="width:30mm; border-color:black; height:6mm; padding-top:3mm; font-size:6pt; text-align:left">
		        <xsl:call-template name="PopulateText">
		          <xsl:with-param name="TargetNode"  select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftIDNum"/>
	     	    </xsl:call-template>
		        <span class="styTableCellPad"/>
		      </td>
		      <td class="styTableCellSmall" style="width:30mm; border-color:black; height:6mm; padding-top:3mm; font-size:6pt; text-align:left">
	            <xsl:call-template name="PopulateText">
	              <xsl:with-param name="TargetNode"  select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrAircraftIDNum"/>
		        </xsl:call-template>
		        <span class="styTableCellPad"/>
	          </td>
		      <td class="styTableCellSmall"  style="width:30mm; border-color:black; height:6mm; padding-top:3mm; border-right-width:0px; font-size:6pt; text-align:left">
	            <xsl:call-template name="PopulateText">
		          <xsl:with-param name="TargetNode"  select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrAircraftIDNum"/>
	    	        </xsl:call-template>
	            <span class="styTableCellPad"/>
			  </td>
		    </tr>
		    <!-- ============================================================================= -->
		    <!-- Line 3 -->
		    <!-- ============================================================================= -->
		    <tr class="styDepTblRow1">
			  <td style="border:none;" scope="row">
			    <div style="width:67mm;">
				  <div class="styBoldText" style="width:5mm; float:left; font-size:7.5pt; padding-left:2mm; height:6mm; padding-top:2mm;">3 </div>
				  <div class="styGenericDiv" style="width:60mm; font-size:7.5pt; padding-top:2mm;">
				    Was the vessel or aircraft chartered in?
				    <!--Dotted Line-->
				    <div class="styDotLn" style="float:right; padding-right:1mm;">.</div>
				  </div>
			    </div>
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:6mm; padding-top:2mm; border-left-width:1px; text-align:center;">
		        <span style="width:1px;"/>
			    <!-- Add Populate Span to boolean (yes/no) checkbox -->
	     	    <xsl:call-template name="PopulateSpan">
				  <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
			    </xsl:call-template>								
		        <input type="checkbox" alt="Vessel Or Aircraft Chartered In Indicator Yes" class="styCkbox">
				  <xsl:call-template name="PopulateYesCheckbox">
	         	    <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
	         	    <xsl:with-param name="BackupName">VesselOrAircraftCharteredInYes</xsl:with-param>
		          </xsl:call-template>
		        </input>
			    <label>
		          <xsl:call-template name="PopulateLabelYes">
	                <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
	          	    <xsl:with-param name="BackupName">VesselOrAircraftCharteredInYesLabel</xsl:with-param>
				  </xsl:call-template>
	       		  <span style="font-size:6pt">Yes </span>
		        </label>
		        <span style="width:5mm"/>
			    <!-- Add Populate Span to boolean (yes/no) checkbox -->
			    <xsl:call-template name="PopulateSpan">
				  <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
			    </xsl:call-template>								
		        <input type="checkbox" alt="Vessel Or Aircraft Chartered In Indicator No" class="styCkbox">
	         	  <xsl:call-template name="PopulateNoCheckbox">
	        	        <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
		            <xsl:with-param name="BackupName">VesselOrAircraftCharteredInNo</xsl:with-param>
		          </xsl:call-template>
		        </input>
			    <label>
	    	          <xsl:call-template name="PopulateLabelNo">
	    	            <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
	                <xsl:with-param name="BackupName">VesselOrAircraftCharteredInNoLabel</xsl:with-param>
	    	          </xsl:call-template>
    	    	          <span style="font-size:6pt">No </span>
	    		      <span style="width:2mm"/>
		        </label>
		        <span class="styTableCellPad"/>
	     	    <xsl:call-template name="SetFormLinkInline">
		          <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
		        </xsl:call-template>
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:6mm; padding-top:2mm; text-align:center">
	     	    <span style="width:1px;"/>
			    <!-- Add Populate Span to boolean (yes/no) checkbox -->
	     	    <xsl:call-template name="PopulateSpan">
				  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftCharteredInInd"/>
		        </xsl:call-template>								
	    	        <input type="checkbox" alt="Vessel Or Aircraft Chartered In Indicator Yes" class="styCkbox">
	        	      <xsl:call-template name="PopulateYesCheckbox">
	                <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftCharteredInInd"/>
	                <xsl:with-param name="BackupName">VesselOrAircraftCharteredInYes</xsl:with-param>
		          </xsl:call-template>
	     	    </input>
			    <label>
	    	          <xsl:call-template name="PopulateLabelYes">
	         	    <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftCharteredInInd"/>
	                <xsl:with-param name="BackupName">VesselOrAircraftCharteredInYesLabel</xsl:with-param>
		          </xsl:call-template>
	    		      <span style="font-size:6pt">Yes </span>
	    	        </label>
	    	        <span style="width:5mm"/>
			    <!-- Add Populate Span to boolean (yes/no) checkbox -->
		        <xsl:call-template name="PopulateSpan">
			      <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftCharteredInInd"/>
		        </xsl:call-template>								
		        <input type="checkbox" alt="Vessel Or Aircraft Chartered In Indicator No" class="styCkbox">
	    		      <xsl:call-template name="PopulateNoCheckbox">
	        	        <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/	VesselOrAircraftCharteredInInd"/>
	                <xsl:with-param name="BackupName">VesselOrAircraftCharteredInNo</xsl:with-param>
	     		  </xsl:call-template>
		        </input>
			  <label>
			    <xsl:call-template name="PopulateLabelNo">
		          <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrAircraftCharteredInInd"/>
	         	  <xsl:with-param name="BackupName">VesselOrAircraftCharteredInNoLabel</xsl:with-param>
				</xsl:call-template>
	     		<span style="font-size:6pt">No </span>
	    		<span style="width:2mm"/>
	    	    </label>
	    	      <span class="styTableCellPad"/>
	          <xsl:call-template name="SetFormLinkInline">
		        <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
			  </xsl:call-template>
			</td>
			<td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:6mm; padding-top:3mm; text-align:center">
		      <span style="width:1px;"/>
			  <!-- Add Populate Span to boolean (yes/no) checkbox -->
		      <xsl:call-template name="PopulateSpan">
				<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrAircraftCharteredInInd"/>
		      </xsl:call-template>								
		      <input type="checkbox" alt="Vessel Or Aircraft Chartered In Indicator Yes" class="styCkbox">
		        <xsl:call-template name="PopulateYesCheckbox">
    		      <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrAircraftCharteredInInd"/>
	        	  <xsl:with-param name="BackupName">VesselOrAircraftCharteredInYes</xsl:with-param>
		    	</xsl:call-template>
		      </input>
			  <label>
		    	<xsl:call-template name="PopulateLabelYes">
		          <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrAircraftCharteredInInd"/>
		          <xsl:with-param name="BackupName">VesselOrAircraftCharteredInYesLabel</xsl:with-param>
		    	</xsl:call-template>
		    	<span style="font-size:6pt">Yes </span>
	    	  </label>
	    	  <span style="width:5mm"/>
			  <!-- Add Populate Span to boolean (yes/no) checkbox -->
	     	  <xsl:call-template name="PopulateSpan">
		    	<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrAircraftCharteredInInd"/>
	    	  </xsl:call-template>								
	    	  <input type="checkbox" alt="Vessel Or Aircraft Chartered In Indicator No" class="styCkbox">
	    		<xsl:call-template name="PopulateNoCheckbox">
	    	      <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrAircraftCharteredInInd"/>
	    	      <xsl:with-param name="BackupName">VesselOrAircraftCharteredInNo</xsl:with-param>
		    	</xsl:call-template>
	     	  </input>
			  <label>
	    		<xsl:call-template name="PopulateLabelNo">
	        	  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrAircraftCharteredInInd"/>
	        	  <xsl:with-param name="BackupName">VesselOrAircraftCharteredInNoLabel</xsl:with-param>
    			</xsl:call-template>
		        <span style="font-size:6pt">No </span>
		        <span style="width:2mm"/>
		      </label>
		      <xsl:call-template name="SetFormLinkInline">
		        <xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
		      </xsl:call-template>
			</td>
			<td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:6mm; padding-top:2mm; text-align:center; border-right-width:0px;">
	          <span style="width:1px;"/>
			  <!-- Add Populate Span to boolean (yes/no) checkbox -->
    		  <xsl:call-template name="PopulateSpan">
	     		<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrAircraftCharteredInInd"/>
	     	  </xsl:call-template>								
	    	  <input type="checkbox"  alt="Vessel Or Aircraft Chartered In Indicator Yes" class="styCkbox">
	    		<xsl:call-template name="PopulateYesCheckbox">
		    	  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrAircraftCharteredInInd"/>
		    	  <xsl:with-param name="BackupName">VesselOrAircraftCharteredInYes</xsl:with-param>
		    	</xsl:call-template>
		      </input>
			  <label>
		    	<xsl:call-template name="PopulateLabelYes">
	    		  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrAircraftCharteredInInd"/>
		    	  <xsl:with-param name="BackupName">VesselOrAircraftCharteredInYesLabel</xsl:with-param>
			    </xsl:call-template>
			    <span style="font-size:6pt">Yes </span>
			  </label>
			  <span style="width:5mm"/>
		      <!-- Add Populate Span to boolean (yes/no) checkbox -->
		      <xsl:call-template name="PopulateSpan">
			    <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrAircraftCharteredInInd"/>
		      </xsl:call-template>								
		      <input type="checkbox"  alt="Vessel Or Aircraft Chartered In Indicator No" class="styCkbox">
		    	<xsl:call-template name="PopulateNoCheckbox">
	     		  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrAircraftCharteredInInd"/>
		    	  <xsl:with-param name="BackupName">VesselOrAircraftCharteredInNo</xsl:with-param>
		    	</xsl:call-template>
		      </input>
			  <label>
		    	<xsl:call-template name="PopulateLabelNo">
		    	  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrAircraftCharteredInInd"/>
	    		  <xsl:with-param name="BackupName">VesselOrAircraftCharteredInNoLabel</xsl:with-param>
		    	</xsl:call-template>
		    	<span style="font-size:6pt">No </span>
		    	<span style="width:2mm"/>
		      </label>
		      <span class="styTableCellPad"/>
		      <xsl:call-template name="SetFormLinkInline">
	    		<xsl:with-param name="TargetNode" select="VesselOrAircraftCharteredInInd"/>
	    	  </xsl:call-template>
			</td>
			</tr>
			<!-- ============================================================================= -->
			<!-- Line 4 -->
			<!-- ============================================================================= -->
			<tr class="styDepTblRow2">
			  <td style="border:none;" scope="row">
				<div style="width:67mm;">
				  <div class="styBoldText" style="width:5mm; float:left; font-size:7.5pt; padding-left:2mm; height:6mm; padding-top:2mm;">4</div>
				  <div class="styGenericDiv" style="width:60mm; font-size:7.5pt; padding-top:2mm;">Was the vessel or aircraft chartered out?
				    <!--Dotted Line-->
					<div class="styDotLn" style="float:right;padding-right:1mm;">.</div>
				  </div>
				</div>
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:center; border-style:solid; border-color:black; height:6mm; padding-top:2mm; border-left-width:1px;">
			    <!-- Add Populate Span to boolean (yes/no) checkbox -->
		      	<xsl:call-template name="PopulateSpan">
		    	      <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
	    	        </xsl:call-template>								
		       	<input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator Yes" class="styCkbox">
		    	      <xsl:call-template name="PopulateYesCheckbox">
		            <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
	     	        <xsl:with-param name="BackupName">VesselOrArcrftCharteredOutYes</xsl:with-param>
		    	      </xsl:call-template>
		      	</input>
			    <label>
			      <xsl:call-template name="PopulateLabelYes">
	    	            <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
	     		    <xsl:with-param name="BackupName">VesselOrArcrftCharteredOutYesLabel</xsl:with-param>
		    	      </xsl:call-template>
		    	      <span style="font-size:6pt">Yes </span>
		     	</label>
			    <span style="width:5mm"/>
			    <!-- Add Populate Span to boolean (yes/no) checkbox -->
		     	<xsl:call-template name="PopulateSpan">
				  <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
		    	    </xsl:call-template>								
		    	    <input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator No" class="styCkbox">
		    	      <xsl:call-template name="PopulateNoCheckbox">
		            <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
	     	     	<xsl:with-param name="BackupName">VesselOrArcrftCharteredOutNo</xsl:with-param>
			      </xsl:call-template>
		     	</input>
			    <label>
		    	      <xsl:call-template name="PopulateLabelNo">
		         	<xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
		         	<xsl:with-param name="BackupName">VesselOrArcrftCharteredOutNoLabel</xsl:with-param>
		    	      </xsl:call-template>
		    	      <span style="font-size:6pt">No </span>
			      <span style="width:2mm"/>
		     	</label>
		     	<span class="styTableCellPad"/>
			    <xsl:call-template name="SetFormLinkInline">
		    	      <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
		    	    </xsl:call-template>
		      </td>
			  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:center; border-style:solid; border-color:black; height:6mm; padding-top:2mm">
			    <!-- Add Populate Span to boolean (yes/no) checkbox -->
	     		<xsl:call-template name="PopulateSpan">
	     		  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrArcrftCharteredOutInd"/>
			    </xsl:call-template>								
			    <input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator Yes"  class="styCkbox">
			      <xsl:call-template name="PopulateYesCheckbox">
		    	        <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrArcrftCharteredOutInd"/>
	    		        <xsl:with-param name="BackupName">VesselOrArcrftCharteredOutYes</xsl:with-param>
			      </xsl:call-template>
			    </input>
			    <label>
			      <xsl:call-template name="PopulateLabelYes">
			        <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrArcrftCharteredOutInd"/>
			        <xsl:with-param name="BackupName">VesselOrArcrftCharteredOutYesLabel</xsl:with-param>
			      </xsl:call-template>
			      <span style="font-size:6pt">Yes </span>
			    </label>
			    <span style="width:5mm"/>
			    <!-- Add Populate Span to boolean (yes/no) checkbox -->
			    <xsl:call-template name="PopulateSpan">
				  <xsl:with-param name="TargetNode"  select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/	VesselOrArcrftCharteredOutInd"/>
			    </xsl:call-template>								
			    <input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator No" class="styCkbox">
				  <xsl:call-template name="PopulateNoCheckbox">
					<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrArcrftCharteredOutInd"/>
					<xsl:with-param name="BackupName">VesselOrArcrftCharteredOutNo</xsl:with-param>
				  </xsl:call-template>
				</input>
			    <label>
				  <xsl:call-template name="PopulateLabelNo">
				    <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/VesselOrArcrftCharteredOutInd"/>
					<xsl:with-param name="BackupName">VesselOrArcrftCharteredOutNoLabel</xsl:with-param>
				  </xsl:call-template>
				  <span style="font-size:6pt">No </span>
				  <span style="width:2mm"/>
				</label>
				<span class="styTableCellPad"/>
				<xsl:call-template name="SetFormLinkInline">
				  <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
				</xsl:call-template>
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:center; border-style:solid; border-color:black; height:6mm; padding-top:2mm">
			    <!-- Add Populate Span to boolean (yes/no) checkbox -->
			    <xsl:call-template name="PopulateSpan">
				  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrArcrftCharteredOutInd"/>
				</xsl:call-template>								
			    <input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator Yes" class="styCkbox">
				  <xsl:call-template name="PopulateYesCheckbox">
					<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrArcrftCharteredOutInd"/>
					<xsl:with-param name="BackupName">VesselOrArcrftCharteredOutYes</xsl:with-param>
				  </xsl:call-template>
				</input>
				<label>
				  <xsl:call-template name="PopulateLabelYes">
					<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrArcrftCharteredOutInd"/>
					<xsl:with-param name="BackupName">VesselOrArcrftCharteredOutYesLabel</xsl:with-param>
				  </xsl:call-template>
				  <span style="font-size:6pt">Yes </span>
				</label>
				<span style="width:5mm"/>
			    <!-- Add Populate Span to boolean (yes/no) checkbox -->
				<xsl:call-template name="PopulateSpan">
			      <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrArcrftCharteredOutInd"/>
		     	</xsl:call-template>								
				<input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator No" class="styCkbox">
				  <xsl:call-template name="PopulateNoCheckbox">
					<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrArcrftCharteredOutInd"/>
					<xsl:with-param name="BackupName">VesselOrArcrftCharteredOutNo</xsl:with-param>
				  </xsl:call-template>
				</input>
			    <label>
			      <xsl:call-template name="PopulateLabelNo">
					<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/VesselOrArcrftCharteredOutInd"/>
					<xsl:with-param name="BackupName">VesselOrArcrftCharteredOutNoLabel</xsl:with-param>
				  </xsl:call-template>
				  <span style="font-size:6pt">No </span>
		    	      <span style="width:2mm"/>
		      	</label>
		       	<span class="styTableCellPad"/>
			    <xsl:call-template name="SetFormLinkInline">
			      <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
		     	</xsl:call-template>
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:center; border-style:solid; border-color:black; height:6mm; padding-top:2mm; border-right-width:0px;">
			    <!-- Add Populate Span to boolean (yes/no) checkbox -->
				<xsl:call-template name="PopulateSpan">
	   			  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrArcrftCharteredOutInd"/>
				</xsl:call-template>								
				<input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator Yes" class="styCkbox">
				  <xsl:call-template name="PopulateYesCheckbox">
	    		        <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrArcrftCharteredOutInd"/>
	    		        <xsl:with-param name="BackupName">VesselOrArcrftCharteredOutYes</xsl:with-param>
		    	      </xsl:call-template>
		      	</input>
			    <label>
		    	      <xsl:call-template name="PopulateLabelYes">
	    		        <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrArcrftCharteredOutInd"/>
	    		        <xsl:with-param name="BackupName">VesselOrArcrftCharteredOutYesLabel</xsl:with-param>
		    	      </xsl:call-template>
		    	      <span style="font-size:6pt">Yes </span>
		     	</label>
		    	    <span style="width:5mm"/>
			    <!-- Add Populate Span to boolean (yes/no) checkbox -->
		      	<xsl:call-template name="PopulateSpan">
				  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrArcrftCharteredOutInd"/>
		    	    </xsl:call-template>								
		     	<input type="checkbox" alt="Vessel Or Aircraft Chartered Out Indicator No" class="styCkbox">
		    	      <xsl:call-template name="PopulateNoCheckbox">
	    		        <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrArcrftCharteredOutInd"/>
		    	        <xsl:with-param name="BackupName">VesselOrArcrftCharteredOutNo</xsl:with-param>
		    	      </xsl:call-template>
		    	    </input>
			    <label>
		    	      <xsl:call-template name="PopulateLabelNo">
		    	        <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/VesselOrArcrftCharteredOutInd"/>
	     		    <xsl:with-param name="BackupName">VesselOrArcrftCharteredOutNoLabel</xsl:with-param>
			      </xsl:call-template>
		    	      <span style="font-size:6pt">No </span>
		    	      <span style="width:2mm"/>
		    	    </label>
		       	<span class="styTableCellPad"/>
		    	    <xsl:call-template name="SetFormLinkInline">
		    	      <xsl:with-param name="TargetNode" select="VesselOrArcrftCharteredOutInd"/>
			    </xsl:call-template>
		      </td>
			</tr>
			<!-- Line 5 -->
			<tr class="styDepTblRow1">
			  <td style="border:none;" scope="row">
				<div style="width:67mm;">
				  <div class="styBoldText" style="width:5mm; float:left; font-size:7.5pt; padding-left:2mm; height:6mm; padding-top:2mm;">5</div>
				  <div class="styGenericDiv" style="width:60mm; font-size:7.5pt; padding-top:2mm;">Name of registered owner
					<!--Dotted Line-->
					<div class="styDotLn" style="float:right;padding-right:1mm;">.....</div>
				  </div>
				</div>
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:6mm; padding-top:3mm; border-left-width:1px;">
	        		<xsl:call-template name="PopulateText">
	    	          <xsl:with-param name="TargetNode" select="RegisteredOwnerName/BusinessNameLine1Txt"/>
	        		</xsl:call-template>
	        		<span class="styTableCellPad"/>
	        		<br/>
	        		<xsl:call-template name="PopulateText">
	              <xsl:with-param name="TargetNode"  select="RegisteredOwnerName/BusinessNameLine2Txt"/>
	        		</xsl:call-template>
	        		<span class="styTableCellPad"/>
			  </td>
	     	  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:6mm; padding-top:3mm;">
	     	    	<xsl:call-template name="PopulateText">
	              <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/ VesselAircraftInformation[$pos + 1]/RegisteredOwnerName/BusinessNameLine1Txt"/>
	    	     	</xsl:call-template>
	        		<br/>
	        		<xsl:call-template name="PopulateText">
	            	  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/RegisteredOwnerName/BusinessNameLine2Txt"/>
	        		</xsl:call-template>
	        		<span class="styTableCellPad"/>
		      </td>
	    		  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:6mm; padding-top:3mm;">
	            <xsl:call-template name="PopulateText">
	     	      <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/RegisteredOwnerName/BusinessNameLine1Txt"/>
	    	      	</xsl:call-template>
		        	<br/>
		        	<xsl:call-template name="PopulateText">
	        		  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/RegisteredOwnerName/BusinessNameLine2Txt"/>
	         	</xsl:call-template>
	    	     	<span class="styTableCellPad"/>
		      </td>
		      <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:6mm; padding-top:3mm; border-right-width:0px;">
	    	    	    <xsl:call-template name="PopulateText">
	    	    	      <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/RegisteredOwnerName/BusinessNameLine1Txt"/>
	        		</xsl:call-template>
	    	    	    <br/>
	    	        <xsl:call-template name="PopulateText">
	    	    	      <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/RegisteredOwnerName/BusinessNameLine2Txt"/>
		        	</xsl:call-template>
	        		<span class="styTableCellPad"/>
	    	      </td>
	        </tr>
		    <!-- Line 6 -->
    		    <tr class="styDepTblRow2">
			  <td style="border:none;" scope="row">
			    <div style="width:67mm;">
				  <div class="styBoldText" style="width:5mm; float:left; font-size:7.5pt; padding-left:2mm; height:6mm; padding-top:2mm;">6</div>
				  <div class="styGenericDiv" style="width:60mm; font-size:7.5pt; padding-top:2mm;">EIN or SSN of registered owner
				    <!--Dotted Line-->
					<div class="styDotLn" style="float:right; padding-right:1mm;">...</div>
				  </div>
				</div>
			  </td>
	     	  <td class="styTableCellSmall" style="width:30mm; border-style:solid; border-color:black; height:6mm; padding-top:3mm; border-left-width:1px; text-align:center;">
         		<xsl:if test="RegisteredOwnerEIN != ' '">
	        	      <xsl:call-template name="PopulateEIN">
	             	<xsl:with-param name="TargetNode" select="RegisteredOwnerEIN"/>
	            	  </xsl:call-template>
	    	        	  <span class="styTableCellPad"/>
    		     	</xsl:if>
	    	     	<xsl:if test="RegisteredOwnerSSN != ' '">
		          <xsl:call-template name="PopulateSSN">
		            	<xsl:with-param name="TargetNode" select="RegisteredOwnerSSN"/>
	            	  </xsl:call-template>
	        	      <span class="styTableCellPad"/>
	        		</xsl:if>
	         	<xsl:if test="MissingEINReasonCd != ' '">
	            	  <xsl:call-template name="PopulateText">
	                	<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
	            	  </xsl:call-template>
	            	  <span class="styTableCellPad"/>
	        		</xsl:if>
		        	<xsl:if test=" UnknownRegisteredOwnerCd!= ' '">
	            	  <xsl:call-template name="PopulateText">
	     	        <xsl:with-param name="TargetNode" select="UnknownRegisteredOwnerCd"/>
	    	          </xsl:call-template>
	            	  <span class="styTableCellPad"/>
		        </xsl:if>
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; text-align:center; border-style:solid; border-color:black; height:6mm; padding-top:3mm;">
		        <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/RegisteredOwnerEIN != ' '">
	            	  <xsl:call-template name="PopulateEIN">
             		<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/      			 RegisteredOwnerEIN"/>
	        	      </xsl:call-template>
	        	    	  <span class="styTableCellPad"/>
	        		</xsl:if>
	        		<xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/RegisteredOwnerSSN != ' '">
	            	  <xsl:call-template name="PopulateSSN">
		            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/	RegisteredOwnerSSN"/>
		          </xsl:call-template>
	            	  <span class="styTableCellPad"/>
	        		</xsl:if>
	         	<xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/MissingEINReasonCd != ' '">
	              <xsl:call-template name="PopulateText">
	            		<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/ MissingEINReasonCd"/>
		          </xsl:call-template>
	            	  <span class="styTableCellPad"/>
        			</xsl:if>
        		    	<xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/UnknownRegisteredOwnerCd!= ' '">
         	      <xsl:call-template name="PopulateText">
	                <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/	 UnknownRegisteredOwnerCd"/>
	              </xsl:call-template>
		          <span class="styTableCellPad"/>
	            	</xsl:if>
	            <span class="styTableCellPad"/>
			  </td>
	        	  <td class="styTableCellSmall"	style="width:30mm; text-align:center; border-style:solid; border-color:black; height:6mm; padding-top:3mm;">
	        		<xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/RegisteredOwnerEIN != ' '">
	            	  <xsl:call-template name="PopulateEIN">
	           		<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/ RegisteredOwnerEIN"/>
	            	  </xsl:call-template>
	            	  <span class="styTableCellPad"/>
	         	</xsl:if>
	        		<xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/RegisteredOwnerSSN != ' '">
		          <xsl:call-template name="PopulateSSN">
		            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/RegisteredOwnerSSN"/>
	              </xsl:call-template>
	            	  <span class="styTableCellPad"/>
	         	</xsl:if>
	         	<xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/MissingEINReasonCd != ' '">
	        	    	  <xsl:call-template name="PopulateText">
	            	    <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/MissingEINReasonCd"/>
	         	  </xsl:call-template>
	        		  <span class="styTableCellPad"/>
	        		</xsl:if>
	         	<xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/UnknownRegisteredOwnerCd != ' '">
	              <xsl:call-template name="PopulateText">
	             	<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/UnknownRegisteredOwnerCd"/>
	            	  </xsl:call-template>
	        	      <span class="styTableCellPad"/>
		        	</xsl:if>
	         	<span class="styTableCellPad"/>
		    	  </td>
    			  <td class="styTableCellSmall" style="width:30mm; text-align:center; border-style:solid; border-color:black; height:6mm; padding-top:3mm; border-right-width:0px;">
	            <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/RegisteredOwnerEIN != ' '">
	              <xsl:call-template name="PopulateEIN">
	                <xsl:with-param name="TargetNode"  select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/RegisteredOwnerEIN"/>
	              </xsl:call-template>
	            	  <span class="styTableCellPad"/>
    	         	</xsl:if>
	            <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/RegisteredOwnerSSN != ' '">
	              <xsl:call-template name="PopulateSSN">
		            <xsl:with-param name="TargetNode"  select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/RegisteredOwnerSSN"/>
	          	  </xsl:call-template>
	         	  <span class="styTableCellPad"/>
	    	        </xsl:if>
	     	    <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/MissingEINReasonCd != ' '">
		          <xsl:call-template name="PopulateText">
		            <xsl:with-param name="TargetNode"  select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/MissingEINReasonCd"/>
	              </xsl:call-template>
	              <span class="styTableCellPad"/>
	     	    </xsl:if>
		        <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/UnknownRegisteredOwnerCd != ' '">
	              <xsl:call-template name="PopulateText">
		            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/UnknownRegisteredOwnerCd"/>
                  </xsl:call-template>
		          <span class="styTableCellPad"/>
		        </xsl:if>
		       	<span class="styTableCellPad"/>
		      </td>
		   	</tr>
			<!-- Line 7 -->
			<tr class="styDepTblRow1">
			  <td style="border:none;" scope="row">
				<div style="width:67mm;">
				  <div class="styBoldText" style="width:5mm; float:left; font-size:7.5pt; padding-left:2mm; height:6mm; padding-top:3mm;">7</div>
				  <div class="styGenericDiv" style="width:60mm;font-size:7.5pt;padding-top:3mm;">Name of operator 
				    <!--Dotted Line-->
					<div class="styDotLn" style="float:right;padding-right:1mm;">.......</div>
				  </div>
				</div>
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; border-style:solid; border-color:black; height:6mm; padding-top:3mm; border-left-width:1px; font-size:6pt; text-align:left;">
		    	    <xsl:if test="OperatorBusinessName != ' '">
	     	      <xsl:call-template name="PopulateText">
                  	<xsl:with-param name="TargetNode"  select="OperatorBusinessName/BusinessNameLine1Txt"/>
	              </xsl:call-template>
	            	  <span class="styTableCellPad"/>
	              <br/>
	              <xsl:call-template name="PopulateText">
            	        <xsl:with-param name="TargetNode"  select="OperatorBusinessName/BusinessNameLine2Txt"/>
	              </xsl:call-template>
	              <span class="styTableCellPad"/>
		        	</xsl:if>
		        	<xsl:if test="OperatorPersonNm != ' '">
	              <xsl:call-template name="PopulateText">
	            	    	<xsl:with-param name="TargetNode" select="OperatorPersonNm"/>
	            	  </xsl:call-template>
	              <span class="styTableCellPad"/>
		        	</xsl:if>
	        		<xsl:if test="UnknownOperatorNameCd != ' '">
	        	      <xsl:call-template name="PopulateText">
		        	    <xsl:with-param name="TargetNode" select="UnknownOperatorNameCd"/>
	        	      </xsl:call-template>
		          <span class="styTableCellPad"/>
		        	</xsl:if>
		    	  </td>
		       <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:6mm; padding-top:3mm;">
     	    		<xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OperatorBusinessName  != ' '">
	              <xsl:call-template name="PopulateText">
	                <xsl:with-param name="TargetNode"  select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OperatorBusinessName/BusinessNameLine1Txt"/>
	              </xsl:call-template>
	        	      <span class="styTableCellPad"/>
	    	          <br/>
	              <xsl:call-template name="PopulateText">
		            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OperatorBusinessName/BusinessNameLine2Txt"/>
	              </xsl:call-template>
	              <span class="styTableCellPad"/>
	         	</xsl:if>
	          	<xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OperatorPersonNm != ' '">
	            	  <xsl:call-template name="PopulateText">
		            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OperatorPersonNm"/>
		          </xsl:call-template>
	              <span class="styTableCellPad"/>
	        		</xsl:if>
	         	<xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/UnknownOperatorNameCd != ' '">
		          <xsl:call-template name="PopulateText">
		            	<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/UnknownOperatorNameCd"/>
	              </xsl:call-template>
		        </xsl:if>
	        		<span class="styTableCellPad"/>
	          </td>
			  <!--  ********************************************************************************************  -->
		    	  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; text-align:left; border-style:solid; border-color:black; height:6mm; padding-top:3mm;">
	        		<xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OperatorBusinessName  != ' '">
		          <xsl:call-template name="PopulateText">
	            	    	<xsl:with-param name="TargetNode"  select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OperatorBusinessName/BusinessNameLine1Txt"/>
	            	  </xsl:call-template>
		          <span class="styTableCellPad"/>
	            	  <br/>
	          	  <xsl:call-template name="PopulateText">
	                	<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OperatorBusinessName/BusinessNameLine2Txt"/>
	         	  </xsl:call-template>
	        	      <span class="styTableCellPad"/>
		        	</xsl:if>
	         	<xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OperatorPersonNm != ' '">
		          <xsl:call-template name="PopulateText">
	               	<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OperatorPersonNm"/>
	            	  </xsl:call-template>
	            	  <span class="styTableCellPad"/>
	        		</xsl:if>
	         	<xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/UnknownOperatorNameCd != ' '">
	            	  <xsl:call-template name="PopulateText">
	        	    	    <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/UnknownOperatorNameCd"/>
		          </xsl:call-template>
	        		</xsl:if>
	            <span class="styTableCellPad"/>
		    	  </td>
	    		  <td class="styTableCellSmall" style="width:30mm; text-align:left; border-style:solid; border-color:black; height:6mm; padding-top:3mm; border-right-width:0px;">
	    		    <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OperatorBusinessName  != ' '">
	        		  <xsl:call-template name="PopulateText">
	         		<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/ VesselAircraftInformation[$pos + 3]/OperatorBusinessName/BusinessNameLine1Txt"/>
	        		  </xsl:call-template>
	          	  <span class="styTableCellPad"/>
	        		  <br/>
	     	    	  <xsl:call-template name="PopulateText">
	         		<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/ OperatorBusinessName/BusinessNameLine2Txt"/>
	        		  </xsl:call-template>
	        		  <span class="styTableCellPad"/>
	        		</xsl:if>
	        		<xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OperatorPersonNm!= ' '">
	            	  <xsl:call-template name="PopulateText">
		            	<xsl:with-param name="TargetNode"  select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OperatorPersonNm"/>
	              </xsl:call-template>
	            	  <span class="styTableCellPad"/>
	        		</xsl:if>
		        	<xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/UnknownOperatorNameCd  != ' '">
	              <xsl:call-template name="PopulateText">
		            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/UnknownOperatorNameCd"/>
             	  </xsl:call-template>
	            	  <span class="styTableCellPad"/>
	        		</xsl:if>
	         	<span class="styTableCellPad"/>
		      </td>
     		</tr>
			<!-- Line 8 -->
			<tr class="styDepTblRow2">
			  <td style="border:none;" scope="row">
				<div style="width:67mm;">
				  <div class="styBoldText" 	style="width:5mm; float:left; font-size:7.5pt; padding-left:2mm; height:6mm; padding-top:2mm;">8</div>
				  <div class="styGenericDiv" style="width:60mm; font-size:7.5pt; padding-top:2mm;">EIN or SSN of operator
					<!--Dotted Line-->
					<div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
				  </div>
				</div>
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; text-align:center; border-style:solid; border-color:black; height:6mm; padding-top:3mm; border-left-width:1px">
        			<xsl:if test="OperatorEIN != ' '">
	              <xsl:call-template name="PopulateEIN">
	                	<xsl:with-param name="TargetNode" select="OperatorEIN"/>
	            	  </xsl:call-template>
	            	  <span class="styTableCellPad"/>
	        		</xsl:if>
		        	<xsl:if test="OperatorSSN != ' '">
	            	  <xsl:call-template name="PopulateSSN">
                		<xsl:with-param name="TargetNode" select="OperatorSSN"/>
	            	  </xsl:call-template>
	            	  <span class="styTableCellPad"/>
	        		</xsl:if>
		        	<xsl:if test="EINMissingReasonCd != ' '">
	            	  <xsl:call-template name="PopulateText">
		            <xsl:with-param name="TargetNode" select="EINMissingReasonCd"/>
		          </xsl:call-template>
		          <span class="styTableCellPad"/>
		        	</xsl:if>
		        	<xsl:if test="UnknownOperatorCd != ' '">
	            	  <xsl:call-template name="PopulateText">
	            		<xsl:with-param name="TargetNode" select="UnknownOperatorCd"/>
		          </xsl:call-template>
	              <span class="styTableCellPad"/>
	         	</xsl:if>
		        <span class="styTableCellPad"/>
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; text-align:center; border-style:solid; border-color:black; height:6mm; padding-top:3mm;">
	     		<xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OperatorEIN != ' '">
	         	  <xsl:call-template name="PopulateEIN">
	            		<xsl:with-param name="TargetNode"  select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OperatorEIN"/>
	          	  </xsl:call-template>
		          <span class="styTableCellPad"/>
	      		</xsl:if>
	    		    <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OperatorSSN != ' '">
	    	    	      <xsl:call-template name="PopulateSSN">
	         	    <xsl:with-param name="TargetNode"  select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/OperatorSSN"/>
	         	  </xsl:call-template>
	    	          <span class="styTableCellPad"/>
	    		    </xsl:if>
		      	<xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/EINMissingReasonCd != ' '">
		          <xsl:call-template name="PopulateText">
		           	<xsl:with-param name="TargetNode"  select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/EINMissingReasonCd"/>
		        	  </xsl:call-template>
	    	    	    <span class="styTableCellPad"/>
	     		</xsl:if>
	    		    <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/UnknownOperatorCd != ' '">
	         	  <xsl:call-template name="PopulateText">
	           		<xsl:with-param name="TargetNode"  select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/UnknownOperatorCd"/>
		        	  </xsl:call-template>
	         	  <span class="styTableCellPad"/>
		    	    </xsl:if>
	     		<span class="styTableCellPad"/>
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; text-align:center; border-style:solid; border-color:black; height:6mm; padding-top:3mm;">
	     		<xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OperatorEIN != ' '">
		        	  <xsl:call-template name="PopulateEIN">
	         		<xsl:with-param name="TargetNode"  select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OperatorEIN"/>
	        		  </xsl:call-template>
        			  <span class="styTableCellPad"/>
		    	    </xsl:if>
     			<xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OperatorSSN != ' '">
	         	  <xsl:call-template name="PopulateSSN">
	     	    	    <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/OperatorSSN"/>
	              </xsl:call-template>
	    	          <span class="styTableCellPad"/>
		    	    </xsl:if>
	     		<xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/EINMissingReasonCd != ' '">
		        	  <xsl:call-template name="PopulateText">
		        	    <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/EINMissingReasonCd"/>
		        	  </xsl:call-template>
			      <span class="styTableCellPad"/>
		    	    </xsl:if>
		    	    <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/UnknownOperatorCd != ' '">
		        	  <xsl:call-template name="PopulateText">
		         	<xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 2]/UnknownOperatorCd"/>
	         	  </xsl:call-template>
	    	          <span class="styTableCellPad"/>
	     		</xsl:if>
		       	<span class="styTableCellPad"/>
			  </td>
			  <td class="styTableCellSmall"	style="width:30mm; text-align:center; border-style:solid; border-color:black; height:6mm; padding-top:3mm; border-right-width:0px;">
	     		<xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OperatorEIN != ' '">
		          <xsl:call-template name="PopulateEIN">
		            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OperatorEIN"/>
		          </xsl:call-template>
		          <span class="styTableCellPad"/>
	    		    </xsl:if>
		    	    <xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OperatorSSN != ' '">
	         	  <xsl:call-template name="PopulateSSN">
		          	<xsl:with-param name="TargetNode"  select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/OperatorSSN"/>
		        	  </xsl:call-template>
			      <span class="styTableCellPad"/>
		     	</xsl:if>
	     		<xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/EINMissingReasonCd != ' '">
	        		  <xsl:call-template name="PopulateText">
		            <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/EINMissingReasonCd"/>
	         	  </xsl:call-template>
	        		  <span class="styTableCellPad"/>
	     	    	</xsl:if>
		        	<xsl:if test="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/UnknownOperatorCd!= ' '">
	        	      <xsl:call-template name="PopulateText">
	        	        <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/UnknownOperatorCd"/>
	        	      </xsl:call-template>
		          <span class="styTableCellPad"/>
	     		</xsl:if>
	     		<span class="styTableCellPad"/>
		      </td>
			</tr>
			<!-- line 9 -->
			<tr class="styDepTblRow1">
			  <td style="border:none;" scope="row">
				<div style="width:67mm;">
				  <div class="styBoldText" style="width:5mm; float:left; font-size:7.5pt; padding-left:2mm; height:20mm; padding-top:2mm;">9</div>
				  <div class="styGenericDiv" style="width:60mm; font-size:7.5pt; padding-top:2mm;">
					U.S. source gross transportation income. See instructions for details regarding a statement that must be attached
					to Schedule V describing the method used to determine your U.S. source gross transportation income. 
					<!--Dotted Line-->
					<div class="styDotLn" style="float:right;padding-right:1mm;">......</div>
				  </div>
				</div>
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:20mm; padding-top:20mm; border-left-width:1px; text-align:right;">
	            <xsl:call-template name="PopulateAmount">
	    	    	      <xsl:with-param name="TargetNode" select="USSourceGrossTransIncmAmt"/>
	     		</xsl:call-template>
	    		    <span class="styTableCellPad"/>
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:20mm; padding-top:20mm;">
	     		<xsl:call-template name="PopulateAmount">
		          <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 1]/USSourceGrossTransIncmAmt"/>
		     	</xsl:call-template>
		     	<span class="styTableCellPad"/>
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:20mm; padding-top:20mm;">
		     	<xsl:call-template name="PopulateAmount">
	     		  <xsl:with-param name="TargetNode" select="$Form1120FScheduleVData/VesselAircraftInformation[$pos +  2]/USSourceGrossTransIncmAmt"/>
	    		    </xsl:call-template>
		        <span class="styTableCellPad"/>
			  </td>
			  <td class="styTableCellSmall" style="width:30mm; font-size:6pt; border-style:solid; border-color:black; height:20mm; padding-top:20mm; border-right-width:0px;">
		        	<xsl:call-template name="PopulateAmount">
		        	  <xsl:with-param name="TargetNode"  select="$Form1120FScheduleVData/VesselAircraftInformation[$pos + 3]/USSourceGrossTransIncmAmt"/>
		     	</xsl:call-template>
		     	<span class="styTableCellPad"/>
			  </td>
		    </tr>
		  <tr>
			<td colspan="5">
			  <span class="styTableCellPad"/>
			</td>
		  </tr>
		</xsl:if>
	  </xsl:for-each>
	  <!-- first for-each vessel aircraft information -->
	</table>
  </xsl:if>
  </form>
</body>
</html>
</xsl:template>
</xsl:stylesheet>