{

  inputs.packument.url   = "https://registry.npmjs.org/string-natural-compare?rev=21-f772c976023149b41c64543133f8a369";
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
    ident = "string-natural-compare";
    ldir  = "info/unscoped/s/string-natural-compare";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
