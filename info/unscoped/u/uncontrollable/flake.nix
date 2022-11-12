{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/uncontrollable?_rev=59-27a55a1e5528a366e65c2fd23c894e5b";
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
    ident = "uncontrollable";
    ldir  = "info/unscoped/u/uncontrollable";
    inherit packument fetchInfo;
  } // latest';

}
