{

  inputs.packument.url   = "https://registry.npmjs.org/rxjs?rev=304-2c093f4dfa71c3e392dff08b4014683f";
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
    ident = "rxjs";
    ldir  = "info/unscoped/r/rxjs";
    inherit packument fetchInfo;
  } // latest';

}
