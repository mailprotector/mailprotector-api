Accounts
========

The Accounts API allows you to manage your customer accounts.

Get accounts
------------

* `GET /accounts.xml` will return a collection of accounts that are visible to the authenticated manager. This supports 
paging parameters.

```xml
<accounts type="array">
 <account>
	 <id>128</id>
	 <name>Test Account A</name>
	 <account_status>Demo</account_status>
	 <created_at>2010-02-15T13:49:45Z</created_at>
 </account>
 <account>
	 <id>248</id>
	 <name>Test Account B</name>
	 <account_status>New</account_status>
	 <created_at>2010-07-06T13:56:00Z</created_at>
 </account>
 <account>
	 <id>250</id>
	 <name>Test Account C</name>
	 <account_status>Configured</account_status>
	 <created_at>2010-07-06T15:37:15Z</created_at>
 </account>
</accounts>
```

Get account
-----------

* `GET /accounts/#{id}.xml` will return the specified account.

```xml
<account>
 <id>123</id>
 <name>Test Account</name>
 <account_status>Configured</account_status>
 <created_at>2010-07-06T15:37:15Z</created_at>
</account>
```

Create account
--------------

* `POST /accounts.xml` will create a new project from the parameters passed.

Parameters:
* name (required): Name for this account.

Example request:

```xml
<account>
 <name>New Account</name>
</account>
```

This will return `201 Created`, with the location of the new account in the `Location` header along with the current XML representation of the account if the creation was a success. See the **Get account** endpoint for more info. If the manager does not have access to create new accounts you'll see `403 Forbidden`.

Example response:

```xml
<account>
 <id>123</id>
 <name>New Account</name>
 <account_status>Active</account_status>
 <created_at>2010-07-06T15:37:16Z</created_at>
</account>
```

Update account
--------------

* `PUT /accounts/#{id}.xml` will update an existing account with new information from the submitted XML.

Parameters:
* name: Name for this account.

Example request:

```xml
<account>
 <name>Test Account</name>
</account>
```

This will return `200 OK` if the update was a success along with the current XML representation of the account. See the **Get accounts** endpoint for more info. If the manager does not have access to update the account, you'll see `403 Forbidden`.

Example response:

```xml
<account>
 <id>123</id>
 <name>Test Account</name>
 <account_status>New</account_status>
 <created_at>2010-07-06T15:37:16Z</created_at>
</account>
```

Delete account
--------------

* `DELETE /accounts/#{id}.xml` will delete the account at the referenced URL. All domains under this account will also be deleted.

This will return `200 OK` if it was successful. If the manager does not have access to delete the account, you'll see `403 Forbidden`.

