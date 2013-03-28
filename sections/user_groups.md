User Groups
-----------

Get user groups
---------------

* `GET /domains/#{domain_id}/user_groups.xml` will return a collection of user groups that belong to the specified domain.


```xml
<user-groups type="array">
 <user_group>
	 <domain_id type="integer">32</domain_id>
	 <id type="integer">303</id>
	 <name>observers</name>
 </user_group>
 <user_group>
	 <domain_id type="integer">32</domain_id>
	 <id type="integer">27</id>
	 <name>other</name>
 </user_group>
 <user_group>
	 <domain_id type="integer">32</domain_id>
	 <id type="integer">64</id>
	 <name>office</name>
 </user_group>
</user-groups>
```

Get user group
--------------

* `GET /user_groups/#{id}.xml` will return the specified user group.

```xml
<user_group>
 <domain_id type="integer">32</domain_id>
 <id type="integer">64</id>
 <name>office</name>
</user_group>
```

Create user group
-----------------

* `POST /domains/#{domain_id}/user_groups.xml` will create a new user group under the specified domain.

Parameters:
* `name`: Name of the user group to add.

Example request:

```xml
<user_group>
 <name>new user group</name>
</user_group>
```

This will return `201 Created`, with the location of the new user group in the `Location` header along with the current XML representation of the user group if the creation was a success. See the **Get user group** endpoint for more info. If the manager does not have access to create new user groups you'll see `403 Forbidden`.

Example response:

```xml
<user_group>
 <domain_id type="integer">32</domain_id>
 <id type="integer">405</id>
 <name>new user group</name>
</user_group>
```

Delete user group
-----------------

* `DELETE /user_groups/#{id}.xml` will delete the user group at the referenced URL. All users in this group will be deleted as well.

This will return `200 OK` if it was successful. If the manager does not have access to delete the user group, you'll see `403 Forbidden`.

