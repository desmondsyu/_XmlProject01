<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="/">
        <html>
            <head>
                <title>Order table using xsl</title>
                <style>
                    table {
                        font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
                        border-collapse: collapse;
                        width: auto;
                        margin: 0;
                        padding: 10px;
                    }
        
                    th {
                        background-color: blanchedalmond;
                    }
        
                    th, td {
                        text-align: center;
                        padding: 8px;
                        border: 1px solid;
                    }
        
                </style>
            </head>
            <body>
                <h1>Order Details</h1>
                <table>
                    <tr>
                        <th>Order Id</th>
                        <th>Customer Name</th>
                        <th>Email</th>
                        <th>Status</th>
                        <th>Item Instock</th>
                        <th>Item Id</th>
                        <th>Item Name</th>
                        <th>Price</th>
                        <th>Qty</th>
                        <th>shippingDetails</th>
                    </tr>
                    <xsl:for-each select="/orders/order/item/">
                    <tr>
                        <td><xsl:value-of select="../@oid" /></td>
                        <td><xsl:value-of select="../customerInfo/customerName" /></td>
                        <td><xsl:value-of select="../customerInfo/email" /></td>
                        <td><xsl:value-of select="../status" /></td>
                        <td><xsl:value-of select="@instock" /></td>
                        <td><xsl:value-of select="@itemid" /></td>
                        <td><xsl:value-of select="name" /></td>
                        <td><xsl:value-of select="price" /></td>
                        <td><xsl:value-of select="qty" /></td>
                        <td><xsl:value-of select="../shippingDetails" /></td>
                    </tr>
                </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>