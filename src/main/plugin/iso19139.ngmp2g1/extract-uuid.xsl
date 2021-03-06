<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" 
                  xmlns:gco="http://www.isotc211.org/2005/gco"
                  xmlns:gmd="http://www.isotc211.org/2005/gmd"
                  xmlns:gmi="http://standards.iso.org/iso/19115/-2/gmi/1.0">

    <xsl:template match="gmd:MD_Metadata|gmi:MI_Metadata">
        <uuid>
            <xsl:value-of select="gmd:fileIdentifier/gco:CharacterString"/>
        </uuid>
    </xsl:template>

</xsl:stylesheet>
