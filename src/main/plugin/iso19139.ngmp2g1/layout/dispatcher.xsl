<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:gmd="http://www.isotc211.org/2005/gmd" xmlns:gts="http://www.isotc211.org/2005/gts"
                xmlns:gco="http://www.isotc211.org/2005/gco" xmlns:gmx="http://www.isotc211.org/2005/gmx"
                xmlns:srv="http://www.isotc211.org/2005/srv" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:gml="http://www.opengis.net/gml/3.2" xmlns:xlink="http://www.w3.org/1999/xlink"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:gn="http://www.fao.org/geonetwork"
                xmlns:gn-fn-metadata="http://geonetwork-opensource.org/xsl/functions/metadata"
                xmlns:gn-fn-iso19139="http://geonetwork-opensource.org/xsl/functions/profiles/iso19139"
                xmlns:saxon="http://saxon.sf.net/" extension-element-prefixes="saxon"
                exclude-result-prefixes="#all">

    <xsl:include href="evaluate.xsl"/>
    <xsl:include href="layout.xsl"/>

    <!-- Load the schema configuration for the editor -->
    <xsl:template name="get-iso19139.ngmp2g1-configuration">
        <xsl:copy-of select="document('config-editor.xml')"/>
    </xsl:template>


    <!-- Dispatch to the current profile mode -->
    <xsl:template name="dispatch-iso19139.ngmp2g1">
        <xsl:param name="base" as="node()"/>
        <xsl:param name="overrideLabel" as="xs:string" required="no" select="''"/>
        <xsl:param name="refToDelete" as="node()?" required="no"/>

        <!--
            Process in iso19139 mode -
            We can override any templates defined for iso19139 by importing 
            that stylesheet into our ngmp2g1 stylesheet
            That way the iso19139 templates will have a lower priority than ours
        -->
        <xsl:apply-templates mode="mode-iso19139" select="$base">
            <xsl:with-param name="overrideLabel" select="$overrideLabel"/>
            <xsl:with-param name="schema" select="$schema"/>
            <xsl:with-param name="labels" select="$iso19139.ngmp2g1labels"/>
            <xsl:with-param name="refToDelete" select="$refToDelete"/>
        </xsl:apply-templates>

    </xsl:template>
</xsl:stylesheet>
