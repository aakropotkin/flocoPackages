{

  inputs.packument.url   = "https://registry.npmjs.org/@leichtgewicht/ip-codec";
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
    scope = "@leichtgewicht";
    ident = "@leichtgewicht/ip-codec";
    ldir  = "info/leichtgewicht/ip-codec";
    inherit packument fetchInfo;
  } // latest';

}
