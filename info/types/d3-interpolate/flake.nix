{

  inputs.packument.url   = "https://registry.npmjs.org/@types/d3-interpolate?rev=592-99692f02211e238230ed7c500f73fc5d";
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
    ident = "@types/d3-interpolate";
    ldir  = "info/types/d3-interpolate";
    inherit packument fetchInfo;
  } // latest';

}
