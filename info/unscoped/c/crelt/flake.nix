{

  inputs.packument.url   = "https://registry.npmjs.org/crelt?rev=6-cd170150606c6b63b3b5223f0f519397";
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
    ident = "crelt";
    ldir  = "info/unscoped/c/crelt";
    inherit packument fetchInfo;
  } // latest';

}
