{

  inputs.packument.url   = "https://registry.npmjs.org/awesome-typescript-loader?rev=223-91a4ea973f0a9d21a2429a57febf14e8";
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
    ident = "awesome-typescript-loader";
    ldir  = "info/unscoped/a/awesome-typescript-loader";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
