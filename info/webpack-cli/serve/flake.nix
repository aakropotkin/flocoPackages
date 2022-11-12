{

  inputs.packument.url   = "https://skimdb.npmjs.com/registry/@webpack-cli/serve?_rev=33-676f1693fb98328e84048540c54d65d2";
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
    scope = "@webpack-cli";
    ident = "@webpack-cli/serve";
    ldir  = "info/webpack-cli/serve";
    inherit packument fetchInfo;
  } // latest';

}
