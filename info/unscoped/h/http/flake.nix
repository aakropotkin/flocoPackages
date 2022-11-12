{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/http?_rev=32-d5d8c0b5fce553cfa1bd3aaea765715a";
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
    ident = "http";
    ldir  = "info/unscoped/h/http";
    inherit packument fetchInfo;
  } // latest';

}
