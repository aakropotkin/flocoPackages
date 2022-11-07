{

  inputs.packument.url   = "https://registry.npmjs.org/babel-preset-stage-0?rev=92-2cf4d81523435f76d80bf9ad6b2251b1";
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
    ident = "babel-preset-stage-0";
    ldir  = "info/unscoped/b/babel-preset-stage-0";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
