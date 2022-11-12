{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/frac?_rev=24-fce77167a1e26bd7411fa85d87b9062f";
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
    ident = "frac";
    ldir  = "info/unscoped/f/frac";
    inherit packument fetchInfo;
  } // latest';

}
