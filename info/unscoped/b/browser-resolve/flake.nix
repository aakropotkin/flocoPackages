{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/browser-resolve?_rev=89-6e16b9133507a27ff551efae502671fa";
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
    ident = "browser-resolve";
    ldir  = "info/unscoped/b/browser-resolve";
    inherit packument fetchInfo;
  } // latest';

}
