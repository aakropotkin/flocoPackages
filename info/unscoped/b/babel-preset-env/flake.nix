{

  inputs.packument.url   = "https://registry.npmjs.org/babel-preset-env?rev=158-886384dcc81b1b180387fc27e59e959e";
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
    ident = "babel-preset-env";
    ldir  = "info/unscoped/b/babel-preset-env";
    inherit packument fetchInfo;
  } // latest';

}
