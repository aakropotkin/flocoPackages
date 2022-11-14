#! /usr/bin/env bash

# This should get reworked to accept args.
#
# As written it drops any versions without a `bin' field, and hides
# "unstable" versions ( 0.x ).
# It normalized bin fields by stripping `./' prefixes, then groups.

pacote packument "$1" --json 2>/dev/null|jq '
.versions|
  map( select( ( .bin != null ) and ( .version|test( "^0" )|not ) )
    |{ version: .version,
       bin: ( .bin|with_entries( .value|=sub( "\\./"; "" ) ) )
     }
  )|group_by( .bin )
  |map( { bin: .[0].bin, versions: map( .version ) } )';
