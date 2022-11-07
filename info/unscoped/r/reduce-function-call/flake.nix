{

  inputs.packument.url   = "https://registry.npmjs.org/reduce-function-call?rev=9-f0e7299e512581635cb95934ac3ab9b2";
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
    ident = "reduce-function-call";
    ldir  = "info/unscoped/r/reduce-function-call";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
