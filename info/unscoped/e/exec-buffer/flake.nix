{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/exec-buffer?_rev=25-833aa38a28c3560b813870693e2ddba9";
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
    ident = "exec-buffer";
    ldir  = "info/unscoped/e/exec-buffer";
    inherit packument fetchInfo;
  } // latest';

}
