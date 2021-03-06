<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.1" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:output method="html"/>

	<xsl:template match="/">
		<html>
		<head>
			<title>RSS feed by morss</title>
			<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;" />

			<style type="text/css">
				body {
					overflow-wrap: anywhere;
					word-wrap: anywhere;
					font-family: sans;
				}

				#url {
					background-color: rgba(255, 165, 0, 0.25);
					padding: 1% 5%;
					display: inline-block;
					max-width: 100%;
				}

				body > ul {
					background-color: #FFFAF4;
					padding: 1%;
					max-width: 100%;
				}

				ul {
					list-style-type: none;
				}

				.tag {
					color: darkred;
				}

				.attr {
					color: darksalmon;
				}

				.value {
					color: darkblue;
				}

				.comment {
					color: lightgrey;
				}

				pre {
					margin: 0;
					max-width: 100%;
					white-space: normal;
				}
			</style>
		</head>

		<body>
			<h1>RSS feed by morss</h1>

			<p>Your RSS feed is <strong style="color: green">ready</strong>. You
			can enter the following url in your newsreader:</p>

			<div id="url"></div>

			<ul>
				<xsl:apply-templates/>
			</ul>

			<script>
				document.getElementById("url").innerHTML = window.location.href;
			</script>
		</body>
		</html>
	</xsl:template>

	<xsl:template match="*">
		<li>
			<span class="element">
				&lt;
					<span class="tag"><xsl:value-of select="name()"/></span>

					<xsl:for-each select="@*">
						<span class="attr"> <xsl:value-of select="name()"/></span>
						=
						"<span class="value"><xsl:value-of select="."/></span>"
					</xsl:for-each>
				&gt;
			</span>

			<xsl:if test="node()">
				<ul>
					<xsl:apply-templates/>
				</ul>
			</xsl:if>

			<span class="element">
				&lt;/
					<span class="tag"><xsl:value-of select="name()"/></span>
				&gt;
			</span>
		</li>
	</xsl:template>

	<xsl:template match="comment()">
		<li>
			<pre class="comment"><![CDATA[<!--]]><xsl:value-of select="."/><![CDATA[-->]]></pre>
		</li>
	</xsl:template>

	<xsl:template match="text()">
		<li>
			<pre>
				<xsl:value-of select="normalize-space(.)"/>
			</pre>
		</li>
	</xsl:template>

	<xsl:template match="text()[not(normalize-space())]"/>

</xsl:stylesheet>
