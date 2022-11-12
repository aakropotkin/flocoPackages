{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/gaze?_rev=125-d16fcfa52c24efc60602915032346037";
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
    ident = "gaze";
    ldir  = "info/unscoped/g/gaze";
    inherit packument fetchInfo;
  } // latest';

}
