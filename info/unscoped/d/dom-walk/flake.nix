{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/dom-walk?_rev=15-ea0147a65f0005e36ced849a4fb49975";
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
    ident = "dom-walk";
    ldir  = "info/unscoped/d/dom-walk";
    inherit packument fetchInfo;
  } // latest';

}
