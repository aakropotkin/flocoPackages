{

  inputs.packument.url   = "https://registry.npmjs.org/is-typed-array?rev=25-4884c444e7d2ce9583112f421ae9e50e";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "is-typed-array";
    ldir  = "info/unscoped/i/is-typed-array";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
