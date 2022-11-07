{

  inputs.packument.url   = "https://registry.npmjs.org/cron?rev=301-0cc7f2392d15e5abed6fb9078a783a78";
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
    ident = "cron";
    ldir  = "info/unscoped/c/cron";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
