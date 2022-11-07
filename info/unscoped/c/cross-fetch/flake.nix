{

  inputs.packument.url   = "https://registry.npmjs.org/cross-fetch?rev=56-7f526643b3c4aa18fb76e874eff43db4";
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
    ident = "cross-fetch";
    ldir  = "info/unscoped/c/cross-fetch";
    inherit packument fetchInfo;
  } // latest';

}
