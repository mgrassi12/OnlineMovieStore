<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:nsm="http://www.uts.edu.au/31284/oms">
    <xsl:output method="html"/>

    <xsl:template match="/">
        <html>      
            <head>
                <link rel="stylesheet" href="blockbuster.css" type="text/css"></link>
            </head>     
            <body>
                <h1>Users</h1>
                <xsl:apply-templates />
            </body>
        </html>
    </xsl:template>

    <xsl:template match="nsm:users" >
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Password</th>
                    <th>Phone</th>
                    <th>Address</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates />
            </tbody>
        </table>
    </xsl:template>
    
    <xsl:template match="nsm:user">
        <tr>
            <td>
                <xsl:value-of select="nsm:name"/>
            </td>
            <td>
                <xsl:value-of select="nsm:email"/>
            </td>
            <td>
                <xsl:value-of select="nsm:password" />
            </td>
             <td>
                <xsl:value-of select="nsm:phone" />
            </td>
            <td>
                <xsl:value-of select="nsm:address" />
            </td>
        </tr>
    </xsl:template>
    
</xsl:stylesheet>