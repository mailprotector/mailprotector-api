Settings
--------

Get settings
------------

* `GET /accounts/#{account_id}/settings.xml`
* `GET /domains/#{domain_id}/settings.xml`
* `GET /user_groups/#{user_group_id}/settings.xml`
* `GET /users/#{user_id}/settings.xml`

Retrieves a list of effective settings for the target.

Example response:

```xml
<settings type="array">
 <setting>
	 <entity_id type="integer">32</entity_id>
	 <entity_type>Domain</entity_type>
	 <name>inbound_smtp_host</name>
	 <value>10.1.16.8</value>
 </setting>
 <setting>
	 <entity_id type="integer">32</entity_id>
	 <entity_type>Domain</entity_type>
	 <name>outbound_smtp_host</name>
	 <value>10.10.5.26</value>
 </setting>
 <setting>
	 <entity_id type="integer">55</entity_id>
	 <entity_type>Provider</entity_type>
	 <name>digest_report_enabled</name>
	 <value>true</value>
 </setting>
</settings>
```

Set settings
------------

* `POST /accounts/#{account_id}/set_settings.xml`
* `POST /domains/#{domain_id}/set_settings.xml`
* `POST /user_groups/#{user_group_id}/set_settings.xml`
* `POST /users/#{user_id}/set_settings.xml`

Sets the specified settings for the target to the given values.

Example request:

```xml
<settings>
 <setting>
	 <name>digest_report_enabled</name>
	 <value>false</value>
 </setting>
</settings>
```

This will return `200 OK` if it was successful. If the manager does not have access to change settings for the target, you'll see `403 Forbidden`.
