{

  inputs.packument.url   = "https://registry.npmjs.org/scoped-regex?rev=6-e8cb2039f549365ec5f89f6266e8e346";
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
    ident = "scoped-regex";
    ldir  = "info/unscoped/s/scoped-regex";
    inherit packument fetchInfo;
  } // latest';

}
