{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/sw-toolbox?_rev=34-4ebfb15d275da6361db76927231663c3";
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
    ident = "sw-toolbox";
    ldir  = "info/unscoped/s/sw-toolbox";
    inherit packument fetchInfo;
  } // latest';

}
