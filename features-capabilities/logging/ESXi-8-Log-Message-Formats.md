# ESXi 8 Log Message Formats | VMware
Introduction
------------

In ESXi 8.0.0, VMware standardized the formats of log files and syslog transmissions. This standardization affects the metadata associated with each log file line or syslog transmission, for example time stamp, programmatic source identifier, message severity, and operation identifier.

This document describes the changes, including the new formatting standards.

Augmented Backus-Naur Form (ABNF)
---------------------------------

Logging message formats are expressed in ABNF. ABNF is governed by the following RFC:

[https://tools.ietf.org/html/rfc5234](https://tools.ietf.org/html/rfc5234)

The inspiration for using ABNF in this document comes from its use in RFC 5424. An unambiguous way to specify grammars.

Adding Additional Data to a Message
-----------------------------------

The SD-ELEMENT is the place to add additional parameters in the future. This ensures that the data is accessible via an established grammar. When RFC 5424 message transmission is enabled, the collector need not parse the unstructured data, searching for something.

Time Stamps
-----------

Time stamps are always UTC/GMT and comply with RFC 5424.

Seconds resolution - no decimal point or anything after it - is acceptable by the RFCs and the ABNF grammars below reflect this. However, ESXi time stamps will use millisecond resolution or better where possible.

Syslog Message Transmissions
----------------------------

vmsyslogd (a syslog originator) messages transmitted to collectors (the "remote host" capability in syslog "speak") are principally governed by the following RFCs:

[https://tools.ietf.org/html/rfc3164](https://tools.ietf.org/html/rfc3164) (RFC 3164, the legacy syslog specification)

[https://tools.ietf.org/html/rfc5424](https://tools.ietf.org/html/rfc5424) (RFC 5424, the current syslog specification)

A legacy syslog collector may only be able to accept messages in RFC 3164 format; more recent syslog collectors may be able to handle RFC 3164 and RFC 5424 formats. Since a syslog originator has no way of determining the capabilities of a collector, vmsyslogd will support a configuration parameter that specifies the message format for each remote host. This also means that RFC 3164 messages will have a different format than RFC 5424 messages.

RFC 3164 Transmission Message Format
------------------------------------

Since RFC 3164 does not provide an ABNF, an RFC 3164 ABNF is specified below. ESXi places RFC 5424 structured data frames into some messages.

```
      SYSLOG-MSG      = HEADER SP MSG

      HEADER          = PRI TIMESTAMP SP HOSTNAME SP APP-NAME [PROC-IDENTIFIER] ":"

      PRI             = "<" PRIVAL ">"
      PRIVAL          = 1*3DIGIT ; range 0 .. 191 (the MSG PRI; contains facility and severity values, ORed together)

      APP-NAME        = 1*32PRINTUSASCII
      HOSTNAME        = 1*255PRINTUSASCII
      PROC-IDENTIFIER = "[" *DIGITS "]" ; the PID associated with APP-NAME

      TIMESTAMP       = FULL-DATE "T" UTC-TIME
      FULL-DATE       = DATE-FULLYEAR "-" DATE-MONTH "-" DATE-MDAY
      DATE-FULLYEAR   = 4DIGIT
      DATE-MONTH      = 2DIGIT ; 01-12
      DATE-MDAY       = 2DIGIT ; 01-28, 01-29, 01-30, 01-31 based on month/year
      UTC-TIME        = TIME-HOUR ":" TIME-MINUTE ":" TIME-SECOND [TIME-SECFRAC] "Z"

      TIME-HOUR       = 2DIGIT ; 00-23
      TIME-MINUTE     = 2DIGIT ; 00-59
      TIME-SECOND     = 2DIGIT ; 00-59
      TIME-SECFRAC    = "." 1*6DIGIT

      STRUCTURED-DATA = 1*SD-ELEMENT
      SD-ELEMENT      = "[" SD-ID *(SP SD-PARAM) "]"
      SD-PARAM        = PARAM-NAME "=" %d34 PARAM-VALUE %d34
      SD-ID           = SD-NAME
      PARAM-NAME      = SD-NAME
      PARAM-VALUE     = UTF-8-STRING ; characters '"', '\' and ']' MUST be escaped.
      SD-NAME         = 1*32PRINTUSASCII ; except '=', SP, ']', %d34 (")

      MSG             = [STRUCTURED-DATA SP] UTF-8-STRING
```


Event Traceability is facilitated via an opID. When available/appropriate, the opID must be part of the an SD-ELEMENT where the PARAM-NAME is "opID" and "opID" string is the PARAM\_VALUE.

RFC 5424 Transmission Message Format
------------------------------------

The ABNF of RFC 5424 messages can be found in section 6, pages 8 and 9. The grammar for ESXi RFC 5424 compliant messages is:

```
      SYSLOG-MSG      = HEADER SP STRUCTURED-DATA [SP MSG]

      HEADER          = PRI VERSION SP TIMESTAMP SP HOSTNAME SP APP-NAME SP PROCID SP MSGID
      PRI             = "<" PRIVAL ">"
      PRIVAL          = 1*3DIGIT ; range 0 .. 191; contains facility and severity data
      VERSION         = NONZERO-DIGIT 0*2DIGIT
      HOSTNAME        = 1*255PRINTUSASCII
      APP-NAME        = 1*48PRINTUSASCII

      NILVALUE        = '-'
      PROCID          = NILVALUE | *DIGITS ; the PID associated with APP-NAME
      MSGID           = NILVALUE

      TIMESTAMP       = FULL-DATE "T" UTC-TIME
      FULL-DATE       = DATE-FULLYEAR "-" DATE-MONTH "-" DATE-MDAY
      DATE-FULLYEAR   = 4DIGIT
      DATE-MONTH      = 2DIGIT ; 01-12
      DATE-MDAY       = 2DIGIT ; 01-28, 01-29, 01-30, 01-31 based on month/year
      UTC-TIME        = TIME-HOUR ":" TIME-MINUTE ":" TIME-SECOND [TIME-SECFRAC] "Z"
      TIME-HOUR       = 2DIGIT ; 00-23
      TIME-MINUTE     = 2DIGIT ; 00-59
      TIME-SECOND     = 2DIGIT ; 00-59
      TIME-SECFRAC    = "." 1*6DIGIT

      STRUCTURED-DATA = NILVALUE / 1*SD-ELEMENT
      SD-ELEMENT      = "[" SD-ID *(SP SD-PARAM) "]"
      SD-PARAM        = PARAM-NAME "=" %d34 PARAM-VALUE %d34
      SD-ID           = SD-NAME
      PARAM-NAME      = SD-NAME
      PARAM-VALUE     = UTF-8-STRING ; characters '"', '\' and ']' MUST be escaped.
      SD-NAME         = 1*32PRINTUSASCII ; except '=', SP, ']', %d34 (")

      MSG             = MSG-UTF8
      MSG-UTF8        = BOM UTF-8-STRING
      BOM             = %xEF.BB.BF
```


ESXi _never_ has a TIME-OFFSET as part of a TIMESTAMP.

Event Traceability is facilitated via an opID. When available/appropriate, the opID must be part of the an SD-ELEMENT where the PARAM-NAME is "opID" and "opID" string is the PARAM\_VALUE.

Audit Record Transmission Format
--------------------------------

ESXi audit records have a facility of 13 (LOG\_AUDIT) and are fully compliant to the RFC 3164 and 5424 grammars documented above. The audit data will be contained in a SD-ELEMENT (structured data). No unstructured data follows the SD-ELEMENT. Event traceability information will be present in the audit record when that data is available.

Log File Formats
----------------

### Log Files Written Directly By a Program

A program - and only this program - writes its log file for itself, typically via a "logger" (e.g. Log Facility, vmacore logger, Python logger).

An example of this is the VMX (the process what manages each VM). Each VM has a directory and the log file (vmware.log) for the VM is found within, written directly by the VMX itself. The VMX ALWAYS writes its log messages to vmware.log. The VMX may, optionally, also​ submit its log messages to syslog. Since the messages are already stored in vmware.log, vmsyslogd does not also​ write these messages to a log file, as this would unnecessarily consume system resources.

### Log Files Written Indirectly via syslog Submission

vmsyslogd takes care of the creation and management of the log files as well as writing the messages to the file. Messages from multiple programs may appear in some log files.

Directly Written File Format
----------------------------

The ABNF for log files written directly by program is specified here:

```

      LOG-MSG         = HEADER SP MSG

      HEADER          = TIMESTAMP SP SEVERITY SP THREAD-NAME SP OPID

      TIMESTAMP       = FULL-DATE "T" FULL-TIME
      FULL-DATE       = DATE-FULLYEAR "-" DATE-MONTH "-" DATE-MDAY
      DATE-FULLYEAR   = 4DIGIT
      DATE-MONTH      = 2DIGIT  ; 01-12
      DATE-MDAY       = 2DIGIT  ; 01-28, 01-29, 01-30, 01-31 based on month/year
      FULL-TIME       = TIME-HOUR ":" TIME-MINUTE ":" TIME-SECOND[TIME-SECFRAC] "Z"
      TIME-HOUR       = 2DIGIT  ; 00-23
      TIME-MINUTE     = 2DIGIT  ; 00-59
      TIME-SECOND     = 2DIGIT  ; 00-59
      TIME-SECFRAC    = "." 1*6DIGIT

      SEVERITY        = SEVERITY-STRING SEVERITY-VALUE [LINE-MARKER]

      SEVERITY-STRING = "Em"/ "Al" / "Cr" / "Er" / "Wa" / "No" / "In" / "Db"

      SEVERITY-VALUE  = "(" *DIGIT ")"

      LINE-MARKER     = "+"

      NILVALUE        = "-"

      THREAD-NAME     = NILVALUE / 1*32PRINTUSASCII

      OPID            = NILVALUE / 1*128UTF-8-STRING

      STRUCTURED-DATA = 1*SD-ELEMENT
      SD-ELEMENT      = "[" SD-ID *(SP SD-PARAM) "]"
      SD-PARAM        = PARAM-NAME "=" %d34 PARAM-VALUE %d34
      SD-ID           = SD-NAME
      PARAM-NAME      = SD-NAME
      PARAM-VALUE     = UTF-8-STRING ; characters '"', '\' and ']' MUST be escaped.
      SD-NAME         = 1*32PRINTUSASCII ; except '=', SP, ']', %d34 (")

      MSG             = [STRUCTURED-DATA SP] UTF-8-STRING
```


ESXi event traceability is facilitated via the OPID. 

The SEVERITY-STRING is an abbreviated expression of the 8 severity levels specified in RFC 5424, section 6.2.1, pages 9 and 10.

"Em" - Emergency

"Al" - Alert

"Cr" - Critical

"Er" - Error

"Wa" - Warning

"No" - Notice

"In" - Informational

"Db" - Debug

The SEVERITY-VALUE is an optional expression of the numeric value associated with the SEVERITY-STRING. This allows levels supported by a logger to be collapsed into the 8 required strings with no loss of information (e.g. Db(5) - debug, level 5).

The LINE-MARKER is added to each subsequent line generated from a multi-line submission. It clearly identifies multiline submissions and prevents a log injection security attack.

A single threaded program may not have a thread name, hence NILVALUE being acceptable.

The component (APP-NAME) is implied - the single program that is writing the file - so no component field is necessary, only the thread name.

Indirectly Written File Format (vmsyslogd)
------------------------------------------

The ABNF for log files written written by vmsyslogd is specified here:

```
      LOG-MSG         = HEADER SP MSG

      HEADER          = TIMESTAMP SP SEVERITY SP APP-NAME [PROC-IDENTIFIER] ":" 

      APP-NAME        = 1*32PRINTUSASCII
      PROC-IDENTIFIER = "[" *DIGITS "]" ; the PID associated with APP-NAME

      TIMESTAMP       = FULL-DATE "T" FULL TIME

      FULL-DATE       = DATE-FULLYEAR "-" DATE-MONTH "-" DATE-MDAY
      DATE-FULLYEAR   = 4DIGIT
      DATE-MONTH      = 2DIGIT  ; 01-12
      DATE-MDAY       = 2DIGIT  ; 01-28, 01-29, 01-30, 01-31 based on month/year
      FULL-TIME       = TIME-HOUR ":" TIME-MINUTE ":" TIME-SECOND[TIME-SECFRAC] "Z"
      TIME-HOUR       = 2DIGIT  ; 00-23
      TIME-MINUTE     = 2DIGIT  ; 00-59
      TIME-SECOND     = 2DIGIT  ; 00-59
      TIME-SECFRAC    = "." 1*6DIGIT

      SEVERITY-STRING = "Em" / "Al" / "Cr" / "Er" / "Wa" / "No" / "In" / "Db"

      SEVERITY        = SEVERITY-STRING PRI-STRING [LINE-MARKER]

      PRIVAL          = 1*3DIGIT ; range 0 .. 191 (the MSG PRI; contains facility and severity values, ORed together)
      PRI-STRING      = "(" PRIVAL ")"

      LINE-MARKER     = "+"

      STRUCTURED-DATA = 1*SD-ELEMENT
      SD-ELEMENT      = "[" SD-ID *(SP SD-PARAM) "]"
      SD-PARAM        = PARAM-NAME "=" %d34 PARAM-VALUE %d34
      SD-ID           = SD-NAME
      PARAM-NAME      = SD-NAME
      PARAM-VALUE     = UTF-8-STRING ; characters '"', '\' and ']' MUST be escaped.
      SD-NAME         = 1*32PRINTUSASCII ; except '=', SP, ']', %d34 (")

      MSG             = [STRUCTURED-DATA SP] UTF-8-STRING
```


Event Traceability is facilitated via an opID. When available/appropriate, the opID must be part of the an SD-ELEMENT where the PARAM-NAME is "opID" and "opID" string is the PARAM\_VALUE.

The SEVERITY-STRING is an abbreviated expression of the 8 severity levels specified in RFC 5424, section 6.2.1, pages 9 and 10.

"Em" - Emergency

"Al" - Alert

"Cr" - Critical

"Er" - Error

"Wa" - Warning

"No" - Notice

"In" - Informational

"Db" - Debug

The PRIVAL contains the bits from the message "PRI". This allows one to see the Facility of the message, as well as the severity bits themselves.

The LINE-MARKER is added to each subsequent line generated from a multi-line submission. It clearly identifies multiline submissions and prevents a log injection security attack.

Audit Record Storage Format
---------------------------

Audit records are not stored, locally, in "log files." They are stored in a special format, in specially handled files. Audit records are accessed locally via the auditLogReader program; do not read, use, or edit an audit record storage file directly. Event traceability information will be present in the audit record when that data is available.

Locally stored audit records comply with RFC 5424 transmission format where the HOSTNAME and MSGID are always NILVALUE.