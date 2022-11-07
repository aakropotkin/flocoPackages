{

  inputs.packument.url   = "https://registry.npmjs.org/enquirer?rev=51-d3e63317e334691adf01f9e1ef2d0120";
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
    ident = "enquirer";
    ldir  = "info/unscoped/e/enquirer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
