{

  inputs.packument.url   = "https://registry.npmjs.org/js-stringify?rev=11-e7009e78661898325d2a49e35a22abd7";
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
    ident = "js-stringify";
    ldir  = "info/unscoped/j/js-stringify";
    inherit packument fetchInfo;
  } // latest';

}
