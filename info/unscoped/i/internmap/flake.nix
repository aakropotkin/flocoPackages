{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/internmap?_rev=7-2e286134bcf456c74cac9c0cf3ba42b0";
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
    ident = "internmap";
    ldir  = "info/unscoped/i/internmap";
    inherit packument fetchInfo;
  } // latest';

}
