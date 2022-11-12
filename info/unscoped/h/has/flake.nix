{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/has?_rev=27-cf613fabfa63c42660c11588b0da0d58";
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
    ident = "has";
    ldir  = "info/unscoped/h/has";
    inherit packument fetchInfo;
  } // latest';

}
