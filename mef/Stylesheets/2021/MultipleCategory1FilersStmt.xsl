<?xml version="1.0" encoding="UTF-8"?>
<!-- 06/15/2015 - Changes made for IE11 compatibility - Jeremy Nichols -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" indent="yes"/>
  <xsl:strip-space elements="*"/>
  
  <xsl:include href="PopulateTemplate.xsl"/>
  <xsl:include href="CommonPathRef.xsl"/>
  <xsl:include href="AddHeader.xsl"/>
  <xsl:include href="AddOnTable.xsl"/>

  <xsl:param name="DependencyData" select="$RtnDoc/MultipleCategory1FilersStmt"/>
  <xsl:template name="DependencyTemplate">
  
  <xsl:for-each select="$DependencyData/Cat1FilerNotFilingSingle8865">  
    <table id="MC1FTbl" class="styDepTbl">
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="width:40%;text-align:right;">Item No.                          </th>
        <td class="styDepTblCell" style="text-align:center;"><xsl:value-of select="position()"/></td>
      </tr>      
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Filer's Name
        </th>
        <td class="styDepTblCell" style="text-align:left;">
			<xsl:if test="normalize-space(Category1FilerBusinessName)">
			  <xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="Category1FilerBusinessName/BusinessNameLine1Txt"/>
			  </xsl:call-template>
			  <xsl:if test="Category1FilerBusinessName/BusinessNameLine2Txt != ''">
				<br/><xsl:call-template name="PopulateText">
					<xsl:with-param name="TargetNode" select="Category1FilerBusinessName/BusinessNameLine2Txt"/>
				  </xsl:call-template>
			  </xsl:if>
			</xsl:if>
			<xsl:if test="normalize-space(Category1FilerPersonNm)">
			  <xsl:call-template name="PopulateText">
				<xsl:with-param name="TargetNode" select="Category1FilerPersonNm"/>
			  </xsl:call-template>
			</xsl:if>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Filer's EIN
        </th>
        <td class="styDepTblCell" style="text-align:left;">
           <xsl:choose>
               <xsl:when test="normalize-space(Category1FilerEIN)">                    
                       <xsl:call-template name="PopulateEIN">
                             <xsl:with-param name="TargetNode" select="Category1FilerEIN"/>
                       </xsl:call-template>  
                       <span style="width: 2px"/>
               </xsl:when>
               <xsl:when test="normalize-space(Category1FilerSSN)">                    
                       <xsl:call-template name="PopulateSSN">
                             <xsl:with-param name="TargetNode" select="Category1FilerSSN"/>
                       </xsl:call-template>  
                       <span style="width: 2px"/>
               </xsl:when>  
              <xsl:otherwise> 
	            	<xsl:call-template name="PopulateText">
		            	<xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
		            </xsl:call-template>    
		           <span style="width: 2px"/>
	          </xsl:otherwise>   
          </xsl:choose>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Filer's Tax Year Beginning  
        </th>
        <td class="styDepTblCell" style="text-align:center;">
          <xsl:call-template name="PopulateMonthDayYear">
            <xsl:with-param name="TargetNode" select="Category1FilerTaxYearBeginDt"/>
          </xsl:call-template>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Filer's Tax Year Ending
        </th>
        <td class="styDepTblCell" style="text-align:center;">
          <xsl:call-template name="PopulateMonthDayYear">
            <xsl:with-param name="TargetNode" select="Category1FilerTaxYearEndDt"/>
          </xsl:call-template>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Filer's Share of Liabilities - Nonrecourse
        </th>
        <td class="styDepTblCell" style="text-align:right;">
  <!--        <span style="width:44mm;text-align:right;">  -->
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="FilerShareOfLiabNonRecourseAmt"/>        
          </xsl:call-template>
