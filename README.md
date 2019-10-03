## Easy Abap

Library that simplifies programming with abap. This project collects utility and helper functions for everyday use in abap.

Requirement: ABAP Version 702 or higher

Latest build (v.06): zcl_easy_abap.abap (link)

## Design Goals

* Easy installation on every abap system, just copy one class
* Easy to use, no requirements, no side effects, just create an instance and start working
* User friendly, every method tries to accept data as typeless as possible

## Installation

* Create a new global class in your abap system
* Copy the file (LINK) into the global class section of your new class
   * Rename line 5 with the name of your new class
* Copy the file (LINK) into the local class section of your new class
   * Rename line 6 with the name of your new class
* Start working and watch out the examples (link)
   * Message Handling (here)
   * Exceptions (here)
   * BAL, GOS, (here)

## Example for the first start

```ABAP
report zre_easy_abap_example.

"create an instance of your new helper class
lo_help = new zcl_easy_abap( ).

"start working with it
"...

"for instance: read a t100 message
lo_help->msg( exporting i_any = '123(bus123id)' importing es_bapi = data(ls_msg) ).

"save message persistent
lo_help->db_save( 
          bus    = 'X'       "business application log
          i_key  = 'ZLOG_01' "bal class
          i_key2 = 'ZMSG'    "bal subclass
          i_any  = ls_msg    "Message content
          ).

"and so on (watch out other examples)
```

## Versions

...


