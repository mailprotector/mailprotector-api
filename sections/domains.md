Domains
-------

Get domains
------------

* `GET /domains.xml` will return a collection of domains that are visible to the authenticated manager.
* `GET /accounts/#{account_id}/domains.xml` will return a collection of domains that belong to the specified account.


```xml
<domains type="array">
 <domain>
	 <account_id type="integer">127</account_id>
	 <created_at type="datetime">2010-07-07T20:39:56Z</created_at>
	 <id type="integer">545</id>
	 <name>addtest1.com</name>
	 <parent_id type="integer" nil="true"></parent_id>
	 <updated_at type="datetime">2010-07-07T20:39:57Z</updated_at>
 </domain>
 <domain>
	 <account_id type="integer">127</account_id>
	 <created_at type="datetime">2010-03-23T16:08:04Z</created_at>
	 <id type="integer">45</id>
	 <name>testdomain.com</name>
	 <parent_id type="integer" nil="true"></parent_id>
	 <updated_at type="datetime">2010-07-02T18:24:28Z</updated_at>
 </domain>
</domains>
```

Get domain
-----------

* `GET /domains/#{id}.xml` will return the specified domain.

```xml
<domain>
 <account_id type="integer">127</account_id>
 <created_at type="datetime">2010-07-07T20:39:56Z</created_at>
 <id type="integer">545</id>
 <name>addtest1.com</name>
 <parent_id type="integer" nil="true"></parent_id>
 <updated_at type="datetime">2010-07-07T20:39:57Z</updated_at>
</domain>
```

Create account
--------------

* `POST /domains.xml` will create a new domain from the parameters passed.
* `POST /accounts/#{account_id}/domains.xml` will create a new domain under the specified account.

Parameters:
* `name`: Fully qualified domain name.
* `parent_id`: This is the ID of the domain to make this domain an alias of. (Optional)

Example request:

```xml
<domain>
 <name>addtest1.com</name>
</domain>
```

This will return `201 Created`, with the location of the new domain in the `Location` header along with the current XML representation of the domain if the creation was a success. See the **Get domain** endpoint for more info. If the manager does not have access to create new domains you'll see `403 Forbidden`.

Example response:

```xml
<domain>
 <account_id type="integer">127</account_id>
 <created_at type="datetime">2010-07-07T20:15:45Z</created_at>
 <id type="integer">545</id>
 <name>addtest1.com</name>
 <parent_id type="integer" nil="true"></parent_id>
 <updated_at type="datetime">2010-07-07T20:15:45Z</updated_at>
</domain>
```

Move domain
--------------

* `POST /domains/#{id}/move.xml` will move the target domain to the specified account.

Parameters:
* account_id: ID of the account to move this domain to.

Example request:

```xml
<account_id>123</account_id>
```

This will return `200 OK` if the move was a success. If the manager does not have access to move the domain, you'll see `403 Forbidden`.

Delete account
--------------

* `DELETE /domains/#{id}.xml` will delete the domain at the referenced URL.

This will return `200 OK` if it was successful. If the manager does not have access to delete the domain, you'll see `403 Forbidden`.

