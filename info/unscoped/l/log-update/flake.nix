{

  inputs.packument.url   = "https://registry.npmjs.org/log-update?rev=54-22fdfc6bd8706e2de245f3475bc60a52";
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
    ident = "log-update";
    ldir  = "info/unscoped/l/log-update";
    inherit packument fetchInfo;
  } // latest';

}
