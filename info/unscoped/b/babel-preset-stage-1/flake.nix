{

  inputs.packument.url   = "https://registry.npmjs.org/babel-preset-stage-1?rev=77-293140df6f1e36db472682a19c54957c";
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
    ident = "babel-preset-stage-1";
    ldir  = "info/unscoped/b/babel-preset-stage-1";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
