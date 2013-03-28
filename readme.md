Mailprotector API
=================

The Mailprotector API is implemented as vanilla XML over HTTP using all four verbs (GET/ POST/PUT/DELETE). Every resource, like Account, Domain, or User, has their own URL and are manipulated in isolation. In other words, we've tried to make the API follow the REST principles as much as we can.

You can explore the view part of the API (everything that's fetched with GET) through a regular browser. Using Chrome for this is particularly nice as it has a good, simple XML renderer. Almost any URL in the Mailprotector Console can be viewed in its XML form by adding the .xml extension. So /domains becomes /domains.xml if you want to see the XML version.


Authentication
--------------

When you're using the API, it's always through an existing manager in Mailprotector. There's no special API manager or user. So when you use the API as "john", you get to see and work with what "john" is allowed to. Authenticating is done with an authentication token, which you'll find on the "Edit Profile" screen in the Mailprotector Console. The authentication tokens are tied to a specific role for a manager. This allows you do have multiple authentication tokens with different permissions. This way you can lock down certain applications accessing your Mailprotector account to keep your data more secure.

When using the authentication token, you don't need a separate password. But since Mailprotector uses HTTP Basic Authentication, and lots of implementations assume that you want to have a password, it's often easier just to pass in a dummy password, like X.

Example using the authentication token and a dummy password through curl:

```shell
curl -u AUTHENTICATION_TOKEN:X https://console.mailprotector.com/domains.xml
 ```

Remember that anyone who has your authentication token can see and change everything you have access to. So you want to guard that as well as you guard your username and password. If you come to fear that it has been compromised, you can regenerate it at any time from the "Edit Profile" screen in the Mailprotector Console.

For additional information about the API including all of the available methods, see the sections below.


Common List Method Parameters
-----------------------------

For most actions that return multiple results there is a set of parameters that may be used to 
specify how the results should be returned. The following parameters may be specified in the 
query string for actions that support them:

* `offset` - integer specifying the index of the first record to return (defaults to 0)
* `limit` - integer specifying how many records to return starting at the offset 
index (defaults to 50 for most actions)
* `all` - a value of “true” indicates that the offset and limit should be ignored and 
all records should be returned
* `filter_field` - property of the list members to search on (all applicable properties are 
searched if this is not specified)
* `filter_value` - value to search for in the properties specified by filter_field
* `sort_column` - property of the list members to sort on (each list method has its own 
default property to sort on if this is not specified)
* `sort_dir` - direction to sort the results in, accepted values are “asc” and “desc” for 
ascending and descending order


API ready for use
-----------------

* [Accounts](https://github.com/virtualconnect/mailprotector-api/blob/master/sections/accounts.md)
* [Domains](https://github.com/virtualconnect/mailprotector-api/blob/master/sections/domains.md)
* [User Groups](https://github.com/virtualconnect/mailprotector-api/blob/master/sections/user_groups.md)
* [Users](https://github.com/virtualconnect/mailprotector-api/blob/master/sections/users.md)
* [Allow/Block Rules](https://github.com/virtualconnect/mailprotector-api/blob/master/sections/allow_block_rules.md)
* [Content Filtering Rules](https://github.com/virtualconnect/mailprotector-api/blob/master/sections/content_rules.md)
* [Quarantine](https://github.com/virtualconnect/mailprotector-api/blob/master/sections/quarantine.md)
* [Spam Tolerance](https://github.com/virtualconnect/mailprotector-api/blob/master/sections/spam_tolerance.md)
* [Directory Sync Profile](https://github.com/virtualconnect/mailprotector-api/blob/master/sections/directory_sync_profile.md)
* [Managers](https://github.com/virtualconnect/mailprotector-api/blob/master/sections/managers.md)
* [Roles](https://github.com/virtualconnect/mailprotector-api/blob/master/sections/roles.md)
* [Addresses](https://github.com/virtualconnect/mailprotector-api/blob/master/sections/addresses.md)
* [Phones](https://github.com/virtualconnect/mailprotector-api/blob/master/sections/phones.md)
* [Settings](https://github.com/virtualconnect/mailprotector-api/blob/master/sections/settings.md)
* [Invoices](https://github.com/virtualconnect/mailprotector-api/blob/master/sections/invoices.md)


Wrappers and example code
---------------------

Browse the [example code and wrappers](https://github.com/virtualconnect/mailprotector-api/blob/master/libraries/) you can use. We will be adding more examples and wrappers to this list.

Wrote your own API wrapper? Feel free to open a pull request and add to this list!


Help us make it better
----------------------

Please tell us how we can make the API better. If you have a specific feature request or if you found a bug, please [open a support ticket](http://support.mailprotector.com). Fork these docs and send a pull request with improvements.