User Stats
==========

Get user stats
--------------

* `GET /domains/#{domain_id}/messages.xml` will return a collection of user inbound and outbound message summaries for the specified domains' users.

Parameters:

All of the [common list parameters](https://github.com/virtualconnect/mailprotector-api#common-list-method-parameters) are supported along with the following additional fields.

* `date_start`: The beginning of the date range to pull statistics for.
* `date_end`: The end of the date range to pull statistics for.
* `direction`: The type of traffic to pull statistics for. Possible values are `inbound` or `outbound`. This is optional and when it is not include, both directions are included in the response.

Example response:

```xml
<inbound_summaries>
  <user_summary>
    <user_id>79783</user_id>
    <username>abuse</username>
    <spam>0</spam>
    <virus>0</virus>
    <policy>0</policy>
    <delivered>0</delivered>
    <total>0</total>
  </user_summary>
</inbound_summaries>
<outbound_summaries>
  <user_summary>
    <user_id>79783</user_id>
    <username>abuse</username>
    <spam>0</spam>
    <virus>0</virus>
    <policy>0</policy>
    <delivered>0</delivered>
    <total>0</total>
  </user_summary>
</outbound_summaries>
```