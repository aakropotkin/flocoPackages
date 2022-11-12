{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/dom4?_rev=43-7d47d079d06a5c382e0d41157bb2b4ee";
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
    ident = "dom4";
    ldir  = "info/unscoped/d/dom4";
    inherit packument fetchInfo;
  } // latest';

}
