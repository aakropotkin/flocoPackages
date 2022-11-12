{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/globule?_rev=22-9b091e30088337e3146c7a7ba0d5e7f5";
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
    ident = "globule";
    ldir  = "info/unscoped/g/globule";
    inherit packument fetchInfo;
  } // latest';

}
