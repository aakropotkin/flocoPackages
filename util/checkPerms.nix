{ runCommandNoCC ? ( builtins.getFlake "nixpkgs" ).legacyPackages.${builtins.currentSystem}.runCommandNoCC
, url     ? "https://registry.npmjs.org/${ident}/-/${baseNameOf ident}-${version}.tgz"
, ident   ? null
, version ? null
} @ args: let
  m = builtins.match "(.*)-([0-9]+\\.[0-9]+\\.[0-9]+(-.*)?)\\.tgz"
                     ( baseNameOf url );
  ident   = args.ident or ( builtins.head m );
  version = args.version or ( builtins.elemAt m 1 );
in runCommandNoCC "check-perms-${baseNameOf ident}-${version}" {
  src      = builtins.fetchTree { type = "file"; inherit url; };
  outputs  = ["out" "perms"];
  passthru = { inherit url ident version; };
} ''
  tar tzvf "$src" > "$perms";
  if grep '^d..-' "$perms"; then
    printf FAIL > "$out";
  else
    printf PASS > "$out";
  fi
''
