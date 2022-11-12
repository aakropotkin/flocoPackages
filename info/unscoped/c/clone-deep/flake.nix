{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/clone-deep?_rev=28-9e4fabd9afc64c92bd46a5e810c28199";
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
    ident = "clone-deep";
    ldir  = "info/unscoped/c/clone-deep";
    inherit packument fetchInfo;
  } // latest';

}
