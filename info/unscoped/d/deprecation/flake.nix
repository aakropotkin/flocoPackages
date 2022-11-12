{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/deprecation?_rev=8-7ccab10adb92a2a4ea6b6c84d68736ee";
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
    ident = "deprecation";
    ldir  = "info/unscoped/d/deprecation";
    inherit packument fetchInfo;
  } // latest';

}
