{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/express-session?_rev=534-3bceafa7fd0b8e83f6dc03714a247e36";
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
    ident = "express-session";
    ldir  = "info/unscoped/e/express-session";
    inherit packument fetchInfo;
  } // latest';

}
