{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/make-iterator?_rev=14-303e12e547b1e5644d810d0cc4fd4396";
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
    ident = "make-iterator";
    ldir  = "info/unscoped/m/make-iterator";
    inherit packument fetchInfo;
  } // latest';

}
