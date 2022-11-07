{

  inputs.packument.url   = "https://registry.npmjs.org/@types/xmldom?rev=478-d0365228a2803c7dd3d8af9dab756045";
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
    ident = "@types/xmldom";
    ldir  = "info/types/xmldom";
    inherit packument fetchInfo;
  } // latest';

}
