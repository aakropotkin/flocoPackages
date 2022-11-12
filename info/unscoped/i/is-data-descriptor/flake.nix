{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/is-data-descriptor?_rev=10-91e6ef3925fa7c9663f4931353d5e51f";
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
    ident = "is-data-descriptor";
    ldir  = "info/unscoped/i/is-data-descriptor";
    inherit packument fetchInfo;
  } // latest';

}
