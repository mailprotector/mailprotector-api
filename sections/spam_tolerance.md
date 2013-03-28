Spam Tolerance
--------------

Get spam tolerance
------------------

* `GET /domains/#{domain_id}/spam_tolerance.xml`
* `GET /user_groups/#{user_group_id}/spam_tolerance.xml`
* `GET /users/#{user_id}/spam_tolerance.xml`

Returns the current spam tolerance settings for the target entity. The entity_type, entity_id values in spam tolerance refer to the entity the target is inheriting their spam tolerance settings from.

Example response:

```xml
<spam_tolerance>
 <entity_type>Domain</entity_type>
 <entity_id>32</entity_id>
 <possible_spam_min_score>220</possible_spam_min_score>
 <possible_spam_max_score>280</possible_spam_max_score>
 <possible_spam_text_location>subject</possible_spam_text_location>
 <possible_spam_text>[Possible spam]</possible_spam_text>
</spam_tolerance>
```

Set spam tolerance
------------------

* `GET /domains/#{domain_id}/spam_tolerance.xml`
* `GET /user_groups/#{user_group_id}/spam_tolerance.xml`
* `GET /users/#{user_id}/spam_tolerance.xml`

Sets the spam tolerance settings for the target entity to the given values.

Parameters:
* `possible_spam_min_score`: This is the minimum score at which messages are considered either possible spam or spam. Allowed values are between 0 and 1000. 0 indicates that all messages are considered possible spam or spam, and 1000 indicates that all messages are considered clean.
* `possible_spam_max_score`: This is the maximum score at which messages are considered possible spam. Allowed values are between 0 and 1000. If this value is equal to possible_spam_min_score, no messages are considered possible spam. If this value is greater than the minimum, then messages whose score falls between the minimum and maximum are considered possible spam while those whose score is greater than the maximum are considered spam.
* `possible_spam_text_location`: This indicates where to put the possible_spam_text in each message. Options include `header` and `subject.
* `possible_spam_text`: This is the text to add to this message if the message is possibly spam.

Example request:

```xml
<spam_tolerance>
 <possible_spam_min_score>200</possible_spam_min_score>
 <possible_spam_max_score>350</possible_spam_max_score>
 <possible_spam_text_location>subject</possible_spam_text_location>
 <possible_spam_text>[Possible Spam]</possible_spam_text>
</spam_tolerance>
```

This will return `200 OK` if it was successful. If the manager does not have access to set spam tolerance, you'll see `403 Forbidden`.


Reset spam tolerance
------------------

* `GET /domains/#{domain_id}/reset_spam_tolerance.xml`
* `GET /user_groups/#{user_group_id}/reset_spam_tolerance.xml`
* `GET /users/#{user_id}/reset_spam_tolerance.xml`

Resets the spam tolerance settings for the target entity. This causes the entity to inherit its spam tolerance settings from its owner.

This will return `200 OK` if it was successful. If the manager does not have access to set spam tolerance, you'll see `403 Forbidden`.