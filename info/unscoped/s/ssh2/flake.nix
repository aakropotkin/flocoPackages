{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/ssh2?_rev=285-852c28192f144e29c7babaac38c94620";
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
    ident = "ssh2";
    ldir  = "info/unscoped/s/ssh2";
    inherit packument fetchInfo;
  } // latest';

}
