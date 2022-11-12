{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/grunt-known-options?_rev=9-4d89f5c0fefe10db298ffea9658648d6";
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
    ident = "grunt-known-options";
    ldir  = "info/unscoped/g/grunt-known-options";
    inherit packument fetchInfo;
  } // latest';

}
