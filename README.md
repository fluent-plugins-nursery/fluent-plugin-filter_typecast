# fluent-plugin-filter_typecast

[![Build Status](https://secure.travis-ci.org/sonots/fluent-plugin-filter_typecast.png?branch=master)](http://travis-ci.org/sonots/fluent-plugin-filter_typecast)

A Fluentd filter plugin to cast record types

## Requirements

Fluentd >= v0.12

## Install

Use RubyGems:

```
gem install fluent-plugin-filter_typecast
```

## Configuration Example

```apache
<source>
  type dummy
  tag dummy
  dummy {"field1":"1","field2":"2","field3":"2013-02-12 22:04:14 UTC","field4":"true","field5":"a,b,c"}
</source>

<filter **>
  type typecast
  types field1:integer,field2:string,field3:time,field4:bool,field5:array
</filter>

<match **>
  type stdout
</match>
```

You should see casted records:

```
dummy {"field1":1,"field2":"2","field3":1418380657,"field4":true,"field5":["a","b","c"]}
```

## Parameters

* types
  * KEY:TYPE pairs separated by comma(,)
  * support types:
    * integer
    * float
    * string
    * time
    * bool
    * array

### time_format

Time format can be specified like `KEY:time:TIME_FORMAT` as:

```apache
<filter **>
  type typecast
  types field3:time:%d/%b/%Y:%H:%M:%S %z
</filter>
```

As default, ruby takes cares of it as much as possible (`Time.parse` method is used).

### array_delimiter

Array delimiter can be specified like `KEY:array:DELIMITER` as:

```apache
<filter **>
  type typecast
  types field5:array:.
</filter>
```

## ChangeLog

See [CHANGELOG.md](CHANGELOG.md) for details.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new [Pull Request](../../pull/new/master)

## Copyright

Copyright (c) 2015 Naotoshi Seo. See [LICENSE](LICENSE) for details.
