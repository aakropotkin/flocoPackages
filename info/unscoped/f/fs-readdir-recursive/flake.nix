{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/fs-readdir-recursive?_rev=27-d2a6ef5752a0b59782714e77ea6e0713";
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
    ident = "fs-readdir-recursive";
    ldir  = "info/unscoped/f/fs-readdir-recursive";
    inherit packument fetchInfo;
  } // latest';

}