<!--          </span>   -->
        </td>
      </tr>    
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Filer's Share of Liabilities - Qualified Nonrecourse Financing
        </th>
        <td class="styDepTblCell" style="text-align:right;">
  <!--        <span style="width:44mm;text-align:right;">  -->
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="QualifiedNonRcrsFinancingAmt"/>
            </xsl:call-template>
<!--          </span>   -->
        </td>
      </tr>    
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Filer's Share of Liabilities - Other
        </th>
        <td class="styDepTblCell" style="text-align:right;">
  <!--        <span style="width:44mm;text-align:right;">  -->
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="FilerShareOfLiabilitiesOthAmt"/>
            </xsl:call-template>
<!--          </span>   -->
        </td>
      </tr>    
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Parent Category 1 Filer's Name
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="ParentCategory1FilerName/BusinessNameLine1Txt"/>
          </xsl:call-template>
          <xsl:if test="ParentCategory1FilerName/BusinessNameLine2Txt != ''">
            <br/><xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ParentCategory1FilerName/BusinessNameLine2Txt"/>
              </xsl:call-template>
          </xsl:if>            
        </td>
      </tr>    
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Parent Category 1 Filer's EIN
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <xsl:call-template name="PopulateEIN">
            <xsl:with-param name="TargetNode" select="ParentCategory1FilerEIN"/>
          </xsl:call-template>
        </td>
      </tr>    
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Parent Category 1 Filer's Address          
        </th>
        <td class="styDepTblCell" style="text-align:left;">
   <xsl:choose>
        <xsl:when test="ParentCat1FilerUSAddress">
             <xsl:call-template name="PopulateUSAddressTemplate">
                    <xsl:with-param name="TargetNode" select="ParentCat1FilerUSAddress"/>
             </xsl:call-template> 
       </xsl:when>
  <xsl:otherwise>
       <xsl:call-template name="PopulateForeignAddressTemplate">
               <xsl:with-param name="TargetNode" select="ParentCat1FilerForeignAddress"/>
       </xsl:call-template> 
    </xsl:otherwise>
 </xsl:choose>
        </td>
      </tr>  
    <xsl:if test="IRS8865ScheduleA">
      <tr class="styDepTblRow1">
        <th class="styDepTblHdr" scope="row" style="text-align:center;" colspan="2">
          IRS8865 Schedule A
        </th>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Owns Direct Interest
        <!--
        <label>
          <xsl:call-template name="PopulateLabel">
            <xsl:with-param name="TargetNode" select="IRS8865ScheduleA/OwnsDirectInterest" />
          </xsl:call-template>  
          Owns Direct Interest
        </label>
        -->  
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <xsl:choose>
            <xsl:when test="IRS8865ScheduleA/OwnsDirectInterestInd = 'X'">
              Yes
            </xsl:when>
            <xsl:otherwise>No</xsl:otherwise>
          </xsl:choose>
          <!--
          <input type="checkbox" class="styCkbox">              
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleA/OwnsDirectInterest" />
            </xsl:call-template>
          </input>
          -->
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Owns Constructive Interest  
          <!--
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleA/OwnsConstructiveInterest" />
            </xsl:call-template>  
            Owns Constructive Interest  
          </label>
          -->
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <xsl:choose>
            <xsl:when test="IRS8865ScheduleA/OwnsConstructiveInterestInd = 'X'">
              Yes
            </xsl:when>
            <xsl:otherwise>No</xsl:otherwise>
          </xsl:choose>
          <!--
          <input type="checkbox" class="styCkbox">              
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleA/OwnsConstructiveInterest" />
            </xsl:call-template>
          </input>
          -->
        </td>
      </tr>
      <xsl:if test="IRS8865ScheduleA/ConstructiveOwnershipInfoGrp">
        <tr class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:15mm;" colspan="2">
            Constructive Ownership of Partnership Interest
            <span class="styDepTableCellPad"/>
          </th>
        </tr>
      </xsl:if>
    <xsl:for-each select="IRS8865ScheduleA/ConstructiveOwnershipInfoGrp">
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Constructive Owner Name    
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <xsl:call-template name="PopulateText">
            <xsl:with-param name="TargetNode" select="ConstructiveOwnerName/BusinessNameLine1Txt"/>
          </xsl:call-template>
          
          <xsl:if test="ConstructiveOwnerName/BusinessNameLine2Txt">
            <br/><xsl:call-template name="PopulateText">
                <xsl:with-param name="TargetNode" select="ConstructiveOwnerName/BusinessNameLine2Txt"/>
              </xsl:call-template>
          </xsl:if>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
            Constructive Owner's U.S. or Foreign Address  
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <xsl:choose>
            <xsl:when test="ConstructiveOwnerUSAddress">      
           <xsl:call-template name="PopulateUSAddressTemplate">
                <xsl:with-param name="TargetNode" select="ConstructiveOwnerUSAddress"/>
              </xsl:call-template>
           </xsl:when>
           <xsl:otherwise>
 
    
           <xsl:call-template name="PopulateForeignAddressTemplate">
                <xsl:with-param name="TargetNode" select="ConstructiveOwnerFrgnAddress"/>
              </xsl:call-template>
              </xsl:otherwise>
            </xsl:choose>
        </td>
      </tr>

      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
            Constructive Owner's TIN
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <xsl:choose>
            <xsl:when test="ConstructiveOwnerSSN">
              <xsl:call-template name="PopulateSSN">
                <xsl:with-param name="TargetNode" select="ConstructiveOwnerSSN"/>
              </xsl:call-template>
            </xsl:when>

          <xsl:when test="MissingEINReasonCd">
                <xsl:call-template name="PopulateText">
              	  <xsl:with-param name="TargetNode" select="MissingEINReasonCd"/>
                </xsl:call-template>
              </xsl:when>
          
            <xsl:otherwise>
              <xsl:call-template name="PopulateEIN">
                <xsl:with-param name="TargetNode" select="ConstructiveOwnerEIN"/>
              </xsl:call-template>
            </xsl:otherwise>
          </xsl:choose>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
            Check if Foreign Person  
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <xsl:choose>
            <xsl:when test="ConstructiveOwnerIsFrgnPrsnInd = 'X'">
              Yes
            </xsl:when>
            <xsl:otherwise>No</xsl:otherwise>
          </xsl:choose>
        <!--
          <input type="checkbox" class="styCkbox">              
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode"  select="ConstructiveOwnerIsFrgnPerson" />
            </xsl:call-template>
          </input>
          -->
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
            Check if Direct Partner
          <!--
          <label>
            <xsl:call-template name="PopulateLabel">
              <xsl:with-param name="TargetNode" select="ConstructiveOwnerIsDirectPrtnr" />
            </xsl:call-template>  
            Check if Direct Partner
          </label>
          -->
        </th>
        <td class="styDepTblCell" style="text-align:left;">
          <xsl:choose>
            <xsl:when test="ConstructiveOwnerIsDrtPrtnrInd = 'X'">
              Yes
            </xsl:when>
            <xsl:otherwise>No</xsl:otherwise>
          </xsl:choose>
          <!--
          <input type="checkbox" class="styCkbox">              
            <xsl:call-template name="PopulateCheckbox">
              <xsl:with-param name="TargetNode" select="ConstructiveOwnerIsDirectPrtnr" />
            </xsl:call-template>
          </input>
          -->
        </td>
      </tr>
    </xsl:for-each>
    
  </xsl:if>
    <xsl:if test="IRS8865ScheduleN">
      <tr class="styDepTblRow1" style="text-align:right;">
        <th class="styDepTblHdr" scope="row" style="text-align:center;" colspan="2">
          IRS8865 Schedule N      
        </th>
      </tr>
      <!-- Repeat block -->
      <xsl:if test="IRS8865ScheduleN/IRS8865SchN/SalesOfInvntryPrtnrOthRltdEnt">
        <tr class="styDepTblRow2" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">       
            Sales of inventory  
          </th>
        </tr>
        <tr class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            U.S. Person Filing this Return            
          </th>
          <td class="styDepTblCell" style="text-align:right;">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/SalesOfInvntryPrtnrOthRltdEnt/USPersonAmt"/>
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
          </th>
          <td class="styDepTblCell" style="text-align:right;">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/SalesOfInvntryPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
          </th>
          <td class="styDepTblCell" style="text-align:right;">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/SalesOfInvntryPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                      <!--span class="styDepTableCellPad"></span-->
          </th>
          <td class="styDepTblCell" style="text-align:right;">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/SalesOfInvntryPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
              </xsl:call-template>
            </span>
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="IRS8865ScheduleN/IRS8865SchN/SalesOfPropertyPrtnrOthRltdEnt">
        <tr class="styDepTblRow1" style="text-align:right;">
          <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
            Sales of Property
          </th>
        </tr>
        <tr class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            U.S. Person Filing this Return            
          </th>
          <td class="styDepTblCell" style="text-align:right;">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/SalesOfPropertyPrtnrOthRltdEnt/USPersonAmt"/>
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
          </th>
          <td class="styDepTblCell" style="text-align:right;">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/SalesOfPropertyPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
          </th>
          <td class="styDepTblCell" style="text-align:right;">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/SalesOfPropertyPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                      <!--span class="styDepTableCellPad"></span-->
          </th>
          <td class="styDepTblCell" style="text-align:right;">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/SalesOfPropertyPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
              </xsl:call-template>
            </span>
          </td>
        </tr>
      </xsl:if>
      <xsl:if test="IRS8865ScheduleN/IRS8865SchN/CompRcvdPrtnrOthRltdEnt">
        <tr class="styDepTblRow2" style="text-align:right;">
          <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
            Compensation Received for Technical, Managerial, Engineering, Construction, or like Services                  </th>
        </tr>
        <tr class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            U.S. Person Filing this Return            
          </th>
          <td class="styDepTblCell" style="text-align:right;">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CompRcvdPrtnrOthRltdEnt/USPersonAmt"/>
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr class="styDepTblRow2">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
          </th>
          <td class="styDepTblCell" style="text-align:right;">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CompRcvdPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
              </xsl:call-template>
            </span>
          </td>
        </tr>
        <tr class="styDepTblRow1">
          <th class="styDepTblCell" scope="row" style="text-align:right;">
            Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
          </th>
          <td class="styDepTblCell" style="text-align:right;">
            <span style="width:44mm;text-align:right;">
              <xsl:call-template name="PopulateAmount">
                <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CompRcvdPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
              </xsl:call-template>
            </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CompRcvdPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/CommissionsRcvdPrtnrOthRltdEnt">
      <tr class="styDepTblRow1" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Commissions Received    
        </th>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return            
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CommissionsRcvdPrtnrOthRltdEnt/USPersonAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CommissionsRcvdPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CommissionsRcvdPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CommissionsRcvdPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/RentRyltsLcnsPrtnrOthRltdEnt">
      <tr class="styDepTblRow2" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Rents, Royalties, and License Fees Received
        </th>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return            
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/RentRyltsLcnsPrtnrOthRltdEnt/USPersonAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/RentRyltsLcnsPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/RentRyltsLcnsPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/RentRyltsLcnsPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
  </xsl:if>  
  <xsl:if test="IRS8865ScheduleN/IRS8865SchN/DistriReceivedPrtnrOthRltdEnt">  
      <tr class="styDepTblRow1" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Distributions Received  
        </th>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return            
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/DistriReceivedPrtnrOthRltdEnt/USPersonAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/DistriReceivedPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/DistriReceivedPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/DistriReceivedPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/IntReceivedPrtnrOthRltdEnt">
      <tr class="styDepTblRow2" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Interest Received
        </th>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return            
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/IntReceivedPrtnrOthRltdEnt/USPersonAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/IntReceivedPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/IntReceivedPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/IntReceivedPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>  
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/OtherReceivedPrtnrOthRltdEnt">
      <tr class="styDepTblRow1" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Other Received  
        </th>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return            
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/OtherReceivedPrtnrOthRltdEnt/USPersonAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/OtherReceivedPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/OtherReceivedPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/OtherReceivedPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/AllReceivedTotPrtnrOthRltdEnt">
      <tr class="styDepTblRow2" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          All Received Total
        </th>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return            
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AllReceivedTotPrtnrOthRltdEnt/USPersonAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AllReceivedTotPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AllReceivedTotPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AllReceivedTotPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/PrchsOfInvntryPrtnrOthRltdEnt">
      <tr class="styDepTblRow1" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Purchases of Inventory  
        </th>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return            
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PrchsOfInvntryPrtnrOthRltdEnt/USPersonAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PrchsOfInvntryPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PrchsOfInvntryPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PrchsOfInvntryPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/PrchsTngblPropPrtnrOthRltdEnt">    
      <tr class="styDepTblRow2" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Purchases of Tangible Property
        </th>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return            
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PrchsTngblPropPrtnrOthRltdEnt/USPersonAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
      <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PrchsTngblPropPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PrchsTngblPropPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PrchsTngblPropPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/PrchsPropRghtsPrtnrOthRltdEnt">
      <tr class="styDepTblRow1" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Purchases of Property Rights (patents, trademarks, etc.)  
        </th>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PrchsPropRghtsPrtnrOthRltdEnt/USPersonAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PrchsPropRghtsPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PrchsPropRghtsPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/PrchsPropRghtsPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/CompensationPdPrtnrOthRltdEnt">
      <tr class="styDepTblRow2" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Compensation Paid for Technical, Managerial, Engineering, Construction, or like Services  
        </th>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CompensationPdPrtnrOthRltdEnt/USPersonAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CompensationPdPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CompensationPdPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CompensationPdPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/CommissionsPaidPrtnrOthRltdEnt">
      <tr class="styDepTblRow1" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Commissions Paid
        </th>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CommissionsPaidPrtnrOthRltdEnt/USPersonAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CommissionsPaidPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CommissionsPaidPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/CommissionsPaidPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/RentRyltsLcnsPdPrtnrOthRltdEnt">
      <tr class="styDepTblRow2" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Rents, Royalties, and License Fees Paid    
        </th>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/RentRyltsLcnsPdPrtnrOthRltdEnt/USPersonAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/RentRyltsLcnsPdPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/RentRyltsLcnsPdPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/RentRyltsLcnsPdPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/DistributionsPdPrtnrOthRltdEnt">
      <tr class="styDepTblRow1" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Distributions Paid
        </th>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/DistributionsPdPrtnrOthRltdEnt/USPersonAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/DistributionsPdPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/DistributionsPdPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/DistributionsPdPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/InterestPaidPrtnrOthRltdEnt">
      <tr class="styDepTblRow2" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Interest Paid
        </th>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/InterestPaidPrtnrOthRltdEnt/USPersonAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/InterestPaidPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/InterestPaidPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/InterestPaidPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/OtherPaidPrtnrOthRltdEnt">
      <tr class="styDepTblRow1" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Other Paid
        </th>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/OtherPaidPrtnrOthRltdEnt/USPersonAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/OtherPaidPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/OtherPaidPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/OtherPaidPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/AllPaidTotalPrtnrOthRltdEnt">
      <tr class="styDepTblRow2" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          All Paid Total
        </th>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AllPaidTotalPrtnrOthRltdEnt/USPersonAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
          <span class="styDepTableCellPad"/>
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AllPaidTotalPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AllPaidTotalPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AllPaidTotalPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/AmountsBorrowedPrtnrOthRltdEnt">
      <tr class="styDepTblRow1" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Amounts Borrowed (enter the maximum loan balance during the year)
        </th>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AmountsBorrowedPrtnrOthRltdEnt/USPersonAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AmountsBorrowedPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AmountsBorrowedPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AmountsBorrowedPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
    </xsl:if>
    <xsl:if test="IRS8865ScheduleN/IRS8865SchN/AmountsLoanedPrtnrOthRltdEnt">    
      <tr class="styDepTblRow2" style="text-align:right;">
        <th class="styDepTblCell" scope="row" style="text-align:left;padding-left:65mm;" colspan="2">
          Amounts loaned (enter the maximum loan balance during the year)  
        </th>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AmountsLoanedPrtnrOthRltdEnt/USPersonAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Domestic Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AmountsLoanedPrtnrOthRltdEnt/DomesticCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow1">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          Foreign Corp. or Partnership Controlling or Controlled by U.S. Person Filing this Return
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AmountsLoanedPrtnrOthRltdEnt/ForeignCorporationOrPrtshpAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      <tr class="styDepTblRow2">
        <th class="styDepTblCell" scope="row" style="text-align:right;">
          U.S. Person With a 10% or More Direct Interest in the Controlled Foreign Partnership                    <!--span class="styDepTableCellPad"></span-->
        </th>
        <td class="styDepTblCell" style="text-align:right;">
          <span style="width:44mm;text-align:right;">
            <xsl:call-template name="PopulateAmount">
              <xsl:with-param name="TargetNode" select="IRS8865ScheduleN/IRS8865SchN/AmountsLoanedPrtnrOthRltdEnt/USPerson10PctOrMoreDrtIntAmt"/>
            </xsl:call-template>
          </span>
        </td>
      </tr>
      </xsl:if>
    </xsl:if>
  </table>
    <br/>
  </xsl:for-each>
  
  
  
  
  
  
  </xsl:template>
  
  <xsl:template name="GetClass">
    <xsl:attribute name="class">
      <xsl:choose>
         <xsl:when test="position() mod 2 = 1">styDepTblRow1</xsl:when>
         <xsl:otherwise>styDepTblRow2</xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:template>
  

  
  
  
  <!-- Main template -->
  <xsl:param name="depDocTitle">
    <xsl:call-template name="PopulateDisplayName"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>  
  </xsl:param>
  <!-- Main template -->
  <xsl:template match="/">

    <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html>
      <head>
				<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
           <title><xsl:value-of select="$depDocTitle"/></title>
         <!-- No Browser Caching -->
         <meta http-equiv="Pragma" content="no-cache"/>
         <meta http-equiv="Cache-Control" content="no-cache"/>
         <meta http-equiv="Expires" content="0"/>
         <!-- No Proxy Caching -->
         <meta http-equiv="Cache-Control" content="private"/>
         <!-- Define Character Set -->
         <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>        
         <meta name="Description" content="{$depDocTitle}"/>
         <script language="JavaScript" src="{$ScriptPath}/FormDisplay.js"/>
        <xsl:call-template name="InitJS"/>

        
        <style type="text/css">
        </style>
        <style type="text/css">
  <xsl:if test="not($Print) or $Print=''">
    <xsl:call-template name="AddOnStyle"/>    
  </xsl:if>
</style>
      <xsl:call-template name="GlobalStylesDep"/>
</head>
    
      <body class="styBodyClass">

        <xsl:call-template name="DocumentHeaderDependency"/>  
        <div class="styDepTitleLine" style="width:187mm;">
          <span class="styDepTitle" style="width:187mm;">
            <span style="width:187mm;"><xsl:value-of select="$depDocTitle"/></span>    
          </span>
        </div>
        <xsl:call-template name="PopulateDepCommonLeftover"><xsl:with-param name="TargetNode" select="$DependencyData"/></xsl:call-template>
        <span style="height:5px;"/>
        <!-- Transform Itemized Other Income Schedule -->
        <xsl:call-template name="DependencyTemplate"/>
        
        <br/>
      
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>