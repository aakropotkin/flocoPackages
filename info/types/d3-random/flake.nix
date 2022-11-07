{

  inputs.packument.url   = "https://registry.npmjs.org/@types/d3-random?rev=617-a809c0e990a116a9ccf7df87f035cd42";
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
    scope = "@types";
    ident = "@types/d3-random";
    ldir  = "info/types/d3-random";
    inherit packument fetchInfo;
  } // latest';

}
