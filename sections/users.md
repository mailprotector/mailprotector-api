Users
-----

Get users
---------

* `GET /domains/#{domain_id}/users.xml` will return a collection of users that belong to the specified domain.
* `GET /user_groups/#{user_group_id}/users.xml` will return a collection of users that belong to the specified user group.


```xml
<users type="array">
 <user>
	 <id>735</id>
	 <name>admin</name>
	 <user_type>user</user_type>
	 <parent_id></parent_id>
	 <domain_id>32</domain_id>
	 <user_group_id>27</user_group_id>
	 <first_name></first_name>
	 <last_name></last_name>
	 <created_at>2010-02-09 15:22:29 UTC</created_at>
 </user>
 <user>
	 <id>3314</id>
	 <name>johndoe</name>
	 <user_type>user</user_type>
	 <parent_id></parent_id>
	 <domain_id>32</domain_id>
	 <user_group_id>64</user_group_id>
	 <first_name>John</first_name>
	 <last_name>Doe</last_name>
	 <created_at>2010-04-05 21:19:54 UTC</created_at>
 </user>
 <user>
	 <id>3319</id>
	 <name>janedoe</name>
	 <user_type>user</user_type>
	 <parent_id></parent_id>
	 <domain_id>32</domain_id>
	 <user_group_id>64</user_group_id>
	 <first_name>Jane</first_name>
	 <last_name>Doe</last_name>
	 <created_at>2010-04-05 21:21:32 UTC</created_at>
 </user>
</users>
```

Get user
--------

* `GET /users/#{id}.xml` will return the specified user.

```xml
<user>
 <id>3314</id>
 <name>johndoe</name>
 <user_type>user</user_type>
 <parent_id></parent_id>
 <domain_id>32</domain_id>
 <user_group_id>64</user_group_id>
 <first_name>John</first_name>
 <last_name>Doe</last_name>
 <created_at>2010-04-05 21:19:54 UTC</created_at>
</user>
```

Create user
-----------

* `POST /domains/#{domain_id}/users.xml` will create a new user under the specified domain under the default user group.
* `POST /user_groups/#{user_group_id}/users.xml` will create a new user under the specified user group.

Parameters:
* `name`: This is the name of the user to add, which corresponds to the username portion of an email address (`jdoe@example.org` would be `jdoe`).
* `password`: This is the password for this user’s email account. This is optional for non-hosted email users.
* `first_name`: First name for the user. (Optional)
* `last_name`: Last name for the user. (Optional)
* `user_type`: This determines the type of user to add. The accepted options are “user”, “alias” and “mailing_list”. This value defaults to “user” unless otherwise specified.
* `parent_id`: This is the ID of the user to alias this new user to. This only applies to and is required for alias users.


Example request:

```xml
<user>
 <name>jdoe</name>
 <password>testpass123</password>
 <first_name>John</first_name>
 <last_name>Doe</last_name>
</user>
```

This will return `201 Created`, with the location of the new user in the `Location` header along with the current XML representation of the user if the creation was a success. See the **Get user** endpoint for more info. If the manager does not have access to create new user you'll see `403 Forbidden`.

Example response:

```xml
<user>
 <id>21898</id>
 <name>jdoe</name>
 <user_type>user</user_type>
 <parent_id></parent_id>
 <domain_id>32</domain_id>
 <user_group_id>27</user_group_id>
 <first_name>John</first_name>
 <last_name>Doe</last_name>
 <created_at>2010-07-19 17:52:49 UTC</created_at>
</user>
```

Import Users
------------

Imports a list of users to the targeted entity’s user list. Any imported users that already exist will update the existing users' information.

* `POST /domains/#{domain_id}/import.xml` will import users to the specified domain under the default user group.
* `POST /user_groups/#{user_group_id}/import.xml` will import users to the specified user group.

Parameters:
* `name`: This is the name of the user to add, which corresponds to the username portion of an email address (`jdoe@example.org` would be `jdoe`).
* `password`: This is the password for this user’s email account. This is optional for non-hosted email users.
* `first_name`: First name for the user. (Optional)
* `last_name`: Last name for the user. (Optional)

Example request:

```xml
<import>
 <mode>overwrite</mode>
 <users>
	 <user>
	 <name>johndoe</name>
	 <password>testpass123</password>
	 <first_name>John</first_name>
	 <last_name>Doe</last_name>
	 </user>
 <user>
	 <name>janedoe</name>
	 <password>testpass123</password>
	 <first_name>Jane</first_name>
	 <last_name>Doe</last_name>
	 </user>
 </users>
</import>
```

This will return `200 OK` if the import was a success. It will also return a summary of the actions taken. If the manager does not have access to import users, you'll see `403 Forbidden`.

Example response:

```xml
<status>2 users added, 1 user deleted</status>
```

Move user
---------

* `POST /users/#{id}/move.xml` will move the user to the specified user group.

Parameters:
* `user_group_id`: ID of the user group to move this user to.

Example request:

```xml
<user_group_id>123</user_group_id>
```

This will return `200 OK` if the move was a success. If the manager does not have access to move the domain, you'll see `403 Forbidden`.

Delete user
-----------

* `DELETE /users/#{id}.xml` will delete the user at the referenced URL.

This will return `200 OK` if it was successful. If the manager does not have access to delete the user, you'll see `403 Forbidden`.

