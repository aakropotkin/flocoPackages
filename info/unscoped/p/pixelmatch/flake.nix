{

  inputs.packument.url   = "https://registry.npmjs.org/pixelmatch?rev=416-7181f0ba669d474a2f9c0aebdbae107b";
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
    ident = "pixelmatch";
    ldir  = "info/unscoped/p/pixelmatch";
    inherit packument fetchInfo;
  } // latest';

}
