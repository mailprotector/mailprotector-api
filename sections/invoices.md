Invoices
--------

Get invoices
------------

* `GET /accounts/#{account_id}/invoices.xml ` will return a list of invoices for the specified account.

Example response:

```xml
<invoices type="array">
 	<invoice>
		<id>55</id>
		<account_id>184</account_id>
		<number></number>
		<invoice_date>2010-09-20</invoice_date>
		<due_date>2010-09-20</due_date>
		<invoice_status>Paid</invoice_status>
		<discount></discount>
		<total>1345.25</total>
		<terms></terms>
		<notes></notes>
 	</invoice>
 	<invoice>
		<id>57</id>
		<account_id>184</account_id>
		<number></number>
		<invoice_date>2010-09-20</invoice_date>
		<due_date>2010-09-20</due_date>
		<invoice_status>Sent</invoice_status>
		<discount></discount>
		<total>1345.26</total>
		<terms></terms>
		<notes></notes> 
	</invoice>
</invoices>
```

Get invoice
-----------

* `GET /invoices/#{id}.xml` will return the specified invoice.

Example response:

```xml
<invoice>
	<id>57</id>
	<account_id>184</account_id>
	<number></number>
	<invoice_date>2010-09-20</invoice_date>
	<due_date>2010-09-20</due_date>
	<invoice_status>Sent</invoice_status>
	<discount></discount>
	<total>1345.26</total>
	<terms></terms>
	<notes></notes>
	<invoice_lines>
		<invoice_line>
			<cost type="float">581.1</cost>
			<description></description>
			<id type="integer">1761</id>
			<name>Customer A</name>
			<retail type="float">581.1</retail>
			<invoice_lines type="array">
				<invoice_line>
					<cost type="float">451.6</cost>
					<description></description>
					<id type="integer">1763</id>
					<name>customerdomain1.com</name>
					<retail type="float">451.6</retail>
					<invoice_lines type="array">
						<invoice_line>
							<cost type="float">451.6</cost>
							<description></description>
							<id type="integer">1765</id>
							<name>Premium Hosted Email</name>
							<retail type="float">451.6</retail>
							<invoice_lines type="array"/>
						</invoice_line>
					</invoice_lines>
				</invoice_line>
				<invoice_line>
					<cost type="float">129.5</cost>
					<description></description>
					<id type="integer">1767</id>
					<name>customerdomain2.com</name>
					<retail type="float">129.5</retail>
					<invoice_lines type="array">
						<invoice_line>
							<cost type="float">129.5</cost>
							<description></description>
							<id type="integer">1769</id>
							<name>Hosted Exchange</name>
							<retail type="float">129.5</retail>
							<invoice_lines type="array"/>
						</invoice_line>
					</invoice_lines>
				</invoice_line>
				<invoice_line>
					<cost type="float">0.0</cost>
					<description></description>
					<id type="integer">1771</id>
					<name>customerdomain3.com</name>
					<retail type="float">0.0</retail>
					<invoice_lines type="array">
						<invoice_line>
							<cost type="float">0.0</cost>
							<description></description>
							<id type="integer">1773</id>
							<name>Premium Hosted Email</name>
							<retail type="float">0.0</retail>
							<invoice_lines type="array"/>
						</invoice_line>
					</invoice_lines>
				</invoice_line>
			</invoice_lines>
		</invoice_line>
		<invoice_line>
			<cost type="float">356.26</cost>
			<description></description>
			<id type="integer">1775</id>
			<name>Customer B</name>
			<retail type="float">356.26</retail>
			<invoice_lines type="array">
				<invoice_line>
					<cost type="float">293.95</cost>
					<description></description>
					<id type="integer">1777</id>
				</invoice_line>
 			</invoice_lines>
 		</invoice_line>
 		<invoice_line>
			<cost type="float">129.5</cost>
			<description></description>
			<id type="integer">1767</id>
			<name>customerdomain2.com</name>
			<retail type="float">129.5</retail>
			<invoice_lines type="array">
				<invoice_line>
					<cost type="float">129.5</cost>
					<description></description>
					<id type="integer">1769</id>
					<name>Hosted Exchange</name>
					<retail type="float">129.5</retail>
					<invoice_lines type="array"/>
				</invoice_line>
			</invoice_lines>
		</invoice_line>
		<invoice_line>
			<cost type="float">0.0</cost>
			<description></description>
			<id type="integer">1771</id>
			<name>customerdomain3.com</name>
			<retail type="float">0.0</retail>
			<invoice_lines type="array">
				<invoice_line>
					<cost type="float">0.0</cost>
					<description></description>
					<id type="integer">1773</id>
					<name>Premium Hosted Email</name>
					<retail type="float">0.0</retail>
					<invoice_lines type="array"/>
				</invoice_line>
			</invoice_lines>
		</invoice_line>
	</invoice_lines>
</invoice>
```