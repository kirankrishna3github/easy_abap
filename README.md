## Easy Abap

Library that simplifies programming with abap. This project collects utility and helper functions for everyday use in abap.

Requirement: ABAP Version 702 or higher

Latest build: [zcl_easy_abap (v.0.6)](https://github.com/lars-sawyer/easy_abap/tree/master/zcl_easy_abap) 

## Design Goals

* Easy installation: works on every abap system, just copy one class and change two lines of code with the name of the class
* Easy to use: no requirements, no side effects, just create an instance and start calling its methods
* User-friendly: every method tries to accept data as typeless as possible, don't waste time with conversions any more

## Installation

* Create a new global class in your abap system
* Copy [following content](https://raw.githubusercontent.com/lars-sawyer/easy_abap/master/zcl_easy_abap/zcl_easy_abap_global_class.abap) into the global class section of your new class
   * Rename line 5 with the name of your new class
* Copy [following content](https://raw.githubusercontent.com/lars-sawyer/easy_abap/master/zcl_easy_abap/zcl_easy_abap_local_types.abap) into the local class section of your new class
   * Rename line 6 with the name of your new class
* Start working and watch out the examples
   * [Message Handling](link)
   * [Exceptions](link)
   * [BAL, GOS, ...](link)
   * [others](link)

## An example for the beginning

```ABAP
"wherever you want to use the functions of easy abap

"create an instance of the new class
data(lo_easy) = new zcl_easy_abap( ).

"and for instance: read a t100 message
data(ls_msg) = lo_easy->get_msg('123(bus123id)').

"save message persistent
lo_easy->db_save( 
           bal    = 'X'       "business application log
           i_key  = 'ZLOG_01' "bal class
           i_key2 = 'ZMSG'    "bal subclass
           i_any  = ls_msg    "message content
         ).

"and so on...
```

## Versions

...


