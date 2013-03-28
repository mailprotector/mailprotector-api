Allow/Block Rules
-----------------

Get allow/block rules
---------------------

* `GET /domains/#{domain_id}/allow_block_rules.xml` will return a collection of rules that belong to the specified domain.
* `GET /user_groups/#{user_group_id}/allow_block_rules.xml` will return a collection of rules that belong to the specified user group.
* `GET /users/#{user_id}/allow_block_rules.xml` will return a collection of rules that belong to the specified user.

Adding `rule_type=allow` or `rule_type=block` to the query will limit the response to one type or the other

```xml
<rules>
 <rule> 
 	<address>allowtestdomain.com</address>
 	<type>allow</type>
 </rule>
 <rule>
 	<address>blocktestdomain.com</address>
 	<type>block</type>
 </rule>
</rules>
```

Create allow/block rule
-----------------------

* `POST /domains/#{domain_id}/allow_block_rules.xml` will add a rule to the specified domain.
* `POST /user_groups/#{user_group_id}/allow_block_rules.xml` will add a rule to the specified user group.
* `POST /users/#{user_id}/allow_block_rules.xml` will add a rule to the specified user.

You can pass multiple rules in the same call to the API.

Parameters:
* `type`: This is the type of rule to create. Accepted values are `allow` and `block`
* `address`: Email address or domain name to allow or block.

Example request:

```xml
<rules>
 <rule>
	 <address>allowtestdomain.com</address>
	 <type>allow</type>
 </rule>
 <rule>
	 <address>blocktestdomain.com</address>
	 <type>block</type>
 </rule>
</rules>
```

This will return `200 OK`if the creation was a success. If the manager does not have access to create allow/block rules you'll see `403 Forbidden`.

Delete allow/block rule
-----------------------

* `POST /domains/#{domain_id}/allow_block_rules/destroy_rules.xml` will delete the allow/block rule from the specified domains rule list.
* `POST /user_groups/#{user_group_id}/allow_block_rules/destroy_rules.xml` will delete the allow/block rule from the specified user group rule list.
* `POST /users/#{user_id}/allow_block_rules/destroy_rules.xml` will delete the allow/block rule from the specified user rule list.

You can pass multiple rules in the same call to the API.

Parameters:
* `type`: This is the type of rule to delete. Accepted values are `allow` and `block`
* `address`: Email address or domain name to remove from the list.

Example request:

```xml
<rules>
 <rule>
	 <address>allowtestdomain.com</address>
	 <type>allow</type>
 </rule>
 <rule>
	 <address>blocktestdomain.com</address>
	 <type>block</type>
 </rule>
</rules>
```

This will return `200 OK` if it was successful. If the manager does not have access to delete the rules, you'll see `403 Forbidden`.

