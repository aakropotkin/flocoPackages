{

  inputs.packument.url   = "https://registry.npmjs.org/typescript?rev=2874-b5a82fdf41b11eae4ebf91baa23de0d3";
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
    ident = "typescript";
    ldir  = "info/unscoped/t/typescript";
    inherit packument fetchInfo;
  } // latest';

}
