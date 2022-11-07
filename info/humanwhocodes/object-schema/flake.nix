{

  inputs.packument.url   = "https://registry.npmjs.org/@humanwhocodes/object-schema?rev=8-8c9eacb32913aa9d3d8e1b34f005d2db";
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
    scope = "@humanwhocodes";
    ident = "@humanwhocodes/object-schema";
    ldir  = "info/humanwhocodes/object-schema";
    inherit packument fetchInfo;
  } // latest';

}
