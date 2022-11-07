{

  inputs.packument.url   = "https://registry.npmjs.org/@types/d3-force?rev=670-9faae49e673402a497008225eb5b5acc";
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
    ident = "@types/d3-force";
    ldir  = "info/types/d3-force";
    inherit packument fetchInfo;
  } // latest';

}
