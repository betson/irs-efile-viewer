<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<!--
*****************************************************************************************************
Document Header Template stylesheet
*****************************************************************************************************
Created by: Charles Moore
*****************************************************************************************************
Description: Templates for populating "efile graphic print - do not process" line at the top of every page 
*****************************************************************************************************
-->
  <!-- For "portrait" format forms that are not dependencies -->
  <xsl:template name="DocumentHeader">
    <div class="styDocHeader" style="width:187mm;" id="PageHeader">
      <xsl:call-template name="DocumentHeaderContent"></xsl:call-template>
    </div>
  </xsl:template>
  
  <!-- For "landscape" format forms -->
  <xsl:template name="DocumentHeaderLandscape">
    <div class="styDocHeader" style="width:256mm;" id="PageHeader">
      <xsl:call-template name="DocumentHeaderContent"></xsl:call-template>
    </div>
  </xsl:template>
  
  <!-- For dependency forms -->
  <xsl:template name="DocumentHeaderDependency">    
    <div class="styDocHeader" style="width:187mm;" id="PageHeader">
      <xsl:call-template name="DocumentHeaderContent"></xsl:call-template>
    </div>
    <br/>
  </xsl:template>
  
  <!-- For dependency forms -->
  <xsl:template name="DocumentHeaderDependencyLandscape">    
    <div class="styDocHeader" style="width:256mm;" id="PageHeader">
      <xsl:call-template name="DocumentHeaderContent"></xsl:call-template>
    </div>
  <!-- Added note to advise page orientation for printing. Venkata R.Boggavarapu; 09/22/03-->
    <br/>
    <div style="font-size:8pt;font-weight:bold;">Note:  To capture the full content of this document, please select landscape mode (11" x 8.5") when printing.</div>    
    <br/>
  </xsl:template>
  
  <!-- This template contains the display styles and logic that applies similarly to all three header types -->
  <xsl:template name="DocumentHeaderContent">    
    <span class="styDoNotProcess">
      <xsl:value-of select="$AppProp/FormHeaderGeneric" />
      <span style="width:12px;"></span>
      <span class="styDataStage">
      <xsl:choose>
        <xsl:when test="$TaxpayerPrint='true' or $TaxpayerPrint='1'">
          Taxpayer Copy
        </xsl:when>
        <xsl:otherwise>
          <xsl:if test="$Stage='original'">
            <xsl:value-of select="$AppProp/FormHeaderOriginalData" />
          </xsl:if>
          <xsl:if test="$Stage='latest'">
            <xsl:value-of select="$AppProp/FormHeaderLatestData" />
          </xsl:if>
          - <xsl:value-of select="$AppProp/SystemMode" />
        </xsl:otherwise>
      </xsl:choose>
      </span>
      <xsl:if test="$ReturnStatus='R'">
        <span class="styRejected">
          Rejected
        </span>
      </xsl:if>
    </span>
    <span class="styDLN">
      <xsl:choose>
        <xsl:when test="/AppData/Parameters/DocumentDLN != ''">
      		DLN: <xsl:value-of select="/AppData/Parameters/DocumentDLN" />
      	</xsl:when>
        <xsl:when test="/AppData/Parameters/DLN">
          <xsl:choose>
            <xsl:when test="/AppData/Parameters/DLN=''">
              TIN: <xsl:value-of select="/AppData/Parameters/TIN" />
            </xsl:when>
            <xsl:otherwise>
              DLN: <xsl:value-of select="/AppData/Parameters/DLNLatest" />
              <!-- If Taxpayer print is not selected -->
		        <xsl:if test="$TaxpayerPrint='false' or $TaxpayerPrint='0'">
	              <!-- If the DLN has been changed, display the the delta triangle. -->
	              <xsl:if test="/AppData/Parameters/DLNChanged='1' or /AppData/Parameters/DLNChanged='true'">
	                <span style="width:2px;" /><img src="{$NonVersionedImagePath}/changeSmall.gif" style="padding-top:1px;" alt="DLN has changed"/>
	              </xsl:if>
              </xsl:if>
            </xsl:otherwise>
          </xsl:choose>
        </xsl:when>
        <xsl:otherwise >
          TIN: <xsl:value-of select="/AppData/Parameters/TIN" />
        </xsl:otherwise>
      </xsl:choose>          
    </span>
  </xsl:template>
</xsl:stylesheet>