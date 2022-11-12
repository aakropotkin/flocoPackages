jq 'group_by( .scope )|map( { key: .[0].scope, value: map( .bname ) } )|from_entries'
