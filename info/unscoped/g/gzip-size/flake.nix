{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/gzip-size?_rev=41-a056b058e5c093871bbdae9a962e74b0";
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
    ident = "gzip-size";
    ldir  = "info/unscoped/g/gzip-size";
    inherit packument fetchInfo;
  } // latest';

}
