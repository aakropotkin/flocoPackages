{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/asap?_rev=31-17604d5332d25c5f033af38f0d682a3a";
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
    ident = "asap";
    ldir  = "info/unscoped/a/asap";
    inherit packument fetchInfo;
  } // latest';

}
