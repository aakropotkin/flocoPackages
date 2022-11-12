{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/copy-to-clipboard?_rev=47-5b1c051aefb6972e06a2d73c13420991";
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
    ident = "copy-to-clipboard";
    ldir  = "info/unscoped/c/copy-to-clipboard";
    inherit packument fetchInfo;
  } // latest';

}
