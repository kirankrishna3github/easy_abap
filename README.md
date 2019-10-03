## Easy Abap

Library that simplifies programming with abap. This project collects utility and helper functions for everyday use in abap.

Requirement: ABAP Version 702 or higher

Latest build: zcl_easy_abap.abap (link)


## Installation

* Create a new global class in your abap system
* Copy the file (LINK) into the global class section of your new class
    * Rename line 5 with the name of your new class
* Copy the file (LINK) into the local class section of your new class
    * Rename line 6 with the name of your new class
* Start working and watch out the examples (link)

## Example

```ABAP
DATA itab2 TYPE STANDARD TABLE OF row_type WITH NON-UNIQUE KEY comp1 comp2.
```

or resort to `EMPTY KEY` if you don't need a key at all.

```ABAP
DATA itab1 TYPE STANDARD TABLE OF row_type WITH EMPTY KEY.
```

more Example
   * Message Handling (here)
   * Exceptions (here)
   * BAL, GOS, (here)

## FAQ

...


