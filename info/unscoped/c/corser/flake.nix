{

  inputs.packument.url   = "https://registry.npmjs.org/corser?rev=32-40f1ab3dab0e7392411cb52b29bc0f21";
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
    ident = "corser";
    ldir  = "info/unscoped/c/corser";
    inherit packument fetchInfo;
  } // latest';

}
