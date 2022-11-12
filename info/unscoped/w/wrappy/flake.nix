{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/wrappy?_rev=16-4390461d2521040ecdc065435100612c";
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
    ident = "wrappy";
    ldir  = "info/unscoped/w/wrappy";
    inherit packument fetchInfo;
  } // latest';

}
