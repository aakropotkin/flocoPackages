{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/resolve.exports?_rev=7-713212e540fb60d9aba6375b5ccbb522";
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
    ident = "resolve.exports";
    ldir  = "info/unscoped/r/resolve.exports";
    inherit packument fetchInfo;
  } // latest';

}
