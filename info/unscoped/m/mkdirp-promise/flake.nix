{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/mkdirp-promise?_rev=26-b66ba36f07f6f7920d3fb0811b3313a3";
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
    ident = "mkdirp-promise";
    ldir  = "info/unscoped/m/mkdirp-promise";
    inherit packument fetchInfo;
  } // latest';

}
