{

  inputs.packument.url   = "https://registry.npmjs.org/@pnpm/npm-conf?rev=8-990db726e7b932ca5bb89cd0032f4f67";
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
    scope = "@pnpm";
    ident = "@pnpm/npm-conf";
    ldir  = "info/pnpm/npm-conf";
    inherit packument fetchInfo;
  } // latest';

}
